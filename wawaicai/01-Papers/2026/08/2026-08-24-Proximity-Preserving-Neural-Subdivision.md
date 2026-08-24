---
title: "Proximity-Preserving Neural Subdivision (PNS)"
authors: (作者未在摘要中列出)
date: 2026-08-14
tags: [几何, 网格处理, 细分曲面, 神经细分, Loop细分]
categories: [Subdivision Surfaces, Neural Mesh Refinement]
arxiv: "2608.14704"
conference: arXiv cs.GR
---

# Proximity-Preserving Neural Subdivision (PNS)

## 核心方法

提出**可学习的Loop细分增强规则**，在保持细分结构约束的同时适应局部几何特征。

### 背景问题

- 经典细分方案（Loop、Catmull-Clark）：固定模板，全局面性
- 局部几何特征（锐脊、软边）难以精确拟合
- 神经网格细化可适应特征，但无约束预测缺乏结构性

### PNS解决方案

在Loop细分基础上添加**有界、曲率门控修正**：
- 协变局部框架（covariant local frame）表达
- 修正幅度有界（bounded correction）
- 曲率门控（curvature-gated）

## 理论保证（架构固有，非训练后获得）

| 性质 | 保证 |
|------|------|
| 刚性运动等变性 | ✓ 精确保持 |
| 平面输入精确重现 | ✓ |
| 二次 proximity envelope | ✓ 保持在Loop模板周围 |
| 平面k-价星上的线性化 | 与Loop一致 |
| 切空间特征向量继承 | 与Loop一致 |
| Reif谱隙继承 | 与Loop一致 |

## 关键洞察

> "learning can be introduced into subdivision without abandoning the structural constraints that make subdivision useful as a geometry-processing primitive"

**核心信息**：在保持细分结构约束的前提下引入学习。

## 与基线对比

| 方法 | 一步拟合 | 迭代后行为 |
|------|----------|------------|
| PNS | 改善ridge特征拟合 | 保持在proximity envelope内 |
| 无约束神经基线 | 更好的一步拟合 | 高频伪影，偏离细分机制 |

## 相关技术

- Loop Subdivision
- Subdivision Surfaces
- Neural Mesh Refinement
- Equivariant Neural Networks
- Proximity Envelope
- Local Frame / Covariant Representation

## 关联笔记

[[细分曲面]]
[[Loop细分]]
[[神经网格处理]]
[[网格细化]]
