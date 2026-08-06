# 🥬 LLM/NLP 每日论文总结 — 2026-08-06

## 概览
- **日期**: 2026-08-06
- **论文数量**: 7 篇
- **领域分布**: LLM Agents (3), Multimodal (2), Optimization (1), Clinical AI (1)

---

## 论文列表

| # | ID | 标题 | 领域 |
|---|-----|------|------|
| 1 | [2608.04066](#260804066) | The LLM Proposes, the Executive Disposes | LLM Agent |
| 2 | [2608.04095](#260804095) | FinPerMA: Personalized Memory for LLM Agents | LLM Agent |
| 3 | [2608.04077](#260804077) | FinProBench: Financial AI Agents | LLM Agent |
| 4 | [2608.04071](#260804071) | MCTS-Report: Table-to-Multimodal Report | Multimodal |
| 5 | [2608.04013](#260804013) | C²MOE: Missing Modality Emotion Learning | Multimodal |
| 6 | [2608.04507](#260804507) | Reputation-Based Cooperation in LLM Agents | LLM Multi-Agent |
| 7 | [2608.04026](#260804026) | Gmake: Trust-region Moment Estimation | LLM Training |

---

## 精选论文

### 2608.04066
**The LLM Proposes, the Executive Disposes: A Self-Verifying Agent Instrument**

**核心贡献**: 提出一种结构化验证框架，将 LLM 与确定性 Executive 分离。LLM 仅提出 typed proposals，承诺机制 (commitment mechanism) 在行动前预先注册预测，由代码对照观察结果验证。引入 shadow reference 机制在 ablation 中也定义 drift 指标。

**关键发现**: 消融 commitment mechanism 导致 goal-abandonment 从 0.00 跳至 1.00，而 binding error 保持 0.00。binding channel 失败被代码层结构性吸收，仅在上游表现为 hypothesis formation collapse。

**意义**: 提供了一种 long-horizon agent 的验证方法论，对 ARC-AGI-3 任务完全无效 (0 level completions)，但其验证框架本身可复用。

---

### 2608.04095
**FinPerMA: Personalized Memory Benchmark for LLM Agents**

**核心贡献**: 提出事件驱动的个性化记忆基准 FinPerMA，使用理论驱动的 deterministic impact rules 生成，Post-Shock checkpoint 评估 agent 是否整合了重大事件到持久化 user model。

**关键发现**: 7 个 frontier LLMs 在所有配置下远未饱和：full-context 配置总体准确率不超过 ~0.47，多选题不超过 ~39%。Summary-based memory 保留事实但丢失偏好信号，simple retrieval 可优于 purpose-built memory systems，shock 后差距扩大。

**意义**: 揭示当前 LLM agents 在长期个性化用户建模上的重大不足。

---

### 2608.04077
**FinProBench: Financial AI Agents with Role-Grounded Rubrics**

**核心贡献**: 提出 Role-Grounded Rubric Construction (RGRC) 流程，从从业者产出物中提取评估标准，替代 prompt-only 或 model-output-based 评估。

**关键发现**: 对于 prior-rich conventional roles，Prompt-only ≈ RGRC (89.2% vs 90.7%)；对于 prior-sparse role-specialized roles，RGRC 大幅领先 (99.1% vs 78.0%)。Human deliverables 平均排名第一 (73.7 vs 70.3/70.2/69.6)。

**意义**: 揭示 prompt engineering 能力受限于模型先验，专业领域的 tacit standards 需要从真实产出中提取。

---

### 2608.04071
**MCTS-Report: Monte Carlo Tree Search for Table-to-Multimodal Report Generation**

**核心贡献**: 将表格→多模态报告生成建模为 MCTS 搜索过程，LLM 生成逐步推理和 action，存储 reasoning trajectory 用于 context-aware 报告构建。multi-dimensional reward 联合评估 factual consistency (SQL)、chart quality、chart-text alignment、structural completeness。

**关键发现**: MMRBench 基准上总体得分 77.9，显著优于强 baseline。

**意义**: 展示了 MCTS + LLM reasoning 在结构化数据报告生成中的有效性。

---

### 2608.04013
**C²MOE: Consistency and Complementarity-guided MoE for Incomplete Multimodal Emotion Learning**

**核心贡献**: 提出信息论框架将多模态知识分解为 consistency 和 complementarity 两个组件，通过 interaction-aware experts 捕获。Consistency branch 最小化不确定性，Complementarity branch 通过 entropy maximization 利用模态独有线索。

**关键发现**: 在多种 missing-modality 设置下持续超越 SOTA 方法。

**意义**: 首次将 consistency + complementarity 引入 missing modality imputation，MoE 架构在此场景有效性得到验证。

---

### 2608.04507
**Emergence of Reputation-Based Cooperation in LLM Agents**

**核心贡献**: 研究 LLM agents 在间接互惠捐赠博弈中的合作演化稳定性。策略以自然语言 prompt 表示，跨代文化传递。

**关键发现**: 4 个 LLM backend 对 free-rider 入侵的鲁棒性差异超过一个数量级。最强预测因子是对手 endowment sensitivity（Image Scoring 机制）。所有模型都无法发展出更鲁棒的 Leading-Eight norms。

**意义**: 揭示 LLM agents 的合作能力被限制在 Image Scoring 级别，多智能体文化演化存在根本性脆弱性。

---

### 2608.04026
**Gmake: A Trust-region Framework for Moment Estimation**

**核心贡献**: 提出 Trust-region 框架统一理解 Adam 等自适应矩估计机制。更新步长由 p∈[2,4] 阶矩约束的 trust-region governed，p=4 涉及类 kurtosis 估计。

**关键发现**: GPT2-124M 在 FineWeb-Edu 和 TinyStories 上，弱 trust-region 约束下 4th-moment 更有优势；强约束下 2nd-moment 竞争力更强。Gmake 统一了解释 normalization、learning-rate scheduling、spectral lowpass filtering as momentum、operator-level spectral normalization。

**意义**: 为 LLM 训练优化器的设计提供了统一理论框架。

---

## 📝 备注
- 本日 cs.CL 旧编号 2608.02609 论文（TabletCraft/Akkadian NMT）实际发布时间早于当日新论文
- cs.NE 论文多与神经形态计算相关，LLM 相关度较低
- 今日 LLM agents 方向论文最多（5篇），体现该方向热度

---
*🥬 油麦菜 — LLM/NLP 研究助手*
