---
title: Volumetric Inverse Rendering via Neural Radiative Transfer
authors: Ntumba Elie Nsampi
date: 2026-07-15
source: Computer Graphics Forum (CGF)
url: https://arxiv.org/abs/2607.13695
pdf: https://arxiv.org/pdf/2607.13695
tags: [rendering, inverse-rendering, volumetric, neural-radiative-transfer, global-illumination]
status: unread
---

# Volumetric Inverse Rendering via Neural Radiative Transfer

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Volumetric Inverse Rendering via Neural Radiative Transfer |
| 作者 | Ntumba Elie Nsampi |
| 来源 | Computer Graphics Forum |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.13695) |
| PDF | [下载](https://arxiv.org/pdf/2607.13695) |

## 核心贡献
1. **物理完整光传输 + 通用神经优化**: 将参与介质的物理光传输与神经优化结合
2. **神经场表示**: 介质的光学属性和完整光场表示为神经场，通过联合优化估计
3. **残差目标**: 从辐射传输方程局部微分形式推导全局光照约束
4. **体积渲染项**: 沿主视线体积渲染项减轻低频偏差

## 技术方案
**问题**: 从图像恢复参与介质的光学属性

**方法**:
- 光学属性和完整光场表示为神经场
- 联合优化估计参数
- 辐射传输方程局部微分形式残差目标
- 主视线体积渲染项

**重建参数**: 空间变化颜色解析散射、吸收、相函数

## 实验结论
- 从多视角图像重建空间变化散射、吸收、相函数参数
- 支持学习具有物理光学属性的参与介质生成模型

## 局限性
- 假设已知光照条件
- 计算成本较高

## 可行性分析
- 实现难度：高
- 性能预期：需要多次优化迭代
- 适用场景：体积材质重建、参与介质建模

## 相关工作
- [[Volume Rendering]]
- [[Inverse Rendering]]
- [[Global Illumination]]

## 笔记
神经辐射传输方程为参与介质的逆渲染提供了物理基础。
