---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, security, auditing, billing, reasoning-models]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2605.30040
arxiv: 2605.30040
---

# Token Inflation: How Dishonest Providers Can Overcharge for Large Language Model Usage

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Token Inflation: How Dishonest Providers Can Overcharge for Large Language Model Usage |
| **作者** | Shahinul Hoque, Jinghuai Zhang, Jinyuan Sun, Fnu Suya |
| **发表** | arXiv preprint（University of Tennessee, Knoxville + UCLA） |
| **链接** | [原文](https://arxiv.org/abs/2605.30040) |
| **arXiv** | arXiv:2605.30040 |
| **分类** | cs.CR, cs.AI, cs.CL |
| **代码** | 未提供 |

---

## 核心贡献

> 揭示"按 token 计费"在设计上就难以审计，并给出**信任悖论（trust paradox）**：任何审计都必须信任某个工件，而现有框架恰恰信任那些供应商最有动机操纵的工件；三个近期审计框架都可被系统性地吹大计费 token 数。

1. **结构化分析**：提出 **proxy gap（代理鸿沟）**——满足审计器的检查并不等于证明上报 token 确实被生成过；配合 **provider-control** 条件构成两个结构性弱点，超越任何单一审计器的实现缺陷。
2. **CoIn 攻击**：复用或伪造看似合理的推理块，最高实现 **1,469% 的平均 token 数膨胀且不被检测**；按当前前沿推理模型价格，同一查询上 $100 的诚实账单可变成约 **$1,569**。
3. **PALACE 攻击**：通过答案改写（+30.30% 长变体 / +16.62% 冗长变体）、触发 token、辅助训练数据投毒、以及对审计器本身的后门（99.91% 触发样本平均膨胀 **247.16%**）操纵审计器的"预测推理长度"。
4. **统计审计器攻击**：利用乘性 martingale 聚合的非线性，通过对部分样本"少报"来对冲"多报"，即使推理字符串完全可见，仍可实现 **50.85% 的净膨胀**而不触发检测。
5. **防御评估**：逐一测试"自然防御"（拒绝重复哈希、预归一化答案、异常值过滤、偏差校正）并给出适应性攻击绕过；结论是只有把 token 数绑定到**供应商不可控的证据**（可信执行证明、推理的密码学证明、第三方重执行）才能真正消除两个条件。

---

## 技术方案

### 核心思想
威胁模型设定为不透明 LLM 服务：用户提交 prompt $P$，收到最终答案 $A$，并按供应商上报的 token 数 $m$ 计费；供应商内部可能生成用户看不到但被计入账单的隐藏推理轨迹 $R$。供应商观测 $(P, R, A)$，用户通常只观测 $(P, A, m)$。由于商业 API 为保护 IP、缓解越狱、保留隐私而隐藏模型、tokenizer 与执行过程，审计者只能检查供应商提供的证据——这退化为对供应商自身报告的一致性检查，即信任悖论。论文把这一弱点形式化为两个条件：**条件 (i) proxy gap**（审计器接受的报告多于真实生成的 token）与**条件 (ii) provider control**（被审计证据由被审计方控制）。随后在三个框架上分别给出"朴素攻击 → 自然防御 → 适应性攻击"的三段式演示：CoIn 用 256-token 分块的 T2B（块→答案）与 B2A（答案→块）相似度打分器验证推理块，攻击者复制块、加少量 token 扰动以规避重复哈希检测、用 CoIn 自己的分数挑选最对齐的块重复、用 GCG 离线构造对抗样本再训练一个小生成器以摊销优化成本；PALACE 用学得的预测器从答案预测隐藏推理长度，攻击者改写答案表面形式、投毒辅助训练数据、或给审计器植入后门；统计审计器用乘性 martingale 统计量聚合逐样本偏差，攻击者对绝大多数样本做微小少报、对每第十个样本做大量多报，抵消审计统计量的漂移。

### 关键公式
```math
\text{Martingale statistic: }\quad
\mathcal{M}_t=\prod_{s\le t}\big(1+\lambda\, d_s\big)-1,
\qquad d_s=\hat{m}_s-\mathbb{E}[\hat{m}_s]

\text{Net inflation}=\frac{\sum_s \hat{m}_s-\sum_s m_s^{\text{honest}}}{\sum_s m_s^{\text{honest}}}
\]

### 关键组件
- **CoIn**（Sun et al. 2025a）：基于 256-token 分块的推理块语义验证器，含规则阈值验证器与学习式（RNN）验证器。
- **PALACE**（Wang et al. 2025）：用 domain-adapted 审计器从答案预测隐藏推理长度，标记与预测偏离的报告。
- **Martingale-based statistical auditor**（Velasco et al. 2025a）：乘性聚合逐样本偏差的非线性统计检验。
- **攻击工具**：GCG（对抗块生成）、T5 小生成器（摊销伪造块生成）、Qwen3-14B（答案风格改写）、后门投毒（辅助数据 + 触发器）。
- **防御族**：① 消除 provider-control（如让审计器在供应商 commit 之后随机选择打分器、禁止供应商预跑审计）；② 缩小 proxy gap（pairwise 分数差检测、答案风格/重复度/计费异常检测、偏差校正、双侧检验）；③ 绑定到不可控证据（可信执行证明 attested inference、推理的密码学证明、第三方重执行）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 被攻击框架 | 3 个：CoIn、PALACE、martingale-based statistical auditor |
| CoIn 最高膨胀 | **1,469%** 平均（最宽松设定），未被检测 |
| CoIn 朴素复制攻击 | 549.9% 平均膨胀 |
| CoIn 重复哈希防御被绕过 | 插入少量合法 token 扰动后仍达 536.8% |
| CoIn 用自身分数选块 | 1,004.0% |
| CoIn 用 GCG 训练的 T5 生成器 | 770.0%（一次性离线优化成本摊销） |
| PALACE 答案改写 | 长变体 +30.30%、冗长变体 +16.62% 的预测推理长度 |
| PALACE 后门 | 99.91% 的触发样本被污染，平均膨胀 **247.16%** |
| 统计审计器 | 每十分之一样本膨胀 10,000 token、其余样本少报 41 token，1,000 样本跨度上实现 **50.85%** 净膨胀且未触发检测 |
| 少报偏移需求 | 注入膨胀 1,000→10,000 token 时，规避检测所需最小偏移仅从 24 增至 41 token |
| 账单影响 | $100 诚实账单 → 约 $1,569 |
| 数据集 | Glaive reasoning-v1-20m（CoIn 与 PALACE）、Medical-R1-Distill-Data（martingale 审计主实验） |
| 硬件 | 单机 AMD EPYC 7713 + NVIDIA A100 40GB |
| 防御评估 | pairwise 分数差检测在 1-token 修改下检出 95%（FPR 7.4%），10-token 修改下降至 56%；CoIn 审计器后置随机选打分器可使伪造块通过率从 73% 降至至多 28% |

---

## 局限性

- 只研究了三个具体审计框架，论文明确声明这**不构成"鲁棒审计协议不可能设计"的证明**，而应被解读为现有机制与类似方法的结构性弱点证据。
- 假设动机为经济利益、行为独立的供应商；排除了审计者串通、用户操纵与"诚实的过度推理"（后者是效率问题而非计费诚实问题）。
- 未实现 enclave metering、attested inference、密码学证明等最终防御，仅作为讨论方向。
- 依赖供应商实际控制 tokenizer 与执行的前提；若可获得独立 token 计数（如客户端侧 tokenizer）则攻击面显著收窄。
- 攻击的经济可行性对 CoIn 场景有讨论（GCG 在线成本可能超过诚实推理，故用小模型摊销），但未做完整的收益模型。

---

## 建议

- **是否推荐使用**：是（作为审计设计与供应商信任评估的必读参考）
- **适用场景**：企业采购 LLM API 时的计费审计设计；评估自研"隐藏推理 token 计数"审计器的抗攻击性；推理模型 API 的供应商风险评估；TEE / 可信执行证明方案的动机论证。
- **值得复现**：是（攻击代码复用度高，martingale 偏移攻击实现简单且效果显著；防御侧的"审计器后置随机化"与"pairwise 分数差检测"最值得直接落地测试）

---

**相关论文**：[[LLM-Judge-Reliability]], [[Attested-Inference]], [[Reasoning-Model-Billing]]
**主题标签**：#LLM #NLP #Security #Auditing #Token-Billing
