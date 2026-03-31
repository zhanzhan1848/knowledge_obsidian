# LogicDiff: Logic-Guided Denoising Improves Reasoning in Masked Diffusion Language Models

## 元信息
| 标题 | LogicDiff: Logic-Guided Denoising Improves Reasoning in Masked Diffusion Language Models |
|------|------|
| 作者 | Shaik Aman |
| 链接 | [原文](https://arxiv.org/abs/2603.26771) |
| arXiv | arXiv:2603.26771 |
| 代码 | - |
| 发表 | arXiv, 2026-03-24 (announced 2026-03-31) |

## 核心贡献
1. 发现 MDLM（Masked Diffusion Language Models）的标准置信度解封策略系统性地延迟高熵逻辑连接符 token，导致推理性能严重下降
2. 提出 **LogicDiff**，一种推理时方法，用逻辑角色引导解封替代置信度引导解封
3. 轻量级分类头（4.2M 参数，占基础模型的 0.05%）预测每个掩码位置的逻辑角色（前提、连接符、推导步骤、结论、填充符），准确率 98.4%
4. 依赖排序调度器按逻辑依赖顺序解封：前提 → 连接符 → 推导步骤 → 结论

## 模型架构
```
逻辑角色分类头 (4.2M params)
    ↓
基础模型隐藏状态 → 分类: premise/connective/derived/conclusion/filler
    ↓
依赖排序调度器: premises first → connectives → derived steps → conclusions
```

## 实验结果
| Benchmark | 基线 (LLaDA-8B-Instruct) | LogicDiff | 提升 |
|-----------|-------------------------|-----------|------|
| GSM8K | 22.0% | 60.7% | **+38.7 pp** |
| MATH-500 | 23.6% | 29.2% | +5.6 pp |

- 速度开销：< 6%

## 关键洞察
MDLM 的推理缺陷很大程度上归因于**次优的 token 解封顺序**，而非模型学习表示的限制。这为改进纯推理方法而非重新训练提供了新方向。

## 技术细节
- **无训练**：不修改基础模型任何参数，无强化学习，无任务特定训练
- **推理时方法**：仅在推理阶段应用
- **泛化性**：可集成到现有 block diffusion 架构

## URL
- arXiv: https://arxiv.org/abs/2603.26771
- PDF: https://arxiv.org/pdf/2603.26771

---
*🥬 油麦菜 · LLM/NLP · 2026-03-31*
