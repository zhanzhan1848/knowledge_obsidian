# Forecasting Supply Chain Disruptions with Foresight Learning

## 元信息
| 标题 | Forecasting Supply Chain Disruptions with Foresight Learning |
|------|------|
| 作者 | Benjamin Turtel et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.01298) |
| arXiv | arXiv:2604.01298 [cs.LG] |
| 数据集 | [HuggingFace](https://huggingface.co/datasets/LightningRodLabs/supply-chain-predictions) |
| 发表 | 2026-04-01 |

## 核心贡献

1. **端到端LLM概率预测框架**：训练LLM直接输出校准的概率预测，无需显式prompting
2. **使用真实中断结果作为监督**：用实现的供应链中断结果作为训练信号
3. **在准确率、校准、精确率上超越GPT-5**：包括概率校准
4. **发现训练诱导更结构化的推理**：无需显式提示即可产生可靠的概率推理

## 核心发现

### 无需显式提示的内在推理能力
训练过程诱导LLM产生更结构化、更可靠的概率推理能力：
- 显式提示（chain-of-thought）可能限制内在推理
- 端到端训练可以让模型学习隐式的推理策略

### 性能对比
- 在准确率、校准（calibration）、精确率上超越GPT-5
- 在概率预测任务上显著优于强基线

## 方法特点

1. **端到端训练**：直接优化概率预测目标
2. **概率校准**：输出校准的概率分布
3. **决策就绪信号**：产生可直接用于决策的概率输出

## 数据集

- **Supply Chain Predictions Dataset**
- 来自 LightningRodLabs
- 开源可用

## 局限性

- 领域特定（供应链预测）
- 需要领域特定的训练数据

## 标签
#LLM #概率预测 #供应链 #领域适应 #校准 #微调 #决策AI #时间序列推理

## 相关概念
- Probability Calibration
- Forecasting
- Domain-Specific Fine-tuning
- Foresight Learning
