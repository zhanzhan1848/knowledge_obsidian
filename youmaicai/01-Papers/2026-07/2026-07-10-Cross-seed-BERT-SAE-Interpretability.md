# Cross-seed Explainability: Procrustes-conditioned Joint SAE for BERT

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Cross-seed explainability using Procrustes-conditioned Joint End-to-end Top-K Sparse Autoencoders |
| **arXiv** | arXiv:2607.08499 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08499 |
| **日期** | 2026-07-10 |

## 核心贡献

1. 解决**独立训练的 BERT 模型间 feature misalignment**问题（dictionary learning 非凸，独立训练会学到不对齐的特征空间）
2. 方法：**Procrustes-conditioned Joint SAE Training**
   - 训练前用 **orthogonal Procrustes rotation** 对齐 seeds 间的激活空间
   - 再进行联合 Top-K Sparse Autoencoder 训练
3. 结合：Top-K sparsity + end-to-end 下游优化 + dead-feature revival loss

## 问题背景

- Dictionary learning is non-convex
- 不同随机种子训练的独立网络学到的特征空间不对齐
- 看起来相同的特征实际上可能是不同的（因随机初始化而异）

## 方法

### Pipeline

```
独立训练 BERT (seed A, seed B)
        ↓
Procrustes rotation 对齐激活空间
(找正交矩阵 R 使得 A ≈ R·B)
        ↓
联合 SAE 训练（Top-K sparsity + downstream loss + dead-feature revival）
        ↓
跨 seed 通用特征
```

### Procrustes Alignment

```math
R^* = \arg\min_R \| A - R B \|_F \quad \text{s.t.} \quad R^T R = I
```

- 找正交旋转矩阵对齐两个 seed 的激活空间
- 使对应特征可以直接比较

## 实验结果

| Dataset | Pearson r (across seeds) |
|---------|------------------------|
| SST-2 | ≥ 0.70 |
| Stanford Politeness | ≥ 0.70 |
| TweetEval Emotion | ≥ 0.70 |

- 在所有 3 个数据集上均优于 post-hoc alignment baselines
- 定性分析确认高通用性特征编码了可解释的社会语言模式

## 相关工作

- [[2607.08339]] - Recovering Type Representations from Code Models（另一类 interpretability 工作）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08499 | 2026-07-10*
