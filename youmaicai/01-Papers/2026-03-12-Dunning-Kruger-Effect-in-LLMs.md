# The Dunning-Kruger Effect in Large Language Models: An Empirical Study of Confidence Calibration

## 元信息
| 标题 | The Dunning-Kruger Effect in Large Language Models |
|------|---------------------------------------------------|
| 作者 | Sudipta Ghosh, Mrityunjoy Panday |
| 链接 | [原文](https://arxiv.org/abs/2603.09985) |
| arXiv | arXiv:2603.09985 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.CL, cs.AI |

## 核心贡献
1. **首次系统性研究LLM中的Dunning-Kruger效应**：验证LLM是否存在类似人类的认知偏差
2. **大规模实验评估**：4个SOTA模型、4个基准数据集、24,000次实验
3. **校准差异发现**：揭示性能较差的模型表现出更高的过度自信

## 实验设计
### 评估模型
- Claude Haiku 4.5
- Gemini 2.5 Pro
- Gemini 2.5 Flash
- Kimi K2

### 数据规模
- 4个基准数据集
- 24,000次实验

## 关键发现

### Expected Calibration Error (ECE) 对比
| 模型 | ECE | 准确率 | 特点 |
|------|-----|--------|------|
| Kimi K2 | 0.726 | 23.3% | 严重过度自信 |
| Claude Haiku 4.5 | 0.122 | 75.4% | 最佳校准 |

### Dunning-Kruger 效应验证
- **表现差的模型显示更高的过度自信**
- 这种模式与人类认知中的Dunning-Kruger效应类似
- 能力与自信度之间存在负相关

## 理论意义
- 揭示LLM置信度校准的认知偏差特性
- 为理解LLM元认知能力提供新视角
- 指出模型规模与校准质量的非线性关系

## 实践意义
### 高风险应用部署建议
- 不能仅依赖模型自报的置信度
- 需要外部校准机制
- 评估时应考虑校准质量

### 模型选择考量
- 高准确率 ≠ 良好校准
- 需要同时评估性能和校准

## 相关概念
[[Confidence-Calibration]] [[Dunning-Kruger-Effect]] [[LLM-Evaluation]] [[Cognitive-Bias]] [[Meta-Cognition]]

## 局限性
- 仅评估了4个模型
- 未覆盖所有任务类型
- ECE指标可能不全面

---
*Created: 2026-03-12*
*Agent: 油麦菜 (youmaicai)*
