---
type: paper
created: 2026-04-23
updated: 2026-04-23
tags: [geometry, skeleton-generation, mesh-animation, deep-learning]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.20539
---

# Animator-Centric Skeleton Generation on Objects with Fine-Grained Details

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Animator-Centric Skeleton Generation on Objects with Fine-Grained Details |
| **作者** | Mingze Sun et al. |
| **发表** | CVPR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.20539) |
| **DOI** | 10.48550/arXiv.2604.20539 |

---

## 核心贡献

> 面向动画师的骨骼生成框架，处理复杂结构并提供直观控制

1. 构建大规模数据集：82,633 个带骨骼的网格模型
2. 提出 **semantic-aware tokenization scheme** 用于自回归建模
3. 设计 **learnable density interval module** 允许动画师控制骨骼密度

---

## 技术方案

### 核心思想

现有深度学习方法无法处理现代模型的结构复杂性，且控制性有限。论文提出动画师中心的骨骼生成框架，将骨骼分为语义有意义的组，增强对结构复杂性的鲁棒性。

### 关键技术

| 技术 | 说明 |
|------|------|
| Semantic-Aware Tokenization | 语义感知分词，将骨骼分为语义组 |
| Learnable Density Interval | 可学习的密度间隔模块，控制骨骼密度 |
| 自回归建模 | Auto-regressive modeling |

### 数据集

- 82,633 rigged meshes
- 多样化复杂结构

---

## 实验结论

- 在挑战性输入上生成高质量骨骼
- 成功满足专业动画师两个关键需求

---

## 相关工作

- [[Skeleton Generation]]
- [[Mesh Animation]]
- [[Rigging]]

---

## 实现建议

- **实现难度**: 高（深度学习 + 复杂网格处理）
- **适用场景**: 3D 动画、自动绑定、游戏资产生成

---

## 开源参考

- 论文 PDF: https://arxiv.org/pdf/2604.20539