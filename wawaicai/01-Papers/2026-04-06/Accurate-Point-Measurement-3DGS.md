---
tags: [几何, 点云, 3DGS, 测量, 精度评估]
date: 2026-04-06
source: arXiv cs.CV
---

# Accurate Point Measurement in 3DGS

## 核心方法

提出基于 3D Gaussian Splatting (3DGS) 的精确点测量方法，突破传统立体视图测量的局限。

### 核心发现
- **网格重建管道**优化连续表面，高度依赖捕获几何
- **薄物体**（thin structures）→ 网格方法 RMSE 0.062m，本文 0.037m
- **尖锐角落**（sharp corners）→ 网格方法完全失败，本文 0.013m RMSE

### 方法优势
| 场景 | 网格方法 | 本文方法 |
|------|----------|----------|
| 薄结构 | 0.062m RMSE | 0.037m RMSE |
| 尖锐角落 | 完全失败 | 0.013m RMSE |

### 技术贡献
- 针对几何挑战区域（薄结构、尖锐边缘）设计
- 网格表示在这些区域易出现平滑或失败
- 3DGS 显式表示 + 快速光栅化 → 精确测量

## 开源参考
- 代码: https://（待补充）
- 相关: 3D Gaussian Splatting, Mesh Reconstruction

## 相关笔记
[[Point Cloud]]
[[Mesh Reconstruction]]
[[3D Gaussian Splatting]]

## 可行性分析

### 技术概述
3DGS 用于精确点测量，优于传统基于网格的测量

### 实现难度
- 算法复杂度：中
- 数值稳定性：在挑战性几何区域表现稳定
- 依赖项：3DGS

### 推荐结论
✅ 推荐关注

### 适用场景
- 高精度点测量
- 薄结构/尖锐边缘场景
- 工程测量与检测

---
**链接**: https://arxiv.org/abs/2603.24716
**PDF**: https://arxiv.org/pdf/2603.24716
**作者**: Rongjun Qin et al.
**日期**: 2026-03-25
