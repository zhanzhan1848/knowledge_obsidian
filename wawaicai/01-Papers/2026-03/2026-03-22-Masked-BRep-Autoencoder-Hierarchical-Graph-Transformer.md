---
tags: [几何, CAD, BRep, 图神经网络, 自监督学习, 深度学习]
arxiv: https://arxiv.org/abs/2603.14927
date: 2026-03-22
---

# Masked BRep Autoencoder via Hierarchical Graph Transformer

## 核心方法

提出了一种**自监督学习框架**，用于从CAD模型（Boundary Representation, BRep）中自动学习表示，支持下游任务：
- 零件分类 (Part Classification)
- 建模分割 (Modeling Segmentation)
- 加工特征识别 (Machining Feature Recognition)

### 两大核心组件

1. **Masked Graph Autoencoder**
   - 随机遮蔽BRep的几何和属性
   - 通过重建任务学习表示
   - 增强泛化能力

2. **Hierarchical Graph Transformer**
   - **Cross-scale Mutual Attention Block**: 建模长程几何依赖
   - **GNN Block**: 聚合局部拓扑信息
   - 优雅融合全局和局部学习

## 算法复杂度

- 训练数据: 大规模无标签BRep数据集
- 少样本学习: 下游任务仅需少量标注数据
- 架构: Encoder-Decoder，下游任务替换Decoder

## 创新点

- 首个针对BRep的Masked Autoencoder框架
- 层次化Graph Transformer处理CAD几何
- 自监督预训练 + 少样本微调范式

## 实验结果

- 在多种下游任务上达到高性能
- **少量训练数据下显著优于其他方法**
- 特别适用于训练数据非常有限的场景

## 开源实现

- 状态: 代码未发布（Under review）
- 论文: 27 pages, 11 figures

## 相关性评估

| 维度 | 评分 |
|------|------|
| 几何处理相关性 | ⭐⭐⭐⭐⭐ |
| 实现难度 | 中高 |
| 实用价值 | 高 |

## 推荐结论

✅ **强烈推荐关注**

对于CAD几何处理、网格重建、特征识别等任务具有重要参考价值。自监督学习范式减少了对标注数据的依赖。

## 相关笔记

[[BRep表示]]
[[图神经网络]]
[[自监督学习]]
[[CAD几何处理]]
