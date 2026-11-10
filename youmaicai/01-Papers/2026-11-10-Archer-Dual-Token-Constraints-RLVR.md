---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, RLVR, entropy, post-training, reasoning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2507.15778
arxiv: 2507.15778
---

# Stabilizing Knowledge, Promoting Reasoning: Dual-Token Constraints for RLVR

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stabilizing Knowledge, Promoting Reasoning: Dual-Token Constraints for RLVR |
| **作者** | Runze Liu, Jiakang Wang, Fuzheng Zhang, Xiu Li, Guorui Zhou, Kun Gai, Ling Pan 等 |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2507.15778) |
| **arXiv** | arXiv:2507.15778 |
| **分类** | cs.CL |
| **代码** | [github.com/wizard-III/ArcherCodeR](https://github.com/wizard-III/ArcherCodeR) |

---

## 核心贡献

> 提出 Archer：**保留跨 token 类型的联合优化**（而非像 mask/异步训练那样割裂 token），而是通过"响应级熵归一化 + 差异化裁剪范围 + 差异化 KL 正则"来调节不同 token 的更新强度，从而在保护知识 token 的同时促进推理 token 的探索。

1. 反驳"高熵 token（推理）与低熵 token（知识）应被隔离优化"的既有做法，主张保留跨类型的训练信号可带来更有效的学习。
2. **响应级熵归一化**：对 token 熵做 per-response 归一化，使 token 分类在不同长度、不同序列熵尺度下保持稳定。
3. **双 token 约束**：高熵（推理）token 使用**更宽的裁剪范围**与**更小的 KL 系数**以鼓励探索；低熵（知识）token 使用**更窄的裁剪范围**与**更大的 KL 系数**以保护基座模型的事实记忆。
4. 在数学推理与代码生成基准上、跨多个模型规模一致优于强基线，同时改善 pass@1 与 pass@K。

---

## 技术方案

### 核心思想
RLVR 已成为提升 LLM 推理能力的标准后训练手段，但现有方法对所有 token 施加统一的优化约束，忽略了 token 角色的异质性：已有研究表明高熵 token 与推理行为紧密相关，而低熵 token 主要编码事实知识；近期方法尝试通过 masking 或异步训练来"隔离"不同 token 的更新。Archer 的立场相反：割裂 token 会破坏序列级依赖，而序列级依赖正是 LLM 推理的根基。做法是保留统一的优势与统一的目标函数，只在**更新强度**上做区分：先计算每个 token 的熵，做响应级归一化后按阈值划分 reasoning / knowledge 两类；然后为两类 token 配置不同的 PPO 裁剪区间 $\varepsilon(e_t^i)$ 与不同的 KL 系数 $\beta(e_t^i)$。论文用"裁剪区域图"解释其机制：在原 GRPO 的裁剪区间 A 之外，Archer 对高熵 token 额外打开区域 E（放宽上界），从而允许更大的策略更新；对低熵 token 则收紧边界（区域 F），抑制对知识记忆的破坏。作者的实验还验证了两个前提：完全去掉 KL 惩罚会导致训练崩溃与性能退化；对包括高熵 token 在内的所有 token 施加统一 KL 惩罚会显著拖慢学习并降低最终性能——这正是需要差异化 KL 的直接证据。

### 关键公式
```math
\mathcal{J}_{\mathrm{Archer}}(\theta)=\mathbb{E}\Big[
\Big(\min\big(r_t^i(\theta)\hat{A}_t^i,\ \mathrm{clip}\big(r_t^i(\theta),\,1-\varepsilon(e_t^i),\,1+\varepsilon(e_t^i)\big)\hat{A}_t^i\big)
-\beta(e_t^i)\,\mathbb{D}_{\mathrm{KL}}(\pi_\theta\|\pi_{\mathrm{ref}})\Big)\Big]

\varepsilon(e_t^i)=\varepsilon_{\mathrm{low}}\ \ \text{if } e_t^i < \tau
\quad;\quad
\varepsilon(e_t^i)=\varepsilon_{\mathrm{high}}\ \ \text{if } e_t^i \ge \tau
\qquad(\varepsilon_{\mathrm{high}}>\varepsilon_{\mathrm{low}})

\beta(e_t^i)=
\begin{cases}
\beta_{\mathrm{knowledge}} & e_t^i < \tau \quad\text{(更强 KL，保知识)}\\
\beta_{\mathrm{reasoning}} & e_t^i \ge \tau \quad\text{(更弱 KL，促探索)}
\end{cases}
\qquad(\beta_{\mathrm{knowledge}}>\beta_{\mathrm{reasoning}})
```

### 关键组件
- **响应级熵归一化（response-level entropy normalization）**：消除序列长度与整体熵尺度对 token 分类的影响，得到稳定的两类划分。
- **熵阈值 τ**：划分 reasoning token / knowledge token 的分界。
- **差异化裁剪范围 $\varepsilon(e_t^i)$**：高熵放宽（Region E），低熵收紧（Region F）。
- **差异化 KL 系数 $\beta(e_t^i)$**：知识 token 强 KL 锚定参考策略，推理 token 弱 KL 允许偏离。
- **GRPO 基座**：全部实验基于 GRPO 目标做增量改造，保留其优势归一化与联合优化结构。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 基准模型 | DeepSeek-R1-Distill-Qwen-1.5B、Qwen3-4B、Qwen3-8B、Qwen3-30B-A3B（Qwen3 用 non-thinking 模式） |
| 数学基准 | AIME24、AIME25、AMC23、MATH-500、OlympiadBench、Minerva-Math（六个，共 1,546 题） |
| 代码基准 | LiveCodeBench v5（2024.08.01–2025.02.01）、v6（2025.02.01–2025.05.01） |
| 采样设置 | 每 prompt 16 条 rollout，temperature 1.0；最大响应长度 32,768（R1-1.5B）/ 8,192（Qwen3-4B、30B-A3B）/ 6,144（Qwen3-8B）；batch 64，mini-batch 32 |
| pass@K 设置 | AIME24/25 与 AMC23 用 K=64；LiveCodeBench v6 用 K=16；v5 与 Minerva 用 K=8；MATH-500 与 OlympiadBench 用 K=4 |
| 验证器 | DeepScaleR + Math-Verify 的验证函数 |
| 相对基座模型 | R1-Distill-Qwen-1.5B 基座之上，AIME24 与 AIME25 平均准确率提升，LiveCodeBench v5 与 v6 平均提升（论文给出具体百分点，正文以文字表述） |
| 相对 GRPO | 在**所有基准**上一致超过 GRPO，数学与代码任务分别取得显著平均增益；应用于 Qwen3-4B 与 Qwen3-8B 时仍大幅领先 GRPO |
| 对比 SOTA 开源推理模型 | 代码任务上超过全部可比模型，包括编程专用模型（正文给出训练成本对比表） |
| 消融 | 受控 masking 消融（Qwen3-4B）：以六个数学基准的 avg@K 均值为指标，比较纯 masking 路线 |
| 关键结论 | 完全移除 KL 惩罚 → 训练崩溃与性能退化；统一 KL 惩罚（含高熵 token）→ 学习显著变慢、最终性能下降 |

---

## 局限性

- token 类型的划分依赖熵阈值这一启发式代理，尽管做了响应级归一化，仍可能误分类中等熵的 token。
- 差异化裁剪/系数引入了额外超参（τ、$\varepsilon_{\mathrm{low/high}}$、$\beta_{\mathrm{knowledge/reasoning}}$），相对 GRPO 增加调参负担。
- 实验集中在数学与代码这两个有明确验证奖励的领域，开放式生成（对话、创意写作）中"知识 token"与"推理 token"的边界更模糊，泛化性未验证。
- 高熵 ⇄ 推理、低熵 ⇄ 知识的对应关系本身是经验观察，论文未对其在不同模型/规模上的稳健性做系统刻画。
- 与"隔离 token 更新"的直接对比主要通过 masking 消融进行，部分对比结论受基线实现细节影响。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：GRPO/RLVR 训练中的稳定性与性能改进；数学/代码 RLVR 后训练流水线；模型在 RL 后出现灾难性遗忘或事实能力退化时的正则化设计；需要在 pass@1 与 pass@K 上同时获益的高预算训练。
- **值得复现**：是（代码已开源；改动局限在 GRPO 损失的裁剪与 KL 项上，实施成本低、收益直接，是"细粒度 RL 约束设计"的高性价比起点）

---

**相关论文**：[[GRPO]], [[RLVR]], [[Entropy-Aware-Tokens]]
**主题标签**：#LLM #NLP #RLVR #Post-Training #Entropy
