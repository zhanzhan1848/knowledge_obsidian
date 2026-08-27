# The Dialect Tax: Dialectal Biases Persist throughout the Language Modeling Pipeline

## 元信息
| 标题 | The Dialect Tax: Dialectal Biases Persist throughout the Language Modeling Pipeline |
|------|------|
| 作者 | Elle Michelle Yang et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.24952) |
| arXiv | arXiv:2608.24952 |
| 发表 | EMNLP 2026 |
| 分类 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. **追踪"方言税"在整个 NLP 流程中的累积**：从 tokenization → pre-training → post-training → inference 全链路分析方言性能差距
2. **发现多层次的不平等编码**：即使 LMs 能在语义层面识别方言等价文本，下游性能差距依然存在
3. **揭示方言对的梯度更新分叉更大**：预训练中，语义等价的方言对产生的梯度更新比完全不相关的 SAE 文档对更大
4. **Reward Model 的不稳定方言偏好**：reward model 在不同上下文中对方言产生不稳定偏好

## 关键发现

### 语义等价 ≠ 表现等价
LMs 可以识别 AAVE 和 SAE 语义等价，但下游任务表现仍有差距。

### 全链路累积
```
Tokenization → Pre-training → Post-training → Inference
   ↓              ↓              ↓            ↓
  不平等        不平等        不平等        不平等
```

### 消融实验：Character-Level Tokenizer
使用字符级 tokenizer（绕过 subword segmentation）既不能消除输入输出的不对称性，也不能消除方言准确率差距。

### Pre-training 梯度分叉
```
方言对梯度更新 > 无关 SAE 文档对梯度更新
```
模型从语义等价的方言内容中学习的难度大于从无关 SAE 文档学习。

### Post-training Reward Model 不稳定偏好
- **孤立 token**：AAVE 独有 token 比 SAE 独有 token 获得更高 reward
- **完整推理上下文**：task- and model-dependent 的方言惩罚
- **结论**：reward model 对方言的偏好是 context-dependent 且不稳定的

## 方言税的定义
> 方言税不是由单一环节造成的，而是在 tokenization、预训练、后训练、推理的每一步都被编码和累积的。

## 建议
- **是否推荐阅读**：是（对 fairness 和 LLM bias 研究有重要价值）
- **适用场景**：LLM fairness、方言 NLP、模型评估

## 相关研究
- Bias in LLM: [[LLM Fairness]]
- Dialectal NLP: [[AAVE]] [[Dialect]]
- Tokenization: [[Tokenization]]

---
*标签*: #dialect-bias #fairness #language-modeling #empirical-study #EMNLP2026
