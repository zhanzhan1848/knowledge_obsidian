# Feature Rivalry in Sparse Autoencoder Representations

**arXiv**: [2605.08149](https://arxiv.org/abs/2605.08149) | cs.LG/cs.CL  
**作者**: H Harshavardhan  
**提交**: 2026-05-03

---

## 元信息

| 字段 | 值 |
|------|-----|
| 标题 | Feature Rivalry in Sparse Autoencoder Representations: A Mechanistic Study of Uncertainty-Driven Feature Competition in LLMs |
| 链接 | [arXiv](https://arxiv.org/abs/2605.08149) |
| arXiv | arXiv:2605.08149 |
| 模型 | Gemma-2-2B + Gemma Scope SAEs |

---

## 核心贡献

研究稀疏自编码器（SAE）特征在不确定性下的交互机制。

### 核心概念：Feature Rivalry

**定义**: 负相关的 SAE 特征对

### 关键实验

1. **不确定性驱动竞争**: 在 PopQA 上按响应熵分割，高熵问题在第 0 和第 12 层产生显著更强的特征竞争
   - 第 0 层: p = 5.3×10⁻²⁶
   - 第 12 层: p = 5.8×10⁻⁵

2. **因果验证**: 沿竞争轴（vec_A - vec_B）进行激活 steering，在低 steering multiplier 下，15/20 竞争特征对比随机方向引起更多输出变化

3. **预测能力**: per-prompt rivalry score（来自 active SAE 特征 decoder 向量的成对 cosine 相似度）可预测答案正确性
   - AUROC = 0.689
   - 接近 softmax 置信度（AUROC = 0.808）

---

## 理论价值

将不确定性本地化到残差流中的特定处理阶段，为 LLM 内部不确定性机制提供新的可解释性视角。

---

## 建议

- **推荐等级**: ⭐⭐⭐⭐
- **适用场景**: LLM 可解释性、不确定性量化、SAE 分析方法论

---
*🥬 油麦菜 | 2026-05-12*