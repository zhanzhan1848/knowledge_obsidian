# 📅 2026-08-31 Daily Research Summary — 流体渲染

> 搜索范围：最近 7 天 arXiv cs.GR 新论文 + SIGGRAPH 2026 流体相关论文
> 执行时间：2026-08-31 14:08 UTC

---

## 🔍 搜索结果概览

| 来源 | 论文数 | 相关论文数 |
|------|--------|-----------|
| arXiv cs.GR (近7天) | 21 | 1 |
| SIGGRAPH 2026 | ~100+ | 3 |
| SIGGRAPH Asia 2026 | 会议中 | 1 |

**结论：近24小时内 arXiv cs.GR 无新增流体渲染直接相关论文（关键词密度低），但过去7天内及 SIGGRAPH 2026 有多篇高影响力流体渲染论文。**

---

## 📄 相关论文详情

---

### 1️⃣ Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows

| 属性 | 内容 |
|------|------|
| **arXiv** | [2608.25203](https://arxiv.org/abs/2608.25203) |
| **DOI** | [10.1145/3842540](https://doi.org/10.1145/3842540) |
| **会议** | SIGGRAPH Asia 2026 (ACM TOG) |
| **作者** | Sinan Wang et al. |
| **Subjects** | cs.GR, math.NA, physics.flu-dyn |
| **日期** | 2026-08-25 |

#### 摘要

Simulating large-scale free-surface water by coupling a localized 3D fluid solver to a cheaper 2D surface model has long faced a mismatch in wave dynamics: efficient 2D wave models used in graphics are typically either linear or non-dispersive. These models are fast, simple, and accurate for calm, small-amplitude seas, but coupling them with strongly nonlinear 3D solvers produces visible reflections and artifacts at the 2D--3D interface.

**本文方法：**
- 引入基于经典 Zakharov 公式的**非线性色散 2D 波浪模型**
- Hamiltonian 结构：表面高程 (η) 和表面势 (ψ) 形成正则对
- 实现了 canonically consistent two-way coupling scheme，2D-3D 界面信息平滑传递
- 比 SWE、BEM、Airy 基线**降低平均波高误差 1.7-5×**，比 BEM 快 **10³×**
- 与 3D Navier-Stokes 求解器耦合，抑制可见接缝伪影（色散匹配 + Kelvin 波形测试）
- 比纯 GPU NB-FLIP 模拟**快 4×**

#### 渲染关联

> **ocean rendering / water surface / 2D-3D coupling**

- 大规模海面自由表面水的实时模拟
- 波浪-3D 流动双向耦合
- Kelvin 波形（船舶尾迹）
- GPU 加速实现

#### 核心创新点

```
1. 非线性色散 2D 波浪模型 (Zakharov formulation)
2. Hamiltonian 正则对 (η, ψ) 保证耦合一致性
3. 无需全局求解器 → 实时 Arbitrary-resolution
4. 与 3D Navier-Stokes 求解器的无缝接口
```

#### 性能指标

| 指标 | 数值 |
|------|------|
| 波高误差减少 | 1.7-5× vs SWE/BEM/Airy |
| 速度提升 | >10³× vs BEM |
| 全系统加速 | 4× vs GPU NB-FLIP |

#### URL

- Paper: https://arxiv.org/abs/2608.25203
- PDF: https://arxiv.org/pdf/2608.25203

---

### 2️⃣ Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

| 属性 | 内容 |
|------|------|
| **DOI** | [10.1145/3811312](https://doi.org/10.1145/3811312) |
| **会议** | SIGGRAPH 2026 — **Best Paper** (ACM TOG) |
| **作者** | Doug L. James (Stanford), Ethan James |
| **日期** | 2026-07 |
| **代码** | https://dougjam.github.io/mixwell-2026/ |

#### 摘要

Mixwell presents **sharp 2D fluid brushes** and GPU-accelerated analytical methods for **progressive, resolution-independent physics-based mixing**.

核心方法：
- 从圆柱齿周围的势流（potential flow）推导
- 包含 cusped, **Kelvinlet-style regularized velocity brush**，捕捉圆柱-流体相互作用
- 基于 Maxwell 1869 drift formulation，开发 GPU 友好的粒子漂移评估策略
- 引入 **Cylindrical Reverse-Drift Functions (RDFs)**：编码齿插入、运动和移除的位移场
- 像 SDF 一样可自然组合，可在 shader 中链接实现复杂操作
- 无需全局求解器、网格或中间纹理重采样

#### 渲染关联

> **fluid mixing / particle system / progressive rendering / 2D fluid**

- 2D 流体混合（绘画风格）
- 粒子漂移（Maxwell drift）
- 无网格、无全局求解
- GLSL/HLSL 实时实现
- Houdini (OpenCL, OSL) 生产集成

#### 核心创新点

```
1. Kelvinlet-style velocity brush（正则化速度笔刷）
2. Maxwell 1869 drift formulation 的 GPU 高效实现
3. Reverse-Drift Functions (RDFs) — 类似 SDF 的组合性
4. 周期性组合方案（Periodicity-exploiting composition）
5. 完全 progressive：无全局求解、无网格、无中间纹理重采样
```

#### 性能指标

| 指标 | 数值 |
|------|------|
| 数值耗散 | negligible（可忽略）|
| 分辨率依赖 | 无（resolution-independent）|
| 实现方式 | GLSL/HLSL 实时 shader |

#### URL

- Project: https://dougjam.github.io/mixwell-2026/
- Code: https://github.com/dougjam/mixwell-2026

---

### 3️⃣ GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction

| 属性 | 内容 |
|------|------|
| **DOI** | [10.1145/3799902.3811148](https://doi.org/10.1145/3799902.3811148) |
| **会议** | SIGGRAPH 2026 |
| **作者** | TBA |
| **Session** | Fluid Reconstruction & Optimization |
| **日期** | 2026-07 |

#### 摘要

Physics-aware method for **reconstructing dynamic fluids from sparse-view videos**.

**本文方法：**
- 结合体积渲染 + 物理引导的 Gaussian 优化
- 显式耦合 Gaussian 参数的动态演化与底层流动
- 强制密度和运动的一致性
- 减少伪影，提高真实感

#### 渲染关联

> **smoke rendering / volume rendering / 3D Gaussian Splatting / sparse-view reconstruction**

- 稀视重建（稀疏多视角）
- 烟雾体积渲染
- 3D Gaussian Splatting
- 物理一致性约束

#### 核心创新点

```
1. Physics-guided Gaussian optimization（物理引导的高斯优化）
2. Gaussian 参数与流动运动的显式耦合
3. 密度-运动一致性强制约束
4. 稀视输入下的高精度烟雾重建
```

#### URL

- Paper: https://dl.acm.org/doi/10.1145/3799902.3811148

---

### 4️⃣ LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction

| 属性 | 内容 |
|------|------|
| **arXiv** | [2605.09299](https://arxiv.org/abs/2605.09299) |
| **DOI** | [10.1145/3799902.3811188](https://doi.org/10.1145/3799902.3811188) |
| **会议** | SIGGRAPH 2026 |
| **作者** | Ningxiao Tao et al. |
| **日期** | 2026-05-10 |

#### 摘要

Reconstructing 3D fluid velocity fields from sparse 2D video observations is a highly ill-posed inverse problem.

**本文方法：**
- 用 **Divergence-Free Kernel** 表示重建速度场
- 驱动 **Lagrangian 3D Gaussian Splatting** 表示的对流
- **结构上保证** flow incompressibility 和 long-range transport coherence
- 引入 **Sliding Window scheme**：在可管理的训练成本下传播时间域梯度
- 支持高质量重模拟和流动分析

#### 渲染关联

> **fluid reconstruction / 3D Gaussian Splatting / divergence-free / Lagrangian method**

- 流体速度场重建（稀视 → 3D）
- Divergence-free 速度场（流体力学约束）
- Lagrangian 3D Gaussian Splatting
- 重模拟 + 流动分析

#### 核心创新点

```
1. Divergence-Free Kernel 表示（结构保证不可压缩性）
2. Lagrangian 3DGS 对流（长期传输一致性）
3. Sliding Window 梯度传播（高效优化）
4. transport consistency + physical accuracy 双重保证
```

#### URL

- arXiv: https://arxiv.org/abs/2605.09299
- HTML: https://arxiv.org/html/2605.09299v1

---

## 📊 今日分析总结

### 技术趋势

| 趋势 | 描述 |
|------|------|
| **3DGS + 流体** | Gaussian Splatting 成为流体重建的主流底层表示（LagrangianSplats, GauSmoke）|
| **物理约束内嵌** | 不再靠软惩罚，而是结构上保证物理定律（divergence-free, Hamiltonian）|
| **无网格/无全局求解** | Mixwell 示范了完全局部的 GPU shader 方法，零数值耗散 |
| **2D-3D 耦合** | 大规模海面模拟采用分层耦合（Hamiltonian Waves + 3D NS）|
| **实时性突破** | Mixwell 实时 GLSL/HLSL；Hamiltonian 耦合 4× 快于 NB-FLIP |

### 渲染技术分类

```
体积渲染 Volume Rendering
├── GauSmoke (3DGS + physics)
└── LagrangianSplats (divergence-free 3DGS)

粒子渲染 Particle Rendering  
├── Mixwell (Maxwell drift, Kelvinlet brush)
└── LagrangianSplats (Lagrangian Gaussian primitives)

水面渲染 Water Surface
└── Hamiltonian Two-Way Coupling (2D-3D wave-NS coupling)

无网格方法 Meshfree
└── Mixwell (RDFs, no grid, no global solve)
```

### 值得关注的后续

1. **Mixwell** → 扩展到 3D？RDF 组合思想迁移到其他流体效果？
2. **LagrangianSplats** → 能否用于 water/ fire 而不只是烟雾？
3. **Hamiltonian coupling** → 与 neural solver 的结合？

---

## 🔗 相关资源

- arXiv cs.GR: https://arxiv.org/list/cs.GR/recent
- SIGGRAPH 2026 Papers: https://kesen.realtimerendering.com/sig2026.html
- SIGGRAPH Asia 2026: https://asia.siggraph.org/2026/submissions/technical-papers/

---
*🌱 由 豆苗 (Doumiao) 自动生成 | 2026-08-31*
