---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, reasoning, mechanistic-interpretability, robustness]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10974
arxiv: 2611.10974
---

# SWEET: Mitigating Spurious Feature Reliance in LLM Reasoning via Weight Editing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SWEET: Mitigating Spurious Feature Reliance in LLM Reasoning via Weight Editing |
| **作者** | Lucas Zhao, Michalis Korakakis, Mengru Ding, Lukasz Szpruch, Yue Zhang 等 |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.10974) |
| **arXiv** | arXiv:2611.10974 |
| **分类** | cs.CL, cs.LG |
| **代码** | 未提供 |

---

## 核心贡献

> 提出训练无关的 SWEET 方法，用反事实干预 + 机制可解释性定位并"抹除"驱动长链式思维伪推理的权重，成功把模型在扰动输入上的鲁棒性差距从 17.6% 压到 2.5%。

1. **反事实方向提取**：把"加无关干扰项"视为对任务无关属性的反事实干预，从原始问题与其反事实变体的激活对比中，分别提取**token 级（TL）**与**序列级（SL）**两类行为方向，捕捉局部（过度整合无关条件）与全局（过度思考）两类伪推理模式。
2. **方向性权重正交化**：用方向性归因（directional attribution）排序出负责的 MLP 神经元与注意力头，再通过权重正交化 `W' = (I - d d^T) W` 直接抹掉它们沿该方向的贡献——**一次编辑，无需训练、无需推理期激活干预**。
3. **极低数据量 + 强泛化**：仅用 **20 对**原始-反事实样本提取方向，即可在 5 个开源推理模型 × 5 个推理基准上把扰动输入准确率平均提升 **11.8 个百分点**，原始输入提升 **2 个百分点**。
4. **机制层面归因**：识别出"过度整合无关条件（over-integration）"与"过度思考（overthinking）"两种反复出现的伪推理模式，并用因果干预证明抑制对应方向即可同时消除这两种行为。

---

## 技术方案

### 核心思想

SWEET 分五步：（1）**构造配对**——用 NoOp 在原问题上追加无关信息得到答案不变的扰动版本，让目标模型分别作答，只保留"原题对、扰动题错"的配对，最多取 20 对作为方向提取集（提取集与校准集均与最终评测集不相交）。（2）**方向提取**——token 级方向用 teacher forcing 在同一推理轨迹前缀下比较两个提示下的 next-token KL 散度，选取散度最高的位置求激活差均值；序列级方向对各自独立生成的完整轨迹做均值池化后求差。为提升估计稳定性，用维度级归一化 `V = μ ⊘ (σ + λ·med(σ))` 抑制跨样本方差大的维度。（3）**组件排序**——对每个方向，用 `(d)^T c_u(s)` 给所有注意力头与 MLP 神经元打分，头与头比、神经元与神经元比，各有独立预算 τ。（4）**权重编辑**——对入选组件的输出权重做正交化投影，使其沿该方向的输出分量严格为零，其余分量不变；未被选中的组件完全不动。（5）**稀疏度校准**——在与测试集不相交的校准集上选择编辑预算 τ。

### 关键公式

```math
# 稳定化归一化（维度级）
\mathcal{V}_\ell[\{\delta_{\ell,i}\}_{i=1}^{N}]
=\mu_\ell\oslash\bigl(\sigma_\ell+\lambda\operatorname{med}(\sigma_\ell)\bigr)

# Token 级方向
\delta_{\ell,i}^{r}=\frac{1}{|S_i^r|}\sum_{t\in S_i^r}\left[h_\ell(x_i^p,y_{i,<t}^r)-h_\ell(x_i^o,y_{i,<t}^r)\right]
v_\ell^{\mathrm{TL}}=\frac{1}{2}\sum_{r\in\{o,p\}}\mathcal{V}_\ell[\{\delta_{\ell,i}^r\}_{i=1}^{N}]

# 序列级方向
\bar h_{\ell,i}^r=\frac{1}{T_i^r}\sum_{t=1}^{T_i^r}h_\ell(x_i^r,y_{i,\le t}^r),\quad
v_\ell^{\mathrm{SL}}=\mathcal{V}_\ell[\{\bar h_{\ell,i}^p-\bar h_{\ell,i}^o\}_{i=1}^{N}]

# 方向性归因与组件选择
A_u^g(s)=(d_\ell^g)^\top c_u(s),\qquad
\bar A_u^g=\frac{1}{M_g}\sum_q\frac{1}{|\mathcal C_q^g|}\sum_{s\in\mathcal C_q^g}A_u^g(s)
\mathcal{E}_{g,m}(\tau)=\mathrm{Top}_k(\mathcal{U}_{g,m}^+;\bar A^g),\quad k=\max(1,\lfloor\tau|\mathcal{U}_{g,m}^+|\rfloor)

# 方向性权重编辑（正交化）
W_u'=\left(I-d_\ell^g(d_\ell^g)^\top\right)W_u
\quad\Rightarrow\quad (d_\ell^g)^\top c_u'=0
```

### 关键组件
- **Original–Perturbed Pair Construction**：基于 NoOp 的答案保持型扰动，保留"原对扰错"的困难配对。
- **Token-Level (TL) Direction**：定位局部"把无关条件并入推理"的位置级行为。
- **Sequence-Level (SL) Direction**：定位全局轨迹级行为（如反复怀疑、回答过长）。
- **Directional Attribution**：沿方向对每个组件打分，超越简单的直接 logit 归因。
- **Orthogonalization-based Weight Editing**：一次性权重修改，无需训练，可直接部署到后续所有问题。
- **Sparse Calibration**：在校准集上选 τ（主结果用 TL-MLP25 / SL-Attn100 预算）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 模型 | DeepSeek-R1-Distill-Qwen-1.5B / -7B / -32B、DeepSeek-R1-Distill-Llama-8B、Qwen3-4B（5 个开源推理模型） |
| 基准 | Math500、AMC、Gaokao-Math、AIME（2024–2026 共 90 题）、GSM-Symbolic（5 个基准，含 NoOp 扰动版） |
| 扰动输入准确率提升 | 平均 **+11.8 个百分点**（五模型平均 NoOp 准确率 61.1–65.5% vs 基线最高 60.1%） |
| 原始输入准确率提升 | 平均 **+2 个百分点** |
| 相对差距缩减 | 从 **17.6% 降到 2.5%**（32B 模型 11.9%→3.0%；8B 模型 23.1%→2.9%） |
| 32B 最优（SL+TL） | NoOp 准确率 **75.7%**，Orig **78.1%**，比最强基线 Steer2Edit 高 4.7 / 5.1 个百分点 |
| 8B 最优 | NoOp 准确率 **61.5%**（SL 达 65.6% Orig），比 Steer2Edit 高 5.1 个百分点 |
| 方向消融 | 联合编辑比单一方向在 NoOp 上再高 3.1（32B）/ 2.5（8B）个百分点 |
| 对比基线 | Base、Steering（激活引导）、ThinkEdit、Steer2Edit；过思考基线含 Budget forcing、DEER、SEAL、Chain-of-Draft |

---

## 局限性

- 方向提取仍需少量"原题对/扰动题错"的对照样本（最多 20 对），构造这些样本本身需调用目标模型，扰动方式目前依赖 NoOp 这一特定范式。
- 预算 τ、λ 等超参需在校准集上选取，跨模型迁移性有限（32B 与 8B 上 TL/SL 的相对优劣不同）。
- 编辑作用于注意力头与 MLP 神经元输出权重，属于结构化后处理，对未见过的伪推理模式（如非"过度整合/过度思考"类）可能无效。
- 个别基准上存在权衡：Llama-8B 在 GSM-Symbolic 上的 Orig 准确率从 73.5% 降到 71.3%。
- 论文未提供代码仓库，复现需自行实现方向提取与正交化编辑流程。

---

## 建议

- **是否推荐使用**：是（对关注长 CoT 鲁棒性与机制可解释性的研究者尤有价值）
- **适用场景**：LLM 推理对无关干扰敏感（prompt 注入式干扰、题目改写）的排查与修复；需要"可解释 + 可干预"的模型调试流程；不想重新训练模型但想提升鲁棒性的场景。
- **值得复现**：是

---

**相关论文**：[[2026-11-10-Deletion-Tuning-LLM-Post-Training]] [[2026-11-10-GLR-Geometric-Latent-Reasoning]]
**主题标签**：#LLM #NLP #Reasoning #MechanisticInterpretability #Robustness #WeightEditing
