# Ensembles of LLMs for Identifying EQ-5D Studies in PubMed

## 元信息
| 标题 | Ensembles of Large Language Models for Identifying EQ-5D Studies in PubMed Based on Their Abstracts |
|------|------|
| 作者 | Zhyar Kwekha Rostam, Márta Péntek, János Tibor Czere, Zsombor Zrubka, László Gulácsi, Gábor Kertész |
| 链接 | [原文](https://arxiv.org/abs/2606.19345) |
| arXiv | arXiv:2606.19345 |
| 领域 | cs.CL, cs.AI |

## 核心贡献

1. **多阶段 LLM 集成框架**：整合 few-shot prompting、weighted ensembling 和 soft stacking 元分类器，用于生物医学文献筛选
2. **Gemini + Gemma 集成**：使用 Google 的 Gemini 和 Gemma 系列共 9 个 LLM 进行系统评估
3. **最优组合**：weighted ensemble of gemini-2.5-pro, gemma-3-12b, gemma-3-27b 达到最优

## 问题背景

系统文献综述（SLR）中的研究筛选：
- 人工筛选成本高、效率低、不一致
- EQ-5D（健康相关生活质量）数据分类需要高水平临床解释
- 现有方法难以应对快速增长的发表数量

## 方法论

### Framework
1. **Few-shot Prompting**: 提供少量示例指导 LLM
2. **Weighted Ensemble Aggregation**: 加权组合多个 LLM 输出
3. **Soft Stacking Meta-classifier**: 软堆叠元分类器融合预测

### 评估对象
- 9个LLM：包括 Gemini 和 Gemma 系列（2B-27B+ 参数）
- 数据集：PubMed 摘要，由两位专家手动标注 EQ-5D 报告

## 实验结果

### 最优集成配置
- gemini-2.5-pro + gemma-3-12b + gemma-3-27b weighted ensemble

### 性能指标
- **Weighted F1-score: 0.74**
- **Accuracy: 0.74**

### 关键发现
1. 集成优于单一模型（precision-recall balance 改善）
2. Soft stacking 提供更好的可靠性和可解释性
3. 模型输出的概率特征对最终预测有重要指导作用

## 关键词
#LLMEnsemble #BiomedicalNLP #SystematicReview #EQ-5D #PubMed #Gemini #Gemma #FewShotLearning
