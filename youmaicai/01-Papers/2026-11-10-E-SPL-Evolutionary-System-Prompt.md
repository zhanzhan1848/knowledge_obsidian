---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, reinforcement-learning, prompt-evolution, self-improvement]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2602.14697
arxiv: 2602.14697
---

# Evolutionary System Prompt Learning for Reinforcement Learning in LLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Evolutionary System Prompt Learning for Reinforcement Learning in LLMs |
| **作者** | Lunjun Zhang 等（University of Toronto / Northwestern University / Bridgewater AIA Labs） |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2602.14697) |
| **arXiv** | arXiv:2602.14697 |
| **分类** | cs.AI, cs.LG |
| **代码** | https://github.com/LunjunZhang/E-SPL |

---

## 核心贡献

> 让"自进化"同时发生在两个层面：RL 更新权重（程序性知识），进化算法更新 system prompt（可解释的陈述性知识）；两者协同，在"由易到难"的泛化设定上把 RL 成功率从 38.8% 提到 45.1%。

1. **E-SPL 框架**：在每个 RL 迭代中用多个 system prompt 并行采样轨迹，用这些轨迹同时做 RL 权重更新与 system prompt 的自反思式进化。
2. **复用 RL rollout 的进化算法**：复用 RL 已生成的 rollout 评估适应度（无需额外 held-out 集），用 TrueSkill 的持久化评分（$\mu_i,\sigma_i$）在非平稳迭代间聚合相对排名；用乐观 UCB 式选择（$\mu_i+\lambda\sigma_i$）平衡利用与探索。
3. **两个 LLM 驱动的遗传算子**：mutation（对最优 prompt 做轨迹摘要 → 自批评 → 局部 diff 提案 → 局部到全局聚合，以 git diff 形式应用）与 crossover（按"逐题表现"比较多个父本，重组互补段落）。
4. **明确的分工假说**：声明式知识（可用语言解释的全局启发式）进 prompt，程序性知识（靠反复练习形成的直觉）进权重；论文给出的进化 prompt 实例（自验证策略、常见失败模式清单）印证了这一点。

---

## 技术方案

### 核心思想
当前 LLM 的自改进有两条互不相干的路径：self-reflection 改上下文（context），RL 改权重（weights）。已有工作几乎总是孤立优化其一。E-SPL 的主张是：有效的自改进智能体应当**同时**进化高层行为规范（system prompt）与低层参数策略（policy weights）。做法上，RL 部分维护一个 system prompt 种群 $\mathcal{S}$（初始为单个 root，随迭代长成进化树），每轮按 UCB 式分数采样 $M$ 个 prompt，在每个 prompt 下采样 $N$ 条轨迹算奖励，用 GRPO 风格的组内基线做策略梯度更新权重——因为 prompt 多样化，权重不会过拟合到某个 prompt，同时 prompt 之间形成直接的进化竞争。进化部分解决两个整合难题：一是传统遗传算子假设适应度景观静止，而 RL 每轮都在移动权重；二是传统 prompt 进化需要单独 held-out 评估，而 RL 产生的是 on-policy 轨迹。E-SPL 的应对是把每轮视作一次"锦标赛"（同一批题、同一权重，只有相对序有意义），用 TrueSkill 贝叶斯消息传递更新每个 prompt 的持久化技能值与不确定度。变异只作用于本轮最优 prompt，通过参考模型 $\pi_{\text{ref}}$ 对该 prompt 下的成功/失败轨迹做对比反思，生成 git 风格 diff 以保持编辑局部化，避免整段重写丢掉已积累的原则；交叉算子则按逐题表现差异重组多个父本中各自有效的片段。

### 关键公式
```math
（1）RL 权重更新（GRPO 风格，组内基线）：
V_i = \frac{1}{N}\sum_{j=1}^{N} r_{i,j},\qquad r_{i,j}=R(x, y_{i,j}),\ \ y_{i,j}\sim\pi_\theta(\cdot\mid \mathbf{s}_i, x)
\mathcal{J}(\theta,x) = \frac{1}{NM}\sum_{i=1}^{M}\sum_{j=1}^{N}(r_{i,j}-V_i)\log\pi_\theta(y_{i,j}\mid \mathbf{s}_i,x)
\theta \leftarrow \theta + \alpha\,\frac{1}{|\mathcal{B}|}\sum_{x\in\mathcal{B}}\nabla_\theta\big(\mathcal{J}(\theta,x) - \beta\,\mathrm{KL}(\pi_\theta,\pi_{\text{ref}})\big)
（LoRA 训练时 KL 项隐式，$\beta = 0$）

（2）适应度评估（每轮视为锦标赛 + TrueSkill）：
\mathbf{v} \leftarrow \mathrm{argsort}([V_1,\dots,V_M]),\qquad
\{(\mu_i,\sigma_i)\} \leftarrow \mathrm{TrueSkill.update}\big(\{(\mu_i,\sigma_i)\},\mathbf{v}\big)

（3）选择（乐观 UCB 式）：
\mathrm{score}_i = \mu_i + \lambda\,\sigma_i,\qquad p_i \propto \exp(\mathrm{score}_i / T)
（$\lambda$ 与 $T$ 权衡利用与探索）

（4）变异（只作用于本轮最优 $\mathbf{s}_k$，$k\leftarrow\arg\max_i V_i$）：
\ell \sim \pi_{\text{ref}}(\cdot\mid \Psi_{\text{reflect}},\mathcal{E}_k),\quad
\mathrm{diff} \sim \pi_{\text{ref}}(\cdot\mid \mathbf{s}_k,\ell),\quad
\mathbf{s}_{\text{mutate}} \leftarrow \mathrm{git.apply}(\mathbf{s}_k,\mathrm{diff})
（子代以父代均值为初值、不确定度放大：$\mu_k,\ \sqrt{\sigma_k^2 + \Delta\sigma^2}$）
自反思仅在"有成功也有失败"的题目上执行（$0 < V_k < 1$），以便对比

（5）交叉：
按当前 RL batch 内的逐题表现比较 prompt，$\mathrm{Crossover}(\mathcal{B},R,\Omega,\pi_\theta,\pi_{\text{ref}})$ 生成子代

（6）交叉的上下文构造差异：
Mutation 的上下文 = 同一 prompt 下的组内成功/失败轨迹对比（自身血统的错误）
Crossover 的上下文 = 不同 prompt 之间的逐题互补强弱（跨血统的原则迁移）
```

### 关键组件
- **System prompt 种群 $\mathcal{S}$**：初始单个 root，随迭代长成进化树；每条含 prompt、TrueSkill 的 $\mu$ 与 $\sigma$。
- **RL 组件**：$M$ 个 prompt × $N$ 条轨迹；GRPO / CISPO 算法；LoRA 微调（rank 32）；KL 正则向 $\pi_{\text{ref}}$。
- **变异算子**：轨迹摘要（trajectory summarization）→ 自批评（self-critique，做原则级信用分配）→ 局部 diff 提案（逐题）→ 局部到全局聚合；全程用固定参考模型 $\pi_{\text{ref}}$。
- **交叉算子**：单阶段，按逐题表现差异做互补重组。
- **Fitness/Selection**：复用 RL rollout 的组内相对排名 + 持久化 TrueSkill + 乐观 UCB 选择。
- **模型**：数学任务用 DeepSeek-v3.1（671B MoE，37B 激活）；agentic search 用 OpenAI gpt-oss-120b（120B MoE，5B 激活）。
- **训练集**：DAPO100（100 题）→ AIME 2025；HMMT 2023/2024/2025-02 → HMMT 2025-11；AIME 22/23/24 → BeyondAIME；agentic search 在 NQ + HotpotQA 上抽 196 训练 / 64 测试。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| AIME 2025 成功率（RL-only → E-SPL） | 56.3% → 60.6% |
| HMMT 2025-11 成功率 | 50.0% → 52.7% |
| AIME → BeyondAIME（易到难泛化） | 38.8% → 45.1% |
| Agentic Search（gpt-oss-120b） | 44.2% → 48.6% |
| 相对 evolution-only 的相对提升（数学任务） | +5.8% ~ +12.8% |
| 相对 evolution-only 的相对提升（agentic search） | +42.9% |
| 相对 compute-matched GRPO 基线 | HMMT +4.4%、BeyondAIME +15.1%（相对） |
| 相对"先进化后 RL"的顺序训练 | AIME 2025 +4.3% |
| GRPO group size 翻三倍 | 仅 +1.0%（收益递减） |
| Evolution-only vs Self-reflection | evolution 稳定更优；在 DAPO100→AIME25 与 AIME→BeyondAIME 上 evolution 甚至超过 RL-only；HMMT 上 GRPO 略胜 |
| 多随机种子 | BeyondAIME 的增益在各 seed 上保持（附录 C.1–C.3） |
| 额外计算开销 | 复用 RL 已生成的 rollout，只需额外的 LLM 自反思采样，可与 RL 梯度更新并发 |

---

## 局限性

- 只在两个超大 MoE 模型（DeepSeek-v3.1、gpt-oss-120b）上验证，LoRA 微调复现成本极高，普通研究团队难以直接复现。
- 进化算子依赖强 LLM（参考模型 $\pi_{\text{ref}}$）做自反思与 diff 生成，质量受参考模型能力制约；diff 格式也把"局部化编辑"的假设写死了。
- TrueSkill 在非平稳（权重每轮变化）下的适应度聚合是工程近似，缺乏理论保证。
- 增益幅度在多数设定下为个位数百分点（除 BeyondAIME 与 agentic search），且部分对照（compute-matched GRPO）的基线设定敏感。
- "声明式知识进 prompt、程序性知识进权重"的分工是假说与事后解读，论文未给出直接因果验证（如消融 prompt 知识与权重知识的交互）。
- agentic search 任务仅用 196 题训练、64 题测试，样本量小，结论的方差未充分报告。

---

## 建议

- **是否推荐使用**：是（作为"上下文与权重联合优化"的方法论参考）
- **适用场景**：具备 RL 后训练算力的团队做自改进智能体；希望把可解释策略沉淀为可读 system prompt 的场景；需要提升"从易到难"泛化的 RL 训练（论文中增益最大处）。
- **值得复现**：否（算力门槛极高）；但"复用 RL rollout 做适应度评估 + TrueSkill 持久化评分"这一工程技巧可低成本借鉴到自研的 prompt 进化流程中。

---

**相关论文**：[[2026-03-11-HCAPO-Hindsight-Credit-Assignment]]
**主题标签**：#LLM #NLP #RL #prompt-evolution #self-improvement
