---
type: paper
created: 2026-07-11
updated: 2026-07-11
tags: [paper, real-time rendering, path tracing, progressive rendering, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.26612
---

# HiPR: Hierarchical Progressive Rendering for Immediate Feedback

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HiPR: Hierarchical Progressive Rendering for Immediate Feedback |
| **作者** | Rafael Padilla 等 |
| **发表** | SIGGRAPH 2026 Real Time Live! (2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.26612) |
| **DOI** | 10.1145/3799821.3820912 |
| **代码** | - |

---

## 核心贡献

> HiPR 将交互式路径追踪的场景编辑反馈延迟问题重新定义为调度问题，通过光路依赖层次结构对像素进行优先级排序，在保持无偏收敛的同时提供即时视觉反馈。

1. 提出基于光路依赖层次结构的动态渲染调度算法，识别场景修改影响的像素并优先渲染
2. 三阶段处理流程：可见性检测 → 直接可见瓦片渲染（含二次弹跳发现）→ 按权重排序渲染剩余瓦片
3. 利用 Vulkan inline ray tracing 和硬件加速 BVH，集成 OpenPBR BSDF

---

## 技术方案

### 核心思想

传统渐进式渲染器在场景修改后重新计算整个帧，HiPR 改变这一范式——它只更新受影响的像素，并根据从修改元素向外传播的光路依赖层次确定更新顺序。

### 三阶段流程

1. **Stage 1 - 可见性检测**：追踪主射线生成 G-buffer，识别被修改元素 ℰ 直接可见的瓦片集合 A
2. **Stage 2 - 直接可见瓦片渲染**：路径追踪渲染 A 中的瓦片，同时追踪次级弹射点，将其投影到对应瓦片并累积权重
3. **Stage 3 - 排序渲染**：对所有发现的瓦片按权重并行排序（降序），依次渲染直至收敛

### 瓦片权重公式

次级顶点 x_k 对瓦片 T 的权重贡献：

```math
\Delta W(\mathbf{x}_k) = \beta_k \cdot w_{\text{lobe}}(\ell_k) \cdot w_{\text{path}}(c_k) \cdot \frac{1}{1+k}
```

其中：
- β_k：到顶点 x_k 的累计 throughput
- w_lobe(ℓ_k)：BSDF 波瓣优先级权重（specular > glossy > diffuse > transmission）
- w_path(c_k)：光路类型权重（direct > indirect > caustic）
- 1/(1+k)：弹射深度惩罚

### 感知优先级

默认优先级顺序（Ulschmid et al. 2025）：specular/direct > diffuse > indirect > caustic，逼近人眼对场景变化的感知顺序。

### 关键参数

| 参数 | 说明 | 影响 |
|------|------|------|
| n | 瓦片尺寸 | 小瓦片局部反馈好但 GPU 分发碎片化；大瓦片一致性好但粗糙 |
| ε | 深度容差 | 紧值可能漏掉掠射曲面；松值引入误报 |
| w_lobe / w_path | 感知权重 | 场景相关：玻璃内部提高 caustic/transmission；角色 look-dev 提高 diffuse |

---

## 实现细节

### Vulkan Inline Ray Tracing

- 使用 inline ray tracing 而非完整 Vulkan ray tracing pipeline，避免 shader binding table 耦合开销
- 手动构建硬件加速结构，通过 object ID 直接绑定材质参数
- 材质使用 Adobe OpenPBR BSDF 实现

### 收敛保证

HiPR 仅重排序瓦片，不改变每个像素的采样估计器。每个像素始终是独立无偏样本的均值，最终结果无偏。未发现传输的瓦片复用前一帧 radiance，最终会渲染以保证无偏。

---

## 应用场景

1. **Look Development**：材质/光照/构图迭代编辑，即时反馈加速创意探索
2. **Virtual Production**：多 stakeholder 实时评审，修改请求即时可视化
3. **Attention-Guided**：结合眼动追踪或游戏事件，优先渲染用户关注区域

---

## 局限性

- 当前形式对相机运动整体重新投影，未考虑视差不等效应
- 未来方向：逐物体启发式判断相机运动是否需要新 HiPR pass；按编辑幅度缩放优先级（差异感知加权）；利用模拟数据/运动向量引导采样密度；建立感知光传输显著性公式

---

## 可行性分析

- **实现难度**：中
- **预期性能**：场景修改后即时局部反馈，最终收敛到无偏路径追踪结果
- **适用场景**：交互式路径追踪工作流、虚拟制作look-dev、VR/AR注视点渲染
- **相关工作**：Ulschmid et al. 2025 上下文感知重渲染优先级；Vulkan Ray Tracing BVH 加速

---

## 相关论文

- [[2606.14173 HoloPathTracer]] - SIGGRAPH 2026 同会议全息路径追踪
- [[2026-06-Richer-Material-Generation-Procedural-Data-Enhancement]] - SIGGRAPH 2026 材质增强（OpenPBR BSDF 关联）
