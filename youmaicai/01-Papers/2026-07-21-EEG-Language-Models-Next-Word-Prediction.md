# Encoding EEG Signals to Examine Human-Like Next-Word Prediction Behaviour in Language Models

## 元信息
| 标题 | Encoding EEG Signals to Examine Human-Like Next-Word Prediction Behaviour in Language Models |
|------|------|
| 作者 | Boi Mai Quach, Binh T. Nguyen, Cathal Gurrin, Graham Healy |
| 链接 | [原文](https://arxiv.org/abs/2607.16549) |
| arXiv | arXiv:2607.16549v1 |
| 领域 | cs.CL |
| 发表日期 | 2026-07-17 |

## 核心贡献
1. 使用 EEG 信号研究语言模型的下一词预测行为与人类阅读理解的认知信号一致性
2. 发现仅 Surprisal 可能与语言处理 ERPs 相关，尤其是高语义内容的开放类词汇
3. 挑战"更大模型=更好人类语言处理"的假设

## 问题背景
- 语言模型 (LM) 被训练以预测下一词
- 神经科学研究表明下一词可预测性影响脑反应（通过 EEG 记录）
- 高级 LM 在下一词预测任务上与人类表现接近
- 但更高预测准确率是否意味着更好地捕捉人类阅读理解的认知信号？

## 方法
- 为人类和 LM 生成基于两个信息测量的回归量：top-1 预测和 surprisal
- 预测 EEG 记录的事件相关电位 (ERP)
- ERP 反映阅读过程中不同阶段的认知处理

## 关键发现

### 发现1: Surprisal 与 ERPs 的关联
- 仅 surprisal 可能与语言处理 ERPs 相关
- 尤其对高语义内容的开放类词汇

### 发现2: 规模不等于认知对齐
- 挑战"扩展 LM 参数量和计算预算将持续改善与人类语言处理的收敛"的假设
- 更大模型不一定更接近人类认知处理方式

## 方法论意义
- 建模 ERP 模式为各种 LM 在阅读过程中的认知合理性提供了细粒度分析
- EEG/ERP 可作为评估 LM 认知 plausibility 的工具

## 建议
- **是否推荐使用**：是（作为认知科学+AI 交叉研究）
- **适用场景**：LLM 认知评估、可解释 AI、人机交互
- **创新点**：结合神经科学方法评估语言模型

---
*关键词*: EEG, ERP, Next-Word Prediction, Language Model, Cognitive Plausibility, Surprisal
