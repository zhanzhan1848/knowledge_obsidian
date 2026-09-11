# 🥬 LLM 论文分析：TF-IDF Weighted Cross-Entropy Loss

## 基本信息
- **标题**: Rebalancing Token Importance in Language Models with TF-IDF Weighted Cross-Entropy Loss
- **作者**: Zhijian Li
- **发表**: arXiv:2609.11029 | cs.CL / cs.LG
- **链接**: [原文](https://arxiv.org/abs/2609.11029) | [PDF](https://arxiv.org/pdf/2609.11029) | [HTML](https://arxiv.org/html/2609.11029v1)

## 核心贡献

1. **TF-IDF 加权交叉熵损失**: 使用 TF-IDF 统计重新调整 token 级别贡献，强调语义信息丰富的 token，降权常见低信息量 token
2. **减少记忆化**: 一致减少记忆化的子串长度，同时保持 perplexity 和下游任务性能
3. **LoRA 友好**: LoRA 微调下所有 5 个模型平均减少 14% 记忆子串；全量微调 TinyLLaMA 1.1B 减少 58%
4. **架构无关**: 可集成到现有训练流程，计算开销 < 3%

## 背景与动机

**问题**:
- LLM 通常在均匀 token 加权下训练
- 频繁低信息量 token 主导学习
- 增加记忆表面级文本片段的倾向

**TF-IDF 加权核心思想**:
- 高 TF-IDF token → 语义丰富 → 更高权重
- 低 TF-IDF token → 常见低信息 → 更低权重

## 方法

```math
L_{TF-IDF} = -\sum_{t} w_t \cdot \log p(x_t | x_{<t})

w_t = TF-IDF(x_t) / \sum_{t'} TF-IDF(x_{t'})
```

**实现要点**:
- 计算整个 corpus 的 TF-IDF 统计
- 在标准交叉熵损失上应用 token 级权重
- 架构无关，可插入任何自回归 LM

## 实验结果

| 实验设置 | 模型规模 | 记忆化减少 |
|----------|----------|-----------|
| LoRA 微调 | 1.1B - 13B (5 个模型) | **14%** 平均 |
| 全量微调 | TinyLLaMA 1.1B | **58%** |

| 指标 | 影响 |
|------|------|
| Perplexity | 保持 |
| 下游任务性能 | 保持 |
| 计算开销 | < 3% |

## 局限性

- 依赖 TF-IDF 统计，预计算需要遍历整个 corpus
- 减少 58% 是 TinyLLaMA 1.1B，可能不适用于更大模型

## 建议
- **是否推荐使用**: ⭐⭐⭐⭐ (简单有效，通用性强)
- **适用场景**: 隐私敏感训练、减少幻觉、版权风险缓解
- **实践建议**: 作为训练的正则化项使用，计算开销可接受

---

## 🏷️ Tags
#Memorization #Training-Loss #TF-IDF #Privacy #Fine-tuning #LoRA
