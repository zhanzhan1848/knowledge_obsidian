# Applied Explainability for Large Language Models: A Comparative Study

## 元信息
| 标题 | Applied Explainability for Large Language Models: A Comparative Study |
|------|---------|
| 作者 | Venkata Abhinandan Kancharla |
| 链接 | [原文](https://arxiv.org/abs/2604.15371) |
| arXiv | arXiv:2604.15371v1 |
| 领域 | cs.CL, cs.AI, cs.LG |
| 发表 | 2026-04-15 |
| 同行评审 | 未经peer review |

## 核心贡献

对三种可解释性方法在 fine-tuned DistilBERT（SST-2 情感分类）上进行**实践行为评估**：

### 三种方法对比

| 方法 | 类别 | 优势 | 劣势 |
|------|------|------|------|
| Integrated Gradients | Gradient-based | 更稳定、更直观 | 计算成本较高 |
| Attention Rollout | Attention-based | 计算高效 | 与预测相关特征对齐较差 |
| SHAP | Model-agnostic | 灵活性高 | 计算成本高、变异性大 |

## 核心发现

1. **梯度归因（Gradient-based attribution）**：提供更稳定和直观的解释
2. **基于注意力的方法**：计算高效，但与预测相关特征对齐较差
3. **模型无关方法**：提供灵活性，但引入更高计算成本和变异性
4. **核心观点**：可解释性方法应作为**诊断工具**，而非确定性解释

## 实验设置

- 模型：DistilBERT（SST-2 情感分类微调）
- 方法：Integrated Gradients, Attention Rollout, SHAP
- 目标：评估实用行为的一致可复现设置

## 标签
#explainability #transformer #NLP #DistilBERT #SST-2 #interpretability #attention #integrated-gradients #SHAP
