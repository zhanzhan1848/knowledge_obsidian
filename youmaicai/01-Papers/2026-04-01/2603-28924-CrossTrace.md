# CrossTrace: 跨领域科学推理追踪数据集

## 元信息
| 标题 | A Cross-Domain Dataset of Grounded Scientific Reasoning Traces for Hypothesis Generation |
|------|------|
| 作者 | Andrew Bouras |
| 链接 | [原文](https://arxiv.org/abs/2603.28924) |
| arXiv | arXiv:2603.28924 [cs.CL] |
| 代码 | [GitHub](https://github.com/andrewbouras/crosstrace) |
| 领域 | 科学假设生成 · 数据集 · LLM推理 |

## 核心贡献

### CrossTrace 数据集
- **1,389 条** grounded scientific reasoning traces
- 覆盖 **生物医学（518）**、**AI/ML（605）**、**跨领域（266）**
- 每条 trace 包含从已有知识 → 中间逻辑步骤 → 新假设的结构化推理链
- 每个步骤都锚定于源论文文本（step-level verification）

## Schema 设计
扩展 **Bit-Flip-Spark (HypoGen) Framework**：
- **Input**：领域知识/文献
- **Trace**：推理步骤链，每步有源文本 grounding
- **Output**：生成的科学假设

## 发现模式分类
8 类发现模式（discovery patterns）taxonomy

## QLoRA 微调实验
在 Qwen2.5-7B-Instruct 上用 QLoRA 微调 CrossTrace：

| 指标 | 微调前 | 微调后 |
|------|--------|--------|
| IAScore (GPT-4o judge) | 0.828 | **0.968** |
| IAScore (Claude Opus 4.5 judge) | 0.716 | **0.888** |
| Structural Compliance | 0% | **100%** |
| Spark Cosine Similarity | 0.221 | **0.620** |

## 关键发现
1. **跨领域训练优于单领域训练**：balanced 训练（biomedical + AI/ML + CS）超过单一领域训练，证明科学推理模式具有部分领域通用性
2. **Step-level grounding 有效**：人类验证 150 条分层记录，step-level grounding accuracy 达 99.7%，fabrication rate 为 0.0%
3. **训练信号有效**：grounded reasoning traces 是有效的训练信号

## 意义
- 首个**大规模跨领域** grounded scientific reasoning traces 数据集
- 证明了跨领域科学推理可迁移，为科学假设生成的 LLM 训练提供新范式

## 标签
#科学假设生成 #数据集 #跨领域推理 #QLoRA微调 #科学发现
