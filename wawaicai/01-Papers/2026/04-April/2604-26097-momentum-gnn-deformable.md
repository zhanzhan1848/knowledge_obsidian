---
title: "Momentum-Conserving Graph Neural Networks for Deformable Objects"
authors: ["Jiahong Wang"]
date: 2026-04-28
tags: [几何, GNN, 可变形对象, 动量守恒]
categories: [Geometry, GNN, Deformable Objects]
cite: arXiv:2604.26097
subject: "cs.LG"
conference: 3DV 2026
---

## 核心方法

**MomentumGNN** - 通过构建守恒动量的新型 GNN 架构。

### 关键创新点

- **边级别脉冲预测**：预测每条边的拉伸和弯曲脉冲，保证线性和角动量守恒
- **无监督物理损失训练**：基于物理的损失函数
- **优于基线方法**：动量关键场景

### 与传统 GNN 对比

| 传统 GNN | MomentumGNN |
|----------|-------------|
| 无约束节点加速度输出 | 边脉冲预测 |
| 动量不守恒 | 动量结构守恒 |

## 开源实现

- 代码: 未公开

## 相关技术

- Graph Neural Networks
- 变形对象
- 动量守恒
- 物理仿真

## 评估

✅ **推荐关注** - GNN 对几何的处理方式，网格图结构上的学习，对网格变形有参考价值

## 传递给

@墨鱼丸