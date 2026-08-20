# SuTRA: Structurally-Unified Tokenization with Root Awareness

## 元信息
| 标题 | SuTRA: Structurally-Unified Tokenization with Root Awareness |
|---|---|
| 作者 | Vaibhav Rathore, Siddhant Gole, Dadhichi Telwadkar, Rooshil Bhatia, Maulik Ruparel, Siddharth Surekha, Neha Bhargava |
| 链接 | [原文](https://arxiv.org/abs/2608.18087) |
| arXiv | arXiv:2608.18087 |
| 会议 | Interspeech 2026 |

## 核心贡献
1. 提出 **SuTRA**，首个针对**形态丰富语言**（印地语、马拉地语、古吉拉特语）的形态学感知分词算法
2. 揭示并命名 **Morphological Shattering** 现象：频率-based 方法过度分割词，任意切分词根与词缀
3. 在形态对齐（Boundary F1）上提升 **+14.7%**，语义可恢复性提升 **+34%**，机器翻译 chrF2 平均提升 **+8.08**

## 核心问题：Morphological Shattering
现有子词分词器（如 BPE）优化统计压缩，但忽视形态结构——尤其词根与词缀关系。在形态丰富语言中，基本单元是复合书写音节（aksharas）而非字母，导致：
- 过度碎片化
- 词根和词缀被任意切分
- 破坏语义完整性

## 方法
SuTRA 核心机制：
- **保留 akshara 不可分性**：akshara 作为最小分割单元
- **惩罚跨形态边界的合并**：在分词过程中引入形态学约束

## 实验结果
| 指标 | 提升幅度 |
|------|---------|
| Boundary F1（形态对齐） | +14.7% |
| 语义可恢复性（ Hindi） | +34% |
| chrF2（机器翻译） | +8.08 平均 |

## 资源发布
- 新的形态分割数据集：Hindi, Marathi, Gujarati

---
*关键词：分词，形态学，BPE，NLP，Indic 语言，Transformer，Tokenization*
*领域：cs.CL, cs.AI*
