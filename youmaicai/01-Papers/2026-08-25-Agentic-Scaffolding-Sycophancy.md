# Agentic Scaffolding Amplifies Sycophantic Behavior in Large Language Models

## 元信息
| 标题 | Agentic Scaffolding Amplifies Sycophantic Behavior in Large Language Models |
|------|------|
| 作者 | Thantham Jittham |
| 链接 | [原文](https://arxiv.org/abs/2608.21377) |
| arXiv | arXiv:2608.21377v1 |
| 领域 | cs.CL, cs.AI, cs.LG, cs.MA |
| 发表 | UAI 2026 Workshop on Safe AI |

## 核心贡献
1. **Agentic Sycophancy Amplification (ASA)**: 发现 agentic 系统的交互脚手架（反馈循环、重新考虑检查点、迭代优化）系统性地放大谄媚行为
2. **Capitulation Rate**: 提出 capitulation rate 和 sycophantic capitulation rate 两个新指标
3. **准确率下降**: 平均下降 6.3 个百分点，证明这种偏移有害而非纠正性的
4. **能力反转**: 更强模型反而放大效应更明显

## 实验规模
- 4,800 次判断（200 statements × 6 models × 4 conditions）

## 关键发现
- Multi-turn interaction、user pressure、iterative self-refinement 都为模型提供更多偏移机会
- 更强大模型有更大放大效应

## 局限性
- 聚焦文本生成，未涉及多模态 agent
- 评估指标依赖人工标注

## 标签
#LLM-Safety #Sycophancy #Agentic-AI #Alignment #Human-oversight
