# Quantifying Prior Dominance in RAG Systems

## 元信息
| 标题 | Quantifying Prior Dominance in RAG Systems |
|------|------|
| 作者 | Barak Or (ArtificialGate Ltd., Google & Reichman Tech School, Technion, Reichman University) |
| 链接 | [原文](https://arxiv.org/abs/2606.23695) |
| arXiv | arXiv:2606.23695 |
| 领域 | RAG, Evaluation, Small Language Models |

---

## 核心贡献

1. **NCU (Normalized Context Utilization) 指标**：提出利用连续 token log-probabilities 在 zero-shot、oracle 和 adversarial 条件下的差异，严格量化上下文信息增益：
   
   $$NCU = \max\left[0, \min\left(1, \frac{CUS}{S_{prior} + \epsilon}\right)\right]$$
   
   其中 $CUS = S_{prior} - S_{post}$，$S_{prior}$ 是先验熵，$S_{post}$ 是后验熵。

2. **Prior Dominance 量化**：定义模型在对抗性上下文中优先依赖参数化记忆而非外部证据的倾向。

3. **Negative Transfer 识别**：当上下文实际上降低了模型信心（$S_{post} > S_{prior}$）时的系统性崩溃现象。

---

## 核心发现

### RQ1: Extraction Scaling（参数扩展的边际收益递减）

| 模型 | Oracle 准确率 | NCU | 延迟 |
|------|-------------|-----|------|
| Qwen-1.5B | **95.9%** | 0.864 | 0.041s |
| Qwen-7B | 95.3% | 0.861 | - |
| Qwen-72B | 93.8% | 0.868 | 0.389s |
| GPT-4o-mini (商业) | 90.1% | 0.777 | - |

**发现**：SLM 在严格提取任务中与 72B 模型统计持平，但延迟降低 **70×**

### RQ2: Prior Dominance（商业 API 最严重）

| 模型 | Prior Dominance 率 |
|------|------------------|
| Qwen-1.5B | ~33% |
| Qwen-7B | ~33–35% |
| Qwen-72B | 42.5% |
| GPT-4o-mini (商业) | **47.1%** |

**发现**：Prior Dominance 与模型规模和专有对齐正相关

### RQ3: Negative Transfer（商业 API 最脆弱）

| 模型 | Negative Transfer 率 |
|------|--------------------|
| Qwen-1.5B | 3.8% |
| GPT-4o-mini (商业) | **9.8%** (近 3 倍) |

**发现**：商业 API 在遇到冲突知识时频繁出现信心系统性崩溃

---

## 理论框架

### NCU 指标公式

**Prior Epistemic Uncertainty:**
$$S_{prior} = -\frac{1}{k}\sum_{i=1}^{k}\log P_\theta(y_i|y_{<i}, Q)$$

**Posterior Epistemic Uncertainty:**
$$S_{post} = -\frac{1}{k}\sum_{i=1}^{k}\log P_\theta(y_i|y_{<i}, Q, C)$$

**Raw Context Utilization Score:**
$$CUS = \frac{1}{k}\sum_{i=1}^{k}\log P_\theta(y_i|y_{<i}, Q, C) - \frac{1}{k}\sum_{i=1}^{k}\log P_\theta(y_i|y_{<i}, Q)$$

### Alignment Tax Hypothesis

商业模型在高置信度先验被外部证据矛盾时，不仅未能提取新信息，还出现严重的熵降——暗示安全和密集的参数记忆可能 active resist out-of-distribution updates。

---

## 实验设置

- **数据集**：Natural Questions (NQ-Open), TriviaQA (rc.wikipedia), HotpotQA (distractor)
- **模型**：Qwen2.5-1.5B/7B/72B-Instruct, GPT-4o-mini
- **条件**：Zero-shot, Oracle, Adversarial Conflict, Semantic Noise
- **生成限制**：T≤5 tokens, greedy decoding (T=0.0)
- **阈值**：P > 0.05 判定为成功提取

---

## 核心结论

1. **严格提取任务的 Scaling Laws 边际收益极度递减**：SLM 可匹配 72B 模型的上下文利用效率
2. **Prior Dominance 与参数规模和专有对齐相关**：商业 API 在 47.1% 的对抗性冲突中优先使用参数记忆
3. **Alignment Tax Hypothesis**：重型安全对齐或密集参数记忆可能 active resist out-of-distribution updates
4. **RAG 架构建议**：提取任务应路由到 SLM，高容量模型保留用于复杂综合任务（需管理参数覆盖风险）

---

## 标签
#RAG #evaluation #NCU-metric #small-language-models #prior-dominance #alignment