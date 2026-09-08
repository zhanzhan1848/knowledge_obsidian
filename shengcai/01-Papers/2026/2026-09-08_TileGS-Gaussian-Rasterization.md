---
type: paper
created: 2026-09-08
updated: 2026-09-08
tags: [paper, rendering, rasterization, gaussian-splatting, optimization]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.03613
---

# Tile-Local Depth Binning for Gaussian Splatting Rasterization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Tile-Local Depth Binning for Gaussian Splatting Rasterization |
| **作者** | Wei Tan 等 |
| **发表** | arXiv (Under review) |
| **链接** | [原文](https://arxiv.org/abs/2609.03613) |
| **DOI** | 10.48550/arXiv.2609.03613 |
| **代码** | - |

---

## 核心贡献

> 通过 tile-local 深度重组实现 3D Gaussian Splatting 光栅化加速

1. 提出 TileGS，将长tile范围重组为多个短深度局部范围
2. 实现前向到后向顺序的光栅化
3. 应用选择性修复解决粗糙排序不足的问题

---

## 技术方案

### 核心思想

标准 3DGS 光栅化遍历全局排序的 tile 流，创建长 per-tile 范围和大量几何属性传输。TileGS 将每个长 tile 范围转换为一系列较短的深度局部范围，以前向到后向顺序光栅化这些范围。

### 关键技术

| 技术 | 说明 |
|------|------|
| Tile-Local Depth Binning | 将全局排序转为 tile-local 深度排序 |
| 前向到后向光栅化 | 按深度顺序处理 Gaussians |
| 选择性修复 | 处理粗糙排序不完美的情况 |

---

## 实验结论

- **数据集**: 9 场景 benchmark (桌面和笔记本 Ada GPU)
- **基线**: gsplat (优化的开源 3DGS 实现)
- **结果**: 
  - RTX 4090: 平均 1.44x 光栅内核加速
  - 端到端帧加速: RTX 4090 1.069x, RTX 1000 Ada 1.094x
  - PSNR/SSIM/LPIPS 差异 < 0.001

---

## 局限性

- 需要 GPU 特定实现
- 主要针对 Ada 架构优化

---

## 实现建议

- **实现难度**: 高 (需要深入 GPU 架构理解)
- **预期性能**: RTX 4090 上 1.44x 光栅化加速
- **适用场景**: 实时 3DGS 应用、游戏引擎集成

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[实时渲染优化]]
- [[gsplat]]
