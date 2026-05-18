---
title: "Smart Target Point Control for Gaussian Splatting Methods"
date: 2026-05-18
tags: [渲染, 3DGS, Gaussian Splatting, 评估基准]
status: 待读
authors: Pratik Singh Bisht
source: arXiv
source_id: 2605.16158
categories:
  - 3D Gaussian Splatting
  - Evaluation Methods
---

# Smart Target Point Control for Gaussian Splatting Methods

## 元信息
| 标题 | Smart Target Point Control for Gaussian Splatting Methods |
|------|-----|
| 作者 | Pratik Singh Bisht |
| 来源 | arXiv:2605.16158 [cs.GR] |
| 链接 | [原文](https://arxiv.org/abs/2605.16158) |
| 发表时间 | 2026年5月15日 |

## 核心贡献

1. **目标点控制方案**：解决Gaussian splatting方法中启发式密集化和剪枝导致比较不公平的问题
2. **二次目标计数轨迹**：调整密集化和不透明度剔除超参数跟踪二次目标计数轨迹
3. **Quota-governor机制**：在15k迭代时达到目标计数，无突然截断
4. **公平评估**：确保所有方法和视图接收相等的密集化和剪枝周期

## 技术方案

### 问题
- 标准Gaussian splatting依赖启发式密集化和剪枝
- 结果的Gaussian数量强烈影响重建质量和运行时
- 现有方法难以公平比较
- 硬截断导致训练偏差

### 解决方案
- **保留标准密集化窗口和节奏**
- **仅调整现有密集化和不透明度剔除超参数**
- **Quota-governor机制**跟踪二次目标计数轨迹

## 可行性分析

- **实现难度**：低
- **技术成熟度**：研究阶段
- **创新性**：⭐⭐⭐
- **实用性**：⭐⭐⭐⭐
- **推荐度**：⭐⭐⭐⭐

## 相关工作
- 3D Gaussian Splatting (3DGS)
- Gaussian splatting densification
- Pruning strategies

## 标签
#渲染 #3DGS #GaussianSplatting #评估 #2026 #arXiv
