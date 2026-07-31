---
title: "Learning Backward Transport for Source Localization"
authors: [Maurizio Carbone]
date: 2026-07-29
tags: [source-localization, Schrodinger-bridge, turbulence, Lagrangian, chemotaxis]
categories: [physics.flu-dyn]
arxiv_id: 2607.26892
doi: 10.48550/arXiv.2607.26892
---

# 核心创新点

## 研究背景与问题
- 流动中化学源定位问题
- 浓度检测作为源与检测点之间路径的证据
- 经典方法效率有限

## 核心贡献

### 1. Schrödinger Bridge  formulation
- 利用浓度场与 Lagrangian 示踪轨迹的对偶性
- 将浓度检测解释为连接源到检测点的路径证据
- **反向传播算子**（backward propagator of passive tracers）

### 2. 源定位作为采样问题
- 通过 Langevin 动力学对候选发射位置采样
- 施温格桥接（S Schrödinger bridge）连接：
  - 可信发射位置
  - 检测点

### 3. 涌现行为
- 相关的漂移揭示：
  - **化学趋向（chemotaxis）**：向化学源移动
  - **cast-and-surge**：互补行为
- 从单一传输原理涌现

### 4. 2D 湍流中的嗅觉搜索
- 在二维湍流中应用
- **单一、伽利略不变的学习传播算子**
- 在不同风况下优于经典策略

## 理论框架

### Schrödinger Bridge
$$\text{浓度检测} \Leftrightarrow \text{路径证据}$$
$$\text{源定位} = \text{发射位置采样}$$

### 关键方程
通过 Langevin 动力学采样：
$$d\mathbf{x} = \mathbf{b}(\mathbf{x}, t) dt + \sqrt{2\nu} d\mathbf{W}$$

其中 $\mathbf{b}$ 是反向漂移场

### 传输原理
- 前向传播：被动示踪剂从源向外传播
- 反向传播：反向时间传播
- Schrödinger Bridge 连接两个方向

## 方法论

### 学习框架
1. 学习反向传播算子
2. 使用 Langevin 动力学采样
3. 从样本估计最可能源位置

### 优势
- **单一算子**：适用于多种风况
- **伽利略不变**：不依赖参考系
- **数据驱动**：从模拟或实验数据学习

## 数值验证

###