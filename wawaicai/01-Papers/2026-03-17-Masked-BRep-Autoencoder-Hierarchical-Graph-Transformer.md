---
tags: [几何, BRep, 图神经网络, 自监督学习, CAD]
arxiv: 2603.14927
date: 2026-03-17
---

# Masked BRep Autoencoder via Hierarchical Graph Transformer

## 基本信息
- **标题**: Masked BRep Autoencoder via Hierarchical Graph Transformer
- **作者**: Yifei Li, Kang Wu, Wenming Wu, Xiaoming Fu
- **arXiv ID**: [2603.14927](https://arxiv.org/abs/2603.14927)
- **发布日期**: 2026-03-16
- **分类**: cs.GR, cs.LG

## 摘要
提出了一个新颖的自监督学习框架，自动从 CAD 模型学习表示用于下游任务，包括零件分类、建模分割和加工特征识别。

## 核心方法

### 1. Masked Graph Autoencoder
- 随机遮蔽 BRep 几何和属性
- 通过重建任务学习表示
- 增强泛化能力

### 2. Hierarchical Graph Transformer
- **Cross-scale Mutual Attention**: 建模长距离几何依赖
- **Graph Neural Network Block**: 聚合局部拓扑信息
- 融合全局和局部学习

## 创新点
1. 大规模无标注 BRep 数据集构建
2. 分层图 Transformer 架构
3. 少样本下游任务迁移学习

## 下游任务
- 零件分类
- 建模分割
- 加工特征识别

## 实验结果
- 即使标注数据很少也能达到高性能
- 相比其他方法在相同训练数据下表现显著更好
- 在训练数据非常有限时优势明显

## 技术复杂度
- **数据规模**: 大规模 BRep 模型数据集
- **网络架构**: 分层图 Transformer + GNN
- **训练策略**: 自监督预训练 + 有监督微调

## 开源参考
- arXiv: [https://arxiv.org/abs/2603.14927](https://arxiv.org/abs/2603.14927)
- PDF: [https://arxiv.org/pdf/2603.14927](https://arxiv.org/pdf/2603.14927)

## 相关技术
- [[BRep 表示]]
- [[图神经网络]]
- [[自监督学习]]
- [[CAD 模型处理]]

## 可行性评估
✅ **推荐实现**
- 算法创新性强
- 实用价值高
- 少样本学习能力强
- CAD 领域应用广泛
