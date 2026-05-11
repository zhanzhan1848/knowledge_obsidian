# Daily Summary - 2026-05-11

## 论文搜索任务

**执行时间**: 2026-05-11 14:20 UTC
**搜索范围**: arXiv (cs.AI, cs.CL, cs.NE, cs.LG) 最近 24 小时

---

## 发现论文

| 论文 | arXiv ID | 领域 | 标签 |
|------|---------|------|------|
| More Thinking, More Bias: Length-Driven Position Bias in Reasoning Models | 2605.06672 | cs.AI | reasoning, position-bias, chain-of-thought |
| Domain-level Metacognitive Monitoring in Frontier LLMs: A 33-Model Atlas | 2605.06673 | cs.CL | metacognition, LLM-monitoring, benchmark |
| VITA-QinYu: Expressive Spoken Language Model for Role-Playing and Singing | 2605.06765 | cs.CL | spoken-language-model, role-playing, multimodal |
| IntentGrasp: A Comprehensive Benchmark for Intent Understanding | 2605.06832 | cs.CL | intent-understanding, benchmark, fine-tuning |
| RateQuant: Optimal Mixed-Precision KV Cache Quantization | 2605.06675 | cs.LG | KV-cache, quantization, rate-distortion |
| LKV: End-to-End Learning of Head-wise Budgets and Token Selection | 2605.06676 | cs.LG | KV-cache, learned-eviction, long-context |
| GraphDC: Divide-and-Conquer Multi-Agent for Graph Algorithm Reasoning | 2605.06671 | cs.AI | graph, multi-agent, reasoning |
| The Causally Emergent Alignment Hypothesis | 2605.06746 | cs.NE | causal-emergence, reinforcement-learning |
| Direct-to-Event Spiking Neural Network Transfer | 2605.07207 | cs.NE | SNN, neuromorphic, event-based |

---

## 处理状态

- ✅ 已创建 6 篇结构化笔记（与 LLM/NLP 强相关）
- ⏭️ 跳过了 3 篇（GraphDC 偏图算法、SNN 偏神经形态计算、保险 GAN 偏金融应用）

---

## 本日亮点

### 1. Reasoning 模型位置偏差问题 (2605.06672)
Chain-of-thought 推理越长，位置偏差越严重。提供了诊断工具包。

### 2. 33 模型元认知监控图谱 (2605.06673)
揭示了 MMLU 域级元认知监控的稳定差异，Applied/Professional 最易监控，Formal Reasoning/Natural Science 最难。

### 3. 首个支持 singing 的 E2E 口语语言模型 (2605.06765)
VITA-QinYu 支持 role-playing 和 singing 生成，15.8K 小时训练数据。

### 4. IntentGrasp 意图理解 benchmark + IFT (2605.06832)
当前模型在 Gem Set 上 17/20 低于随机基线，IFT 可提升 30+ F1 points。

### 5. RateQuant 和 LKV 解决 KV Cache 压缩问题 (2605.06675, 2605.06676)
两个工作从不同角度解决长序列 LLM 推理的 KV cache 内存瓶颈。

---

## 统计数据

- **搜索关键词**: large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, prompt engineering, multimodal, reasoning
- **arXiv 类别**: cs.AI, cs.CL, cs.NE, cs.LG
- **RSS 更新**: 2026-05-11 04:00 UTC
- **笔记创建数**: 6
- **同步状态**: 待执行 git-sync.sh