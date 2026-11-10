---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, agent-safety, tail-risk, guardrails]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10411
arxiv: 2611.10411
---

# Tail-risk-aware Agent Safety: Constraining Tail Risks Across Multi-step LLM Agent Workflows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Tail-risk-aware Agent Safety: Constraining Tail Risks Across Multi-step LLM Agent Workflows |
| **作者** | Shilong Pan, Zhiliang Tian, Zihan Chen, Wentao Zou, Weiguo Chen, DongSheng Li（国防科技大学计算机学院 PDL Lab） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.10411) |
| **arXiv** | arXiv:2611.10411 |
| **分类** | cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 智能体安全不能只做"每步单独校验"——风险会在步骤间传播；TAS 把工作流建模为安全状态序列，用谱风险度（SRM）度量尾部风险并以共享预算约束，从而压制"低概率高代价"的罕见严重失败而不牺牲正常效用。

1. **工作流级风险传播建模**：把 agent 工作流的每一步表示为安全状态 $h_t$（用户查询、中间输出、安全评估的紧凑风险摘要），形式化为 MDP，动作与中间输出以安全状态为条件，从而追踪风险沿工作流的传播。
2. **尾部敏感的风险度量**：用谱风险度量（Spectral Risk Measure, SRM）对累计成本 $C(\tau)$ 的 $u$-分位数加权积分，权重 $\sigma(u)$ 单调递增并归一化到 $\int_\alpha^1 \sigma(u)du=1$，显式聚焦低概率高代价的尾部。
3. **共享预算约束 + 在线更新**：全工作流共用一个安全预算 $\mathcal{B}$，随工作流推进动态更新剩余预算 $B_t=\mathcal{B}-C_t$；早期高风险转移会挤占后续步骤的预算，从而实现跨步耦合。
4. **采样式经验估计**：因真实风险分布未知，每步采样 $K$ 个候选输出估计经验尾部分布并计算经验 SRM；预算满足则放行、边界则放行但终止工作流、超出则拒绝并回滚重采样（最多 3 次），失败则返回确定性安全回退。

---

## 技术方案

### 核心思想
论文指出已有防御的两类缺口：prompt engineering 与 post-training alignment 只保证"LLM 单步"安全，忽视检索/规划/执行等非 LLM 组件；外部 verification（护栏代理、监控器）虽覆盖全流程，但把每一步独立检查，忽略风险在步骤间的交互传播。TAS 的主张是：应当把整条工作流看成一个安全状态转移序列，用一个共享预算把"跨步传播"纳入考虑；同时由于绝大多数行为安全、少数情形代价极高，平均风险 $\mathbb{E}[C(\tau)]\approx \epsilon C_{tail}$ 会掩盖尾部，用平均约束覆盖尾部又会过度惩罚正常情形。所以改用 SRM 构造尾部敏感的风险分数，并用动态共享预算在线检查每一步是否越界。风险评估器是规则 + LLM API 的混合：规则侧先按工具名、参数、PII/密钥模式、外部目标检查做风险级别预分类，再算非线性特征代价；API 侧由外部 LLM 基于工具名、截断参数、抽取特征与当前上下文返回语义风险分，二者合成最终步级成本 $c_t$。

### 关键公式
```math
（1）步级安全成本与累计成本：
c_t \triangleq c(h_t, a_{t+1}, \tilde{s}_{t+1}) \quad（规则分 + API 语义分合成）
C(\tau) \triangleq \sum_{t=0}^{T-1} c_t,\qquad \tau \sim P_{\pi_\theta}

（2）尾部敏感风险（谱风险度量 SRM）：
M_\sigma\big(C(\tau)\big) \triangleq \int_{\alpha}^{1} \sigma(u)\,F_C^{-1}(u)\,du,
\quad \sigma(u)\ \text{非负单调递增},\ \int_\alpha^1 \sigma(u)\,du = 1
（\alpha 为尾部分位截断点，F_C 为 C(\tau) 的累积分布函数）

（3）共享预算的在线约束：
M_\sigma\big(\Delta C_{t+1}\mid h_t, a_{t+1}\big) \triangleq \int_{\alpha}^{1}\sigma(u)\,F^{-1}_{\Delta C\mid h_t,a_{t+1}}(u)\,du \le B_t,
\quad B_t \triangleq \mathcal{B} - C_t,\ \ \Delta C_{t+1}\triangleq c(h_t,a_{t+1},\tilde{s}_{t+1})

（4）采样式经验尾风险：
\tilde{s}_{t+1}^{(k)} \sim P_\theta(\cdot\mid h_t,a_{t+1}),\quad k=1,\dots,K;
\ c_{t,(1)}\le\cdots\le c_{t,(K)}
\widehat{M}_{\sigma,t} \triangleq \sum_{k=\lceil\alpha K\rceil}^{K} w_k\, c_{t,(k)},\quad
w_k = \frac{\sigma(k/K)}{\sum_{j=\lceil\alpha K\rceil}^{K}\sigma(j/K)}

（5）策略目标：
\max_{\pi}\ J_{\text{util}}(\pi) \triangleq \mathbb{E}_{\tau\sim P_\pi}[U(\tau)]
\ \ \text{s.t.}\ \widehat{M}_{\sigma,t} - \mathcal{B}_t \le 0,\ \forall t
```

### 关键组件
- **安全状态建模**：每步维护 $h_t$（查询、中间输出、安全评估摘要）；MDP 转移以 $(h_t, a_{t+1})$ 为条件生成 $\tilde s_{t+1}$。
- **步级风险评分器**：规则侧（工具名/参数/PII/密钥/外部目标预分类 + 非线性特征代价）+ API 侧（外部 LLM 语义风险分 + 理由）。
- **SRM 尾部度量**：分位截断 $\alpha$ 与单调权重 $\sigma(u)$，归一化后可与预算 $\mathcal{B}$ 直接比较。
- **动态共享预算**：$B_t=\mathcal{B}-C_t$ 随步推进收缩，耦合跨步决策。
- **采样估计**：每步 $K$ 个候选输出估计经验尾部分布；消融显示单样本替换采样会明显变差。
- **三态预算检查**：满足（优先效用）→ 边界（放行但终止工作流）→ 违反（拒绝、回滚到 $h_t$、屏蔽该动作、重采样至多 3 次，仍失败则返回确定性安全回退并终止）。
- **评测**：Agent-SafetyBench（ASB，含 DPI / IPI / POT 攻击）、Agent-SafetyBench 之外的 AgentDojo；骨干含 LlaMA3-70B、Qwen2-72B、GPT-4o、GPT-5.2（以及 8B/7B 小模型）。
- **指标**：ASR（攻击成功率，越低越好）、PNA（benign 效用）、NRP（综合能力，越高越好）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| ASB 平均 ASR（DPI，4 个骨干） | No Def 76.89% → TAS 29.73% |
| ASB 平均 ASR（IPI） | No Def 46.14% → TAS 29.73%（DPI 列最强基线 65.04 / IPI 46.14） |
| 相对 No Defense 的安全提升 | DPI +47.95%、IPI +70.25% |
| 相对此前最强 SOTA 基线的提升 | DPI +24.28%、IPI +20.53% |
| ASB 平均 NRP | No Def 14.29/15.18 → TAS 44.71（DPI/IPI 均最佳） |
| ASB 平均 PNA（效用保持） | TAS 63.63，与 No Def 61.81 接近 |
| Llama3-70B（DPI） | ASR 43.50%（Ours）vs 45.15%（No Def）；IPI 13.95% vs 46.03% |
| GPT-5.2（DPI） | ASR 48.40% vs 65.04%（No Def）；IPI 42.25% vs 58.30% |
| POT 后门攻击平均 ASR | No Def 85.19% → TAS 35.19%（降低 58.69%）；较最强 POT 基线降低 44.64% |
| POT（GPT-4o） | ASR 100.00% → 42.75% |
| Agent-SafetyBench 平均 Safety Score | 较 No Def 提升 61.36%，较最强基线提升 11.41%（GPT-5.2: 0.625 → 0.908） |
| AgentDojo（GPT-4o） | ASR 47.51% → 3.93%（降低最多 91.73%），utility 56.74 → 63.32 |
| AgentDojo（GPT-5.2） | ASR 6.78% → 1.36%，utility 76.91 → 76.43 |
| 消融：去掉共享预算约束（w/o Constr.） | 安全退化最大（Llama3-70B DPI ASR 43.50 → 87.75） |
| 消融：尾部改为平均（w/o Tail） | Llama3-70B DPI ASR 43.50 → 69.75，NRP 32.91 → 14.97 |
| 消融：去掉 SRM 权重（w/o SRM） | ASR 43.50 → 50.50 |
| 消融：去掉 MDP 建模（w/o MDP） | ASR 43.50 → 50.75 |
| 消融：经验估计换成单样本（w/o Samp.） | ASR 43.50 → 66.25 |
| 尾部风险可视化 | 四个骨干上 TAS 曲线稳定停留在左下区域（尾部成本显著低于基线） |
| 效用-安全权衡 | 增大 $\mathcal{B}$ 或减小 $\alpha$ 提升效用但降低安全，趋势在四个骨干上一致 |
| 显著性 | 所有改进在双侧精确 McNemar 检验下显著（p<0.01） |

---

## 局限性

- 依赖规则 + LLM API 混合的风险评估器，可能带有偏置并损害风险估计准确性；设计更无偏、更泛化的评估器仍是开放问题。
- 相比多数基线仍有轻微良性任务效用损失，并引入额外计算开销（采样 K 个候选 + 风险评估），对延迟或效用要求严格的用户需要仔细调参。
- 风险预算 $\mathcal{B}$ 与分位截断 $\alpha$ 需按场景调参，论文只给出定性趋势（预算↑/α↓ → 效用↑、安全↓），未给出自动选择机制。
- 攻击设置相对集中（DPI / IPI / POT + AgentDojo），对更复杂的多步组合攻击或自适应攻击（攻击者知道护栏机制）的鲁棒性未验证。
- 尾部风险的定义依赖步级成本的标定方式（规则分与 API 分的合成），成本标定偏差会直接改变被抑制的"尾部"含义。
- 社会影响两面性：若评估器有偏，可能对良性任务产生不必要的拒绝，同时漏掉真实的高风险行为。

---

## 建议

- **是否推荐使用**：是（作为多步智能体安全防护的设计范式）
- **适用场景**：工具调用 / 多步工作流型智能体的线上防护层；需要区分"罕见灾难"与"常态小错"的安全预算设计；把单步护栏升级为工作流级风险管控的工程改造。
- **值得复现**：是（算法清晰、可在 Agent-SafetyBench 上直接跑；核心可迁移组件是"共享预算 + 尾部敏感度量"这一思想，而非具体实现）

---

**相关论文**：[[2026-03-12-AI-Agent-Security]]
**主题标签**：#LLM #NLP #agent-safety #tail-risk #guardrails
