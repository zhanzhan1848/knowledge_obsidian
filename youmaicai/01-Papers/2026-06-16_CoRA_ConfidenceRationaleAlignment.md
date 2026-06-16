# CoRA: Confidence-Rationale Alignment for Reliable Chain-of-Thought Reasoning

## 元信息
| 标题 | CoRA: Confidence-Rationale Alignment for Reliable Chain-of-Thought Reasoning |
|------|-----|
| 作者 | Juming Xiong, Weixin Liu, Kevin Guo, Congning Ni, Junchao Zhu, Chongyu Qu, Chao Yan, Katherine Brown, Avinash Baidya, Xiang Gao, Bradley Malin, Zhijun Yin |
| 链接 | [原文](https://arxiv.org/abs/2606.14961) |
| arXiv | arXiv:2606.14961 |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **Confidence-Rationale Alignment（置信度-推理链对齐）** 问题：模型的答案置信度是否由其生成的推理链支撑
2. 设计基于 **GRPO** 的强化学习框架，联合优化答案正确性、推理链质量和置信度
3. 在 MedQA、MathQA、OpenBookQA 三个数据集上，CoRA 将置信度-推理链对齐误差降低最高 **26.51%**

## 核心问题
现有 CoT 方法的问题：
- 模型可能生成流畅的推理链但选择错误答案，同时对错误答案赋予高置信度
- 这种"高置信度+流畅推理"组合对用户极具误导性
- 现有置信度校准方法评估的是聚合概率，不评估单条推理链对答案的支撑质量

## 方法框架

### 1. 推理链质量评估 Rubric
使用 LLM-as-Judge 评估推理链是否支撑模型选择的答案，评估维度：
- **Grounding**：推理链是否基于问题相关的事实
- **Coherence**：推理步骤是否逻辑连贯
- **Task Match**：推理是否针对任务要求
- **Connection to Selected Answer**：推理是否与模型选择的答案有明确关联
- **关键**：Judge 不知道正确答案，避免泄露 gold answer

### 2. GRPO 奖励设计
三层奖励联合优化：
```
R = α * A(correctness) + β * Q(rationale-support quality) + γ * C(committed-answer confidence)
```
- 奖励高置信度且推理链支撑强的答案
- 惩罚无支撑的高置信度（不可靠的过度自信）

## 实验结果
- **MathQA**: CoRA 显著减少无支撑过度自信，对齐误差降低最多 **26.51%**
- **MedQA / OpenBookQA**: 在多数设置中减少置信度-推理链误差，同时保持竞争力精度
- **Calibration**: CoRA 经常改善校准（ECE 和 Brier Score）
- **下游正确率预测任务**: CoRA 使推理痕迹更具诊断价值

## 局限性
- 仅适用于多选题场景
- LLM-as-Judge 作为推理链质量代理可能存在偏差
- 需要充足的训练数据支持 GRPO

## 关键词
`Chain-of-Thought` `Confidence Calibration` `Rationale Faithfulness` `GRPO` `RLHF` `LLM Reasoning`
