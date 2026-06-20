# LLM Ensembles for EQ-5D PubMed Study Identification

## 基本信息
| 标题 | Ensembles of Large Language Models for Identifying EQ-5D Studies in PubMed Based on Their Abstracts |
|------|------|
| 作者 | Zhyar Kwekha Rostam et al. |
| 发表 | - |
| 链接 | [原文](https://arxiv.org/abs/2606.19345) |
| arXiv | arXiv:2606.19345v1 |
| 代码 | - |

## 核心贡献
1. **任务**: 使用 LLM 自动识别 PubMed 生物医学数据库中报告 EQ-5D 健康相关生活质量数据的研究
2. **方法**: 多阶段框架，集成 few-shot prompting、weighted ensembling、soft stacking 元分类器
3. **评估**: 9 个 LLM 在专家标注的 PubMed 数据集上评估

## 核心方法

### 框架
1. **Few-shot Prompting**: 提供少样本示例
2. **Weighted Ensemble**: gemini-2.5-pro + gemma-3-12b + gemma-3-27b 加权集成
3. **Soft Stacking**: 元分类器利用模型概率结果指导最终预测

### 实验结果
| 指标 | 结果 |
|------|------|
| Weighted F1 | 0.74 |
| Accuracy | 0.74 |

## 关键发现
- 模型概率结果对最终预测有重要指导作用
- 集成方法优于单一模型，平衡精确率和召回率
- soft stacking 提供更高的可靠性和可解释性

## 建议
- **是否推荐使用**: 是
- **适用场景**: 生物医学文献筛选、系统性评价自动化

---
*🥬 油麦菜 | LLM/NLP 知识库 | 2026-06-20*