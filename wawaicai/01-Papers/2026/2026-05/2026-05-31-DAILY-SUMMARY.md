# Daily Summary - 2026-05-31

## 📋 今日论文收集报告

**收集时间**: 2026-05-31 14:04 UTC  
**搜索范围**: arXiv cs.GR (最近7天), SIGGRAPH/Eurographics 2026  
**关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 📊 搜索结果统计

| 来源 | 论文数 | 几何相关 |
|------|--------|----------|
| arXiv cs.GR (5/25-5/29) | 42篇 | 8篇 |
| 几何相关占比 | - | ~19% |

---

## 🔍 几何处理相关论文

### 1. Cross Field 生成 (与四边形网格相关)

**CrossLift: Look Both Ways Before You Cross: Lifting Cross Fields From 2D Visual Priors**
- **arXiv**: [2605.26062](https://arxiv.org/abs/2605.26062)
- **日期**: 2026-05-25
- **核心方法**: 利用2D 图像的 text-to-image priors 生成 cross fields，然后 back-project 到网格表面
- **几何相关度**: ⭐⭐⭐⭐⭐ (直接涉及 quad meshing 和 cross field)
- **创新点**: 
  - 使用2D visual priors 引导 cross field 生成
  - 两步 smooth interpolation (view内 + cross view)
  - 支持纹理对齐的四边形网格生成
- **链接**: https://crosslift.github.io/

### 2. 曲线骨架化

**CSCD: Curve Skeletonization in Continuous Domain for Meshes and Point Clouds**
- **arXiv**: [2605.25921](https://arxiv.org/abs/2605.25921)
- **日期**: 2026-05-25
- **核心方法**: 将 Local Separators (LS) 方法推广到流形上的连续域
- **几何相关度**: ⭐⭐⭐⭐ (骨架化是几何处理核心问题)
- **创新点**:
  - CSCD-M: 首个 intrinsic 方法用于曲线骨架化
  - CSCD-PC: 使用 tufted Laplacians 增强鲁棒性
  - 超越 LS (TOG'21) 和 CoverageAxis++ (Eurographics'24)
- **链接**: https://cscd-skel.pages.dev

### 3. 曲面 PDE 求解

**PINNSur: Physics-Informed Neural Networks for PDEs on Curved Surfaces**
- **arXiv**: [2605.27308](https://arxiv.org/abs/2605.27308)
- **日期**: 2026-05-26
- **核心方法**: 使用 PINNs 在弯曲曲面上求解 PDE，不依赖网格质量
- **几何相关度**: ⭐⭐⭐⭐ (几何处理基础工具)
- **创新点**:
  - 训练 neural field 近似曲面法向量
  - 将微分算子从 R³ 投影到曲面
  - 适用于任意曲率和拓扑的流形
- **应用**: 几何处理中的表面 PDE 求解

### 4. 可变形对象仿真

**Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes**
- **arXiv**: [2605.29318](https://arxiv.org/abs/2605.29318)
- **日期**: 2026-05-28
- **核心方法**: 使用 Reproducing Kernel Particle Method (RKPM) 表示，构造 reduced-order skinning weights
- **几何相关度**: ⭐⭐⭐ (涉及网格变形)
- **创新点**:
  - 40x 训练加速 vs neural fields per-shape optimization
  - 比 FEM 更低的仿真误差
  - 支持 mesh 和 Gaussian splats
- **会议**: CVPR 2026

### 5. 服装仿真

**ClothTransformer: Unified Latent-Space Transformers for Scalable Cloth Simulation**
- **arXiv**: [2605.27852](https://arxiv.org/abs/2605.27852)
- **日期**: 2026-05-27
- **核心方法**: 将 cloth simulation 转化为 latent space 中的自回归序列建模
- **几何相关度**: ⭐⭐⭐ (涉及 garment mesh)
- **创新点**:
  - 统一 Transformer 处理多种场景
  - 4-9x 更低误差
  - 493.4k 帧的无穿透数据集
- **应用**: 布料仿真

### 6. 服装生成 (2D-3D 对称表示)

**Garment Particles: A 2D-3D Symmetric Garment Representation for Generation and Editing**
- **arXiv**: [2605.26391](https://arxiv.org/abs/2605.26391)
- **日期**: 2026-05-25
- **核心方法**: 5D point-cloud 表示，联合编码 2D 裁剪图案和 3D 几何
- **几何相关度**: ⭐⭐⭐⭐ (涉及服装几何生成)
- **创新点**:
  - Garment Particles Flow (GPF) 支持生成和编辑
  - Particles-to-Pattern Flow 转换为基于曲线的图案
- **链接**: https://garment-particles.github.io

### 7. 开放曲面生成

**AnySurf: Any Surface Generation with Directed Edge**
- **arXiv**: [2605.26149](https://arxiv.org/abs/2605.26149)
- **日期**: 2026-05-26
- **核心方法**: 使用 directed-edge enhanced Flexible Dual Grid (FDG-D) 生成开放/封闭/混合曲面
- **几何相关度**: ⭐⭐⭐⭐⭐ (几何生成核心)
- **创新点**:
  - 解决开放曲面的 normal 和 topology 错误
  - 统一的3D 生成框架
  - ROS-FT post-training + DE-Adapter
- **应用**: 服装、鞋子、配饰

---

## 📝 备注

- 本次搜索未发现专门针对 remeshing/simplification/parametrization 的新论文
- 3D 生成方向 (Gaussian splatting, 3D asset generation) 仍然是热点
- Cross field 和 quad meshing 相关研究持续活跃
- 服装几何建模是 geometry processing 的重要应用方向

---

## 🔗 相关链接

- arXiv cs.GR: https://arxiv.org/list/cs.GR/recent
- 论文列表 (2026-05-25 ~ 2026-05-29): 42 篇
- 本摘要保存位置: `wawaicai/01-Papers/2026/2026-05/2026-05-31-DAILY-SUMMARY.md`