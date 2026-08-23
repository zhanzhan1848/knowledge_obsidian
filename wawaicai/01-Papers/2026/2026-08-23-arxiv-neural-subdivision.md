---
title: "Proximity-Preserving Neural Subdivision (PNS)"
date: 2026-08-23
tags: [arXiv, 细分曲面, 神经几何处理, 等变性, 2026]
---

# 🥬 Proximity-Preserving Neural Subdivision (PNS)

> arXiv: https://arxiv.org/html/2608.14704

## 核心方法

**问题**: 经典细分曲面（Loop, Catmull-Clark）使用固定模板，无法适应局部几何特征；神经网格细化可以适应特征但缺乏细分算子的结构特性。

**创新**: 将神经网格细化表述为 Loop 细分的有界、曲线门控扰动：

$$q_i^\theta = q_i^0 + h_i^2 \gamma_i F_i \eta_\theta(\varphi_i)$$

其中：
- $h_i^2$ 强制二阶 proximity 到 Loop
- $\gamma_i \in [0,1]$ 是曲线门控，抑制平面区域修正
- $F_i \in SO(3)$ 是协变局部框架，保证刚体运动等变性
- $\eta_\theta$ 是从固有特征到 $\mathbb{R}^3$ 的网络映射

## 核心特性（架构决定，无需训练）

| 特性 | 说明 |
|------|------|
| SE(3) 等变性 | 对任何网络权重精确成立 |
| 仿射再现 | 平面输入精确再现 |
| $O(h^2)$ Proximity | 到 Loop 细分 |
| 平面谱继承 | 平面 valence-k 星的线性化与 Loop 一致 |
| 稳定迭代 | 重复应用保持控制 |

## 算法细节

### 固有特征向量
- **曲线特征**: $\varphi_i^{curv} = 1 - n_{f_1} \cdot n_{f_2}$（面法线点积）
- **形状特征**: 四个对数边缘长度比

### 曲线门控
$$\gamma_i = \tanh(c \|\varphi_i^{curv}\|^2)$$

在 $\varphi_i^{curv} = 0$ 处及其梯度都为零，抑制平面区域的修正。

### 与 Neural Subdivision 对比

| 属性 | Neural Subdivision | PNS |
|------|-------------------|-----|
| 位移边界 | 无 | $Ch_i^2$ |
| 刚体等变性 | 学习得到 | 架构决定 |
| 仿射再现 | 否 | 是 |
| Loop proximity | 否 | $O(h^2)$ 架构保证 |
| 迭代行为 | 高频伪影 | 稳定 |

## 实验结果

- 在局部 ridge 特征基准上，PNS 在有限层级改善逼近精度
- 重复细分 4 次后，无约束神经基线的 proximity ratio 达到 $1.15 \times 10^4$，面法线跳跃接近 $\pi$
- PNS 保持在 proximity envelope 内

## 开源实现

- 代码: https://git.ista.ac.at/wojtan-group/peiyuan-xie/boundaryblaze

## 标签

#神经细分 #Loop细分 #等变性 #Proximity分析 #几何处理
