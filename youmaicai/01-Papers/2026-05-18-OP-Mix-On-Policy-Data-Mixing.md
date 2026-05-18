# OP-Mix: On-Policy Mix for Efficient Data Mixing Across LLM Training Lifecycle

## 元信息
| 标题 | Always Learning, Always Mixing: Efficient and Simple Data Mixing All The Time |
|------|------|
| 作者 | Michael Hu |
| 链接 | [原文](https://arxiv.org/abs/2605.15220) |
| arXiv | arXiv:2605.15220 |
| 发表 | cs.CL / cs.AI / cs.LG |

## 核心贡献
1. **问题识别**：现有数据混合方法只处理训练生命周期的一个阶段，需要小代理模型或固定领域集。
2. **OP-Mix (On-Policy Mix)**：在语言模型整个训练生命周期运行的数据混合算法。
3. **核心洞察**：通过在当前模型上直接插入低秩 adapters 来廉价模拟候选数据混合，无需独立代理模型，确保搜索始终基于模型实际学习动态。

## 核心创新

### 在线决策问题视角
数据混合本质上是贯穿训练全过程的在线决策问题，需要统一解决方案。

### 低秩适配器插值
- 在当前模型上直接训练低秩 adapters
- 候选混合通过 adapters 间插值模拟
- 无需独立代理模型
- 搜索始终基于模型实际学习动态

### 全生命周期覆盖
- 预训练
- 持续中间训练（continual midtraining）
- 持续指令微调（continual instruction tuning）

## 实验结果

### 预训练
- **平均 perplexity 提升**: +6.3%

### 持续学习
- 匹配 retraining 性能，使用 **66% 更少计算**
- 匹配 on-policy distillation 性能，使用 **95% 更少计算**

## 关键洞察
语言模型训练不是独立阶段的序列，而是一个从数据中学习的单一连续过程。

## 标签
#data-mixing #continual-learning #fine-tuning #pre-training #optimization