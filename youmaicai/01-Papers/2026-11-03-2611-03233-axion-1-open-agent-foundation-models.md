# Axion 1.0: Open Agent Foundation Models, Simplified

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Axion 1.0: Open Agent Foundation Models, Simplified |
| 作者 | Yuqi Jia, Yunjie Tian, Jiayu Zheng, Yijun Liang, Jingchen Sun, Mengyu Zhao, Di Fu |
| 链接 | [原文](https://arxiv.org/abs/2611.03233) |
| arXiv | arXiv:2611.03233 |
| 类别 | cs.AI |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **Axion 1.0**：一个**完全开放（fully open）的 agent foundation model**，兼具强而广的 agentic 能力，且训练配方**异常简单**。
2. **三阶段极简训练流程**：仅用**两个轻量 SFT 阶段 + 强化学习**，**不使用**专门的 mid-training、**不使用 DPO**、**不使用 on-policy distillation (OPD)**。
3. **模型感知的数据构建（model-aware data construction）**：第一阶段 SFT 合成**有挑战的问题**，并**基于基座模型自身的成功解题策略对这些问题做对抗性强化（adversarially strengthen）**，从而发展出**强自足推理（strong self-contained reasoning）**。
4. **可验证任务的规模化流水线**：第二阶段 SFT 通过一条**可扩展流水线**构造**多样化且自动可验证（automatically verifiable）**的任务，这些任务**扎根于真实世界数据源与确定性计算（deterministic computation）**，把能力扩展到**依赖工具的推理（tool-dependent reasoning）**。
5. **RL 阶段**：强化长时序推理以及与外部工具和环境的交互。
6. **超越权重的开放（open beyond model weights）**：发布**完整配方**——数据构建、生成、过滤、验证、**全部提示词**以及**训练代码**——使整个开发过程可复现、可扩展。
7. **结论性主张**：强 agent 基础模型可以同时做到**开放与简单**，为开放 agentic intelligence 提供了一条实用且可复现的路径。

## 问题背景
当代 agent 基础模型的训练配方高度复杂：中训练（mid-training）、多阶段 SFT、DPO、on-policy distillation 层层叠加，每一步都需要大量数据构造与算力。这带来两个问题：一是**复现门槛极高**，社区难以验证与延续这些模型；二是**复杂度本身未被证明是必要的**——很多阶段可能只是"流水线惯性"。同时，多数"开放"模型仅开放权重（open weights），却不开放数据构造与训练代码，使得完整复现仍然不可能。Axion 1.0 的立论是：把配方做**短**，同时把**过程**做到**完全开放**。

## 方法
**整体训练流程（三阶段）**

```
Stage 1: SFT #1 —— 强自足推理（strong self-contained reasoning）
  输入: 基座模型自身的成功解题策略
  过程: 合成有挑战的问题 → 基于自身成功解法对抗性强化问题 → SFT
Stage 2: SFT #2 —— 工具依赖推理（tool-dependent reasoning）
  输入: 真实世界数据源 + 确定性计算
  过程: 可扩展流水线构造多样化、自动可验证任务 → SFT
Stage 3: 强化学习
  目标: 强化长时序推理 + 与外部工具/环境的交互
```

**明确不使用的组件（论文的"简化"所在）**
- ❌ 专门的 **mid-training** 阶段
- ❌ **Direct Preference Optimization (DPO)**
- ❌ **On-Policy Distillation (OPD)**

**Stage 1 细节：模型感知的数据构建（model-aware data construction）**
- 关键设计：**用模型自身的成功解题策略来"对抗性加强"它所面对的问题**。
- 即：不是从外部取更难的问题，而是**先合成问题，再根据模型已经会解的方式去改造问题**，使其更难、更贴合模型的能力边界。
- 目的：培养**自足（self-contained）推理**——即模型不依赖外部工具即可完成的推理链。

**Stage 2 细节：可验证任务的可扩展流水线**
- **多样（diverse）**：任务覆盖多类真实数据源与操作。
- **自动可验证（automatically verifiable）**：任务自带可自动检验的判据（配合**确定性计算**作为判定基础），从而无需人工标注即可判定成功。
- **扎根真实世界数据源**：任务并非合成臆造，而是建立在现实数据之上。
- 目的：把 Stage 1 的纯推理能力扩展为**依赖工具的推理**。

**Stage 3 细节：强化学习**
- 目标有二：① 强化**长时序推理**；② 强化**与外部工具和环境的交互**。
- 论文未提及 OPD/DPO，说明 RL 阶段直接采用标准 RLVR 类目标（摘要未给出具体算法名与奖励构造）。

**开放性清单（论文强调的差异化）**
发布内容包括：
- 数据**构建**方法
- 数据**生成**流程
- 数据**过滤**规则
- 数据**验证**机制
- **全部 prompts**
- **训练代码**
- 模型权重（由标题"Open Agent Foundation Models"及"open beyond model weights"可推知）

**评测**
- 在**一套广泛的 agentic 基准**上取得强性能，并在**其中若干个**上与**领先的商业模型**竞争（competitive）。
- 摘要未给出基准名称与数值（摘要未给出具体数值）。

## 实验结果
- **强 agentic 基准套件**：Axion 1.0 取得**强性能（strong performance）**。
- **对标商业模型**：在**若干个基准上**与领先商业模型**具竞争力（competitive）**。
- 摘要**未给出**：基准名称、具体分数、基座模型、模型规模、训练 token 量、数据规模、Stage 1/2/3 的算力与超参（摘要未给出具体数值）。
- 定性结论：尽管配方紧凑，Axion 1.0 仍能在广泛的 agentic 基准上达到强性能，并在部分基准上与商业领先模型竞争。

## 关键洞察
1. **"模型感知"的数据构造把数据难度变成可控变量**：不让外部数据决定难度，而是**先看模型已会什么，再据此把问题改造成它尚未掌握的形式**。这把"课程学习"从数据层搬到了**问题改写层**，成本远低于人工出题或调用更强教师模型。
2. **可验证性优先于多样性**：把任务设计成"真实数据源 + 确定性计算"支撑的**自动可验证**任务，使得 RL 阶段的奖励信号几乎免费且无误——这可能是"仅需三阶段"的结构性原因，而不仅仅是工程取舍。
3. **简化配方是一种科研主张而非弱点**：明确列出"不使用 mid-training / DPO / OPD"，等于对当前 agent 训练流水线中的**每一层常见组件发起可证伪的挑战**。如果 Axion 1.0 的成绩站得住，则这些组件的必要性需要被重新论证——这对社区的资源分配影响很大。
4. **"开放"的层次差异**：open weights ≠ open recipe。发布 prompts 与训练/验证代码，使得第三方能**重跑并扩展**该配方，这对 agent 领域尤为关键，因为 agent 的能力高度绑定数据流水线，而非仅绑定权重。

## 局限性
- 摘要**未给出任何基准名称与数值**，无法判断"competitive with leading commercial models"的具体含义与差距幅度。
- 未说明**基座模型**与模型规模（3B？7B？70B？），因此无法评估算力量级与结论的普适性。
- 未披露数据规模、训练/推理 token 量、三阶段各自的时长与成本，"简单"的**成本优势**未被量化。
- 摘要未说明 Stage 3 RL 的具体算法（是否 GRPO/PPO）、奖励来源、以及如何避免 RL 阶段的分布漂移问题。
- **模型感知对抗性强化**的具体"加强"操作未定义（改数值？改约束？加干扰？），可复现性依赖全文与开源代码。
- 未讨论多语言/多模态覆盖、agent 的安全与对齐、以及长时程真实部署的鲁棒性。
- 三阶段配方可能在**更极端的能力要求**（如超长时序、复杂多工具编排）下重新需要 mid-training 或 OPD；论文未给出该边界。

## 适用场景
- 需要构建**可复现的 agent 基础模型**的团队：照搬"2×SFT + RL"配方并替换数据源
- 受限于中训练/DPO/OPD 工程复杂度的团队：作为"最小可用 agent 训练配方"的参考实现
- **自动可验证任务**的构造方法参考：真实数据源 + 确定性计算 + 对抗性改写的组合拳
- 数据构建流水线工程：模型感知数据构造、生成—过滤—验证三段式管线的落地参考
- 开源社区的复现与延伸：以 Axion 1.0 发布的完整配方为基线做增量研究
- 与同批次 SCOPE（技能渐进探索）、SFTProbe（数据筛选加速）组合，构成"数据—训练—探索"闭环

## 相关工作
[[Agent Foundation Models]] [[Supervised Fine-Tuning]] [[Reinforcement Learning from Verifiable Rewards]] [[On-Policy Distillation]] [[DPO]] [[Mid-Training]] [[Model-Aware Data Synthesis]] [[Automatically Verifiable Tasks]] [[Tool-Use Reasoning]] [[Open Source Models]]

---
#LLM #Research #Agent-Model #Open-Recipe #SFT #arXiv-2611
