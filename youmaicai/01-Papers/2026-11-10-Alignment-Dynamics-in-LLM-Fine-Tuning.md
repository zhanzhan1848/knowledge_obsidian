---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, alignment, safety, fine-tuning, interpretability]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2605.18309
arxiv: 2605.18309
---

# Alignment Dynamics in LLM Fine-Tuning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Alignment Dynamics in LLM Fine-Tuning |
| **作者** | Yuhan Huang, Huanran Chen, Yinpeng Dong 等 |
| **发表** | arXiv preprint（代码已开源） |
| **链接** | [原文](https://arxiv.org/abs/2605.18309) |
| **arXiv** | arXiv:2605.18309 |
| **分类** | cs.LG, cs.AI |
| **代码** | [github.com/huang-yh20/alignment-dynamics](https://github.com/huang-yh20/alignment-dynamics) |

---

## 核心贡献

> 提出一个可解析求解的 alignment score 并推导其在微调下的闭式更新，把对齐变化统一分解为 **Rebound Force**（回弹力）与 **Driving Force**（驱动力）两种竞争力量，从而统一解释"对齐为何脆弱"以及"再训练为何更快重新对齐"。

1. 定义 alignment score $S(\theta)$（模型生成满足对齐标准的补全的期望概率），并推导其微调下的闭式变化量 $\Delta S$，把参数空间的优化动力学与函数空间的对齐行为桥接起来。
2. **Rebound Force**：由当前对齐状态与模型分布的"窄度"共同决定的内禀回弹项；分布越窄（数据多样性越低）回弹越强，且强对齐与强失配两种极端状态都更易被后续扰动逆转（双向不稳定性）。
3. **Driving Force**：由训练分布与"结果条件后验"（对 aligned / non-aligned 补全的后验）之间的相对对齐程度决定，实质是训练分布在对齐对比方向上的投影。
4. 预测并实证了 **Rehearsal Priming Effect**（预演启动效应）：先前对齐会留下潜在后验印记，使再暴露时有效 Driving Force 被放大、重新对齐显著加速。

---

## 技术方案

### 核心思想
论文把"对齐"从一个模糊的定性概念转为可微、可估计的标量。设策略 $\pi_\theta(\mathbf{y}\mid\mathbf{x})=\prod_l \pi_\theta(y_l\mid\mathbf{x},\mathbf{y}_{<l})$，对齐集合 $\mathcal{A}\subseteq\mathcal{X}\times\mathcal{Y}$（实践中由人类偏好或校准过的 judge 判定），alignment score 定义为模型生成"合规补全"的期望概率。作者进一步把 $\Delta S$ 展开到 token 级，证明一阶变化等价于 logit 更新 $\Delta\mathbf{z}_l$ 在某个对齐对比方向上的投影。由此对齐动态分解为两个竞争项：**Rebound Force** 是模型条件输出分布的自相互作用项——在单位核 $\mathbf{K}=\mathbf{I}$ 的简化下它写作 $-\pi_S^{+}\sum_i\tilde{\pi}_i^{+2}+\pi_S^{-}\sum_j\tilde{\pi}_j^{-2}$，其中平方和 $\sum_i\pi_i^2$ 度量"分布纯净度"（与 Gini impurity 互补），分布越尖锐回弹越强；**Driving Force** 简化为数据分布与对齐对比方向的内积 $\langle\tilde{\boldsymbol{\pi}}^{+}-\tilde{\boldsymbol{\pi}}^{-},\mathbf{p}\rangle$。这一分解直接给出三个可检验预测：先前对齐可被后续微调逆转、后验越窄逆转越强、先前对齐留下的后验印记使再暴露时重新对齐更快。实验采用三阶段 SFT 序列（Forward → Reverse → Re-exposure），在安全对齐、涌现性失配、情感三组设定上验证，并在安全对齐中通过改变数据多样性做受控实验验证"窄度—回弹强度"依赖关系。

### 关键公式
```math
S(\theta):=\mathbb{E}_{\mathbf{x}\sim p(\mathbf{x})}\Big[\sum_{\mathbf{y}\in\mathcal{Y}}
\mathbb{I}(\mathbf{x},\mathbf{y})\in\mathcal{A}\cdot\pi_{\theta}(\mathbf{y}\mid\mathbf{x})\Big]

\pi_{\theta}(\mathbf{y}\mid\mathbf{x})=\prod_{l=1}^{L_y}\pi_{\theta}(y_l\mid\mathbf{x},\mathbf{y}_{<l})

\Delta S=\mathbb{E}_{\mathbf{x}\sim p(\mathbf{x})}\sum_{l=1}^{L_y}\sum_{\mathbf{y}_{<l}}
\big\langle \Delta\mathbf{z}_l,\ \mathbf{K}(\tilde{\boldsymbol{\pi}}^{+}-\tilde{\boldsymbol{\pi}}^{-}) \big\rangle
\ \triangleq\ \mathcal{F}_{\mathrm{drive}}+\mathcal{F}_{\mathrm{rebound}}

\mathcal{F}_{\mathrm{rebound}}\big|_{\mathbf{K}=\mathbf{I}}
=-\pi_{S}^{+}\sum_i\tilde{\pi}_{i}^{+2}+\pi_{S}^{-}\sum_j\tilde{\pi}_{j}^{-2},
\qquad
\mathcal{F}_{\mathrm{drive}}\big|_{\mathbf{K}=\mathbf{I}}
=\big\langle\tilde{\boldsymbol{\pi}}^{+}-\tilde{\boldsymbol{\pi}}^{-},\mathbf{p}\big\rangle
```

### 关键组件
- **Alignment Score（定义 2.1）**：把安全/风格/情感等对齐属性统一为 $[0,1]$ 标量，支撑跨设定的定量比较。
- **Outcome-conditioned posterior $\tilde{\pi}^{\pm}$**：给定对齐/非对齐结果时的条件后验，是 Rebound 与 Driving 两力的共同支点。
- **分布纯净度 $\sum_i \pi_i^2$**：作为"窄度"的量化指标，连接数据多样性与回弹强度。
- **三阶段 SFT 实验协议**：Forward（达成目标对齐态）→ Reverse（在反转/无关分布上扰动）→ Re-exposure（重新暴露），并通过 Stage 1 的 SFT 步数控制"暴露深度"。
- **窄度受控实验**：在安全对齐中系统性改变微调数据多样性，检验回弹强度对后验窄度的依赖。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 实验设定 | 安全对齐、涌现性失配（emergent misalignment）、情感三组 |
| 序列协议 | Stage 1 Forward → Stage 2 Reverse → Stage 3 Re-exposure 三阶段 SFT |
| Rebound Effect | 三种设定下均一致观察到：先前对齐被后续微调逆转 |
| Rehearsal Priming Effect | 一致成立：Stage 1 暴露越深，Stage 3 重新对齐越快；跨数据集与跨模型架构同趋势 |
| 窄度依赖性 | 受控实验中回弹强度随后验变窄而增强，与理论预测一致 |
| 独立变量 | Stage 1 的 SFT 步数（暴露深度） |
| 理论一致性 | 论文称 alignment score 与实践度量的形式对应关系及其估计误差在附录中给出 |

---

## 局限性

- alignment score 依赖对齐集合 $\mathcal{A}$ 的判定来源（人类偏好或校准 judge），本质上仍是代理指标而非真实对齐。
- 理论推导基于 RSK 类假设与一阶（线性化）近似，未刻画大参数更新或强非线性情形。
- 实证以"模型被微调后回退到预训练分布"为主要机制观察对象，对 RLHF/DPO 等偏好优化阶段的对齐演化覆盖不足。
- 论文未给出量化的数值结果表（正文以趋势性结论与图示为主），复现需依赖代码与附录。

---

## 建议

- **是否推荐使用**：是（作为解释性框架与实验设计参考）
- **适用场景**：安全对齐韧性评估、"为何微调会破坏对齐"类问题的归因分析、再对齐（re-alignment）策略设计、Rehearsal Priming 现象的复现与扩展。
- **值得复现**：是（代码已开源，理论框架清晰，适合作为 alignment dynamics 的基础参考实现）

---

**相关论文**：[[RLHF]], [[Catastrophic-Forgetting-in-LLMs]], [[Alignment-Erosion]]
**主题标签**：#LLM #NLP #Alignment #Safety #Interpretability
