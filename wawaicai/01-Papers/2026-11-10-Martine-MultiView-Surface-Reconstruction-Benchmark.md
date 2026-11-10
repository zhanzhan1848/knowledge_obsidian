---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 几何处理, 多视角重建, 基准测试, 表面重建, 点云, 神经隐式]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.11602
---

# Martine: Benchmarking Multi-View 3D Surface Reconstruction Across Viewpoint Coverage, Resolution, and Lighting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Martine: Benchmarking Multi-View 3D Surface Reconstruction Across Viewpoint Coverage, Resolution, and Lighting |
| **作者** | Robin Bruneau, Baptiste Brument, Frederic Giraud, Bastian Sigrist, Sascha Jecklin, Philipp Fürnstahl, Björn Menze, Lilian Calvet |
| **发表** | arXiv 2026-11-08 (cs.CV) |
| **链接** | [原文](https://arxiv.org/abs/2611.11602) |
| **代码** | 未在摘要中给出 |

---

## 核心贡献

> 提供一个**可控采集**的多视角 3D 表面重建基准，用以公平比较不同重建范式在不同视角覆盖、分辨率、光照和材质属性下的表现。

1. **28 个物体**的高精度多视角采集，含**透明材质**与**精细结构**等困难样例
2. **9568 × 6376** 分辨率，**84 个视角**，覆盖球冠（spherical cap）
3. **单光 / 多光**两种光照制度
4. **物体无关的相机标定** + **高精度 3D 真值扫描** + **标定与图像-几何对齐精度量化**
5. **3D 属性掩码**：可按材质属性、可见性、曲率、精细结构分析误差
6. 基准可分辨**亚毫米级**重建差异（最优观测 Chamfer 距离 0.058 mm）

---

## 技术方案

### 核心思想

现有基准的两类缺陷导致结论有偏：

| 缺陷 | 后果 |
|------|------|
| 限制视角覆盖 / 分辨率 / 光照 | 比较结果偏向适合该设定的方法 |
| 缺乏精确 3D 真值或图像-几何对齐量化 | 无法做度量的表面评估 |

Martine 的定位是**采集受控**（controlled acquisition），而非事后筛选已有数据——这是它与常规 MVS 基准的根本差异。

### 关键技术

| 技术 | 说明 |
|------|------|
| **采集制度** | 84 视角球冠分布；单光 / 多光两种 regime |
| **分辨率** | 9568 × 6376（超高分辨率，远高于常规基准的 4K 甚至 2K） |
| **相机标定** | 物体无关标定（object-independent），保证标定精度不依赖被摄物体 |
| **真值** | 高精度 3D 扫描（独立于重建流程） |
| **对齐精度** | 在测试图像上量化标定误差与图像-几何对齐误差，作为误差下限 |
| **属性掩码** | 3D property masks，支持按材质、可见性、曲率、精细结构分层分析 |

### 对比的方法族

- 摄影测量（photogrammetry）
- 经典多视图立体（MVS）
- 神经隐式表面（neural implicit surfaces）
- 基于高斯泼溅的重建（Gaussian-splatting-based）
- 多视图光度立体（multi-view photometric stereo）

---

## 实验结论

- **可分辨能力**：最优观测 Chamfer 距离 **0.058 mm**（在评估的可见表面上）
- **结论性发现**：基准提供了 **regime-aware evaluation**（按采集制度分层的评估），并对参考数据精度有**显式控制**
- 关键论断：重建精度**同时**取决于重建范式、物体属性和采集制度三者，不能孤立地评价方法

---

## 局限性

- 仅 28 个物体，物种/类别覆盖有限
- 高分辨率采集意味着数据集体积极大
- 透明材质与精细结构的对齐误差下限虽被量化，但仍是比较的物理约束

---

## 相关工作

- [[Mip-NeRF-360]]
- [[Tanks-and-Temples]]
- [[DTU-Scan]]
- [[Blended-MVS]]
- [[NeuS]]
- [[2DGS]]
- [[Multi-View-Photometric-Stereo]]

---

## 实现建议

- **实现难度**：**高**（作为基准消费方则低）。自建采集需高精度扫描仪 + 标定装置 + 受控光照。
- **数值稳定性**：分辨率高 → 亚毫米级误差需要**浮点精度 + 精确的标定外参**；对 Mesh 做 Chamfer 距离时需注意最近点搜索在大规模网格上的加速（KD-tree / 网格空间哈希）
- **依赖项**：Open3D / PCL（点云与网格 IO）、CGAL（最近点与距离）、PyTorch3D 或自建渲染器
- **适用场景**：
  - **评测自研重建算法**（尤其关心高分辨率、透明材质、精细结构）
  - 论文对比实验中需要「受控制度」的基线
  - 摄影测量标定精度的定量验证
- **推荐度**：⚠️ **建议关注**。对做重建算法评测的研究者这是重要参考；对纯几何处理算法开发者，价值主要在误差分析口径的借鉴。

---

## 可视化建议

- 重点看「regime-aware」分层结果：按光照制度（单光/多光）× 材质属性（透明/不透明）× 曲率层级分组的误差曲线
- Chamfer 距离随分辨率/视角数变化的曲线，可用于确定自己实验的最小必要采集成本
