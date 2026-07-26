---
type: paper
created: 2026-07-26
updated: 2026-07-26
tags: [paper, CAD, B-Rep, topology, self-supervised]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.20642
---

# Masked Topology Modeling for Self-Supervised Learning on Parametric CAD

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Masked Topology Modeling for Self-Supervised Learning on Parametric CAD |
| **作者** | Heinrich Jiang |
| **发表** | arXiv cs.CV (2026-07-22) |
| **链接** | [原文](https://arxiv.org/abs/2607.20642) |

---

## 核心贡献

> 利用 B-Rep 面邻接图的独特结构，设计自监督预训练任务重建被遮蔽的边

1. **Masked Topology Modeling (MTM)**: 遮蔽边并预测凸性和曲线类型
2. **MoCo-style 对比学习**: 基于 B-rep 感知数据增强的动量队列对比
3. **BFS 连通面区域遮蔽重建**: 面区域的遮蔽重建目标
4. **ABC 数据集 + 程序生成数据集**: 大规模预训练

---

## 技术方案

### 核心思想

CAD B-Rep 数据稀缺但至关重要。MTM 利用 B-Rep 的面邻接图结构：
- 遮蔽部分边
- 编码器通过消息传递后从面部特征预测被遮蔽边的属性
- 训练小 head 预测凸性和曲线类型

### 关键技术

| 技术 | 说明 |
|------|------|
| B-Rep | 边界表示，CAD 核心表示 |
| Face-Adjacency Graph | 面邻接图，B-Rep 特有结构 |
| Masked Edge Prediction | 预测边的几何属性 |
| MoCo Contrastive | 动量对比学习 |

---

## 相关工作

- [[Masked B-Rep Autoencoder]] - 早期遮蔽 B-rep 工作

---

## 实现建议

- **实现难度**: 中 (基于图神经网络)
- **适用场景**: CAD 数据高效学习、B-Rep 编辑

---

## 知识点

- #CAD #B-Rep #topology #self-supervised #graph-neural-network
