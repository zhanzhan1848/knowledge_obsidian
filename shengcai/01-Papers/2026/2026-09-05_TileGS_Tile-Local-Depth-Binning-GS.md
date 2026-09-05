---
title: Tile-Local Depth Binning for Gaussian Splatting Rasterization
authors: Wei Tan et al.
date: 2026-09-03
source: arXiv cs.GR
url: https://arxiv.org/abs/2609.03613
pdf: https://arxiv.org/pdf/2609.03613
tags: [rendering, 3DGS, rasterization, optimization, 2026]
status: unread
---

# TileGS: Tile-Local Depth Binning for Gaussian Splatting Rasterization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Tile-Local Depth Binning for Gaussian Splatting Rasterization |
| 作者 | Wei Tan et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.03613) |
| PDF | [下载](https://arxiv.org/pdf/2609.03613) |

## 核心贡献
1. 提出 TileGS，将全局 tile 排序重构为 tile-local 深度分箱策略
2. 将长 tile 范围分解为多个短深度局部范围，以前向顺序光栅化
3. 在不损失精度的情况下实现 1.44x 光栅内核加速

## 技术方案

**问题**: 标准 3DGS 光栅化遍历全局排序的 tile 流，产生长 per-tile 范围和高几何属性流量。

**方案**: TileGS 将每个长 tile 范围转化为一系列短的深度局部范围：
- 将 Gaussians 按深度分配到 tile-local 的 depth bin
- 每个 bin 内以前向顺序光栅化
- 选择性修复粗排序不足的区域以匹配基线合成

**性能数据** (RTX 4090, 9 场景基准):
- 光栅内核加速: **1.44x**
- 端到端帧加速: **1.069x** (RTX 4090) / **1.094x** (RTX 1000 Ada)
- PSNR 偏差: < 0.001 dB
- SSIM 偏差: < 0.001
- LPIPS 偏差: < 0.001
- SASS 线程指令减少: **1.26x**

**分析**: TileGS 性能提升来自减少有效光栅遍历工作，而非减少字节量、改善合并、提高占用率或减少 warp 分支。

几何属性主导剩余内存压力：85.8% 总光栅流量，88.6% 过剩扇区。

## 可行性分析
- 实现难度：中等（需修改光栅化管线）
- 性能预期：高质量场景 1.07-1.44x 加速
- 适用场景：实时 3DGS 应用，GPU 光栅化管线

## 相关工作
- [[2026-05-04_GRTX_Efficient-Ray-Tracing-3D-Gaussian]]
- [[2026-06_TRON-Gaussian-Ray-Tracing]]
- [[2026-06-03_Decoupling-Appearance-Geometry-in-Gaussian-Splatting]]

## 笔记
工程优化方向明确，通过 tile-local 重组织减少光栅化遍历开销，是 3DGS 实时渲染的重要优化手段。
