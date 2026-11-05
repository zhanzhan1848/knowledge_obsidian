---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, fluid-simulation, smoke, vem, virtual-element-method, cut-cell, multigrid, boundary-conforming, incompressible, siggraph-2026]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://doi.org/10.1145/3811315
---

# Fast VEM Fluid Simulation (FastVEM)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fast VEM Fluid Simulation |
| **作者** | Runze Zhang, Bo Ren (通讯) — **南开大学 (Nankai University), VCIP** |
| **发表** | **ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), Article 65**, 18 页, 2026-07 |
| **链接** | [DOI](https://doi.org/10.1145/3811315) · [arXiv:2607.17725](https://arxiv.org/abs/2607.17725) (cs.GR) · [PDF](http://ren-bo.net/papers/zrz_tog2026.pdf) · [视频](http://ren-bo.net/Videos/zrz_tog2026.mp4) |
| **DOI** | 10.1145/3811315 |
| **代码** | **✅ https://oliver-zrz-cyber.github.io/FastVEM/** |
| **分类** | 烟雾渲染 / 流体模拟 / 数值方法 |

---

## 核心贡献

> **用"虚拟单元法 (VEM)"做二阶压力离散的边界贴合流体求解器**，配合**保凸性的 cut-cell 网格构造**与**Galerkin 几何多重网格求解器**，把压力投影阶段加速 **最高 100×**，同时稳健处理**窄缝、无人机扫描重建的复杂几何、相对厚度 10⁻⁵ 的超薄结构**等此前难以应对的边界。

1. **问题：边界贴合（boundary-conforming）流体模拟既难又贵**
   - **Cartesian 网格**（Mantaflow 等）高效，但无法处理**非网格对齐的复杂边界**；
   - **体素化 + cut-cell 方法**能贴合边界，但会**在压力投影阶段产生病态线性系统**，导致**计算代价高得不可接受**；
   - 根因：非星形 (non-star-shaped) 单元 + 自由度连接膨胀 → **粗层矩阵稠密化**。
2. **三大顶层设计（top-down coordinated design）**：
   - **数值离散层**：**二阶虚拟单元法 (VEM, order k=2)** 做压力离散，稳健强制不可压缩性与边界条件；
   - **网格构造层**：**保凸性的 BSP-based cut-cell 策略**，避免非星形单元、避免边界面在单元内累积；
   - **线性求解层**：**Galerkin 几何多重网格求解器**，含**无扩散延拓算子 (diffusion-free prolongation operator)** 防止粗层矩阵稠密化，以及**嵌套的、边界感知的网格层级**保证粗层自由度布点良定。
3. **平流方案**：**VEM 多项式空间的 Particle-in-Cell (PIC)** 格式。
4. **性能**：压力投影阶段相对已有 cut-cell 流体求解器**最高 100× 加速**（约两个数量级）。
5. **稳健性**：128³ Cartesian 网格上，复杂/超薄边界几何的高保真烟雾模拟 **< 1 min/frame**。

---

## 技术方案

### 三大组件详解

#### ① 数值离散：二阶虚拟单元法 (VEM, k=2)

- **VEM 是什么**：在任意多面体网格上求解 PDE 的数值方法，单元自由度是**边界上的边/面上的矩 (moments)**，而非单元内部节点值。
- **为什么适合流体**：
  - 天然处理**不规则/贴合网格**，无需"特殊单元"修正；
  - **虚自由度 (virtual DOF)** 使边界条件可以精确强制；
  - 对**星形单元 (star-shaped)** 有稳定性保证 —— 这正是下面 cut-cell 策略要保证的性质。
- **本工作**：采用 **k=2**（二阶精度），比已有的**一阶 VEM**（Antonietti et al. 2023，仅 2D）更进一步，且是**首个 3D 二阶 VEM 几何多重网格方法**。

#### ② 网格构造：保凸性 BSP Cut-Cell

对比 **Mandoline** (Tao et al. 2019) 的两个优势：
1. **所有生成单元保证为凸**（避免非星形单元）→ 改善网格质量 → **VEM 刚度矩阵条件数更好**；
2. **阻止边界面在单个网格单元内累积** → 局部自由度结构更优 → **全局刚度矩阵更稀疏**。

**精度**：用 VEM 专用的单元质量指标（3D 质量度量 $\rho_{3D}(E) = \sqrt{\frac{\rho^D_1(E)\rho^D_2(E) + \rho^D_1(E)\rho^D_3(E)}{2}}$，式 32）评估，cut-cell 策略误差在 **10⁻⁵ ~ 10⁻⁶** 量级 → 可靠捕获**极细的亚格子边界特征**。

#### ③ 求解器：Galerkin 几何多重网格

- **Galerkin 投影**：保证**跨层边界条件传递的一致性**（非 Galerkin 方法在多网格层间无法保证这一点）；
- **无扩散延拓算子**：避免 Galerkin 投影在粗层诱导**自由度连接膨胀 → 粗层矩阵稠密化**（这正是 tetra 网格 MPM 方法 [Xian et al. 2019] 用常值插值规避的问题）；
- **嵌套、边界感知的网格层级**：保证粗层自由度的**良定布点**。

**定位**：现有几何多重网格方法 [McAdams 2010; Chentanez 2012; Setaluri 2014; Weber 2015; Dick 2016; Braun 2025] 都**不是为 body-fitted 网格设计的**；代数多重网格 [Demidov 2020] 无几何假设但精度不足。**本文是首个 3D 二阶 VEM 几何多重网格方法**。

### 整体算法流水线

```
复杂边界几何 (扫描网格 / 超薄壳体)
        ↓  保凸性 BSP cut-cell
body-fitted 不规则网格 (全部单元凸, 星形)
        ↓  VEM 二阶压力离散
稀疏 Poisson 系统 (SPD)
        ↓  Galerkin 几何多重网格 (无扩散延拓 + 嵌套层级)
压力投影解  →  投影速度场
        ↓  VEM 多项式空间 PIC 平流
平流后的速度/标量场
```

### 性能对比（Bunny 边界网格，匹配仿真设置，报告压力投影阶段运行时间）

| 方法 | 压力投影耗时 | 备注 |
|------|-------------|------|
| Azevedo et al. 2016 (一阶) | 极大 | 引自原文论文 |
| Mandoline (Tao et al. 2019) | 极大 | cut-cell 基准 |
| **FastVEM (本文)** | **0.4 s @ 128³** | 约 **两个数量级**加速 |
| FastVEM (一阶 VEM 参考实现) | 3.7 s @ 128³（表中 "Ours" 行对比项） | 用于公平对比 |

**与 Mantaflow 的对比（论文 Fig. 6）**：FastVEM 更准确地解析**薄结构与窄缝**中的边界交互、以及**亚格子级曲面特征**；而 Mantaflow 在这些细尺度几何上**完全失效**。

### 硬件与规模
- 背景网格 **128³**；部分实验用 **256³** 作参考基准；
- GPU：**NVIDIA RTX 3090**；
- 对比对象在 128³ 下可产生 **9.4×10⁸ 非零元**、需 **14 GB 显存** → 限制了可扩展性（这是 FastVEM 要解决的问题）；
- FastVEM 在 **128³ 网格**下做二阶 VEM 压力投影的高保真烟雾模拟 **< 1 min/frame**；
- 论文提及 GPU 上平滑器**易于并行**。

### 展示场景
- **窄缝 (Narrow Gap)**；
- **无人机扫描重建的复杂建筑几何**（Smoke 粒子轨迹可视化，绿色粒子；插图展示建筑内部底部的烟雾运动）；
- **超薄片状边界**（相对厚度 **10⁻⁵**）；
- 近壁流动细节（红色粒子，Short/Plane/Hand/Rose 场景）；
- Lucy 模型嵌入 Cartesian 网格的 Chamfer 距离可视化。

---

## 摘要原文

> The intricate motion arising from fluid–boundary interactions is visually compelling, yet notoriously difficult and computationally expensive to simulate in the presence of complex boundaries. Accurately resolving boundary geometry requires body-fitted grids constructed via cut-cell methods, which often leads to poorly conditioned linear systems in the pressure projection stage and, consequently, prohibitive computational cost. We present FastVEM, an efficient boundary-conforming fluid simulation framework that enables high-fidelity flow–boundary interaction at substantially reduced cost. Computational efficiency is achieved through a coordinated, top-down design spanning numerical discretization, grid construction, and linear solvers. FastVEM adopts a Virtual Element Method (VEM) discretization to robustly enforce incompressibility and boundary conditions on irregular body-fitted grids, and employs a VEM polynomial-space Particle-in-Cell scheme for advection. Complementing this discretization, a convexity-preserving cut-cell strategy is introduced to construct simulation-friendly body-fitted grids. To accelerate pressure projection, we develop a Galerkin geometric multi-grid solver featuring a diffusion-free prolongation operator that prevents coarse-level matrix densification, along with a nested, boundary-aware grid hierarchy that ensures well-posed placement of coarse-level degrees of freedom. Compared to prior cut-cell–based fluid simulators, FastVEM speeds up the computationally dominant pressure projection stage by up to 100×, while robustly handling even more challenging boundary geometries.

---

## 关联笔记
- [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]] — 同为 SIGGRAPH 2026，聚焦可微流体的梯度计算效率
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 同为烟雾重建
- [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] — (本篇的 arXiv 风格索引)
- 技术笔记：[[烟雾火焰]]

## 资源链接
- **代码**：https://oliver-zrz-cyber.github.io/FastVEM/
- PDF：http://ren-bo.net/papers/zrz_tog2026.pdf
