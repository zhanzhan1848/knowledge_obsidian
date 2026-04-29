# ADE: Adaptive Dictionary Embeddings — Scaling Multi-Anchor Representations to LLMs

## 元信息
| 标题 | Adaptive Dictionary Embeddings -- Scaling Multi-Anchor Representations to Large Language Models |
|------|------|
| 作者 | Orhan Demirci, Sezer Aptourachman |
| 链接 | [原文](https://arxiv.org/abs/2604.24940) |
| arXiv | arXiv:2604.24940 |
| 发表 | cs.CL |

## 核心贡献
1. **Vocabulary Projection (VP)**: 将昂贵的两阶段 anchor 查找转换为单次高效矩阵运算
2. **Grouped Positional Encoding (GPE)**: 同一词的 anchors 共享位置信息，保持语义一致性的同时允许 anchor 级别变化
3. **Context-aware anchor reweighting**: 利用自注意力动态组合 anchor 贡献，基于序列上下文调整
4. **Segment-Aware Transformer (SAT)**: 推理时提供上下文感知的 anchor 权重调整

## 核心问题
传统词嵌入用单个向量表示词，对多义词（polysemous words）存在表示瓶颈。

Multi-anchor 方法用多个向量表示词，但此前仅限于小规模模型（计算效率低、与 transformer 架构集成困难）。

## 方法详解

### 三项关键设计

#### 1. Vocabulary Projection (VP)
将 anchor 查找从两步（离散 lookup → 聚合）合并为一步矩阵运算：
$$\text{VP}: \text{embed}(w) = \sum_{a \in \text{anchors}(w)} \alpha_a \cdot v_a$$
其中 $\alpha_a$ 是可学习的 anchor 权重。

#### 2. Grouped Positional Encoding (GPE)
- 同一词的 anchors 共享 positional encoding
- 保持语义连贯性，同时允许 anchor 间有变化
- 解决多义词的不同义项在不同上下文中被激活的问题

#### 3. Context-aware Anchor Reweighting
- 在推理时，通过注意力机制动态决定每个 anchor 的贡献权重
- 不同上下文选择不同的 anchor 子集
- SAT (Segment-Aware Transformer) 实现这一机制

## 实验结果

| Benchmark | ADE | DeBERTa-v3-base |
|-----------|-----|-----------------|
| DBpedia-14 | **98.06%** | 97.80% |
| AG News | 90.64% | **94.50%** |

- 参数量减少 **98.7%**（相比 DeBERTa-v3-base）
- 嵌入层压缩 **40x**

## 核心结论
> Multi-anchor 表示是现代 transformer 架构中单向量嵌入的实用且参数高效的替代方案。

## 相关标签
#word-embeddings #polysemy #multi-anchor #transformer #NLP
