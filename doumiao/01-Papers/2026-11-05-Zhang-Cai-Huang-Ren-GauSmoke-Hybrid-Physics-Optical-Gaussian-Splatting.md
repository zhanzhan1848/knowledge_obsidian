---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, smoke, gaussian-splatting, volumetric-rendering, physics-informed, sparse-view, beer-lambert, incompressible, siggraph-2026]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://doi.org/10.1145/3799902.3811148
---

# GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction |
| **作者** | Wenran Zhang (Nankai), Yuxiang Cai (Nankai), Letian Huang (Nanjing), Dongwei Ye (Nanjing), Jie Guo (Nanjing), Bo Ren (Nankai, 通讯) |
| **发表** | SIGGRAPH 2026 Conference Paper (Los Angeles, 2026-07-19), Article 51, 13 页 |
| **链接** | [DOI](https://doi.org/10.1145/3799902.3811148) · [PDF](http://ren-bo.net/papers/zwr_sig2026.pdf) · [视频](http://ren-bo.net/Videos/zwr_sig2026.mp4) · [项目页](https://letianhuang.github.io/) |
| **DOI** | 10.1145/3799902.3811148 |
| **代码** | 论文内未公开仓库链接；Bo Ren 主页提供 PDF / Video |
| **分类** | 体积渲染 / 烟雾渲染 / 3DGS 重建 |

---

## 核心贡献

> **把物理约束直接注入 3DGS 管线** —— 用 **Beer–Lambert 体积模型**把 Gaussian 图元映射为连续密度场，同时用**全局保体积速度场**在 Eulerian 网格上驱动 Lagrangian Gaussian 图元演化，从而在**稀疏视角**下联合重建速度场与密度场，取代了"启发式图像空间 warp"的动态 3DGS 范式。

1. **问题：稀疏视角下的动态流体重建是严重欠约束问题**。原因有二：
   - 复杂**体积可见性**（volumetric visibility）——单视角无法解耦深度与密度；
   - 湍流、**拓扑变化**的运动特性。
2. **现有动态 3DGS 的失败模式**：主流动态方法用**启发式图像空间 warp**（deformation field / 4D Gaussian），这些方法假设**保拓扑、近刚体**运动，与湍流烟雾的随机性/拓扑变化本质冲突 → 在稀疏观测下**过拟合**，产生 **floater（漂浮物）**与**几何畸变**。
3. **核心方案 A：Beer–Lambert 体积渲染模型**
   - Gaussian 图元 $k_i(x) = \exp[-\frac{1}{2}(p_i-x)^T\Sigma_i^{-1}(p_i-x)]$ 映射为**连续密度场**；
   - 沿 3D 光线施加 **Beer–Lambert 指数消光**，恢复全局一致的密度场；
   - 相比 3DGS 原本的 alpha 合成，得到**物理上有意义**的密度量（而非"opacity"）。
4. **核心方案 B：物理引导的优化 + 双重表示**
   - 在 **Eulerian 网格**上重建可靠速度场（由 **3D U-Net** 实现 $\Phi$，预测当前网格上的速度场变化）；
   - 同时以 **Lagrangian Gaussian 粒子**承载密度等物理属性；
   - 通过**输运方程 (transport equation)** 在全局保体积场中演化 Gaussian 运动 → **避免逐粒子的任意形变**，引导优化走向**物理可接受解**；
   - 关键物理约束：**不可压缩性** $\nabla \cdot u = 0$（全局速度场无散）。
5. **核心方案 C：细化策略捕获细尺度湍流结构** —— 显式耦合 Gaussian 参数的动力学演化与底层流动运动。
6. **统一性**：同一表示可**同时重建动态烟雾与静态固体**。
7. **实际价值**：支持高质量**再仿真 (re-simulation)** 与**流动分析**。

---

## 技术方案

### 与已有工作的对比（作者自述）

| 方法 | 表示 | 运动建模 | 物理约束 | 稀疏视角 |
|------|------|----------|----------|----------|
| Neural Volumes / TomoFluid / Global Transport | 隐式体 | 全局传输 | 传输+物理约束 | 部分支持 |
| NeuSmoke (SIGGRAPH Asia 2024) | 体素 + 隐式 MLP | 神经输运场 | 有 | 有 |
| FluidNexus (2025) | 粒子（视觉+物理） | 粒子级 | 全局约束难施加 | 弱 |
| FluidGS (2025) | Eulerian 网格 | — | 建模的是 **opacity 而非物理 density** | — |
| **GauSmoke (本文)** | **Gaussian 图元 + 连续密度场** | **Eulerian 速度场 + Lagrangian 图元双表示** | **Beer–Lambert 渲染 + 无散输运** | **✓** |

> 作者特别指出：FluidGS 虽引入 Eulerian 网格，但建模的是**不透明度而非物理密度**；本文则将 Gaussian 图元与**连续密度场**、Beer–Lambert 渲染、**物理约束输运**三者耦合。

### 物理约束的实现层次

```
稀疏多视角 RGB 观测
        ↓
┌───────────────────────────────────────────────┐
│  Eulerian 速度场 u(x,t)   [3D U-Net 预测增量] │
│  ∇·u = 0  (全局保体积, 天然满足)              │
└───────────────────┬───────────────────────────┘
                    │ 输运方程驱动
                    ↓
┌───────────────────────────────────────────────┐
│  Lagrangian Gaussian 图元 {p_i, Σ_i, c_i, ρ_i}  │
│  (承载物理密度 ρ, 在全局场中演化, 无逐粒子形变) │
└───────────────────┬───────────────────────────┘
                    │ Beer–Lambert 指数消光
                    ↓
        连续、全局一致的密度场 D(x) → 渲染
```

**为什么这个设计能解决稀疏视角下的过拟合**：
- 启发式 deformation field 可以用**任意逐粒子缩放/漂移**去拟合有限观测 → 物理上不合理但数值上容易拟合；
- 本文把运动自由度限制在**一个全局无散速度场**内，Gaussian 只能"随流运动" → 可行解空间大幅收窄，且解**天然物理可接受**。

---

## 性能数据

### 效率对比（ScalarFlow 烟雾场景，单卡 RTX 3090 24GB，训练 30k 迭代）

| 方法 | 训练时间 (h) ↓ | FPS ↑ | 存储 (MB) ↓ | PSNR ↑ |
|------|--------------|--------|-------------|---------|
| 4D-GS | 0.25 | 152 | 17 | 29.22 |
| Deformable GS | 0.30 | 135 | 20 | 29.50 |
| NeuSmoke | 1.80 | 28 | 53 | 22.74 |
| FluidNexus | 0.60 | 102 | 123 | 32.50 |
| **Ours (GauSmoke)** | **0.80** | **114** | **42** | **34.83** |

**解读**：
- 相比 NeuSmoke（1.5–3 h / 28 FPS / PSNR 22.74）**训练快约 2×、渲染快 4×、PSNR 高 12 dB**；
- 相比 FluidNexus：PSNR 高 2.33 dB，存储仅 1/3；
- 存储优势来源：NeuSmoke 存储全局 MLP 权重 + 位置编码；FluidNexus 存储逐帧复杂物理属性；本文**用轻量 U-Net** 学习速度场变化，参数紧凑。

### 数据集
- **ScalarFlow**（Blender 合成烟雾，分辨率与视角数见论文），120+ 帧，800×800；
- 真实烟雾数据集（in-the-wild）；
- 消融显示：**网格分辨率越高，物理速度场捕获的细节层级越好**，PSNR 单调提升。

---

## 局限
- 论文明确指出在处理**流体与固体的交互**（fluid–solid interaction）时存在局限（Sec. 5.4 有详细分析与未来改进方向）；
- 依赖 Eulerian 网格 + U-Net，仍需一定显存与训练时间。

---

## 关联笔记
- [[2026-11-05-Tao-Chen-Chu-LagrangianSplats-Divergence-Free-Transport]] — 同为 SIGGRAPH 2026，用**无散核**结构性保证不可压缩性
- [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]]
- [[2026-11-04-Zheng-FluidGen-Physics-Aware-Fluid-Video-Generation]]
- [[2026-10-07-fluid-gen-zero]]
- 技术笔记：[[体积渲染]] · [[烟雾火焰]]

---

## 摘要原文

> Reconstructing dynamic fluids from sparse-view videos is a severely under-constrained problem due to complex volumetric visibility and turbulent, topology-changing motion. Current dynamic deformation-based 3D Gaussian Splatting (3DGS) methods use heuristic image-space warps, which often overfit limited observations via non-physical primitive scaling or drifting, producing floaters and geometric distortions. To address these challenges, we propose a hybrid, physics-aware fluid representation that injects physical constraints directly into the 3DGS pipeline. We develop a Beer–Lambert volumetric model mapping Gaussian primitives to a continuous, physically-grounded density field, bridging optical observations with fundamental physical laws. A physically-guided optimization evolves primitives under a global, volume-preserving velocity field, avoiding arbitrary per-particle deformations and effectively preserving volume while recovering fine-scale turbulent details. This unified formulation tightly couples fluid dynamics with differentiable rendering, enabling high-quality, joint predictions of velocity and density. Experiments on synthetic and real smoke datasets demonstrate that our approach surpasses state-of-the-art methods in both visual fidelity and physical consistency, achieving stable 3D reconstructions even from sparse views.
