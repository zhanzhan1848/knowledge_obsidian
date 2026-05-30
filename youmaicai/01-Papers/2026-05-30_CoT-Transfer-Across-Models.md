# Reasoning that Travels: Dissecting Chain-of-Thought Transfer Across Models

## 元信息
| 标题 | Reasoning that Travels: Dissecting How Chain-of-Thought Transfers Across Models |
|------|------|
| 作者 | Beiduo Chen |
| 链接 | [原文](https://arxiv.org/abs/2605.28913) |
| arXiv | arXiv:2605.28913 |
| 发表 | 2026-05-27 (v1) |
| 领域 | cs.CL |

## 核心贡献

1. **Provider-Receiver Framework**: 控制变量研究 CoT 如何帮助接收模型
2. **Force-answer vs Free-generation**: 比较直接回答与继续推理模式

## 实验设置

### Force-answer Mode
接收模型直接从 CoT 前缀回答

### Free-generation Mode
接收模型可继续推理再回答

## 关键发现

### CoT 转移的三种机制

| 机制 | 任务表现 |
|------|----------|
| Answer Extraction | AIME: 主要由显式答案可用性驱动 |
| Reasoning Scaffolding | MMLU-Pro: 接收方能力也发挥作用 |
| Receiver-dependent | ZebraLogic: 部分结构化答案信息 |

### Free-generation Mode
- 部分 CoT 提升所有基准性能
- 前缀可引导继续推理

### Early Stopping
- 接收方答案一致性可作为停止信号
- 无需 gold 标准

## 结论

跨模型 CoT 转移不是单一现象：
- 可以是答案提取
- 可以是推理脚手架
- 可以是接收方依赖的能力

## 关键词
#Chain-of-Thought #Transfer-Learning #Reasoning #Cross-Model