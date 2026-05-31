# MMPO: Meta-Cognitive Memory Policy Optimization for Long-Horizon LLM Agents

## 元信息
| 标题 | Meta-Cognitive Memory Policy Optimization for Long-Horizon LLM Agents |
| 作者 | Ziyan Liu et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30159) |
| arXiv | arXiv:2605.30159 |

## 核心贡献
1. **问题**：现有记忆增强 LLM agents 使用基于结果的强化学习训练记忆策略，无法定位中间记忆质量退化位置
2. **核心论点**：记忆优化应关注中间摘要诱导的信念清晰度，而非仅轨迹级成功
3. **提出 Belief Entropy**：自监督代理，探测模型对当前记忆的潜在任务状态的不确定性
4. **提出 MMPO**：元认知记忆策略优化
   - 不依赖稀疏的基于结果信号
   - 通过明确惩罚诱导高认知不确定性的摘要提供细粒度、记忆特定的监督
   - 在多样化长期任务上持续超越现有方法

## 实验结果
- 在 1.75M-token 上下文规模下保持 97.1% 性能

## 核心机制

```
Belief Entropy = self-supervised proxy
→ How uncertain model is about latent task state given current memory

MMPO:
- Penalizes summaries inducing high epistemic uncertainty
- Fine-grained, memory-specific supervision
- No reliance only on sparse outcome-based signals
```

## 标签
#memory-augmented-agents #meta-cognition #long-horizon #RL