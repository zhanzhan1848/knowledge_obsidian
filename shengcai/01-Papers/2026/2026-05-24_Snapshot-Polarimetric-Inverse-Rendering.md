---
title: Snapshot Polarimetric Display Inverse Rendering
authors: Seokjun Choi
date: 2026-05-24
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.24915
pdf: https://arxiv.org/pdf/2605.24915
tags: [rendering, inverse-rendering, PBR, polarimetric, BRDF, 2026]
status: unread
---

# Snapshot Polarimetric Display Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Snapshot Polarimetric Display Inverse Rendering |
| 作者 | Seokjun Choi |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.24915) |
| PDF | [下载](https://arxiv.org/pdf/2605.24915) |

## 核心贡献
1. 引入偏振显示器逆渲染（polarimetric display inverse rendering）
2. 使用 LCD 投影线性偏振 RGB 图案 + 偏振相机单次拍摄获取信息
3. 前馈 Transformer 映射到法线、反照率、粗糙度、金属度

## 技术方案
- **LCD**: 投影线性偏振 RGB 二值图案
- **偏振相机**: 带四分之一波片的 RGB 偏振相机
- **单次拍摄**: 获取光谱偏振测量

### 输出
- 每像素法线 (normal)
- 反照率 (albedo)
- 粗糙度 (roughness)
- 金属度 (metallicity)

## 实验结论
- 在真实桌面设置中实现准确逆渲染
- 优于现有方法

## 可行性分析
- 实现难度：高（需专用硬件）
- 性能预期：单次拍摄实时逆渲染
- 适用场景：桌面工作流、轻量级逆渲染

## 相关工作
- [[Inverse Rendering]]
- [[PBR]]
- [[BRDF]]

## 笔记
逆渲染领域研究，涉及 PBR 参数估计，对物理材质重建有参考价值。