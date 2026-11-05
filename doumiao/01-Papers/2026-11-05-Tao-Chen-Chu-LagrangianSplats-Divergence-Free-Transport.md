---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, fluid-reconstruction, gaussian-splatting, lagrangian, divergence-free, velocity-field, sparse-view, siggraph-2026]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2605.09299
---

# LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction |
| **作者** | Ningxiao Tao (通讯), Baoquan Chen, Mengyu Chu — **北京大学 (Peking University)** |
| **发表** | SIGGRAPH 2026 Conference Paper, Article 52, 11 页 · arXiv:2605.09299 (2026-05-10) |
| **链接** | [arXiv](https://arxiv.org/abs/2605.09299) · [项目页](https://taoningxiao.github.io/lagrangiansplats/) · [PDF](https://taoningxiao.github.io/lagrangiansplats/files/LagrangianSplats.pdf) · [补充材料](https://drive.google.com/file/d/1tIE-u1iUoxtvsYSlITk23rTcN2kQwP-6/view) · [视频](https://www.bilibili.com/video/BV1DLVM63ExF) |
| **DOI** | 10.1145/3799902.3811188 |
| **代码** | https://github.com/taoningxiao/LagrangianSplats |
| **数据集** | https://huggingface.co/datasets/tnx123/LagrangianSplats-Dataset (已公开) |

---

## 核心贡献

> **用"无散核 (Divergence-Free Kernel)"参数化速度场，从结构上（而非软惩罚上）保证流体的不可压缩性与长程输运一致性**，并用 **Sliding Window 滑动窗口**优化方案让长时程反传可行。这是与 GauSmoke 并列的 SIGGRAPH 2026 流体重建两大突破之一。

1. **问题定位**：从稀疏 2D 视频重建 3D 流体速度场是**高度不适定的逆问题**，必须同时满足：
   - **输运一致性 (transport consistency)** —— 与观测到的运动吻合；
   - **物理有效性 (physical validity)** —— 服从流体定律（尤其不可压缩性 $\nabla \cdot u = 0$）。
2. **现有方法的缺陷**：普遍用**软惩罚 (soft penalty)** 施加这两个约束 → **精度受损、收敛困难**。硬约束（硬投影）虽精确但求解代价高、流水线难以嵌入。
3. **核心方案：Divergence-Free Kernel 表示**
   - 用**连续的"无散核"表示**参数化重建出的速度场；
   - 该表示在**构造上 (by construction)** 内在保证：**(a) 流动不可压缩性**、**(b) 长程输运一致性**；
   - 由此驱动 **Lagrangian 3D Gaussian Splatting** 表示的**平流 (advection)**。
4. **Sliding Window 优化方案**：为了让带约束的系统优化高效，引入滑动窗口，把梯度传播到**有意义的时间跨度**，同时保持**可承受的训练开销**（避免全序列反传）。
5. **成果**：在合成与真实数据集上，**输运一致性与物理精度双双超越 SOTA 基线**，可支撑**高质量再仿真与流动分析**。

---

## 技术方案

### 关键洞察：硬约束优于软惩罚

| 约束满足方式 | 机制 | 优点 | 缺点 |
|-------------|------|------|------|
| **软惩罚**（现有方法） | 在损失项中加 $\lambda \|\nabla\cdot u\|^2$ | 简单，可嵌入任何求解器 | 精度受损、收敛慢、易被"惩罚不够"绕过 |
| **硬投影** | 每步求解 Poisson 方程强制无散 | 精确 | 每次迭代代价高，难以与可微渲染联合优化 |
| **无散核参数化**（本文） | 速度场**构造上**就是无散的 | 精确 + 高效 + 可微 | 速度场被限制在该参数化族内 |

### 方法结构

```
稀疏 2D 视频观测
        ↓
┌──────────────────────────────────────────────┐
│  连续 Divergence-Free Kernel 速度场 v(x,t)   │
│  → 构造性保证 ∇·v = 0（不可压缩）             │
│  → 长程输运一致性                              │
└──────────────────┬───────────────────────────┘
                   │ 平流 advection
                   ↓
┌──────────────────────────────────────────────┐
│  Lagrangian 3D Gaussian Splatting             │
│  (3DGS 图元随流运动, 承载密度/外观)            │
└──────────────────┬───────────────────────────┘
                   ↓
        可微渲染 → 与 2D 观测匹配 → 优化
                   ↑
        Sliding Window 梯度传播 (长时程, 低开销)
```

### 与 GauSmoke 的对比（同为 SIGGRAPH 2026）

| 维度 | **GauSmoke** (Nankai) | **LagrangianSplats** (PKU) |
|------|----------------------|------------------------------|
| 核心机制 | Beer–Lambert 体积密度场 + Eulerian 速度场（U-Net） | 连续 **Divergence-Free Kernel** 速度场 |
| 如何保证无散 | 依赖速度场的物理先验/优化诱导 | **构造性保证**（参数化层面） |
| Gaussian 角色 | Lagrangian 图元承载密度 | Lagrangian 图元承载密度/外观 |
| 优化策略 | 物理引导优化 + 细化策略 | **Sliding Window** 滑动窗口 |
| 强调点 | 光学-物理耦合、体积渲染保真 | 结构化约束、输运一致性、长程梯度 |
| 补充材料 | — | ✅ 公开 |
| 数据集 | ScalarFlow + 真实烟雾 | ✅ **公开数据集**（HuggingFace） |
| 代码 | 未公开 | ✅ **GitHub 公开** |

> **知识库价值**：这两篇构成 2026 年"**物理约束 + 3DGS 流体重建**"路线的一对互补极值——一个强调**渲染保真（Beer–Lambert）**，一个强调**约束结构（Divergence-Free Kernel）**。实现实时流体渲染时可直接参考二者组合。

---

## 摘要原文

> Reconstructing 3D fluid velocity fields from sparse 2D video observations is a highly ill-posed inverse problem, demanding both transport consistency with observed motion and physical validity under fluid laws. Existing methods typically impose these constraints through soft penalties, often leading to compromised accuracy and convergence issues. We introduce a reconstruction framework that structurally enforces both constraints. Specifically, we parameterize the reconstructed velocity using a continuous Divergence-Free Kernel representation, driving the advection of a Lagrangian 3D Gaussian Splatting representation. This formulation intrinsically guarantees both flow incompressibility and long-range transport coherence by construction. To enable efficient optimization of such a constrained system, we introduce a novel Sliding Window scheme that propagates gradients over meaningful temporal horizons while maintaining tractable training costs. Experiments on synthetic and real-world datasets demonstrate that our method outperforms state-of-the-art baselines in both transport consistency and physical accuracy, enabling applications such as high-quality re-simulation and flow analysis.

---

## 关联笔记
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 同届 SIGGRAPH 2026，互补路线
- [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]] — 同为可微流体优化
- 技术笔记：[[体积渲染]]

## 资源链接
- 代码：https://github.com/taoningxiao/LagrangianSplats
- 数据集：https://huggingface.co/datasets/tnx123/LagrangianSplats-Dataset
- 补充材料：https://drive.google.com/file/d/1tIE-u1iUoxtvsYSlITk23rTcN2kQwP-6/view
