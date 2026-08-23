---
title: "Splat-based Metal Artifact Reduction in Cone-Beam CT via Polychromatic Modeling"
authors: Kiseok Choi, Inchul Kim, Jaemin Cho, Hyeongjun Cho, Min H. Kim
date: 2026-08-13
source: Computer Graphics Forum (CGF 2026)
url: https://arxiv.org/abs/2608.13159
pdf: https://arxiv.org/pdf/2608.13159.pdf
tags: [rendering, Gaussian-splatting, CT-reconstruction, metal-artifacts, 2026]
status: unread
---

# Splat-based Metal Artifact Reduction in Cone-Beam CT via Polychromatic Modeling

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Splat-based Metal Artifact Reduction in Cone-Beam CT via Polychromatic Modeling |
| 作者 | Kiseok Choi, Inchul Kim, Jaemin Cho, Hyeongjun Cho, Min H. Kim |
| 来源 | Computer Graphics Forum (CGF 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.13159) |
| PDF | [下载](https://arxiv.org/pdf/2608.13159.pdf) |

## 核心贡献
1. **首个 splat-based 束硬化校正方法** - 首次将 splatting 方法应用于 CBCT 束硬化校正
2. **物理启发的多色模型** - 将多色 X 射线投影模型、材料相关衰减剖面和系统响应建模集成到 Gaussian Splatting 框架
3. **自校准方法** - 无需人工金属掩模或强先验假设，联合优化几何参数和 X 射线光谱特性
4. **高保真合成 CBCT 数据集** - 基于 Monte-Carlo X 射线模拟工具箱验证

## 问题背景

### Cone-beam CT (CBCT) 问题
- CBCT 从 X 射线投影实现体积重建
- 高衰减材料（如金属）成像时会产生严重伪影，尤其是束硬化

### 伪影成因
- X 射线的多色特性
- 衰减随光子能量强烈变化
- 传统单色重建算法未正确处理

### 现有方法局限
- 神经表示方法提供改进的重建质量，但计算成本高，实际部署困难

## 技术方案

### 多色 X 射线投影模型
$$I_{detected} = \int S(E) \cdot exp(-\int \mu(x, E) dl) \cdot D(E) dE$$

### 方法特点
- 每个高斯编码基础材料能量相关衰减
- 使用紧凑材料参数化
- 无需金属掩模
- 联合优化几何和材料特性

### 数据集
- 基于 Monte-Carlo X 射线模拟生成高保真合成 CBCT 数据集
- 释放严重金属诱导伪影的新数据集

## 实验结论
- 在合成和真实 CBCT 数据集上均优于 SOTA 方法
- 伪影抑制和重建精度显著提升

## 可行性分析
- 实现难度：高
- 性能预期：高质量伪影校正
- 适用场景：医学成像、工业 CT

## 相关工作
- [[Gaussian Splatting]]
- [[CT 重建]]
- [[金属伪影校正]]

## 笔记
这是首个将 splatting 应用于 CBCT 金属伪影校正的方法。结合了物理启发的多色模型和 Gaussian Splatting 的连续表示能力，是一个有意义的跨领域应用。
