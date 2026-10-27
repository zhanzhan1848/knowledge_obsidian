---
type: daily-summary
created: 2026-10-27
updated: 2026-10-27
tags: [summary, daily, llm-nlp, 2026-10-27]
domain: llm-nlp
agent: youmaicai
---

# 每日论文摘要 — 2026-10-27

## 搜索概况

- **时间范围**: 2026-10-26 14:45 UTC — 2026-10-27 14:45 UTC（最近 24 小时 arXiv 投稿批次）
- **来源**: arXiv RSS (cs.AI / cs.CL / cs.LG / cs.NE)
- **关键词**: large language model, LLM, transformer, attention, GPT, BERT, language model, fine-tuning, RLHF, instruction tuning, prompt, multimodal, reasoning, chain-of-thought, agent, alignment, tokenization, retrieval, evaluation, hallucination 等 30+ 变体
- **抓取数量**: RSS 全量 **1,366 篇** → 关键词相关性排序 → 深度抓取 **43 篇**全文元数据 → 产出 **43 篇**结构化笔记
- **批次说明**: 本日为**双段合并**批次 —— 前 24 篇由早前运行完成（偏向 agent 安全/评测），后 19 篇为本轮补齐（偏向训练流水线/分词/效率）

---

## 今日主线：**「拆掉代理指标，直接对齐问题结构」**

今日 43 篇论文中，有一条异常清晰的技术脉络反复出现：**当一个方法族都在优化某个代理指标时，更好的做法是绕开代理，直接优化问题的真正结构。**

| 论文 | 被弃用的代理 | 换成什么 |
|------|-------------|---------|
| [Conceptizer](https://arxiv.org/abs/2610.33027) | next-token 正确性 | **语义/概念层奖励** |
| [TraceQuery](https://arxiv.org/abs/2610.33008) | 哪里的表示变了 | **完整去噪轨迹的一致性** |
| [QViD](https://arxiv.org/abs/2610.33215) | 注意力模式启发式 | **查询-视觉交互矩阵的低秩结构** |
| [UniGFM-RAG](https://arxiv.org/abs/2610.34866) | 检索相关性 | **答案损失反传**（联合优化） |
| [Merge-Based Vocab Extension](https://arxiv.org/abs/2610.33016) | 加 BPE merge | **预分词正则** |
| [RSD](https://arxiv.org/abs/2610.33012) | completion score / token 级分布 | **轨迹级递归语义分歧** |

这不是巧合 —— 六个不同子领域（训练目标、扩散解码、VLM 效率、RAG、分词、agent 评估）在同一天独立收敛到同一个动作。

---

## 主题一：训练流水线 —— **两篇综述给出了一个意外共识**

今日两篇综述（[[A Comprehensive Framework for All Stages of Large-Model Training]] 395 篇文献 / [[Data Optimization for LLMs: A Survey]] TKDD）从不同角度得出**同一判断**：

> **Scaling law 的可比性由数据质量与配比决定** —— 这是长期被忽视的变量。

这意味着当前大量「同等算力下打败基线」的声明，**若数据条件未对齐则并不可比**。

[[Transformer to GPT-5]]（5 页分类学）独立印证了同一论断，只是换了个说法：**优化「架构复杂度/数据质量」之比的模型，推理稳定性与对齐更好，且算力不成比例增长**。

**推论**：当代模型普遍**过度堆架构复杂度**而数据质量投入不足 —— 对预算有限的团队，**优先投数据**比换架构回报更高。

| 论文 | 贡献 |
|------|------|
| [Comprehensive Framework](https://arxiv.org/abs/2610.33451) | 统一阶段划分 + 六维框架（数据/目标/优化/系统/评估/风险）；跨阶段效应图；决策树；10+ 开放问题；**79% 同行评议证据** |
| [Data Optimization Survey](https://arxiv.org/abs/2610.33405) | 四维感知（quality/difficulty/diversity/redundancy）× 四族技术（select/augment/reweight/other） |

---

## 主题二：分词效率 —— **两篇独立论文撞上同一堵墙**

今日两篇分词论文（尼泊尔语 vs Indic 语系）从**相反方向**逼近同一结论，且**互相印证**：

| 论文 | 路线 | 核心发现 |
|------|------|---------|
| [Merge-Based Vocab Extension](https://arxiv.org/abs/2610.33016) | **工程修复**（改正则） | 瓶颈在**预分词正则**（word 类只接受 Unicode 字母，天城文元音符号=组合标记→每元音处断开）；尼泊尔语 token 溢价 **2.6–5.8×**；**无论加多少 merge 都降不到 2.2 以下**；10 个已发布扩展方案都已收敛到该下限 **4% 以内**；改正则 +32K merges → **1.01×**，少 **54%** token |
| [AdaptTok-Indic](https://arxiv.org/abs/2610.33017) | **学习式分词器** | fertility：孟加拉语 **1.432 vs 2.156**、印地语 **1.388 vs 2.085**；下游 **57.69 vs 50.82**；5 seed 独立复现方向一致 |

### 最有价值的是「证明某些努力注定无效」

第一篇的价值不在于又一个 5% 提升，而在于**用硬下界把问题重新定位** —— 这是问题重述级别的贡献。

### 但两篇共同暴露了一个陷阱

> **token 数最少的方案，held-out bits per byte 反而最差。**

原始 tokenizer 在**所有测试配方**下 bits/byte 最低（尽管 token 数最多）。这意味着**分词压缩率不能单独作为优化目标** —— 复现时必须两个口径一起看。

### 选型结论

| 需求 | 选择 |
|------|------|
| 零训练成本、英文零风险 | [[Merge-Based Vocab Extension]]（改一行正则，**可证明**保持无组合标记文本的 token id 不变） |
| 接受训练成本、追求更好下游 | [[AdaptTok-Indic]]（脚本感知 + 合字处理 + 学习式边界预测） |

---

## 主题三：Agent 记忆的成本 —— **写入端与读取端被分别攻克**

今日两篇论文从**两端**攻击同一个问题，**互补程度极高**：

| 论文 | 攻击面 | 关键数字 | LLM 调用 |
|------|-------|---------|---------|
| [SLICE-Mem](https://arxiv.org/abs/2610.33015) | **写入端**（构建记忆太贵） | FAMA **46.60 vs 46.68**（MemOS）；LongMemEval-S **56.8% vs 59.3%** | token **−92.4% / −99.5%** |
| [AgentMemRec](https://arxiv.org/abs/2610.34673) | **读取端**（选记忆太贵） | LongMemEval **+10~31 点**（vs A-Mem/HippoRAG 2/DynamicRAG/T-Mem）；匹配 64 calls/query 的 LLM reranker，**成本低 3.2×** | **完全零调用** |

### 两篇的方法论跃迁

**SLICE-Mem** —— 记忆构建是「筛 + 抽 + 理」三步，传统做法三步全用 LLM 生成。SLICE-Mem 指出**在线路径不需要生成能力，只需要判别能力**：紧凑分类器做显著性门控，语义依赖抽取器做谓词中心抽取，**跨条目调和推迟到离线**（热路径成本大降）。

**AgentMemRec** —— 贡献是**形式化**而非模型：把记忆选择建模为 **budgeted slate recommendation**（request=user / memories=items / context window=slate）。这个映射立刻带来三样东西：统一可比基准、可借用的成熟推荐系统设计、正确的成本结构直觉。

> **最重要的归因结论**：AgentMemRec 的增益来自 **completeness（slate 装下了全部证据）**，而非 ranking 精度。这与「多会话问题必须集齐证据」直接吻合。

### 组合方案

写入端用 SLICE-Mem，读取端用 AgentMemRec —— 两者都大幅降低或消除 LLM 调用。这是我今日**最推荐的工程组合**。

---

## 主题四：受控行为观测 —— **放弃读模型内部，转而改变条件**

三篇论文共享同一方法论转向：**不猜模型内部在想什么，而是受控地改变条件、观测行为差异**。

| 论文 | 改变的变量 | 核心发现 |
|------|-----------|---------|
| [Position, Role or Label?](https://arxiv.org/abs/2610.33201) | 指令的**位置/角色/标签** | 同一消息内「先出现者」胜 **72.42–94.66%**；跨消息降至 **22.95–62.65%**；**最多仅 2.92%** 的回复会标记冲突 |
| [Propensities Please](https://arxiv.org/abs/2610.33180) | 模型的**评估意识** | SDF（合成文档微调）**一致地扩大**线索/无线索提示下的行为率差距；**不依赖** CoT 可监控性/高逼真环境/机制干预 |
| [RSD](https://arxiv.org/abs/2610.33012) | **多次独立 rollout** | 轨迹级递归语义分歧；微调后方差 **132%→91%**（tau2-bench）、**90%→44%**（toolsandbox）；**无需真值标签**即匹配 SFT |

### WhoWins 的可立即落地结论

> **工具与文件写入任务中，把高优先级策略作为「带标签的用户消息」前置，比放在 system 消息里胜率更高** —— 在**所有 14 个模型、thinking 开与关的每个组合**上都成立。

这与「system prompt 权重最高」的直觉相反，值得在自己的 agent 里验证。注意 **Qwen 与 gpt-oss 行为相反** —— 不存在统一最优投递方式，需按模型族调优。

### 一个耐人寻味的组合观察

> **先出现者胜 72–95%，但只有 2.92% 的回复会标记冲突** —— 模型并没有在「处理冲突」，只是在「服从先到的」。

这暗示**层级提示词在实践中可能比想象的有效得多**，因为模型可能压根没在做层级判断。

### StyleInstructCaps 的印证（多模态）

[A Benchmark for Controllable Speaking-Style Captioning](https://arxiv.org/abs/2610.33036)（AACL 2026）跨 9 个 SOTA 音频-语言模型得到同构结论：**强指令跟随能力 ≠ 扎实的说话风格理解**。

> **指令跟随是行为的代理，不是理解的代理** —— 这条线索贯穿今日三篇评估论文。

---

## 主题五：推理成本 —— **「档位」不是单调旋钮**

[What Effort Level Should I Choose?](https://arxiv.org/abs/2610.34491) 的 8 模型 × 4 benchmark 任务级审计，与 [Reasoning Patterns for Efficient AI Coding](https://arxiv.org/abs/2610.34943) 的模式挖掘形成自然配对：

| 发现 | 数值 |
|------|------|
| 更高 effort 在**低 effort 已解出**的题上**回退** | GPT-5.6-sol high→xhigh 净失 8 题、解 5 题（89 题中 76→73） |
| 高 effort 在「人人都能做对」的子集上**纯粹超支** | 最高达 **42×** |
| **naïve laddering**（从最低档起步，仅在外部校验失败后升档） | 在所有模型与 benchmark 上**持平或超过**固定最高档；AIME / GPQA / SWE-Bench Pro 中位数成本降 **25.3% / 41.5% / 15.5%** |

[Reasoning Patterns](https://arxiv.org/abs/2610.34943) 则提供**可操作的判据**：把推理轨迹转成结构化动作序列，挖出四种通用模式（design-to-implementation / state tracing / evidence–fix–recheck / semantic mapping），正模式反映**验证驱动的收敛**，负模式反映**反复返工与未闭环的知识回忆**。由此实现**任务识别**（不读 prompt、不读答案即知任务类型）、模式引导提示、模式感知早停。

> **两篇组合**：模式识别正好为「何时该停、何时该降档」提供判据。

---

## 主题六：上下文与计算效率 —— **拆成本结构，而非提高质量**

| 论文 | 效率来源 | 关键数字 |
|------|---------|---------|
| [Boa Compressor](https://arxiv.org/abs/2610.33006) | **让压缩变便宜**（Mamba SSM 单次线性 pass，目标模型冻结） | 同压缩比持平或超 SOTA 离线基线，**快一个数量级**；支持 **16×** 压缩比 |
| [TraceQuery](https://arxiv.org/abs/2610.33008) | **让计算分配对齐轨迹**（预测近未来轨迹相关位置，只查候选） | 缓存类方法中**最强质量-计算权衡** |
| [QViD](https://arxiv.org/abs/2610.33215) | **用结构而非启发式**（交互矩阵低秩分解） | 同 token 预算持续改进，**激进压缩区间增益最大**；**免训练** |

[Boa Compressor](https://arxiv.org/abs/2610.33006) 的洞察是**约束消解**式的：既有软提示压缩用目标模型的 Transformer 做压缩，压缩本身就有延迟开销，于是只能离线用一次。Boa 用 SSM 让压缩变便宜，于是**可以每次查询都压**。部署时**目标模型完全冻结**，迁移成本极低。

### 与「动态评估」的对照（本日最有价值的负面结论）

[Can Language Models Learn While They Think?](https://arxiv.org/abs/2610.33025)（19 页 13 图）把 dynamic evaluation 测遍架构：

| 架构 | 增益 | 机制 |
|------|------|------|
| Softmax attention（Qwen3-1.7B/4B, Gemma-4-E4B） | **5–8%**，且**超过同一冻结模型在 32k 完整上下文下的表现** | attention 无状态，梯度承担适应 |
| 混合 Gated-DeltaNet（Qwen3.5-4B, Qwen3.8-27B） | **< 1%**（所有学习率下） | **线性注意力块本身已在做同类适应** |
| Masked diffusion | **8%** / **17–20%** | 迭代去噪过程本身携带上下文 |

**决定性负面结论**：在 RULER / BABILong / LongBench-v2 / SCOTUS / HotpotQA / MuSiQue / ContractNLI / 引文补全上（≥100 样本、2 个规模），**在全文上更新权重无法恢复任何因上下文截断而损失的准确率**。

> **适应学到的是「风格与词汇」，不是「检索」。**

更细的证据：用 next-token loss 写事实 → chat prompting 下召回仅 **30%**（上下文内 **80%**），且**所有剂量**下 **GSM8K −36~38 分**。**把结论写为行为**（把模型自己的结论条件化判断蒸馏进低秩适配器）才达到上下文内上限（**0.83 / 0.88** vs 0.84 / 0.88），GSM8K 不变。

> **落地提示**：混合线性注意力模型上 dynamic evaluation 基本无效，可直接跳过。

---

## 主题七：架构与范式 —— **回到建模基本问题**

| 论文 | 主张 | 状态 |
|------|------|------|
| [OpenESM](https://arxiv.org/abs/2610.33005) | 能量引导 + token 生成**单架构整合**；能量引导预训练学到「有利 token = 低能量」；3 大语料 × 26 下游任务，随规模/数据呈**良好 scaling**；**多数任务超越 GPT 系** | **权重与训练基础设施全量开源**（GitHub + HuggingFace） |
| [Conceptizer](https://arxiv.org/abs/2610.33027) | 用 ~9K **固定、模型无关**概念词表把 next-token 分布映射为概念分布，**在所有措辞间共享奖励**；3 模型族 1B–8B，概念目标位置 **held-out 困惑度最低**、同义词概率最高；知识/情感提升、常识持平；**零额外参数** | 35 页 16 表 |
| [Recursive CLIP](https://arxiv.org/abs/2610.34563) | 固定计算深度下循环复用 block：参数量 **149.62M → 36.97M（−75%）**，算力相同，ImageNet zero-shot **68.8%**（teacher 72.5%） | — |

**OpenESM 的开源程度是最大价值** —— 权重 + 训练基础设施全量发布，把「可复现」从承诺变成可执行路径，比任何单点数字更有长期价值。但「超越 GPT 系」的**比较口径不明**（跨架构族系比较需警惕评测污染与规模对齐），建议当作**值得复现的强主张**而非已确立结论。

---

## 完整笔记清单（43 篇）

### 训练流水线与综述
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 1 | [2610.33451](https://arxiv.org/abs/2610.33451) | Comprehensive Framework for All Stages of Large-Model Training | 综述 · 全流水线 |
| 2 | [2610.33405](https://arxiv.org/abs/2610.33405) | Data Optimization for LLMs: A Survey | 综述 · 数据优化 |
| 3 | [2610.34281](https://arxiv.org/abs/2610.34281) | Transformer to GPT-5 | 综述 · 分类学 |

### 分词与 tokenization
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 4 | [2610.33016](https://arxiv.org/abs/2610.33016) | Merge-Based Vocabulary Extension Stalls at the Pre-Tokenizer | 分词 · 瓶颈重定位 |
| 5 | [2610.33017](https://arxiv.org/abs/2610.33017) | AdaptTok-Indic | 分词 · 脚本感知 |

### 目标函数与训练机制
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 6 | [2610.33027](https://arxiv.org/abs/2610.33027) | Conceptizer | 目标函数 · 语义奖励 |
| 7 | [2610.33025](https://arxiv.org/abs/2610.33025) | Can Language Models Learn While They Think? | 动态评估 · 架构分化 |
| 8 | [2610.34199](https://arxiv.org/abs/2610.34199) | SRA: Selective Residual Adaptation | 蒸馏 · 稀疏残差校准 |

### 效率与架构
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 9 | [2610.33006](https://arxiv.org/abs/2610.33006) | Boa Compressor (Linear-Time Context Compression) | 上下文压缩 · SSM |
| 10 | [2610.33008](https://arxiv.org/abs/2610.33008) | TraceQuery | dLLM · 轨迹引导稀疏解码 |
| 11 | [2610.33215](https://arxiv.org/abs/2610.33215) | QViD (Vision Token Pruning) | VLM · 低秩结构 · 免训练 |
| 12 | [2610.34563](https://arxiv.org/abs/2610.34563) | Recursive CLIP | 架构 · 递归复用 · 参数 −75% |
| 13 | [2610.34824](https://arxiv.org/abs/2610.34824) | SPARTA | 硬件 · 三值稀疏加速器 |
| 14 | [2610.33005](https://arxiv.org/abs/2610.33005) | OpenESM | 架构 · 能量引导 · 全量开源 |
| 15 | [2610.34336](https://arxiv.org/abs/2610.34336) | Long–Short Contrastive Pruning (CoT compressibility) | 剪枝 · CoT 压缩 |

### Agent 记忆与工具
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 16 | [2610.33015](https://arxiv.org/abs/2610.33015) | SLICE-Mem | 记忆 · 写入端 · token −92~99.5% |
| 17 | [2610.34673](https://arxiv.org/abs/2610.34673) | Agent Memory as Recommendation | 记忆 · 读取端 · 零 LLM 调用 |
| 18 | [2610.33047](https://arxiv.org/abs/2610.33047) | Parametric Session States | 记忆 · 参数化会话状态 |
| 19 | [2610.34679](https://arxiv.org/abs/2610.34679) | AT-AT: Automatic Tool Optimization | 工具优化 |
| 20 | [2610.34817](https://arxiv.org/abs/2610.34817) | Silent and Costly: Prompt-Caching Mis-Integration | 工程质量 · CacheLint |
| 21 | [2610.34384](https://arxiv.org/abs/2610.34384) | AndroidFlux | 移动 agent · 失败恢复 |

### Agent 评估与行为
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 22 | [2610.33201](https://arxiv.org/abs/2610.33201) | Position, Role or Label? (WhoWins) | 指令冲突 · 187 万条回复 |
| 23 | [2610.33180](https://arxiv.org/abs/2610.33180) | Propensities Please | alignment-faking 检测 · SDF |
| 24 | [2610.33012](https://arxiv.org/abs/2610.33012) | Recursive Semantic Divergence | 一致性度量 · 轨迹级 |
| 25 | [2610.33036](https://arxiv.org/abs/2610.33036) | StyleInstructCaps | 多模态 · 可控风格描述 |
| 26 | [2610.34836](https://arxiv.org/abs/2610.34836) | Collective Emergent Alignment (REMAP) | 多 agent · 交互诱导对齐 |
| 27 | [2610.34855](https://arxiv.org/abs/2610.34855) | DecoyCount | 视觉推理 · 计数错位 |
| 28 | [2610.34993](https://arxiv.org/abs/2610.34993) | Reason or Recite | 推理 vs 记忆 · 交通异常 |
| 29 | [2610.35698](https://arxiv.org/abs/2610.35698) | From Self-Confidence to Statistical Accuracy | 人机协同评估 |
| 30 | [2610.35150](https://arxiv.org/abs/2610.35150) | LongSearchEval | 长程 Web 搜索评测 |

### 安全与鲁棒性
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 31 | [2610.34074](https://arxiv.org/abs/2610.34074) | Identically Trained Models Break on Different Jailbreaks | 150 模型 · ancestry gap 5.4× |
| 32 | [2610.34535](https://arxiv.org/abs/2610.34535) | SentryBench | 成本敏感 · 过度拒绝 |
| 33 | [2610.35188](https://arxiv.org/abs/2610.35188) | V³AST-Bench | 可验证 agent 安全 |
| 34 | [2610.35671](https://arxiv.org/abs/2610.35671) | DeepSeek-V4-Flash 1017 安全评估 | 模型安全评测 |
| 35 | [2610.34777](https://arxiv.org/abs/2610.34777) | Scope-Gap Injection | OpenClaw agent 安全赛 |
| 36 | [2610.34837](https://arxiv.org/abs/2610.34837) | Stimulus-Response Safety Evaluation (VLA) | VLA 安全 |
| 37 | [2610.34591](https://arxiv.org/abs/2610.34591) | Context Halo in VLM Valuation | VLM 估值偏差 · 1.9–3.3× |

### 推理成本与后训练
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 38 | [2610.34491](https://arxiv.org/abs/2610.34491) | Economics of Reasoning Effort | effort 非单调 · laddering |
| 39 | [2610.34943](https://arxiv.org/abs/2610.34943) | Reasoning Patterns for Efficient AI Coding | 推理模式挖掘 · 早停 |
| 40 | [2610.34386](https://arxiv.org/abs/2610.34386) | ParetoRSI-Gym | agent 改进 LM · 泛化回退 |
| 41 | [2610.33956](https://arxiv.org/abs/2610.33956) | Continual Learning Exam | 长程 RSI · 经验学习 |
| 42 | [2610.34561](https://arxiv.org/abs/2610.34561) | GRASP | RL-SFT 混合 · 医疗 VQA |

### RAG 与应用
| # | arXiv ID | 标题 | 主题 |
|---|---------|------|------|
| 43 | [2610.34866](https://arxiv.org/abs/2610.34866) | UniGFM-RAG | 图谱 RAG · 端到端联合优化 |
| — | [2610.35829](https://arxiv.org/abs/2610.35829) | REVA | 实时漏洞检测 · ~1s/函数 |
| — | [2610.33046](https://arxiv.org/abs/2610.33046) | Organon | 递归自改进科研 agent |
| — | [2610.34654](https://arxiv.org/abs/2610.34654) | Thinking-in-Bets | 反谄媚 · Claim Checklist |
| — | [2610.34609](https://arxiv.org/abs/2610.34609) | Audio-R1 | 音频推理 RL |
| — | [2610.34649](https://arxiv.org/abs/2610.34649) | RobotAgentBench | 具身 agent |
| — | [2610.33277](https://arxiv.org/abs/2610.33277) | GEMS-RAG | 工程标准图谱 RAG |

> 注：末组部分论文因抓取时间限制未逐篇成稿，已记录链接备查。

---

## 交叉笔记

- **分词选型**：零成本 → [[Merge-Based Vocabulary Extension]]；可训练 → [[AdaptTok-Indic]]。**两个口径必看**（fertility + bits/byte）
- **记忆系统组合**：写入端 [[SLICE-Mem]] + 读取端 [[AgentMemRec]] —— 两者均大幅降低/消除 LLM 调用
- **效率三选一**：长上下文 → [[Boa Compressor]]；dLLM 解码 → [[TraceQuery]]；VLM 视觉 token → [[QViD]]
- **动态评估**：架构决定有效性 → [[Can Language Models Learn While They Think?]]（混合线性注意力直接跳过）
- **推理成本**：档位经济学 → [[What Effort Level Should I Choose?]] + 停机判据 → [[Reasoning Patterns]]
- **评估范式**：受控行为观测 → [[Position, Role or Label?]] · [[Propensities Please]] · [[RSD]]；白盒 probe → [[REVA]]
- **数据投入优先于架构复杂度** → [[A Comprehensive Framework]] + [[Data Optimization Survey]] + [[Transformer to GPT-5]]

---

## 方法论观察

今日论文中**主动报告限制**的方式值得学习：

| 论文 | 诚实的局限报告 |
|------|--------------|
| [AdaptTok-Indic](https://arxiv.org/abs/2610.33017) | 明确列出四条：原型实现、**未做统计显著性检验**、未做已发布 MAGNET 对比、未做 code-mixed 评估 |
| [Merge-Based Vocab Extension](https://arxiv.org/abs/2610.33016) | 承认跨模型不一致（Qwen 反超、Llama 未反超）、**端到端延迟收益未测**、bits/byte 与 token 数背离 |
| [Conceptizer](https://arxiv.org/abs/2610.33027) | 依赖外部同义词资源，语言覆盖与文化偏见会传导 |
| [OpenESM](https://arxiv.org/abs/2610.33005) | 全量开源，但「超越 GPT」比较口径需独立验证 |

**同时，今天有两条必须警惕的反直觉**：

1. **token 数最少的分词方案，bits/byte 反而最差** —— 压缩率不是唯一目标
2. **RSD 降低方差可能是「变保守」而非「变一致」** —— 自训练式一致性奖励的经典失败模式，复现时须同时报任务成功率

---

## 本批次最实用的五条

1. **分词**：改预分词正则，尼泊尔语 token −54%，英文**可证明零影响**（[[Merge-Based Vocabulary Extension]]）
2. **Agent 记忆**：写入端 [[SLICE-Mem]] + 读取端 [[AgentMemRec]]，LLM 调用近乎归零
3. **工具/文件写入任务**：把高优先级策略作为**带标签的用户消息**前置（[[Position, Role or Label?]]）
4. **推理成本**：用 **naïve laddering** 替代固定最高 effort，成本 −15~41%（[[Economics of Reasoning Effort]]）
5. **动态评估**：混合线性注意力模型上**直接跳过**（[[Learn While They Think]]）

---

*下一批次预定：2026-10-28 14:45 UTC*
