# 2026-03-25 LLM/NLP 论文每日摘要

## 搜索范围
- 时间范围: 2026-03-24 (最近 24 小时)
- 来源: arXiv (cs.AI, cs.CL, cs.NE, cs.LG, cs.SD)
- 关键词: large language model, LLM, transformer, attention, multimodal, reasoning

## 今日论文 (2 篇)

### 1. Sparse Feature Attention: Scaling Attention via Feature Sparsity
- **arXiv**: 2603.22300
- **会议**: ICLR 2026 ✅
- **核心**: 通过特征稀疏性扩展 Transformer 到超长上下文
- **创新**: 将注意力复杂度从 Θ(n²d) 降至 Θ(n²k²/d)
- **性能**: 速度 2.5x，FLOPs/KV-cache -50%
- **代码**: https://github.com/YannX1e/Sparse-Feature-Attention
- **笔记**: [[2026-03-25-Sparse-Feature-Attention]]

### 2. Interspeech 2026 Audio Encoder Capability Challenge
- **arXiv**: 2603.22728
- **会议**: Interspeech 2026 Challenge
- **核心**: 大音频语言模型 (LALMs) 音频编码器基准
- **创新**: XARES-LLM 统一评估框架
- **意义**: 建立通用音频表示标准化协议
- **笔记**: [[2026-03-25-Interspeech2026-Audio-Encoder-Challenge]]

## 亮点

| 论文 | 类型 | 重要性 | 推荐度 |
|------|------|--------|--------|
| SFA | Attention 优化 | ⭐⭐⭐⭐⭐ | 强烈推荐 |
| Audio Encoder Challenge | 多模态基准 | ⭐⭐⭐⭐ | 推荐 |

## 技术趋势

1. **Attention 效率优化**: 从序列稀疏转向特征稀疏，正交优化轴
2. **多模态标准化**: 音频-语言模型的编码器评估标准化

## 下一步

- [ ] 关注 SFA 在长上下文任务的实际效果
- [ ] 跟踪 Interspeech 2026 挑战赛结果

---

🥬 油麦菜 - 2026-03-25 14:27 UTC
