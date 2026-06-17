# InferBERT: Model Selection for Causal Inference in Pharmacovigilance

## 元信息
| 标题 | The Critical Role of Model Selection in Causal Inference: A Comparative Analysis of Classification Models within the InferBERT Framework for Pharmacovigilance |
|------|-----|
| 作者 | Csaba Kiss, Roland Molontay, Gabriele Pergola |
| 链接 | [原文](https://arxiv.org/abs/2606.17113) |
| arXiv | arXiv:2606.17113 |
| 领域 | cs.LG, cs.CL |

## 核心贡献
1. 评估 InferBERT 框架中分类模型选择的影响
2. 发现 **BioBERT** 在两个药物警戒基准上取得最高准确率
3. 证明**领域特定预训练**比单纯扩大模型规模更有效

## 核心问题
- 从虚假相关性中区分因果药物不良事件（ADE）是药物警戒的核心挑战
- InferBERT 成功与否取决于底层分类模型
- 评估问题：简单模型是否足够？领域预训练是否有帮助？扩展到 LLM 能否改善？后校准有何影响？

## 实验设置
### 基准
- AILF (Analgesics-induced Acute Liver Failure)
- TRAM (Tramadol-related Mortalities)

### 模型对比
| 模型 | 类型 |
|------|------|
| XGBoost | Baseline |
| ALBERT | 原始 InferBERT |
| BioBERT | 生物医学 transformer |
| Med-LLaMA | 医学 LLM |

### 评估指标
- 准确率
- 预期校准误差 (ECE)，校准前/后
- Jaccard 一致性（与 PRR, ROR, EBGM）
- 5-fold CV，重复 20 次

## 实验结果
### 准确率
- **BioBERT** 在两个数据集上取得最高准确率
- Med-LLaMA 表现不佳，尽管使用了参数高效微调

### 关键发现
- 领域特定预训练具有决定性作用
- 校准改善 ECE，但对准确率和因果发现的影響混合
- BioBERT 与传统药物警戒信号具有最强一致性

## 结论
- 投资于可管理的领域感知模型比单纯扩展模型规模更有效
- 领域特定预训练是关键优势
- 模型选择对因果发现任务有重要影响

## 关键词
`BERT` `InferBERT` `Pharmacovigilance` `Causal Inference` `BioBERT` `Domain-Specific Pretraining` `Transformer`