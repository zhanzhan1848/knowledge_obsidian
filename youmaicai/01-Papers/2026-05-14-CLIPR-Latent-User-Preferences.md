# CLIPR: Conversational Learning for Inferring Preferences and Reasoning

## 元信息
| 标题 | Learning Transferable Latent User Preferences for Human-Aligned Decision Making |
|------|-----|
| 作者 | Alina Hyk, Sandhya Saisubramanian |
| 链接 | [原文](https://arxiv.org/abs/2605.12682) |
| arXiv | arXiv:2605.12682 |
| 类别 | cs.AI |

## 核心贡献
1. **问题**：LLM 作为推理模块时，常难以产生人类对齐的解决方案；现有方法依赖大量重复交互或无法泛化潜在偏好
2. **方案**：CLIPR，从最少对话输入中学习可迁移的自然语言规则来表示潜在用户偏好
3. **核心机制**：这些规则通过自适应反馈迭代优化，应用于分布内和分布外歧义任务

## 方法
- **规则抽取**：从有限对话中提取自然语言表示的潜在偏好规则
- **自适应反馈**：规则迭代优化
- **跨任务泛化**：适用于多个环境和分布外歧义任务

## 实验
- 三个数据集 + 用户研究
- 一致优于现有方法
- 提升对齐度、降低推理成本

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.AI