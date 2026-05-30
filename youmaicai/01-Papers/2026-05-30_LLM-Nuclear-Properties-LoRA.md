# LLM for Unified and Accurate Description of Multidimensional Nuclear Properties

## 元信息
| 标题 | Large language model for unified and accurate description of multidimensional nuclear properties |
|------|------|
| 作者 | Enhong Wang |
| 链接 | [原文](https://arxiv.org/abs/2605.29408) |
| arXiv | arXiv:2605.29408 |
| 发表 | 2026-05-28 (v1) |
| 领域 | nucl-th |

## 核心贡献

1. **Prior-informed LLM Multi-task Learning Framework**: 提出先验信息注入的 LLM 多任务学习框架
2. **LoRA Fine-tuning**: 使用 Low-Rank Adaptation 微调预训练的 DeepSeek-R1-1.5B 模型
3. **Causal Language Modeling**: 在因果语言建模范式下，训练模型预测实验值与理论值的偏差

## 模型架构

### 核心设计
- **Base Model**: DeepSeek-R1-1.5B (预训练大语言模型)
- **Adapter**: LoRA (轻量级适配器)
- **Task**: 多任务回归预测核物理可观测量

### 训练目标
```math
\text{Training Loss} = \text{Deviation}(y_{exp}, y_{theory})
```
通过自回归方式训练，预测偏差值而非原始值

## 实验结果

### 预测的物理量 (7个可观测量)
- 电荷半径 (Charge Radii)
- 质量数 (Masses)
- 结合能 (Binding Energies)
- 分离能 (Separation Energies)
- 衰变能 (Decay Energies)

### 性能
- 所有任务的训练损失降低超过 **98%**
- 统一的框架处理多个核物理任务

## 技术亮点

1. **结构化先验嵌入**: Structured Prior Embedding
2. **参数高效微调**: LoRA 保持预训练参数，只训练轻量适配器
3. **多任务回归**: Multi-task Regression in Physics

## 局限性

- 仅在核物理领域验证
- 依赖 DeepSeek-R1-1.5B 基座模型
- 需要高质量的实验/理论偏差数据

## 关键词
#LLM #Fine-tuning #LoRA #Multi-task #Nuclear-Physics #Domain-Adaptation

## 相关工作
- 相关: Domain-specific LLM, LoRA, Multi-task Learning, Scientific AI