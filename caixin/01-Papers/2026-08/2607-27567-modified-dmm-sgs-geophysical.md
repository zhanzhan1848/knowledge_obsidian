---
title: Modified Dynamic Mixed Subgrid-scale Models for Geophysical Flows: Forced Two-Dimensional and β-plane Turbulence
arxiv: 2607.27567
authors: Anantha Narayanan Suresh Babu
date: 2026-07-30
category: turbulence-modeling
tags: [LES, SGS model, dynamic mixed model, geophysical turbulence, backscatter, β-plane]
journal: physics.flu-dyn
---

# Modified Dynamic Mixed Subgrid-scale Models for Geophysical Flows

## 核心创新点

改进传统动态混合模型（DMM）的Gram-based框架，解决传统DMM中**结构分量主导**导致功能（涡粘）分量正则化失效的问题。

### 关键发现
- 传统DMM最小二乘估计被结构分量主导，限制了功能分量的耗散正则化作用
- 提出**可调结构-功能平衡**的修正Gram框架

### 模型分类
1. **完全耦合 Fully-coupled**
2. **顺序分离 Sequential**：先确定功能分量，再由结构分量修正
3. **完全解耦 Fully-decoupled**

### 测试框架
- 强迫二维湍流
- β平面（β-plane）湍流
- Leith模型 + 四阶非线性梯度模型

## 湍流模型细节

**顺序DMM的优势**：
- 保留a priori结构精度
- 改善a posteriori涡量场、谱、域均值诊断
- 允许回散（backscatter）在大尺度发生
- 在小尺度增强耗散

**关键参数**：
- SGS能量传递
- 涡量转换分析
- $k^{-5/3}$ 惯性区

## 数值方法

- **LES大涡模拟**
- **SGS湍流模型**：动态混合模型（Dynamic Mixed Model）
- **backscatter建模**：能量逆级串

## 链接

- PDF: https://arxiv.org/pdf/2607.27567
- HTML: https://arxiv.org/html/2607.27567v1

## 评价

✅ **LES SGS模型重要进展** — 对地球物理湍流（大尺度流动、海洋、大气）具有直接应用价值
