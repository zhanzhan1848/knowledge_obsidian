# SteerWrite: Training-Free Token-Level Steering for LLM Personalized Co-Writing

## 元信息
| 标题 | Training-Free Token-Level Steering for LLM Personalized Co-Writing |
|------|-------|
| 作者 | Wenhao Mao et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06069) |
| arXiv | arXiv:2608.06069 |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **SteerWrite**：无需训练的个性化协作写作框架，将 LLM 适配到专门领域
2. 在 token 级别进行精细控制（无需梯度更新）
3. 专门设计适配小数据场景

## 方法
- 训练-free：通过 token 级 steering 将基础模型适配专门领域
- 不依赖检索（RAG 做不到细粒度 token 控制），不依赖微调（成本高、数据更新慢）
- 专注协作写作范式（超越仅限 coding 领域的现有方案）

## 实验结果
- 在多个数据集、多个指标和多个模型上达到 SOTA
- 显著降低人工编辑工作量

## 关键洞察
Token 级 steering 是无需训练的领域适配有效手段，协作写作是被忽视的重要场景
