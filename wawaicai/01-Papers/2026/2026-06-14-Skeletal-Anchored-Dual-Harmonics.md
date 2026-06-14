---
tags: [几何, 形状表示, 骨骼, 球谐函数, 点云, mesh-generation]
---

# Skeletal-Anchored Dual Harmonics for Structured 3D Modeling

## 核心方法

提出 **Skeletal-Anchored Dual Harmonics (SADH)**，一种将局部表面几何与内部中尺度骨骼组织紧密耦合的 3D 形状表示。

### 表示方式
- 每个 patch 使用**双通道球谐函数 (SH)** 参数化
- 通道1: 建模局部径向几何
- 通道2: 通过广义视锥定义自适应 patch support

### 优化流程
从无组织点云开始，分阶段优化：
1. 表面几何
2. 锚点位置
3. patch 方向
4. 结构连接性

### 关键创新
- 与各向同性基元（medial spheres, Gaussian kernels）不同，SH patches 直接编码各向异性局部表面几何和自适应空间 support
- **测地锚点图**保持相邻 patch 之间的结构关系

## 核心公式
- 双通道 SH: f(θ, φ) = Σ (a_lm Y_lm(θ, φ) + b_lm Y_lm'(θ, φ))
- 广义视锥定义 support region

## 算法复杂度
- SH 展开: O(n · l²) 其中 l 是 SH 阶数
- 优化: 迭代求解

## 开源实现
- libigl: `igl::harmonic`, `igl::point_areas`
- OpenMesh: `OpenMesh::Utils::SmartVertexT`

## 相关笔记
[[2026-03-17-Masked-BRep-Autoencoder-Hierarchical-Graph-Transformer]]
[[2026-05-20-CompoSE-Part-Aware-3D-Shape-Synthesis]]

## 可行性评估
✅ **推荐实现** - 骨骼+表面联合表示对几何建模很有价值

## 来源
- arXiv: [2606.07337](https://arxiv.org/abs/2606.07337)
- 分类: cs.GR
- 日期: 2026-06-05