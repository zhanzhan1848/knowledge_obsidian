# The Illusion of Latent Generalization: Bi-directionality and the Reversal Curse

## 元信息

| 标题 | The Illusion of Latent Generalization: Bi-directionality and the Reversal Curse |
|------|------|
| 作者 | Julian Coda-Forno, Jane X. Wang, Arslan Chaudhry |
| 链接 | [原文](https://arxiv.org/abs/2604.04943) |
| arXiv | arXiv:2604.04943 |
| 领域 | cs.CL, cs.AI |
| 发表 | ICLR 2026 Workshop (Re-Align) |

## 核心贡献

1. **扩展评估范围**：将 vanilla MLM（掩码语言建模）纳入双向监督目标，首次与 decoder-only masking-based 训练进行系统对比
2. **揭示"幻觉泛化"**：目标层面的"修复"（如双向注意力）可改善 Reversal 行为，但**不一定**诱导真正的潜在泛化
3. **机制解释**：representation distances 和 linear probes 表明，MLM 和 decoder-only masking-based 训练都将正反向存储为**独立条目**，索引几何结构不同

## Reversal Curse

- **现象**：自回归 LM 无法逆向检索事实（如训练在 "$A > B$" 上，却无法回答 "$B < A$"）
- **已有研究**：双向监督目标（双向注意力或 decoder-only 的掩码重建）可缓解
- **本文**：进一步扩展到 vanilla MLM 并做机制研究

## 关键发现

### 1. 逆序准确率需要显式训练信号
> Reversal accuracy requires training signal that **explicitly makes the source entity a prediction target**
- 仅靠双向架构设计不足以实现真正的潜在泛化

### 2. 表示几何结构差异
- **MLM**: 前向/反向表示为独立条目
- **Decoder-only masking-based**: 索引几何结构不同
- 线性探针结果与"统一方向无关概念表示"假设不符

### 3. 警告
> 目标层面的"修复"可能改善 Reversal 行为，但不必然诱导统一概念的潜在泛化

## 实验设计

- 4个 reversal benchmarks 系统对比
- 包含 vanilla MLM 和 decoder-only masking-based 训练
- Minimal mechanistic study（最小化机制研究）

## 局限性

- 机制解释基于探针实验，可能存在其他解释
- 需要更大规模实验验证泛化性

## 关键词

#reversal-curse #bidirectional #MLM #language-model #generalization #ICLR2026 #mechanistic-interpretability

## 相关论文

- 原始 Reversal Curse 工作（待查引）
- Bidirectional supervision 相关工作

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
