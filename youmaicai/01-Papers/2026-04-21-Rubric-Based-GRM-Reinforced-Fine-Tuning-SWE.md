# Rubric-Based GRM for Reinforced Fine-Tuning SWE Agents

## 元信息
| 标题 | Beyond Verifiable Rewards: Rubric-Based GRM for Reinforced Fine-Tuning SWE Agents |
|------|------|
| 作者 | Jiawei Huang, Qingping Yang, Renjie Zheng, Jiaze Chen |
| 链接 | [原文](https://arxiv.org/abs/2604.16335) |
| arXiv | arXiv:2604.16335v1 |
| 发表 | 2026-03-13 |

## 核心贡献
1. 提出 **Rubric-based Generative Reward Model (GRM)**，提供比 binary terminal reward 更丰富的学习信号
2. 提出 **Trajectory Filtration** 方法利用 GRM 反馈收集高质量训练数据
3. 应用 **Reinforced Fine-Tuning (RFT)** 于 SWE 任务，在最终测试准确率上优于仅 terminal-score 的 rejection sampling

## 核心创新点
- **问题**：现有 SWE Agent 端到端微调依赖可验证的 terminal reward（如 unit tests 是否通过），无法指导多步交互中的中间行为塑造
- **方法**：GRM 配备人类设计的评分规则（rubrics），指示鼓励或抑制特定行为模式
- **RFT**：使用 rubric-based 反馈进行强化微调，有效抑制不良模式并促进良好模式

## 实验结果
- 在 SWE Tasks 上表现优于 terminal-score-only rejection sampling
- Case analysis 确认：更有效地抑制不良模式 + 促进良好模式
- 最终测试准确率提升

## 关键词
`LLM Agent` `SWE` `reinforcement fine-tuning` `reward model` `RLHF` `code generation`

## 相关工作
- SWE-bench
- Reinforced Fine-Tuning (RFT)
- Generative Reward Model (GRM)
- Rejection Sampling

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*