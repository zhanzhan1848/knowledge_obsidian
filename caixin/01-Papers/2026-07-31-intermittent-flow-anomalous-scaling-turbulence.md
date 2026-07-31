---
title: "Disentangling intermittent flow structure contributions to anomalous scaling and multifractality in turbulence"
authors: [Ritwik Mukherjee]
date: 2026-07-29
tags: [turbulence, intermittency, vortex, Biot-Savart, scaling, multifractal]
categories: [physics.flu-dyn, cond-mat.stat-mech, math-ph, nlin.CD, physics.comp-ph]
arxiv_id: 2607.26896
doi: 10.48550/arXiv.2607.26896
---

# 核心创新点

## 研究背景与问题

### 湍流间歇性
- 间歇性表现为强烈涡旋和耗散的尖锐峰值
- 导致 Kolmogorov 简单自相似理论的崩溃
- 产生：反常标度（anomalous scaling）、多重分形（multifractality）

### 未解决问题
- 间歇性流动结构如何影响这些测量的定量关系？
- **答案未知**

## 核心贡献

### 1. 简单滤波程序
- **涡量阈值化（Thresholding vorticity）**
- **Biot-Savart 定律反演**生成滤波速度场
- 选择性移除极端涡量贡献

### 2. 关键发现

#### 能量谱标度保持
- 当极端涡量贡献被过滤掉时
- 能量谱标度**持续存在**

#### 瓶颈效应（bottleneck）平坦化
- 惯性区-耗散区过渡的堆积效应被平滑

#### 结构函数趋向 Kolmogorov 值
- 随着间歇性过滤，标度指数趋向 Kolmogorov 值
- 横向指数效应更快速
- 揭示强烈旋涡区域的选择性重要性

#### 多重分形减少
- 间歇性过滤后，多重分形程度降低
- 粗糙度奇点指数范围缩小

### 3. 残留场行为
- 残留场**奇异地更多多重分形**
- 但其结构开始偏离底层湍流骨架

## 方法论

### 滤波程序
1. **涡量阈值化**：
   $$\omega > \omega_{threshold} \text{ 的区域标记}$$
2. **Biot-Savart 反演**：
   $$\mathbf{u}(\mathbf{x}) = \int \frac{\omega(\mathbf{x}') \times (\mathbf{x} - \mathbf{x}')}{4\pi |\mathbf{x} - \mathbf{x}'|^3} d\mathbf{x}'$$

### 分析工具
- Voronoi 分析
- Q 值（局部涡度/应变率比）
- 结构函数分析
- 涡度拉伸和应变自放大量化

## 物理洞察

### 间歇性涡旋的作用
- **对标度的贡献**：保持能量级串，但导致反常标度
- **对瓶颈的贡献**：造成惯性-耗散区过渡堆积
- **对多重分形的贡献**：主导粗糙度分布

### Biot-Savart 方法优势
- 可选择性移除间歇性效应
- 从湍流及其标度中分离涡旋影响
- 提供清洁的对照实验

## 数值验证

### DNS 数据分析
- 提取涡量场
- 应用阈值滤波
- 反演速度场
- 计算统计量

## 数值方法评估

| 方面 | 评估 |
|------|------|
| 数据类型 | DNS 湍流数据 |
| 后处理 | Biot-Savart 反演计算密集 |
| 分析框架 | 统计分析和结构函数 |

## 主要结论
- Biot-Savart 方法可选择性移除间歇性对湍流的影响
- 间歇性涡旋结构是反常标度和多重分形的主要来源
- 能量级串保持独立于间歇性

## 关键引用
```
@article{arXiv2607.26896,
  title={Disentangling intermittent flow structure contributions to anomalous scaling},
  author={Ritwik Mukherjee},
  journal={arXiv:2607.26896},
  year={2026}
}
```

---

*来源：[arXiv:2607.26896](https://arxiv.org/abs/2607.26896)*
