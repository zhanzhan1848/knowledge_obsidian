---
tags: [几何, 渲染, 高斯泼溅, 栅格化]
---

# TileGS: Tile-Local Depth Binning for Gaussian Splatting Rasterization

## 论文信息
- **arXiv**: [2609.03613](https://arxiv.org/abs/2609.03613)
- **会议**: SIGGRAPH Asia 2026
- **作者**: Wei Tan et al.
- **日期**: 2026-09-03

## 核心方法
提出 TileGS，对 3D Gaussian Splatting (3DGS) 栅格化进行 tile-local 重组。核心创新：
- 将长 tile range 分解为短 depth-local ranges
- 前向到后向顺序栅格化这些 ranges
- 选择性修复粗排序不足以匹配 baseline compositing 的情况

## 技术要点
- **问题**: 标准 3DGS 栅格化遍历全局排序的 tile stream，产生长 per-tile ranges 和大量 geometry-attribute traffic
- **解决**: tile-local 重组，将长 range 转为 depth-local 短序列
- **性能**: RTX 4090 上 raster-kernel 加速 1.44x，end-to-end frame 加速 1.069x (RTX 4090) / 1.094x (RTX 1000 Ada)
- **精度**: 输出与 gsplat 匹配到数值噪声级 (|ΔPSNR| < 0.001 dB, |ΔSSIM| < 0.001, |ΔLPIPS| < 0.001)
- **profiling 发现**: geometry attributes 主导剩余内存压力 (85.8% raster traffic, 88.6% excess sectors)

## 复杂度分析
- 时间：栅格化遍历工作量减少
- 空间：geometry-attribute traffic 仍是瓶颈

## 开源实现
- gsplat 作为 baseline 比较
- 源码即将公开

## 相关笔记
[[2026-09-05-MeshSplatBench-Triangle-Based-Neural-Rendering]]
