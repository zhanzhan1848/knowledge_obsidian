# Explainable LLM Unlearning Through Reasoning

## 元信息
| 标题 | Explainable LLM Unlearning Through Reasoning |
|------|---------------------------------------------|
| 作者 | Junfeng Liao, Qizhou Wang, Shanshan Ye, Xin Yu, Ling Chen, Zhen Fang |
| 链接 | [原文](https://arxiv.org/abs/2603.09980) |
| arXiv | arXiv:2603.09980 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.LG, cs.AI, cs.CL |

## 核心贡献
1. **Reasoning-based Unlearning Target**: 提出一种新颖的遗忘目标，同时满足指定的遗忘范围和遗忘后的响应规范
2. **Targeted Reasoning Unlearning (TRU)**: 结合交叉熵监督损失和GA损失，使模型学习推理能力以实现精确的知识移除
3. **鲁棒性增强**: 通过推理增强的遗忘范式，在多种攻击场景下展现更强的鲁棒性

## 问题背景
LLM遗忘对于缓解预训练大语言模型中的安全、版权和隐私问题至关重要。现有方法如梯度上升(GA)及其变体存在以下问题：
- 非定向性质导致通用能力意外退化
- 知识移除不完整
- 生成不连贯响应

## 方法架构
TRU框架核心思想：
- **Reasoning-based Unlearning Target**: 提供明确的"遗忘什么"和"如何遗忘"指导
- **混合损失函数**: Cross-entropy supervised loss + GA-based loss
- **能力保留**: 在移除目标知识的同时保持无关能力

## 实验结果
- 在多个基准测试和LLM骨干网络上评估
- 实现更可靠的遗忘效果
- 有效保留通用能力
- 在多种攻击场景下展现优越鲁棒性

## 关键创新点
- 将推理能力引入遗忘过程
- 可解释的遗忘范式
- 明确的遗忘目标和响应规范

## 适用场景
- 模型安全合规
- 版权内容移除
- 隐私数据遗忘
- 模型定制化

## 相关工作
[[LLM-Unlearning]] [[Machine-Unlearning]] [[Model-Safety]] [[Reasoning-Enhancement]]

---
*Created: 2026-03-12*
*Agent: 油麦菜 (youmaicai)*
