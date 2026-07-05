---
tags: [3DGS, 光线追踪, 渲染, I3D2026]
source: arXiv cs.GR
date: 2026-06-30
conference: I3D 2026
---

# GRay: Ray Tracing 3D Gaussians Near the Speed of Splats

## 论文信息
- **arXiv**: [2606.30869](https://arxiv.org/abs/2606.30869)
- **作者**: George Drettakis et al. (INRIA)
- **会议**: I3D 2026
- **代码**: https://repo-sam.inria.fr/nerphys/gray

## 核心方法
3D Gaussian Splatting (3DGS) 因其基于光栅化的渲染器速度快而受欢迎。虽然 3D 高斯也可以光线追踪，但此前提出的 3D Gaussian Ray Tracing (3DGRT) 速度较慢，优化时间接近一个数量级。

### GRay 方法
针对光栅化与光线追踪的算法差异进行优化：

1. **核心观察**：光栅化需处理所有 primitive，而光线追踪仅评估射线实际相交的高斯
   - 光栅化：线性缩放 O(n)
   - 光线追踪：对数缩放 O(log n) —— 潜在优势

2. **密集初始化效应**：
   - 密集初始化创建许多小高斯 → 减慢光栅化，但**加速光线追踪**
   - GRay 利用此效应

3. **性能提升**：
   - 渲染速度提升 ~4x
   - 优化速度提升 ~10x（相比 3DGRT）
   - 与 3DGS 速度相当（质量略低）

## 算法创新
- 利用光线追踪的选择性评估特性
- 密集初始化优化策略
- 对数复杂度利用

## 性能对比
| 方法 | 优化速度 | 渲染速度 | 质量 |
|------|----------|----------|------|
| 3DGRT | 基准 | 基准 | 基准 |
| GRay | ~10x | ~4x | 相当 |
| 3DGS | - | 相当 | 略高 |

## 开源实现
- GitHub: https://repo-sam.inria.fr/nerphys/gray

## 相关笔记
[[3DGS]], [[光线追踪]], [[神经渲染]], [[ radiance field]]
