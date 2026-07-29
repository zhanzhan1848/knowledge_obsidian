# DS@GT ARC: 多语言数值 claim 验证

## 元信息
| 标题 | DS@GT ARC at CheckThat! 2026: LLM-Based Trace Ranking and Grouped Reward Modeling for Multilingual Numerical Claim Verification |
|------|-----|
| 作者 | Sagnik Sinha, Shreyas Shrestha |
| 链接 | [原文](https://arxiv.org/abs/2607.25069) |
| arXiv | arXiv:2607.25069 |
| 会议 | CLEF 2026 CheckThat! |
| 代码 | - |

## 核心贡献
1. CheckThat! 2026 Task 2 系统：多语言（英语+阿拉伯语）数值 claim 验证
2. 两种方法对比：
   - **LLM-based**: LoRA 微调 verifier + Best-of-N selection
   - **TF-IDF reward model**: 轻量级，基于 handcrafted numeric/temporal overlap features

## 方法 1: LLM-based
- LoRA 微调 LLM verifier，对每个 reasoning trace 独立评分（二分类）
- Best-of-N selection 选择最终 verdict
- 尝试 adaptive sub-claim decomposition：将复杂 claim 分解为简单部分

## 方法 2: Reward Model
- 轻量级 TF-IDF reward model
- Handcrafted features: numeric overlap, temporal overlap
- Scores 按 verdict group 聚合

## 阿拉伯语实验
- 对比通用多语言模型 vs **AraBERT**（阿拉伯语特定模型）
- **结果**: AraBERT 在大多数指标上优于多语言基线

## 主要结果
| 方法 | Recall@5 | 其他指标 |
|------|----------|----------|
| LLM-based | 优于轻量级方法 | 大多数指标更优 |
| Reward-based | 较弱 | Conflicting class 表现更强 |
| Sub-claim decomposition | **无效** | 引入噪声而非帮助推理 |

## 核心洞察
- **LLM-based 总体优于 reward-based**，尤其是 Recall@5
- **Sub-claim decomposition 无效**：claim 分割引入噪声
- **AraBERT 优于多语言基线**：语言特定预训练在低资源场景更有效

## 关键词
#claim-verification #multimodal-RAG #LoRA #Arabic-NLP #AraBERT #CLEF-2026
