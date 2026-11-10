---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, mental-health, multi-task-learning, PEFT, quantization]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10797
arxiv: 2611.10797
---

# Adapting Large Language Models via Multi-Task Learning for Mental Health Problem, Emotion, and Sentiment Detection

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Adapting Large Language Models via Multi-Task Learning for Mental Health Problem, Emotion, and Sentiment Detection |
| **作者** | Amir Rafiq Bhat, Rahim Dehkharghani, Zeki Erdem（Kadir Has University, Istanbul；University of Michigan-Flint） |
| **发表** | arXiv preprint（33 页） |
| **链接** | [原文](https://arxiv.org/abs/2611.10797) |
| **arXiv** | arXiv:2611.10797 |
| **分类** | cs.CL, cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 系统实证顺序式多任务 PEFT（LoRA + 4-bit 量化）在心理健康 NLP 上的效果，核心发现是**任务顺序显著影响知识迁移与任务干扰**，且同时学习（Joint-MTL）会导致任务干扰与生成格式崩塌。

1. **两种顺序课程对比**：MHP-first（MHP → Emotion → Sentiment）与 Emo-first（Emotion → MHP → Sentiment）两条 4 阶段序列，在 Llama 3.1 8B Instruct + QLoRA 上逐步续训同一套 LoRA 适配器（前一阶段的"冻结基座 + 已训适配器"载入后继续更新）。
2. **任务顺序的量化影响**：MHP-first 在主任务 MHP 上达 Micro-F1 **0.7624**；Emo-first 在 Emotion（F1 **0.6052**）与 Sentiment（F1 **0.9459**）上更优——说明不存在对所有任务都最优的单一序列。
3. **Joint-MTL 反证基线**：把三个任务"打包"进一条统一提示同时预测的基线，暴露出任务干扰与**生成格式崩塌**（generative format collapse），反证顺序式设计的必要性。
4. **HPC 视角的资源收益**：4-bit 量化（nf4 + double quant + fp16 compute）+ LoRA r=16 使可训练参数低于总量 1%，可在 T4/P100 级 GPU 上完成 8B 模型适配。

---

## 技术方案

### 核心思想

三个任务高度相关但输出格式各异：MHP 检出是四分类（Anxiety / Bipolar / Depression / SuicideWatch），Emotion 是八类多标签（anger, fear, hopefulness, hopelessness, joy, sadness, calmness, disgust），Sentiment 为二分类（Positive / Negative；因数据集中仅 588 条中性样本被确定性地并入 Negative 以维持 4,243 条全量训练）。方法上采用顺序式多任务学习：每一阶段载入上一阶段的 PEFT 模型（基座冻结、仅更新已有 LoRA 权重），用 `SFTTrainer` 在新任务数据上继续训练。主任务 MHP 最多训 10 个 epoch 以建立临床类表征，辅助任务限 3 个 epoch 并配 Early Stopping（patience=3）以抑制过拟合与任务干扰。为保证顺序有效性，作者额外构造 Joint-MTL 基线（单一统一提示同时生成三类分类结果），用同样的 QLoRA 超参与训练轮次做对照，验证"同时学习"带来的干扰与格式崩塌。

### 关键公式

```math
\text{Sequence 1 (MHP-first):}\quad
M_0 \rightarrow M_1(\text{MHP}) \rightarrow M_2(\text{MHP+Emo}) \rightarrow M_3(\text{MHP+Emo+Sent})

\text{Sequence 2 (Emo-first):}\quad
M_0 \rightarrow M_{1e}(\text{Emo}) \rightarrow M_{2e}(\text{Emo+MHP}) \rightarrow M_{3e}(\text{Emo+MHP+Sent})

\text{QLoRA:}\quad W' = W + \frac{\alpha}{r}B A,\quad r=16,\ \alpha=16,\ \text{dropout}=0.1
```

### 关键组件
- **QLoRA 配置**：`load_in_4bit=True`、`bnb_4bit_quant_type="nf4"`、`bnb_4bit_use_double_quant=True`、`bnb_4bit_compute_dtype=torch.float16`、`bias="none"`、`task_type="CAUSAL_LM"`，目标模块为所有 `bnb.nn.Linear4bit`（排除 lm head）。
- **数据源**：扩展版 SWMH 数据集，4,243 条英文社交媒体帖子。
- **两阶段序列课程**：Seq1 与 Seq2 各 3 个微调阶段（M0→M3），每阶段在前一阶段适配器上继续训练。
- **分阶段训练策略**：主任务 10 epoch，辅助任务 3 epoch + Early Stopping(patience=3)；per-device batch size 1–2，梯度累积 16 或 8 → 有效 batch size 16。
- **Joint-MTL 基线**：单提示三任务同时输出的零样本与微调对照。
- **指令式提示工程**：用自然语言指令而非 few-shot / prompt tuning，契合 Llama 3.1 8B Instruct 的指令跟随能力；M0 零样本评测同时充当提示模板有效性的消融。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 数据集 | 扩展 SWMH，4,243 条英文社交媒体帖子 |
| 基座模型 | Llama 3.1 8B Instruct（4-bit 量化） |
| M0 零-shot（基线） | MHP 0.6188 / Emotion 0.2930 / Sentiment 0.5647（Micro-F1） |
| Seq1 M1（MHP 微调后） | MHP 0.7388（+0.1200）/ Emotion 0.4663（+0.1733）/ Sentiment 0.8635（+0.2988） |
| Seq1 M2（+Emotion） | MHP 0.7553（+0.0165）/ Emotion 0.4697（+0.0034）/ Sentiment 0.8635（+0.0000） |
| Seq1 M3（+Sentiment，最终） | **MHP 0.7624** / Emotion 0.4385（−0.0312）/ Sentiment 0.8635 |
| Seq2 M1e（Emotion 微调后） | MHP 0.6259（+0.0071）/ Emotion 0.6004（+0.3074）/ Sentiment 0.9459（+0.3812） |
| Seq2 M2e（+MHP） | MHP 0.6824 / Emotion 0.6052 / Sentiment 0.9459（Emotion、Sentiment 最优） |
| 顺序效应 | MHP-first 在主任务最优；Emo-first 在 Emotion（0.6052）与 Sentiment（0.9459）最优 → **无普适最优序列** |
| 迁移模式 | 首阶段正迁移最强；后续阶段主任务收益递减，MHP-first 中 Emotion 甚至出现 −0.0312 的负迁移 |
| Joint-MTL | 出现任务干扰与生成格式崩塌，性能劣于顺序式方案 |

---

## 局限性

- 单数据集（SWMH）、单模型（Llama 3.1 8B Instruct）、单语种（英文），结论外推性有限。
- Sentiment 任务把 588 条中性样本确定性并入 Negative，是人工构造的二值化，可能影响该任务指标的解释力。
- 数据极度类别不平衡（尤其 Emotion 八类多标签），Micro-F1 在此情形下对主类偏重。
- 任务数仅 3、序列仅 2 种，任务顺序的交互效应样本量不足。
- 未提供代码仓库；论文同时未给出显著性检验。
- 仅覆盖英文社交媒体文本，未涉及临床对话或多模态场景。

---

## 建议

- **是否推荐使用**：是（作为"任务顺序对多任务 PEFT 影响的经验参考"有价值）
- **适用场景**：资源受限（单卡 T4/P100）下适配 8B 级模型做心理健康/情感分析；设计多任务微调课程顺序的经验参考；需要量化 QLoRA 超参与梯度累积配置的实践指南。
- **值得复现**：是（33 页含完整配置表，成本不高；但数据集需自行获取 SWMH）

---

**相关论文**：[[2026-11-10-Deletion-Tuning-LLM-Post-Training]] [[2026-11-10-SEELE-Responsive-Rollout-Difficulty]]
**主题标签**：#LLM #NLP #MentalHealth #MultiTaskLearning #PEFT #Quantization
