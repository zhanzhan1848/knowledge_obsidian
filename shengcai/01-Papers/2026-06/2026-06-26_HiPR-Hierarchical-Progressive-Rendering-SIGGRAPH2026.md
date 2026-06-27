---
type: paper
created: 2026-06-27
updated: 2026-06-27
tags: [paper, rendering, path-tracing, real-time, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.26612
---

# HiPR: Hierarchical Progressive Rendering for Immediate Feedback

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hierarchical Progressive Rendering for Immediate Feedback |
| **作者** | Rafael Padilla et al. |
| **发表** | SIGGRAPH Real-Time Live! 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.26612) |
| **DOI** | 10.1145/3799821.3820912 |
| **代码** | 待公开 |

---

## 核心贡献

> 将交互式路径追踪的帧调度问题重新定义为核心创新点，通过光路依赖层次结构指导像素优先级，实现场景修改后即时视觉反馈，同时保持无偏收敛。

1. **光路依赖层次调度**：将像素按光路依赖关系组织为层次结构，从修改元素向外传播，优先渲染感知影响最大的区域
2. **三阶段渲染管道**：visibility pass → 直接可见区域路径追踪 → 次级弹射影响发现 → 优先级排序渲染
3. **无偏收敛保证**：仅重新排序瓦片，不改变每个像素的采样估计器，最终结果保持无偏

---

## 技术方案

### 核心思想

传统渐进式渲染在场景修改后重新计算整个帧，HiPR 提出将帧分割为瓦片网格，根据光路依赖确定哪些瓦片需要更新，按感知优先级排序，在保持无偏收敛的同时提供即时视觉反馈。

### 三阶段管道

**Stage 1 - Visibility Pass**
追踪主射线生成 G-buffer（物体 ID + 深度），确定修改元素直接可见的瓦片集合 A

**Stage 2 - Render Directly Visible Tiles**
对集合 A 中的瓦片执行路径追踪，同时追踪次级弹射点：

```math
\Delta W(\mathbf{x}_k) = \beta_k \cdot w_{\text{lobe}}(\ell_k) \cdot w_{\text{path}}(c_k) \cdot \frac{1}{1+k}
```

其中 $\beta_k$ 是累积 throughput，$w_{\text{lobe}}$ 对应 diffuse/glossy/specular/transmission 优先级，$w_{\text{path}}$ 对应 direct/indirect/caustic 路径类别

**Stage 3 - Sort & Render**
对所有发现的瓦片按权重并行排序，降序渲染

### 关键公式

```math
W(T) = \sum_{\mathbf{x}_k \in T} \Delta W(\mathbf{x}_k)
```

瓦片权重通过原子累加所有投影到该瓦片且通过深度测试的顶点贡献

### 感知优先级权重

- specular & direct 优先于 diffuse & indirect & caustic（参考 Ulschmid et al. 2025）
- 可根据场景调整：玻璃内部 → 提高 caustic/transmission；角色 look-dev → 提高 diffuse/direct

### Vulkan 内联光线追踪实现

- 使用 inline ray tracing 而非完整 Vulkan ray tracing pipeline
- 构建硬件加速结构，手动绑定材质到对象 ID
- 材质使用 Adobe OpenPBR BSDF

---

## 实验结论

- Look Development：材质/灯光迭代时更快获得视觉反馈
- Virtual Production：多Stakeholder实时评审时保持创意流畅
- Attention-Guided Applications：游戏/VAR场景中基于眼动追踪或游戏事件引导渲染优先级

---

## 局限性

- 当前公式对相机运动重新投影整个帧，未考虑视差效应
- 未利用模拟数据/运动向量引导复杂场景的采样密度
- 感知光路显著性公式尚需手动参数化

---

## 相关工作

- [[Ulschmid 2025]] Automated Prioritization for Context-Aware Re-Rendering
- [[ReSTIR PT]] 实时路径追踪重采样技术
- [[Megakernel vs Wavefront]] GPU路径追踪架构对比

---

## 实现建议

- **实现难度**: 中等（需修改现有路径追踪器的调度器）
- **预期性能**: 场景修改后首帧反馈速度显著提升，最终收敛质量不变
- **适用场景**: 交互式 look-dev、虚拟制片、实时内容创作工具
- **集成建议**: 可作为现有路径追踪器的调度层插件，Vulkan inline ray tracing 参考实现
