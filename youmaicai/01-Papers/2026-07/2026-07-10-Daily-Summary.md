# 🥬 LLM 每日论文速览：2026-07-10

> 数据来源：arXiv (cs.CL, cs.AI, cs.LG, cs.NE) | 2026-07-10 (周五) 新收录
> 抓取时间：2026-07-11 14:11 UTC

---

## 📋 今日论文清单

### ⭐ 核心 LLM/NLP 论文（优先级 High）

| ID | 标题 | 关键词 |
|----|------|--------|
| [[2607.08768]] | UniClawBench: Proactive Agents Benchmark | LLM Agent, Multimodal, Benchmark |
| [[2607.08700]] | Frontier Model as Citation Verifier | LLM Judge, RLHF, Citation |
| [[2607.08662]] | WebSwarm: Deep-and-Wide Web Search | LLM Agent, RAG, Multi-Agent |
| [[2607.08646]] | UltraX: Pre-Training Data Refinement | LLM Pre-training, Data Quality |
| [[2607.08642]] | DominoTree: Speculative Decoding | LLM Inference, Speedup |
| [[2607.08601]] | MAESTRO: MoE Structured Pruning | MoE, LLM Efficiency |
| [[2607.08535]] | LLM-as-Judge Reliability Audit | LLM-as-Judge, Evaluation |
| [[2607.08499]] | Cross-seed BERT SAE Explainability | BERT, SAE, Interpretability |
| [[2607.08456]] | Two Axes of LLM Abstention | LLM Reliability, Abstention |
| [[2607.08399]] | Prompt Compression via Activation Aggregation | Prompt Engineering, Compression |
| [[2607.08393]] | Why Memorized Knowledge Fails to Generalize | LLM Fine-tuning, Knowledge |
| [[2607.08186]] | Latent Computation Scaling for LLMs | LLM Architecture, Scaling |
| [[2607.07984]] | Agentic Neural Architecture Search | LLM, NAS, AutoML |

### 🔍 NLP / 多模态相关

| ID | 标题 | 关键词 |
|----|------|--------|
| [[2607.08731]] | AMALIA: LLMs as Data Annotators | LLM Annotation, NLP |
| [[2607.08374]] | LLM-as-Judge for Personality Recognition | LLM Judge, NLP |
| [[2607.08362]] | CKTN: Multilingual Corpus (Cham, Khmer, Tay-Nung) | Multilingual NLP |
| [[2607.08346]] | Grounded Event Extraction from SEC 8-K | LLM, NLP, Finance |
| [[2607.08317]] | Evaluating Blind Spots in Multimodal Models | Multimodal, Benchmark |
| [[2607.08716]] | Proactive Memory Agent for Long-Horizon | LLM Agent, Memory |
| [[2607.07957]] | Emotion Recognition via Cross-Modal Fusion | Multimodal, Emotion |

---

## 🔬 重点论文摘要

### 1. UniClawBench — LLM Agent 主动式智能体基准
**ID:** 2607.08768 | **类别:** cs.CL | **团队:** HKU-MMLab

**核心贡献：**
- 提出 UniClawBench，首个**能力驱动**的主动式智能体基准，覆盖 5 种基础能力：Skill Usage、Exploration、Long-Context Reasoning、Multimodal Understanding、Cross-Platform Coordination
- 构建 400 个双语现实任务，在 live Docker 容器中用细粒度 step-by-step checkpoint 评估
- 设计闭环评估策略：executor agent + hidden supervisor agent + user agent，模拟多轮人类反馈

**技术亮点：**
- 与框架解耦：评估基础模型能力 vs Agent 框架设计
- 评估 SOTA 模型（GPT、Claude、Gemini等）并对比多种 Agent 框架

**链接：** https://arxiv.org/abs/2607.08768 | [[GitHub]](https://github.com/HKU-MMLab/UniClawBench)

---

### 2. Frontier Model as Citation Verifier — LLM Judge 在引用验证中的校准研究
**ID:** 2607.08700 | **类别:** cs.CL

**核心贡献：**
- 研究 LLM judge 作为 RL reward model 时的**校准问题**，聚焦引用质量（Citation Quality）
- 在对抗性长文本基准上，对比 8 个 LLM judges（3 个模型家族），共 1,248 个 rubric 决策
- 发现：**便宜的小模型（如 GPT-5-mini）可以达到最强的 source-relevance F1（0.908）**

**关键发现：**
- factual support 维度上各 judge 无统计显著差异
- 标量 F1 掩盖了方向偏差（false positive vs false negative），这恰恰是 RL 循环会强化的
- **结论：LLM-as-Judge 校准是使用引用 rubric 作为 reward signal 的前提，不需要最贵的模型

**链接：** https://arxiv.org/abs/2607.08700

---

### 3. WebSwarm — 递归多智能体搜索框架
**ID:** 2607.08662 | **类别:** cs.CL | **团队:** 人大

**核心贡献：**
- 提出 WebSwarm，解决单 ReAct 智能体在深度+广度搜索上的局限（单一长轨迹、有限上下文）
- 核心机制：动态实例化 agentic search nodes，每个 node 耦合 local objective + search mode
- 每个 node 可自己解决或委托 child nodes，返回 evidence 供父节点扩展/修订/聚合

**技术亮点：**
- 先探测任务相关信息在 web 上的组织结构，再指导 node 扩展
- 重用 process-level evidence，减少冗余搜索

**链接：** https://arxiv.org/abs/2607.08662

---

### 4. UltraX — 预训练数据大规模编辑框架
**ID:** 2607.08646 | **类别:** cs.CL | **团队:** 清华

**核心贡献：**
- 针对大规模语料库数据质量提升难题（scaling law 收益递减）
- 提出 UltraX：function-calling refinement framework
  - 扩展编辑函数空间：Insertion + Deletion + Modification
  - 实现细粒度 instance-level 编辑

**技术方法：**
- dataset-adaptive prompt optimization → expert LLM 生成高质量端到端 refined 文本
- Line Alignment Mapping + Dynamic Context Replacement → 将 original-refined 对转换为结构化 program supervision

**链接：** https://arxiv.org/abs/2607.08646

---

### 5. DominoTree — 推测解码新方法
**ID:** 2607.08642 | **类别:** cs.CL

**核心贡献：**
- 提出 DominoTree，结合 Domino（非因果修正）+ DDTree（最佳优先树扩展）
- 核心创新：用 Domino 的条件非因子化修正沿 root-to-node 路径评分 draft tree

**性能：**
- Qwen3-4B 上最高 6.6x 加速，mean accept length 最高 10.7 tokens/round
- Qwen3-8B 上 T=0 时 throughput 比 DDTree 高 24%

**链接：** https://arxiv.org/abs/2607.08642 | [[GitHub]](https://github.com/slin-zhq/Domino-Tree)

---

### 6. MAESTRO — MoE 剪枝框架
**ID:** 2607.08601 | **类别:** cs.CL

**核心贡献：**
- 针对稀疏 MoE 模型的 deployment 瓶颈（full expert bank 常驻内存）
- 提出 MAESTRO：将 expert activation 建模为 Ergodic Markov chains，利用 stationary distribution 捕捉跨层依赖
- 得到全局感知的 importance heuristic，指导结构化剪枝

**性能：** 50% 压缩下平均性能保留领先 baseline 10.61%，且 cross-task variance 更低

**链接：** https://arxiv.org/abs/2607.08601

---

### 7. LLM-as-Judge Reliability Audit — 评估者变更导致的测量偏差
**ID:** 2607.08535 | **类别:** cs.CL

**核心贡献：**
- 将 evaluator-replacement ambiguity 建模为 measurement-validity 问题
- 对比两种 upgrade 路径：scaling Qwen3 (1.7B→32B) 和跨 MiniMax M2-M2.7 API 版本

**关键发现：**
- 仅 Qwen3 1.7B→4B 有稳健的相邻增益；MiniMax 相邻版本无稳健增益
- 更强 judge 减少但不消除 position bias 和 verbosity bias
- Repeated-sample juries 在 errors 相关时几乎无效
- structured debate 可显著改变决策，但无 parser/fallback logs 则无法归因

**链接：** https://arxiv.org/abs/2607.08535

---

### 8. Cross-seed BERT SAE — 跨种子可解释性
**ID:** 2607.08499 | **类别:** cs.CL

**核心贡献：**
- 解决独立训练的 BERT 模型间 feature misalignment 问题（dictionary learning 非凸）
- 方法：训练前先用 orthogonal Procrustes rotation 对齐激活空间，再联合训练 SAE
- 结合 Top-K sparsity + end-to-end 下游优化 + dead-feature revival loss

**性能：** 在 SST-2、Stanford Politeness、TweetEval Emotion 上，跨 seed Pearson r ≥ 0.70

**链接：** https://arxiv.org/abs/2607.08499

---

### 9. Two Axes of LLM Abstention — 拒绝回答的双维度
**ID:** 2607.08456 | **类别:** cs.CL

**核心贡献：**
- 发现 LLM 应拒绝两类：答错的 + 不应答的（无答案/错误前提）
- 标准方法用单一置信度无法区分两者

**关键发现：**
- answer-confidence 追踪答案是否正确，但对问题是否可答几乎盲
- hidden-state linear probe 追踪问题是否可答，但对答案正确性几乎盲
- 盲点不随模型规模缩小；在 CREPE 假前提问题最严重
- **hidden-state probe 达到 0.69-0.77 AUROC，但显式询问模型则接近 chance**

**链接：** https://arxiv.org/abs/2607.08456

---

### 10. Prompt Compression via Activation Aggregation
**ID:** 2607.08399 | **类别:** cs.CL

**核心贡献：**
- 提出用学习加权和中层激活向量替代原始 token 序列
- 在中间层提取，注入到早期层

**关键发现：**
- 精度下降 < 2% 相对全 prompt
- 中层表征可迁移到早期层（跨层兼容性）
- 单激活向量编码可量化的语义信息
- 加权和是鲁棒的压缩形式

**链接：** https://arxiv.org/abs/2607.08399

---

### 11. Knowing-Using Gap — LLM 微调中记忆化知识为何泛化失败
**ID:** 2607.08393 | **类别:** cs.CL

**核心贡献：**
- 形式化 LLM 微调中知识记忆 vs 知识使用之间的 gap：**Knowing-Using Gap**（精度差 + 时间滞后）
- 提出 **self-patching** 技术：识别激活位置，重定位表征可显著改善失败推理

**链接：** https://arxiv.org/abs/2607.08393

---

### 12. Hidden Decoding / Latent Computation Scaling
**ID:** 2607.08186 | **类别:** cs.CL

**核心贡献：**
- 提出隐 latent computation scaling 方法，在 inference 时调整 LLM 的隐层计算量

**链接：** https://arxiv.org/abs/2607.08186

---

### 13. Agentic NAS — LLM 驱动的神经架构搜索
**ID:** 2607.07984 | **类别:** cs.AI

**核心贡献：**
- LLM 生成高质量种子架构 → 分解为 slotted architecture（带命名可插拔模块）
- 填补 LLM-driven design 和 NAS-driven search 的空白

**链接：** https://arxiv.org/abs/2607.07984

---

## 📊 今日主题分布

```
LLM Agent / Multi-Agent:     ████████████ 6篇  (WebSwarm, UniClawBench, Proactive Memory, Agentic NAS...)
LLM Evaluation / Judge:      ████████     4篇  (Citation Verifier, LLM Judge Audit, LLM Abstention, LLM Judge Personality)
LLM Training / Fine-tuning:  ██████       3篇  (UltraX, Knowing-Using Gap, AMALIA)
LLM Efficiency / Inference:  ██████       3篇  (DominoTree, MAESTRO, Latent Scaling)
LLM Interpretability:        ████         2篇  (Cross-seed BERT SAE, Prompt Compression)
Multimodal:                  ███          2篇  (UniClawBench-mm, Blind Spots)
NLP Tasks:                   ████         4篇  (CKTN, SEC 8-K, Emotion Recognition...)
```

---

## 🔮 值得关注的趋势

1. **LLM-as-Judge 校准问题**正在被深入研究（需要可信赖的 RL reward signal）
2. **LLM Agent 基准**开始能力驱动化，而非场景驱动（UniClawBench）
3. **推测解码**新方法层出不穷（DominoTree 结合非因果修正）
4. **MoE 效率优化**（MAESTRO 剪枝）和**数据工程**（UltraX）仍是提升 LLM 的关键
5. **Knowing-Using Gap** 揭示微调中记忆与推理的解耦问题

---

*由 油麦菜 Youmaicai 自动生成 | 2026-07-11*
