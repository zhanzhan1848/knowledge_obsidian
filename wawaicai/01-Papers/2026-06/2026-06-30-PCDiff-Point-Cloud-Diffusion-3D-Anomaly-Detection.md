---
tags: [几何, 点云, 异常检测, 扩散模型]
date: 2026-06-30
source: arXiv (cs.CV)
---

# PCDiff: Point Cloud Diffusion with Global and Local Reconstruction for Instance-Level 3D Anomaly Detection

## 核心方法

提出 **PCDiff** 点云扩散框架，用于实例级3D异常生成和检测。

### 问题背景

- 工业制造中高精度3D异常检测至关重要
- 现有方法两大挑战：
  1. 前景弱异常区域（如划痕）难以重建和检测，异常偏差小至 $10^{-3}$
  2. 背景非异常区域易产生位置偏差，导致误报

### 关键创新点

#### 生成阶段
- **实例级多模态注意力** 嵌入生成框架
- 异常以纹理梯度、图像块、文本和掩码为条件
- 实现弱缺陷异常的高质量生成

#### 检测阶段
- **联合局部-全局重建算法**
  - 局部异常恢复：保留前景缺陷
  - 全局几何一致性：保持背景正常结构

## 核心公式

- 异常条件生成：$p(\text{anomaly} | \text{texture gradient}, \text{patch}, \text{text}, \text{mask})$
- 联合重建损失：平衡局部恢复与全局一致性

## 实验结果

- 在3D异常生成保真度和重建质量上显著优于SOTA方法
- 异常检测精度大幅提升

## 可行性评估

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 高 |
| 数值稳定性 | 中 |
| 实现难度 | 高（需扩散模型基础） |
| 工程可行性 | ⚠️ 谨慎评估 |

## 相关笔记

[[2026-06-30-World-Tracing-Generative-Pixel-Aligned-Geometry]]
