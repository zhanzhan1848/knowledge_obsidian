---
title: PureLight: Learning Complex Luminaires with Light Tracing
authors: Pedro Figueirêdo et al.
date: 2026-06-03
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.04319
pdf: https://arxiv.org/pdf/2606.04319
tags: [rendering, light-tracing, neural-rendering, luminaire, 2026]
status: unread
---

# PureLight: Learning Complex Luminaires with Light Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | PureLight: Learning Complex Luminaires with Light Tracing |
| 作者 | Pedro Figueirêdo et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.04319) |
| PDF | [下载](https://arxiv.org/pdf/2606.04319) |

## 核心贡献
1. **神经光传输公式**：使用归一化流网络建模出射表面辐射率的概率密度函数
2. 从归一化流估计的 pdf 和 flux 的乘积恢复出射辐射率
3. 蒸馏为轻量级 MLP 实现高效推理
4. 支持低样本数渲染复杂灯具

## 技术方案

### 问题背景
复杂灯具（如多层 specular 包裹的小型发光体）难以用（双向）路径追踪处理。

### 方法
1. 使用 **light tracing** 从发光体构建到出射表面的路径
2. 将外观估计公式化为**分布学习问题**
3. 用大型归一化流网络建模出射表面辐射率的 pdf
4. 恢复辐射率 = pdf × flux
5. 蒸馏为轻量级 MLP
6. 训练采样网络用于直接光照计算
7. 训练混合网络将灯具合成到场景中

## 可行性分析
- 实现难度：中高
- 性能预期：低样本数渲染复杂灯具
- 适用场景：复杂灯具渲染，室内/室外照明

## 相关工作
- [[PureSample (Li et al., 2026)]]

## 笔记
**重要性**：⭐⭐⭐⭐  
**推荐度**：高 - 解决复杂灯具渲染难题