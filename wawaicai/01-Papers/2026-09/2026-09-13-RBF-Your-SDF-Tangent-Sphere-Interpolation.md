---
tags: [几何, SDF重建, RBF插值, 切球, 曲面重建]
date: 2026-09-13
conference: arXiv cs.GR
---

# RBF Interpolation of Signed Distance Fields with Implied Tangent Points

## 论文信息
- **arXiv**: [2609.06209](https://arxiv.org/abs/2609.06209)
- **PDF**: [pdf](https://arxiv.org/pdf/2609.06209)
- **作者**: Yong Cheng et al.
- **日期**: 2026-09-05
- **主题**: RBF interpolation of SDFs preserving sharp features via implied tangent sphere structure

## 核心方法

### 问题背景
Signed Distance Fields (SDFs) 是几何的流行隐式表示。将离散 SDF 样本集转换为显式曲面是几何处理的基本问题。传统方法（Marching Cubes, Dual Contouring）忽略远离表面的样本携带的几何信息。

### 核心创新
将 **切球观察** 与 **径向基函数 (RBF) 插值** 结合：
- 利用所有数据（隐含表面点 + 原始数据）进行重建
- 通过检测极约束切球点（尖锐特征处几何强制形成）识别并保留表面角点
- 使用 **Partition-of-Unity 分解** 实现大分辨率高效缩放

### 技术框架
1. **切球结构**：每个 SDF 样本隐含一个与表面相切球面上的点
2. **切点检测**：检测极约束切球点配置 → 识别尖锐特征处表面角点
3. **RBF 插值**：结合隐含表面点和原始数据
4. **Partition-of-Unity**：分而治之，大分辨率可扩展

### 关键洞察
- 传统方法（marching cubes, dual contouring）只考虑表面点和法线，忽略远离表面的样本
- 切球结构编码了所有样本的空间信息
- 表面重建方法系统性地将角点"圆润化"，本文通过切球检测避免此问题

## 算法复杂度
- 大网格分辨率：通过 Partition-of-Unity 高效扩展
- 精度提升：在所有测试分辨率下改进 Chamfer 和 Hausdorff 精度
- 18 pages

## 关键公式/技术点
- SDF 切球性质：`∇f(p) · (p - c) = ±|p - c|`（切球中心 c，半径 r）
- 隐含切点：球面与表面的唯一切点
- RBF 插值：`f(x) = Σ w_i * φ(|x - x_i|)` + 隐含切点约束
- Partition-of-Unity：局部 RBF → 全局合成

## 相关笔记
[[2026-09-10-RBF-Your-SDF]]
[[2026-09-04-Gaussian-Sculpting-Surface-Reconstruction]]

## 可行性分析
- ✅ **推荐实现** — 理论扎实，精度提升明确
- libigl 参考：`sdf`, `marching_cubes`
- CGAL 参考：`SDF_3`, `make_mesh_3`
