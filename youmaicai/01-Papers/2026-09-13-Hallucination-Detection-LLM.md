# Domain-Specific Hallucination Detection in Large Language Models

## 元信息
| 标题 | Domain-Specific Hallucination Detection in Large Language Models |
| 作者 | Debasmita Biswas, Varun Teja Chundru |
| 链接 | [原文](https://arxiv.org/abs/2609.11878) |
| arXiv | arXiv:2609.11878 |
| 代码 | [GitHub](https://github.com/varunteja99/hallucination-detection-nlp) |

## 核心贡献
1. **多信号检测 Pipeline**: 结合 fine-tuned DeBERTa-v3 分类、MC Dropout 不确定性量化、温度缩放校准
2. **优异检测性能**: HaluEval 基准上 F1=0.915, AUROC=0.977；各子任务 QA=0.97, Summarization=0.96, Dialogue=0.82
3. **DPO 减少幻觉**: 对 Qwen2.5-0.5B 应用 DPO，幻觉率从 85.5% 降至 37.7%（相对减少 55.9%）
4. **领域适应发现**: 领域匹配预训练（PubMedBERT）是最强适应策略

## 模型架构
- **检测器**: Fine-tuned DeBERTa-v3 分类器
- **不确定性**: Monte Carlo Dropout
- **校准**: Temperature-scaled calibration
- **Generator**: Qwen2.5-0.5B
- **领域模型**: PubMedBERT（生物医学领域）

## 实验结果

### HaluEval 基准
| 任务 | F1 | AUROC |
|------|-----|-------|
| General Domain | 0.915 | 0.977 |
| QA | 0.97 | - |
| Summarization | 0.96 | - |
| Dialogue | 0.82 | - |

### DPO 减少幻觉
- 原始 Qwen2.5-0.5B 幻觉率: 85.5%
- DPO 后: 37.7%
- 相对减少: 55.9%

### 跨领域评估
- SciFact 生物医学基准: F1=0.52（通用训练迁移差）
- PubMedBERT + SciFact fine-tune: F1=0.63, AUROC=0.81

### 上下文消融
- 移除知识上下文后 Summarization F1 下降 24%
- 证明模型执行真正的蕴含推理，而非利用表面模式

### 学习曲线
- 25% 训练数据捕获 77% 完整数据性能

## 关键发现
1. 多信号组合（分类 + 不确定性 + 校准）效果最佳
2. MC Dropout 推理进一步提升准确率至 93.2%
3. 领域匹配预训练是最强适应策略
4. 通用域训练跨领域迁移差

## 建议
- 是否推荐使用：是（实用性强）
- 适用场景：LLM 幻觉检测、领域适应、模型可靠性
- 关键词：Hallucination Detection, DeBERTa, MC Dropout, DPO, Domain Adaptation
