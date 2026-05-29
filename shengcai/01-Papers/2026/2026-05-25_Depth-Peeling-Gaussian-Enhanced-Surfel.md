---
title: Depth Peeling for High-Fidelity Gaussian-Enhanced Surfel Rendering
authors: Keyang Ye
date: 2026-05-25
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.25345
pdf: https://arxiv.org/pdf/2605.25345
tags: [rendering, gaussian-splatting, surfel, depth-peeling, 2026]
status: unread
---

# Depth Peeling for High-Fidelity Gaussian-Enhanced Surfel Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Depth Peeling for High-Fidelity Gaussian-Enhanced Surfel Rendering |
| 作者 | Keyang Ye |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.25345) |
| PDF | [下载](https://arxiv.org/pdf/2605.25345) |

## 核心贡献
1. 提出 DP-GES，将不透明 surfels 增强为半透明边界
2. 利用 Depth Peeling 建立精确的逐像素排序
3. 实现无排序的 Gaussian splatting，正确透射率调制

## 技术方案
- **GES (Gaussian-Enhanced Surfels)**: 高性能无排序渲染，但存在混叠和重建问题
- **DP-GES**: 增加半透明边界 + Depth Peeling 排序

### 方法流程
```
不透明 surfels → 半透明边界 → Depth Peeling 排序 → 正确透射率调制
```

## 实验结论
- 消除混叠和 popping artifacts
- 完全可微分的联合优化
- 重建质量优于 SOTA 方法

## 可行性分析
- 实现难度：中（需实现 depth peeling 和 Gaussian 渲染集成）
- 性能预期：保持 GES 高性能特性
- 适用场景：新视角合成、实时渲染

## 相关工作
- [[3D Gaussian Splatting]]
- [[Surfel Rendering]]
- [[Depth Peeling]]

## 笔记
与我的渲染研究相关，涉及渲染技术优化。