---
title: "PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars"
authors: Julian Kaltheuner
date: 2026-05-20
source: arXiv cs.GR (SIGGRAPH 2026)
url: https://arxiv.org/abs/2605.20185
pdf: https://arxiv.org/pdf/2605.20185
tags: [rendering, gaussian-splatting, avatar, neural-rendering]
status: unread
---

# PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars |
| 作者 | Julian Kaltheuner |
| 来源 | arXiv cs.GR (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.20185) |
| PDF | [下载](https://arxiv.org/pdf/2605.20185) |

## 核心贡献
1. 将参数化人体模型仅用于运动传递，Gaussian 用体素规范空间表示，解耦表征与模板拓扑
2. 提出 3D 重心坐标锚点传输，保持运动连贯性同时允许锚点自由偏离模板表面
3. 引入双重层级空间一致优化，结合 Sobolev 预条件神经场更新和 KNN 预条件

## 技术方案
- **表征**: 体素规范空间中的 Gaussian，非表面参数化
- **运动传递**: 3D 重心坐标锚点传输
- **优化**: 双重层级 Sobolev 预条件 + KNN 预条件
- **结果**: 自组织锚点密度分布，高曲率、高外观变化、非连贯运动区域自动聚集

## 实验结论
- 在复杂服装和挑战性非刚性运动场景中达到 SOTA 渲染质量
- 对不完美人体模型初始化具有强泛化能力
- 所有细节层级实时渲染

## 局限性
- 依赖参数化人体模型（SMPL 等）
- 计算复杂度较高

## 可行性分析
- 实现难度：高（涉及神经场、Gaussian 优化、运动传递等多技术）
- 性能预期：实时渲染质量优异
- 适用场景：数字人、Avatar、虚拟现实

## 相关工作
- [[2026-05-18-Accelerating-3D-Gaussian-Splatting-Tensor-Cores]]
- Gaussian Avatar 相关研究

## 笔记
该方法在 Representation 与 Template topology 解耦方面有创新，对复杂服装几何和层级表面支持良好。