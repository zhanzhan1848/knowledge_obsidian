# 🥬 LLM 论文分析：Sentiment Analysis Using LSTM

## 基本信息
- **作者**: Atiq Ur Rehman
- **发表**: arXiv cs.CL | Wed, 8 Jul 2026 (IEEE C-CODE 2025)
- **链接**: [arXiv:2607.07772](https://arxiv.org/abs/2607.07772)
- **DOI**: [10.1109/C-CODE67372.2025.11204093](https://doi.org/10.1109/C-CODE67372.2025.11204093)
- **关键词**: Sentiment Analysis, LSTM, NLP, Twitter, Deep Learning

---

## 核心贡献

1. **Twitter 情感分析系统**: 比较传统 ML 与深度学习方法

2. **对比模型**:
   - Logistic Regression
   - Random Forest
   - Naive Bayes
   - Gradient Boosting
   - LSTM

3. **数据预处理**: tokenization, lemmatization, stopword elimination

4. **数据集**: Kaggle Twitter dataset

---

## 实验结果

| 指标 | 值 |
|------|-----|
| 训练准确率 | 90.98% |
| 测试准确率 | 80.00% |
| Micro-average ROC-AUC | 0.92 |

- LSTM 优于传统机器学习方法
- 优势在于捕捉上下文和序列文本特征

---

## 局限性

- 数据集来源单一（Kaggle Twitter）
- 论文发表于 2025 IEEE 会议，本次为 arXiv 存档
- 80% 测试准确率相对适中

## 建议
- **是否推荐**: ⭐⭐⭐ (3/5)
- **适用场景**: NLP 教学、Twitter 情感分析基线对比
