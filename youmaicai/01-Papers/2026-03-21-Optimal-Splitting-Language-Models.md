# Optimal Splitting: Optimal Splitting of Language Models from Mixtures to Specialized Domains

## 元信息
| 标题 | Optimal Splitting of Language Models from Mixtures to Specialized Domains |
|------|------|
| 作者 | Skyler Seto |
| 链接 | [原文](https://arxiv.org/abs/2603.19149) |
| arXiv | arXiv:2603.19149 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 提出多领域语言模型的最优分割训练方法
2. 使用 Scaling Laws 预测预训练和继续预训练的计算分配
3. 在常识知识和推理基准上持续提升性能

## 问题背景
标准训练范式：
1. 在完整语料库上预训练
2. 在高质量专业数据上继续预训练（领域专业化）

多领域场景的挑战：
- 需要为每个领域训练独立模型
- 计算资源分配不明确

## 核心方法
**Optimal Splitting**：
- 独立预训练多个模型
- 使用 Scaling Laws 确定最优计算分配
- 预测模型大小 N、预训练 token D、专业化 token D' 的损失
- 外推到更大模型和更多 token

## 实验结果
- 在不同模型大小和计算预算下
- 常识知识和推理基准上持续改进
- 准确预测性能表现

## 局限性
- 未提及

## 应用场景
- 多领域 LLM 训练
- 计算资源优化
- 领域专业化

## 相关链接
- [[scaling-laws]]
- [[domain-specialization]]
- [[LLM-training]]
- [[compute-optimization]]
