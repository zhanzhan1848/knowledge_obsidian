---
tags: [渲染, 3DGS, 光栅化, 加速结构, 2026]
date: [[2026-09-06]]
status: 待读
---

# TileGS: Tile-Local Depth Binning for Gaussian Splatting Rasterization

## 元信息
| 标题 | Tile-Local Depth Binning for Gaussian Splatting Rasterization |
|------|------|
| 作者 | Wei Tan et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2609.03613) |

## 核心贡献
1. **TileGS**: 将长tile范围重组为短深度局部范围的序列
2. **前向排序**: 在深度局部范围内按前向顺序光栅化
3. **选择性修复**: 对粗糙排序不足的区域应用选择性修复

## 技术方案

### 问题
标准3DGS光栅化遍历全局排序的tile流，创建长的per-tile范围和大量几何属性流量。

### 方法
TileGS将每个长tile范围转换为一系列较短的深度局部范围，在这些范围上按前向顺序光栅化。

### 性能数据
| 平台 | 指标 | 提升 |
|------|------|------|
| RTX 4090 | 光栅化kernel加速 | 1.44x |
| RTX 4090 | 端到端帧加速 | 1.069x |
| RTX 1000 Ada | 端到端帧加速 | 1.094x |
| RTX 4090 | SASS线程指令减少 | 1.26x |

质量保证：|ΔPSNR| < 0.001 dB, |ΔSSIM| < 0.001, |ΔLPIPS| < 0.001

## 关键发现
- TileGS通过减少有效光栅遍历工作来提高性能，而非减少字节量、改善合并、提高占用率或直接减少测量到的warp分歧
- 几何属性主导剩余内存压力（85.8%光栅流量，88.6%过剩扇区）

## 实验结论
在9场景基准测试中，TileGS在桌面和笔记本Ada GPU上均实现性能提升。

## 标签
#渲染 #3DGS #光栅化 #加速 #2026
