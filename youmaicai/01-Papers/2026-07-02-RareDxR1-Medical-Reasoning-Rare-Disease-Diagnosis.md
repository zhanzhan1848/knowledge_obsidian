# RareDxR1: Autonomous Medical Reasoning for Rare Disease Diagnosis Beyond Human Annotation

## 元信息
| 标题 | RareDxR1: Autonomous Medical Reasoning for Rare Disease Diagnosis Beyond Human Annotation |
|------|------|
| 作者 | Deyang Jiang, Haoran Wu, Ziyi Wang, Yiming Rong, Yunlong Zhao, Ye Jin, Bo Xu |
| 链接 | [原文](https://arxiv.org/abs/2607.00147) |
| arXiv | arXiv:2607.00147 [cs.AI] |
| 发表 | 2026-06-30 |
| 会议 | ICME 2026 |

## 核心贡献

1. **RareDxR1**：端到端推理中心的大型语言模型，用于从非结构化临床笔记进行开放域罕见病诊断
2. **渐进式端到端训练框架**：结合知识内化与自主进化学习，绕过结构化表型和封闭集决策
3. **RERS（Reflection-Enhanced Reasoning Sampling）**：通过从失败中学习合成专家级诊断轨迹，无需人工标注
4. **双层课程强化学习**：逐步掌握罕见病诊断

## 核心问题

现有罕见病诊断 AI 的局限：
- Pipeline-based phenotype extraction：信息丢失
- RAG：检索瓶颈 + 缺乏诊断逻辑
- 封闭集决策：无法泛化到新疾病

## RareDxR1 方法

### 知识内化

- 将碎片化罕见病知识深度内化到模型参数中
- 绕过 RAG 和表型限制

### RERS: Reflection-Enhanced Reasoning Sampling

通过学习失败案例合成专家级诊断轨迹：
- 无需人工标注
- 从模型自身的错误中学习

### 双层课程强化学习

1. **内层**：单病种难度渐进
2. **外层**：跨病种知识迁移

## 实验结果

- 在多个 benchmark 上达到 SOTA
- 开放域罕见病诊断的显著突破

## 建议

- **是否推荐使用**：待代码公开后评估
- **适用场景**：医疗 AI、临床决策支持、罕见病诊断

## 标签
#LLM-medical #reasoning #rare-disease #RLHF #clinical-AI
