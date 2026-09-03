# PRO-Step: Step-level Process Reward Optimization for RAG

## 元信息
| 标题 | PRO-Step: Step-level Process Reward Optimization for Retrieval-Augmented Generation |
|------|------|
| 作者 | MinKeon Kim, Namjun Lee, Jaekwang Kim |
| 链接 | [原文](https://arxiv.org/abs/2609.01658) |
| arXiv | arXiv:2609.01658 |
| 代码 | [GitHub](https://github.com/keemminnke/PRO-Step) |
| 会议 | EMNLP 2026 |

## 核心贡献
1. 指出 RAG 中多跳推理的错误传播问题：早期检索失败会混淆后续推理步骤
2. 现有 process-based 方法仍然对每个步骤用最终答案评分，奖励"巧合成功"（即有缺陷的检索恰好产生正确答案）
3. 提出 **PRO-STEP**：训练一个生成式 PRM 同时评估**逻辑有效性**和**证据接地性**两个维度

## 模型架构 / 方法
- **Generative PRM**：同时评估逻辑有效性和证据接地性
- **PRM-guided value tree search**：构建偏好对，对比 valid steps vs flawed steps
- **Step-level Direct Preference Optimization (DPO)**：优化策略

## 实验结果
- 在 single-hop 和 multi-hop QA 数据集上，PRO-STEP 在 5 个基准上达到最佳平均 EM 和 F1
- 超越 outcome-based 和标准 process-based 基线

## 局限性
- 依赖 PRM 质量，PRM 本身的训练仍需要标注数据
- 计算开销高于标准 RAG

## 关键词
#RAG #process-reward-model #multi-hop-reasoning #DPO #RLHF
