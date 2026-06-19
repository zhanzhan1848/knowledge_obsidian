# Disentangling Linguistic Relatedness from Task Alignment in Cross-Lingual Transfer

## 元信息
| 标题 | Disentangling Linguistic Relatedness from Task Alignment in Cross-Lingual Transfer |
|------|------|
| 作者 | Ahmed Haj Ahmed, Ruochen Zhang, Alvin Grissom II |
| 链接 | [原文](https://arxiv.org/abs/2606.19346) |
| arXiv | arXiv:2606.19346 |
| 领域 | cs.CL, cs.AI |

## 核心贡献

1. **无闪米特语系特异性迁移证据**：对 7 种 LLM（4B-671B 参数，涵盖 Dense 和 MoE 架构）在阿拉伯语上微调后，对闪米特语和非闪米特语进行零样本阅读理解评估，发现**没有证据支持闪米特语系具有特殊的跨语言迁移效果**
2. **任务格式对齐假说**：微调和推理时思维链（Chain-of-Thought）机制的作用相同——都解决任务格式对齐而非跨语言知识迁移
3. **强基线模型的边际增益**：强基线模型无论语言家族如何，增益都边际（说明语言无关知识已充分）

## 实验设计

### 模型
- 7 种 LLM，参数规模 4B-671B
- 涵盖 Dense 和 Mixture-of-Experts (MoE) 架构

### 语言
- **训练**: 阿拉伯语
- **评估**: 闪米特语族（如希伯来语、阿拉姆语）和非闪米特控制语言

### 任务
- 零样本阅读理解

## 关键发现

### 弱基线模型
- 微调后所有语言上都有显著提升
- 跨语言迁移效果明显

### 强基线模型
- 微调后增益边际
- 无论语言家族，增益幅度相似

### Chain-of-Thought Ablation
- 同样的模型：从微调中受益最多的也从推理时 CoT 中受益最多
- 表明两种机制都解决的是 task-format alignment，而非 cross-lingual knowledge transfer

## 理论意义

| 发现 | 含义 |
|------|------|
| 无闪米特特异迁移 | 语言亲缘性对跨语言迁移影响被高估 |
| 任务格式对齐核心 | 跨语言迁移的核心是任务格式对齐，而非语言知识迁移 |
| 强模型边际增益 | 大型预训练模型已习得充分语言知识 |

## 关键词
#CrossLingualTransfer #LLM #SemiticLanguages #Arabic #ChainOfThought #FineTuning #ZeroShot
