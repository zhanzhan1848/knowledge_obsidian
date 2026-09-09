# Beyond Right and Wrong: Evaluating Second-order Social Reasoning in Large Language Models

## 元信息
| 标题 | Beyond Right and Wrong: Evaluating Second-order Social Reasoning in Large Language Models |
| 作者 | Sunny Rai, Jinyi Kuang, Reyhan Jamalova, Annie Lou, Cristina Bicchieri, Niyati Malhotra, Victor Hugo Orozco-Olvera, Ana Maria Munoz-Boudet, Lyle H Ungar, Sharath C Guntuku |
| 链接 | [原文](https://arxiv.org/abs/2609.05437) |
| arXiv | arXiv:2609.05437 |
| 代码 | N/A |
| 发表 | 2026-09-09 (announce), originally Jul 2026 |

## 核心贡献
1. 提出 **metanorm reasoning** 框架，评估 LLM 对二阶社会规范（当规范被违反时，他人会如何反应）的推理能力
2. 发布 **NormReact** 数据集：450 个规范违反场景，标注了情绪反应和行为反应，涵盖违反者性别和观察者社会距离
3. 对比 6 个 LLM，发现它们普遍**高估负面制裁**（人类期望无行动时，模型预测惩罚）

## 核心创新点
本文首次系统评估 LLM 对元规范（metanorm）的推理能力，提出情绪评估和行为响应两个维度，发现当前模型在社会规范执行上呈现"更严厉的世界观"，且随社会距离增加与人类判断的一致性下降。

## 模型架构 / 方法
- **数据集构建**：NormReact，450 场景，手动标注
  - 维度1：情绪评估（emotional appraisal）
  - 维度2：行为响应（behavioral response）
  - 任务1：违规者自我调节预测（self-regulation）
  - 任务2：观察者他人调节预测（other-regulation）
- **评估模型**：6个主流LLM
- **核心发现**：
  - 模型预测的负面制裁 > 人类实际期望
  - 社会距离越大，对齐性越差
  - 在冲突调解、政策模拟等规范敏感领域，模型可能产生扭曲的社会规范图景

## 实验结果
- 6个模型均存在过度预测负面制裁的现象
- 随社会距离增加，人类判断对齐性 deterioration
- 过代表现：over-represents punishment，under-represents tolerance/restraint

## 局限性
- 探索性发现，需更大规模验证
- 仅覆盖特定规范类型

## 关键词
#LLM #社会推理 #AI对齐 #元规范 #NormReact #社会智能

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
