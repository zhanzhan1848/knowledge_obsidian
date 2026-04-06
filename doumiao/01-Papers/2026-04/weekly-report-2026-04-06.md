# 流体渲染论文周报 | 2026-04-06

> 🌱 豆苗自动收集 | 搜索范围: arXiv cs.GR + SIGGRAPH/SIGGRAPH Asia

---

## 📊 本周发现

本周在 arXiv cs.GR 及 SIGGRAPH 会议论文中，共识别出 **2 篇** 直接相关的流体渲染论文。

---

## 🩸 论文 1: Gaussian Fluids

> ### 无网格流体求解器：基于高斯空间表示的流体模拟

**论文信息**
| 属性 | 值 |
|------|-----|
| **标题** | Gaussian Fluids: A Grid-Free Fluid Solver based on Gaussian Spatial Representation |
| **arXiv** | [2405.18133](https://arxiv.org/abs/2405.18133) |
| **会议** | SIGGRAPH 2025 Conference Papers |
| **作者** | Jingrui Xing, Bin Wang, Mengyu Chu, Baoquan Chen (Peking University) |
| **GitHub** | [xjr01/Gaussian-Fluids-Code](https://github.com/xjr01/Gaussian-Fluids-Code) |
| **项目页** | [xjr01.github.io/GaussianFluids](https://xjr01.github.io/GaussianFluids/) |

**核心创新**
- 将 **3D Gaussian Splatting** 的表示能力引入流体模拟
- 将连续流速建模为多个高斯函数的加权和
- 推导空间导数的解析解，求解时变 PDE
- 相比 Eulerian/Lagrangian/Hybrid 离散方法，具有内存高效性和空间自适应性

**技术细节**
- **表示方法**: Gaussian Spatial Representation (GSR)
- **求解器类型**: Custom first-order optimizer tailored to fluid dynamics
- **优势**: 保留细尺度涡旋结构、卡门涡街等边界效应，长期模拟鲁棒
- **局限**: 一阶求解器速度尚不及显式表示方法

**渲染相关性** ⭐⭐⭐⭐⭐
- 直接关联：流体模拟 → 流体渲染管线
- GSR 表示天然适合与 3D Gaussian Splatting 渲染管线结合
- 可实现高保真流体模拟与渲染的一体化

**评估** ✅ 强烈推荐
> 这是将 Gaussian 表示从渲染反向引入模拟的重要工作，代表了流体模拟的新方向。

---

## 🩸 论文 2: Don't Splat your Gaussians

> ### 体积光线追踪基元：散射与自发光介质的建模与渲染

**论文信息**
| 属性 | 值 |
|------|-----|
| **标题** | Don't Splat your Gaussians: Volumetric Ray-Traced Primitives for Modeling and Rendering Scattering and Emissive Media |
| **arXiv** | [2405.15425](https://arxiv.org/abs/2405.15425) |
| **会议** | ACM Transactions on Graphics (SIGGRAPH 2025) |
| **作者** | Jorge Condor, Simon Speierer, Lukas Bode, Anton B. Bozic, Steven Green, Piotr Didyk, Adrian Jarabo |
| **项目页** | [arcanous98.github.io/projectPages/gaussianVolumes](https://arcanous98.github.io/projectPages/gaussianVolumes.html) |

**核心创新**
- 形式化并推广了使用**高斯核混合**建模散射和自发光介质的方法
- 推导了不同核的**透射率闭合解**和**自由飞行距离采样**解析公式
- 适配任意现成的体积路径追踪器
- 引入 **Epanechnikov 核**作为 Gaussian 核的高效替代

**技术细节**
- **核类型**: Gaussian, Epanechnikov 等多种核函数
- **渲染方法**: Volumetric Ray Tracing (非 Splatting)
- **应用场景**: 前向渲染、逆渲染、层析重建、辐射场优化
- **物理基础**: 体积路径追踪，支持散射、重光照、复杂相机模型

**渲染相关性** ⭐⭐⭐⭐⭐
- 直接应用于烟雾、体积光、火等散射介质渲染
- 相比体素网格更紧凑高效
- 支持体积介质的逆渲染和重光照

**评估** ✅ 强烈推荐
> 这是体积渲染领域的重要进展，对烟雾、火、体积光等效果的渲染有直接价值。

---

## 📋 其他相关论文 (arXiv cs.GR 本周)

### RT-GS: Gaussian Splatting with Reflection and Transmittance
- **arXiv**: [2604.00509](https://arxiv.org/abs/2604.00509)
- **领域**: 镜面反射 + 半透明表面 (与水面渲染相关)
- **方法**: 微面元材质模型 + 光线追踪，联合建模反射和透射
- **关联度**: ⭐⭐⭐ (间接相关，水面反射/折射)

### TrackerSplat: Dynamic 3D Gaussians Reconstruction
- **arXiv**: [2604.02586](https://arxiv.org/abs/2604.02586)
- **会议**: SIGGRAPH Asia 2025
- **领域**: 动态场景 3DGS 重建，支持大位移
- **关联度**: ⭐⭐⭐ (可用于动态流体场景)

### Palette-Based Color Grading for 3DGS
- **arXiv**: [2604.01551](https://arxiv.org/abs/2604.01551)
- **领域**: 3DGS 颜色编辑
- **关联度**: ⭐⭐ (不直接相关)

---

## 🔬 技术趋势分析

### Gaussian 表示在流体领域的崛起
1. **Gaussian Fluids** (SIGGRAPH 2025): 将 Gaussian 用于流体模拟
2. **Don't Splat your Gaussians** (SIGGRAPH 2025): 将 Gaussian 用于体积散射渲染
3. 两者结合 → 端到端 Gaussian 流体渲染管线

### 体积渲染新范式
- 传统: 体素网格 + Ray Marching
- 新范式: Gaussian 核混合 + Volumetric Ray Tracing
- 优势: 解析求解、无网格、自适应分辨率

---

## 📁 知识库结构

```
~/knowledge-vault/doumiao/01-Papers/
├── 2026-04/
│   └── weekly-report-2026-04-06.md  ← 本文件
├── 技术/
│   └── 体积渲染/
│       ├── Gaussian-Volumes.md
│       └── Fluid-Simulation.md
└── 开源项目/
    └── Gaussian-Fluids.md
```

---

*由 🌱 豆苗 自动生成 | 2026-04-06*
