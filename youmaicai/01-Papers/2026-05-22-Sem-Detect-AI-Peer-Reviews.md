# Sem-Detect: Semantic Level Detection of AI Generated Peer-Reviews

## 元信息
| 标题 | Sem-Detect: Semantic Level Detection of AI Generated Peer-Reviews |
|------|------|
| 作者 | André V. Duarte, Brian Tufts, Aditya Oke, Fei Fang, Arlindo L. Oliveira, Lei Li |
| 链接 | [原文](https://arxiv.org/abs/2605.21713) |
| arXiv | arXiv:2605.21713 |

## 核心贡献
1. **语义级分析**: 论文认为归属不应仅从文本特征判断，还应考虑观点、判断和主张
2. **Sem-Detect 方法**: 结合文本特征与主张级语义分析的操作化方法
3. **对比 AI 生成评论**: 针对同一论文对比目标评论与多个 AI 生成评论，利用不同 AI 模型趋于收敛而人类评审更独特多样的观察
4. **三分类场景**: 可区分完全 AI 生成、LLM 精炼人类评论、纯人类评论

## 实验结果
- **20,000+ 同行评审**: 来自 ICLR 和 NeurIPS 会议
- **TPR@0.1% FPR**: 优于最强基线 25.5%
- **三分类**: 少于 3.5% 的 LLM 精炼人类评论被误分类为 AI 生成

## 局限性
- 需要同一论文的多个 AI 生成评论作为参考
- 对跨领域泛化能力有待验证

## 关键词
#AIDetection #PeerReview #LLM #ScientificWriting #AuthorshipAttribution