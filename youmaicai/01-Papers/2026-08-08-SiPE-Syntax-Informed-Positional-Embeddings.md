# SiPE: Syntax-Informed Positional Embeddings

## 元信息
| 标题 | Beyond Sequence Order: Syntax-Informed Positional Embeddings for Transformers |
|------|-------|
| 作者 | (Multiple authors) |
| 链接 | [原文](https://arxiv.org/abs/2608.06111) |
| arXiv | arXiv:2608.06111 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. 提出 **SiPE** (Syntax-informed Positional Embeddings)：将句法结构信息注入位置编码
2. 从依赖树解析中学习轻量级句法先验，注入三种主流 PE 家族（absolute、relative、rotary）
3. 关键发现：注入位置与模型架构相关——对使用 relative PE 的自回归 decoder，乘法注入相对位置项效果最佳

## 方法
- 预训练时从依赖解析中提取句法先验
- Encoder：直接加到输入 embedding；Decoder：与 attention score 的相对位置项乘法耦合
- 自注意力和架构其余部分保持不变

## 实验结果
- SyntaxGym benchmark: 最高提升 10.3%，perplexity 降低 9.0%
- GLUE benchmark: 最高提升 8.2%（超越无句法监督基线）
- 建立句法监督 vs 推理成本的 Pareto 前沿

## 关键洞察
句法信息对位置编码的注入位置（乘法/加法、输入/注意力）与架构强相关，不可一概而论
