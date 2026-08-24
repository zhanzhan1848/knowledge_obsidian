---
title: "Topology-Aware Differentiable Triangle-Soup Reconstruction via Persistent Homology"
authors: (作者未在摘要中列出)
date: 2026-08-18
tags: [几何, 网格重建, 拓扑感知, 持续同调, 可微分优化]
categories: [Mesh Reconstruction, Topology, Differentiable Pipeline]
arxiv: "2608.16848"
conference: arXiv cs.GR
---

# Topology-Aware Differentiable Triangle-Soup Reconstruction

## 核心问题

现有可微分三角形重建方法存在**拓扑缺陷**：光度和几何损失无法测量拓扑，坍缩环或穿孔空腔可能与正确拓扑得分相同（Chamfer平等探测下巴 bottleneck 距离差异达 35-40 倍）。

## 核心方法

将**拓扑信息融入损失函数**，通过**持续同调（Persistent Homology）** 实现。

### 关键创新

1. **可微分持续性项**：将演化表面的持久图与固定目标图比较
   - 梯度通过配对冻结的后向重表达流动
   - 匹配 birth/death 单形表达为闭式 circumradii
   - Recruitment项恢复缺失特征的梯度

2. **单一比率旋钮**：校准拓扑损失与光度梯度的权重比
   - 无需课程学习（curriculum）

3. **理论保证**：比先前拓扑感知先验（topology-informed prior）效果更优
   - 所有先验在 loop（环）类别均失败
   - 本文方法在 loop 上实现 **2.3x** 降低误差

## 实验结果

| 指标 | 改进倍数 |
|------|----------|
| 封闭空洞 (enclosed voids) | 4.0-7.9x 更低误差 |
| 环 (loops) | 2.3x，无 phantom handles |
| H0 组件计数 | 无显著改进（预期结果） |

- 在 8 个外部 genus-known meshes 验证
- 预注册两组测试
- 噪声下优雅降级

## 核心洞察

> "correct topology in the loss, allocate wide, combine"
> - 拓扑纠正放入损失函数
> - 分配宽度（allocate wide）
> - 结合使用

## 相关技术

- Persistent Homology（持续同调）
- Differentiable Mesh Reconstruction
- Bottleneck Distance
- Topological Data Analysis (TDA)
- Winding Number

## 关联笔记

[[网格重建]]
[[拓扑修复]]
[[持续同调]]
[[可微分渲染]]
