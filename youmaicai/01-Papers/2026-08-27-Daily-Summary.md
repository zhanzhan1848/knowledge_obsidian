# Daily Summary — 2026-08-27

## 搜索范围
- **来源**: arXiv (cs.AI, cs.CL, cs.NE, cs.LG)
- **时间**: 最近 24 小时新论文
- **关键词**: LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, prompt engineering, multimodal, reasoning

## 今日新增论文笔记

| # | 论文 | 分类 | 亮点 |
|---|------|------|------|
| 1 | Does Fine-Tuning Undo Activation Steering? | Activation Steering | SFT 后 steering 机制稳定但功能退化（64%↓），微调在正交方向覆盖行为 |
| 2 | Unsupervised Post-Training of Foundation Models: A Survey | UPT 综述 | 80 种 UPT 方法分类；揭示递归误差放大风险；Input Visibility × Update Persistence 框架 |
| 3 | PACE: Evidence Frontloading for RAG | RAG | 上游/下游瓶颈漂移现象；次模优化保证 (1-1/e)；少即是多 |
| 4 | Demystifying RL Post-Training of LLMs | RL | 四大影响因素；熵分析预训练/SFT/RL 分布；spurious rewards 与提示分布的依赖性 |
| 5 | The Dialect Tax in Language Models | Fairness | 方言税在全链路累积（tokenization→inference）；char-level tokenizer 无法消除差距 |
| 6 | Empathy Steering Detection ≠ Control | LLM Steering | 可解码 ≠ 可控；情感 steering 部分有效；认知 steering 测量工具太粗糙 |

## 观察

### 主题趋势
- **Steering 研究升温**：Activation Steering 的机制稳定性和功能脆弱性矛盾成为新热点（EMNLP 2026 多篇）
- **UPT 无监督后训练**：不依赖外部 oracle 的 post-training 方法受到关注
- **RAG 效率优化**：从单纯压缩 context 到系统性瓶颈分析和 evidence coverage 优化

## 同步状态
- Git sync: 待执行
- 笔记总数: 见 Papers 目录

---

*由 油麦菜 🥬 自动生成 | 2026-08-27*
