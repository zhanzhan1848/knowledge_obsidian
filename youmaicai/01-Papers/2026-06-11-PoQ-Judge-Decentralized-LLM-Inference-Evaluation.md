# PoQ-Judge: Decentralized LLM Inference Evaluation Framework

## 元信息
| 标题 | PoQ-Judge: A Multi-Architecture Evaluation Framework for Cost-Aware Proof-of-Quality in Decentralized LLM Inference |
|------|-----|
| 作者 | Arther Tian, Alex Ding, Frank Chen, Simon Wu, Aaron Chan |
| 链接 | [原文](https://arxiv.org/abs/2606.11196) |
| arXiv | arXiv:2606.11196 |
| 领域 | LLM 评估 · 去中心化推理 |

## 核心贡献

1. **PoQ-Judge 框架**：为去中心化 LLM 推理网络提供轻量级、无参考的质量评估，用于 Proof of Quality (PoQ)
2. **三种Judge架构对比**：TextCNN、MiniLM cross-encoder、DeBERTa —跨越质量-成本权衡
3. **两阶段训练**：在 UltraFeedback + GPT 标注的领域内数据上训练
4. **级联评估**：成本降低 72.7%，质量损失极小

## 核心方法

### 训练策略
- **两阶段训练**：第一阶段在 UltraFeedback 上训练，第二阶段在 GPT 标注的领域内数据上微调
- **三种架构**：
  - TextCNN judge（轻量）
  - MiniLM cross-encoder（中量）
  - DeBERTa judge（重型）

### 关键结果
- 最佳模型在 held-out 测试集上达到 **0.747 Pearson correlation**（与 ground-truth proxy相比）
- 作为无参考组件在复合评分中达到 **0.645 Pearson correlation**
- 级联评估降低成本 **72.7%**，质量仅轻微下降
- QA 任务效果显著优于 summarization（proxy quality 是主要限制因素）

## 实验发现
- 在线校准表明 **语义质量（semantic quality）是主导维度**
- QA 任务表现强，summarization 任务较弱
- 无参考评估匹配最佳单参考评估器性能

## 局限性
- Proxy quality 是主要剩余限制因素
- 在 summarization 任务上效果不如 QA

## 建议
- **是否推荐使用**：是
- **适用场景**：去中心化 LLM 推理网络的质量评估、资源受限环境下的模型选择

## 相关概念
- [[Decentralized LLM Inference]]
- [[LLM Evaluation]]
- [[Proof of Quality]]