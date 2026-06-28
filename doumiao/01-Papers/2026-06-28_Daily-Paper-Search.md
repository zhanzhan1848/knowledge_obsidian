# 每日论文搜索报告 - 流体渲染领域

**日期**: 2026-06-28
**Agent**: 豆苗 (Doumiao)
**时间**: 14:14 UTC

---

## 搜索摘要

### 搜索范围
- **arXiv cs.GR**: 最近 7 天提交 (2026-06-20 ~ 2026-06-28)
- **SIGGRAPH 2026**: 已接收论文
- **SIGGRAPH Asia 2026**: 征稿中

### 关键词
`fluid rendering`, `water rendering`, `smoke rendering`, `fire simulation`, `ocean rendering`, `particle system`, `volume rendering`

### 搜索结果

本次搜索共发现 **41 篇** arXiv cs.GR 论文。经过筛选，与流体渲染相关的论文如下：

---

## 流体渲染相关论文

### 1. Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

| 属性 | 值 |
|------|-----|
| **arXiv** | [2606.21753](https://arxiv.org/abs/2606.21753) |
| **日期** | 2026-06-20 |
| **会议** | CVPR 2026 Findings |
| **作者** | - |

**摘要**:
3D Gaussian Splatting (3DGS) 已达到最先进的照片级真实感渲染，但表示差距阻止了这些资产在物理上交互。生产级物理引擎不理解 3DGS 表示。先前的物理模拟方法是孤立的，仅展示以对象为中心的物理。本工作提出 **Representation Abstraction Framework**，将 3DGS、虚拟网格和流体转换为统一物理粒子集，实现场景级异构多求解器物理模拟。

**关键技术**:
- Representation Abstraction Framework
- 统一物理粒子集
- 求解器无关物理内核
- 3DGS 资产非刚性变形

**与流体渲染关系**: ⭐⭐⭐⭐
首次实现 3DGS 资产与流体、网格的复杂双向交互

**URL**: https://arxiv.org/abs/2606.21753

---

### 2. GPU-Accelerated Simulations of Moving Boundary Problems and Fluid-Structure Interaction at Extreme Scales

| 属性 | 值 |
|------|-----|
| **arXiv** | [2605.04335](https://arxiv.org/abs/2605.04335) |
| **日期** | 2026-06-24 (v2) |
| **类别** | physics.comp-ph, cs.DC, physics.flu-dyn |
| **作者** | Sushrut Kumar et al. |

**摘要**:
计算流体动力学和流固耦合模拟涉及移动和变形物体极其困难。本工作提出 **GPU 优化实现的 sharp-interface immersed boundary 方法**，在 Cartesian 网格上进行复杂静止和移动物体的模拟。基于 ViCar3D 框架，利用 OpenACC、CUDA、NCCL 和 MPI。

**关键技术**:
- Sharp-interface immersed boundary method
- GPU 优化 (CUDA/OpenACC)
- Multi-GPU 实现 (>90% scaling efficiency)
- 20X 加速比 vs CPU 实现
- 湍流和流固耦合模拟

**与流体渲染关系**: ⭐⭐⭐
大规模流体模拟技术，可用于流体渲染的模拟阶段

**URL**: https://arxiv.org/abs/2605.04335

---

## SIGGRAPH 2026 流体相关论文

根据 [SIGGRAPH 2026 Papers List](https://kesen.realtimerendering.com/sig2026.html)，已确认以下流体相关论文：

### Mixwell: Resolution-Independent Physics-Based Fluid Brushes

**摘要**: Mixwell 引入了锋利的 2D 流体画笔和 GPU 加速解析方法，用于渐进式、与分辨率无关的基于物理的混合。

**来源**: [SIGGRAPH 2026 Technical Papers Awards](https://blog.siggraph.org/2026/05/siggraph-2026-technical-papers-awards-best-papers-honorable-mentions-and-test-of-time.html)

---

## 本次搜索未发现直接相关的论文

本次搜索期间 (2026-06-20 ~ 2026-06-28)，arXiv cs.GR 类别中未发现直接关于以下主题的论文：
- `fluid rendering` 精确匹配
- `water rendering` 精确匹配
- `smoke rendering` 精确匹配
- `fire simulation` 精确匹配
- `ocean rendering` 精确匹配

现有 41 篇论文主要集中在：
- 3D Gaussian Splatting (3DGS) 相关
- 网格生成和处理
- 材质/纹理相关
- 渲染加速技术
- 人体/化身模拟

---

## 相关论文笔记

### 3D Gaussian Splatting 物理模拟进展

**Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats** (2606.21753) 是近期最接近流体渲染的论文。该论文提出：
- 将 3DGS 资产纳入物理模拟
- 流体与 3DGS 资产的双向耦合
- 统一的粒子表示

**创新点**:
1. **Representation Abstraction Framework**: 将不同资产转换为统一物理粒子集
2. **Solver-agnostic physics kernel**: 求解器无关的物理内核
3. **复杂场景支持**: 首次支持复杂静态碰撞几何和异构资产

**对流体渲染的意义**:
这标志着 3DGS 资产生成流体效果成为可能，为流体渲染提供了新的技术路径。

---

## 下一步建议

1. 持续关注 3DGS + 流体模拟方向
2. 跟踪 CVPR/SIGGRAPH 2026 的后续论文
3. 关注 Neural Rendering 与流体模拟的结合

---

## 参考链接

- [arXiv cs.GR recent](https://arxiv.org/list/cs.GR/recent)
- [SIGGRAPH 2026 Papers](https://kesen.realtimerendering.com/sig2026.html)
- [SIGGRAPH 2026 Technical Papers](https://s2026.siggraph.org/program/technical-papers/)

---

*由 Doumiao (豆苗) 自动生成于 2026-06-28 14:14 UTC*