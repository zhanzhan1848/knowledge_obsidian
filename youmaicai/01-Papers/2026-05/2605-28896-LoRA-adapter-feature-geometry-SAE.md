# Feature Geometry of LoRA Adapters: A Sparse Autoencoder Analysis

## 基本信息
| 标题 | Feature Geometry of LoRA Adapters: A Sparse Autoencoder Analysis of Representational Divergence in Fine-Tuned Language Models |
|------|-------------------------------------------------------------------------------------------------------------------------------|
| 作者 | Prasanth K K et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.28896) |
| arXiv | arXiv:2605.28896v1 |
| 领域 | cs.LG |

## 核心贡献

1. **Delta Activation Framework**：提出隔离适配器对残差流特定贡献的框架
2. **实验模型**：Gemma-2-9B，LoRA ranks 4, 8, 16, 32
3. **关键发现**：
   - LoRA-induced 特征字典与预训练 SAE 特征之间几何对齐较弱
   - 适配器专用 SAE 比预训练 SAE 更好地重建 delta activations
   - LoRA 更新在残差流内占据部分独特的表示结构
   - 特征密度随 rank 和深度增加，几何发散在不同 rank 间相对稳定

## 评估方法

- Cosine similarity between decoder directions
- Principal-angle analysis of feature subspaces
- Centered Kernel Alignment (CKA)

## 意义

对 LoRA 微调语言模型的机制可解释性、适配分析和安全审计有启示——LoRA 诱导的特征结构不能被预训练解释性字典完全捕获。

## 标签
#LoRA #fine-tuning #sparse-autoencoder #interpretability