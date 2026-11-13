---
type: paper
created: 2026-11-13
updated: 2026-11-13
tags: [paper, neural-rendering, relighting, path-tracing, light-transport, cs.GR, EGSR2026]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.17185
---

# Neural Render Proxies for Interactive and Differentiable Lighting (NRP)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Render Proxies for Interactive and Differentiable Lighting |
| **作者** | Sergio Sancho, Alexander Rath, Marco Manzi, Pascal Chang, Amit H. Bermano, Derek Nowrouzezahrai, Markus Gross, Marios Papas |
| **发表** | arXiv 2026-11-12，**Computer Graphics Forum (Proc. EGSR 2026)** |
| **链接** | [原文](https://arxiv.org/abs/2611.17185) |
| **DOI** | [10.48550/arXiv.2611.17185](https://doi.org/10.48550/arXiv.2611.17185) |
| **代码** | 未公开 |

---

## 核心贡献

> 把传统渲染**解耦为"路径采样"与"发射项计算"**两部分：只需一次与光照无关（light-agnostic）的离线路径追踪，收集光传输路径样本，即可训练一个场景专属的轻量神经网络，学习"光如何从任意场景位置传输到任意图像像素"，从而实现 30–60 Hz 的交互式可微分重光照。

1. **渲染解耦洞察**：路径采样（与光照条件无关，可复用）与辐射度计算（依赖光照，需快速重算）分离。
2. **神经渲染代理（NRP）**：场景专属小网络，实现交互帧率的可微分重光照，**兼容不可微的生产级渲染器**（如 Arnold、RenderMan）。
3. **可微分逆问题**：支持基于梯度的逆流程，可从直观的图像空间编辑或生成目标反解光照参数。

---

## 技术方案

### 核心思想

CG 动画制作中的灯光调整代价极高：即使微小改动也要用慢速离线渲染器重渲染巨大场景，需要采样全局光照并评估复杂着色器，每帧迭代时间从数分钟到数小时。

NRP 的做法：
- **一次 light-agnostic 渲染 pass** → 收集路径样本（path samples），构成光传输数据。
- 用这些路径样本**在线快速采样不同的光照条件**。
- 训练**场景专属轻量神经网络**：输入 = 场景中任意位置 + 光照参数，输出 = 该位置到任意像素的光传输。

**关键优势**：推理时的内存开销极小，且**扩展性只与分辨率、光源数量、参数数量有关，而与场景复杂度、外观复杂度无关**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **路径采样/发射解耦** | 传统渲染 = 采样路径 + 评估发射项。NRP 只在离线阶段做一次采样 |
| **Light-agnostic 单 pass** | 一次与光照无关的离线路径追踪，产出可复用的路径样本集合 |
| **场景专属神经代理** | 轻量网络学习"位置 → 像素"的传输映射；参数规模与场景外观复杂度无关 |
| **兼容不可微渲染器** | 无需修改生产渲染器（Arnold / RenderMan / Cycles），可对接既有管线 |
| **可微分逆流程** | 支持从图像空间编辑或生成式目标反解灯光参数（梯度下降） |

---

## 公式

```math
% NRP 核心：光传输的分解
I_{\mathrm{pixel}} = \sum_{k \in \mathrm{paths}} w_k \cdot L\!\left(\mathrm{path}_k;\,\boldsymbol{\theta}_{\mathrm{light}}\right)

% 光照参数 θ 只影响发射项，路径结构在 light-agnostic pass 中已固定
\boldsymbol{\theta}_{\mathrm{light}} \;\rightarrow\; L(\cdot) \quad \text{(快速、可微)}
```

---

## 代码片段

```python
# NRP 概念流程（伪代码）
# 1) 离线：一次 light-agnostic pass，缓存路径样本
path_samples = offline_light_agnostic_pass(scene, camera)

# 2) 离线：训练场景专属代理网络
proxy = NRPNet().to(device)
train(proxy, path_samples, varying_light_conditions)

# 3) 在线：可微分重光照（30-60 Hz）
image = proxy(scene_points, light_params=theta)   # theta 可由梯度下降优化
```

---

## 实验结论

- **数据集**: 内部生产级 CG 动画场景（ground truth 为路径追踪）
- **基线**: 离线路径追踪（ground truth）、传统离线渲染流程
- **结果**:
  - 重光照达到 **~30–60 Hz 交互帧率**，视觉保真度接近 ground-truth 路径追踪
  - 推理内存需求极小
  - 扩展性仅随分辨率与光源/参数数量增长，**与场景及外观复杂度无关**
  - 可微分 NRP 支持快速基于梯度的逆流程，从直观图像空间编辑反解光照参数

---

## 局限性

- **仅针对静态场景**，且固定相机与固定材质（论文明确限定："static scenes with fixed camera and materials"）
- 需要一次离线 light-agnostic 渲染 pass 作为前置成本（场景几何/拓扑变化需重做）
- 场景专属训练意味着换场景要重新训练
- 未涉及动态几何（流体/烟雾场景中几何每帧变化，则该前提被破坏）

---

## 相关工作

- [[2026-11-13-Julin-Xie-Bal-Sakashita-Niinuma-Jeni-ReCan-GS-Distractor-Free-4DGS]]
- [[2026-10-02-Ahn-VolS-GS-Relightable-GS-Volumetric-SSS]]
- [[2026-03-16-Volumetric-Ray-Traced-Primitives-SIGGRAPH2025]]
- [[Volume-Rendering]]
- [[Path-Tracing]]
- [[Neural-Rendering]]

---

## 实现建议

- **实现难度**: 高（需改造离线路径追踪器导出路径样本，并训练场景专属代理）
- **预期性能**: 重光照 30–60 Hz；显存占用小
- **适用场景**: CG 动画/影视生产的灯光迭代加速；可微逆渲染（从参考图反解灯光）
- **与流体渲染的关系**: 体积/流体场景的光照迭代极贵，NRP 的"路径采样一次、光照条件重采样"思路对**参与介质（体积光、烟雾、火焰）**的实时重光照尤其有参考价值；但静态场景假设是流体动画的硬伤，需配合时变几何重建
