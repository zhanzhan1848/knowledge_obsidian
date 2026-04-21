# LiFT: Longitudinal Instruction Fine-Tuning for LLM Temporal Reasoning

## 元信息
| 标题 | LiFT: Does Instruction Fine-Tuning Improve In-Context Learning for Longitudinal Modelling by Large Language Models? |
|------|------|
| 作者 | Iqra Ali, Talia Tseriotou, Mahmud Elahi Akhter, Yuxiang Zhou, Maria Liakata |
| 链接 | [原文](https://arxiv.org/abs/2604.16382) |
| arXiv | arXiv:2604.16382v1 |
| 发表 | 2026-03-25 |

## 核心贡献
1. 提出 **LiFT**：纵向指令微调框架，将多样化的纵向建模任务统一在共享指令 schema 下
2. 提出 **Curriculum** 机制：渐进增加时间难度，结合 few-shot 结构和时间条件化
3. 在 5 个数据集、多种模型规模上验证 LiFT 持续优于 base-model ICL

## 核心创新点
- **任务**：Longitudinal NLP — 在时间排序文本上推理，检测人类行为和观点的持续性和变化
- **挑战**：ICL 模型难以整合历史上下文、追踪演化交互、处理罕见变化事件
- **方法**：
  - 共享指令 schema 统一任务
  - Curriculum 渐进式增加时间难度
  - Few-shot structure + temporal conditioning 促进有效利用历史上下文

## 实验结果
测试模型：OLMo (1B/7B), LLaMA-8B, Qwen-14B

- LiFT 持续优于 base-model ICL
- 强泛化能力：跨不同时间粒度的纵向任务训练，在独立数据集上测试
- OOD 数据和 minority change events 上提升显著

## 关键词
`instruction fine-tuning` `longitudinal NLP` `temporal reasoning` `in-context learning` `curriculum learning`

## 相关工作
- Longitudinal NLP
- Instruction Tuning
- In-Context Learning (ICL)
- Temporal reasoning in LLMs

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*