---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, RLVR, post-training, optimization, stability]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10873
arxiv: 2611.10873
---

# BRAT: Bounded Residual-Aligned Training for Stable Multi-Pass LLM Post-Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BRAT: Bounded Residual-Aligned Training for Stable Multi-Pass LLM Post-Training |
| **作者** | Xunlan Zhou, Yuzhe Zhao, Xuhong Huang, Feng Chen, Xuanlin Chen, Lang Feng, Bo An |
| **发表** | arXiv preprint（南京大学、上海交大、港大、南洋理工） |
| **链接** | [原文](https://arxiv.org/abs/2611.10873) |
| **arXiv** | arXiv:2611.10873 |
| **分类** | cs.LG |
| **代码** | 未提供 |

---

## 核心贡献

> BRAT（Bounded Residual-Aligned Training）针对 RLVR 后训练中"同一批 rollout 被复用多轮梯度更新"这一普遍做法，先诊断出**复用会过拟合采样组**（in-sample 到 held-out 的一致性下降近一个数量级），再提出一个连续、有界、无额外超参的替代目标，在四轮复用下避免训练崩溃、限制策略漂移并提升平均精度。

1. **诊断性发现**：度量"由小规模 rollout 组估计出的更新"与"在同 prompt 的 held-out rollout 上 KL 正则化目标"之间的对齐程度，发现该对齐度从 in-sample 到 held-out **下降近一个数量级**（跨三个基座模型），说明重复多轮本质上是在过拟合采样组。
2. **BRAT 目标**：本质是"向采样策略的一个有界重加权做 proximal 更新"。每个 token 的梯度权重随其概率比**线性衰减**、并在信任域边界处**归零**；同时用组中心化奖励的最大幅度做归一化，使优势保持零均值且有界，**不引入任何额外超参**。
3. **对比各类目标的失效模式**：无裁剪更新随策略漂移而崩溃；加负基线（AsymRE）虽避免崩溃但会强化每一个被采样的响应（包括全错组）；PPO 式比率裁剪在边界处突然截断梯度。BRAT 的权重函数在三段区域上连续。
4. **实证**：四轮复用下，BRAT 避免训练崩溃、限制策略漂移，并在多数基准上取得更高平均精度与更低的种子方差。

---

## 技术方案

### 核心思想
由于自回归生成昂贵，RLVR 流水线普遍对同一批采样 rollout 做多次梯度更新以摊销生成成本。论文逐一剖析现有目标在这种"多轮复用"下的失效方式，并把所有目标统一到"组优势 $A_i$"与"token 级乘子 $m(z_{i,t}, A_i)$"两个抽象下比较：RWR/AWR 的优势恒正（无饱和），GRPO 用样本标准差归一化（K=8 时优势范围 $[-2.47, +2.47]$）但乘子为不连续的不裁剪比率，Dr.GRPO 优势范围更窄 $[-0.88, +0.88]$ 却不裁剪，SPO 用会**反向**的比率空间二次/ sigmoid 门，SAPO 用乘性门，AsymRE 通过给基线加负偏移避免崩溃但代价是给所有响应加正向模仿项。BRAT 的两处设计决策回应了这个诊断：第一，**连续的有界 token 权重**——乘子从比率 $\rho=1$ 处线性衰减，在信任半径 $\delta$ 处恰为零，因此梯度不会像 PPO 那样在边界被硬切断，也不会像无裁剪那样持续累积；这一权重形式在"有界重加权"意义下是近端（proximal）更新。第二，**有界优势归一化**——把组中心化奖励除以其最大幅度 $\max(\hat{p}, 1-\hat{p})$（$\hat{p}$ 为组内奖励均值，$R_i\in\{0,1\}$ 二值奖励），使优势落在 $[-1,+1]$，且全对/全错组（$\hat{p}=1$ 或 $0$）的优势恒为零，从而天然不强化无信息的组。两个机制都不需要新的超参。

### 关键公式
```math
A_i^{\mathrm{BRAT}}=\frac{R_i-\hat{p}}{\max(\hat{p},\,1-\hat{p})},
\qquad A_i^{\mathrm{BRAT}}\in[-1,+1],\quad \text{全对/全错组时 } A_i^{\mathrm{BRAT}}=0

m_{\mathrm{BRAT}}(z,A):=1-\mathrm{sign}(A)\cdot\frac{e^{c z}-1}{\delta}
\quad\text{当 } c z \le \delta\ \text{（连续、有界、边界处为 0）}

\ell_{\mathrm{BRAT}}=-A^{\mathrm{BRAT}}\cdot m_{\mathrm{BRAT}}(z_{i,t}, A^{\mathrm{BRAT}}),
\qquad
\frac{\partial \ell_{\mathrm{BRAT}}}{\partial \theta}
=-A^{\mathrm{BRAT}}\,m_{\mathrm{BRAT}}(z_{i,t},A^{\mathrm{BRAT}})\,\nabla_\theta \log\pi_\theta
```

### 关键组件
- **SymMax（对称最大值归一化）**：把组中心化奖励按最大幅度归一化，得到零均值有界优势，无需额外超参。
- **有界残差权重 $m_{\mathrm{BRAT}}$**：随概率比线性衰减、信任域边界归零的 token 级梯度权重，替代 PPO 的硬裁剪。
- **DS（漂移抑制/方向散度约束）**：论文中作为关键组件出现在消融中（BRAT = SymMax + DS），移除 DS 会导致 held-out 序列漂移放大 10 倍。
- **信任半径 $\delta$**：唯一的形状超参，控制权重衰减速度。
- **Held-out alignment 诊断**：以同 prompt 的 held-out rollout 上的 KL 正则化目标为参照，度量每轮更新方向的对齐程度——这是论文的核心诊断工具。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 基准 | 六个数学推理基准共 1,546 题：MATH-500、OlympiadBench、Minerva-Math、AMC 2023、AIME 2024、AIME 2025 |
| 骨干 | Qwen3-8B-Base（诊断部分） |
| 主设置 | 12 轮主设定（384 次更新），四轮复用预算，3 个随机种子，恒定长度归一化 |
| 分布式消融 | 8 GPU × 16 轮（512 次更新）的组件析因、复用深度、信任半径与 token 加权消融 |
| 复用设置 | $p=4$ 次复用、每轮 32 个 mini-batch 步 |
| 主结果 | 在共享四轮复用预算下，BRAT 在**六个基准中的五个**取得最高贪心平均精度；在 Minerva-Math 以及 AMC23/AIME25 的 temperature-1.0 Pass@4 上亦领先（伴随更短响应与更低截断） |
| 对比 GRPO | BRAT 在竞赛任务（AMC23/AIME24/AIME25）的贪心 Pass@1 上全面领先 |
| 梯度范数 | GRPO/Dr.GRPO 的硬裁剪 token 比例上升近 **3×**；BRAT 的 actor 梯度范数从第 1 轮到第 4 轮**持续下降** |
| 漂移诊断 | 移除 DS（SymMax + Linear）会使 Pass 4 时的 held-out 序列漂移比 BRAT 高 **10×** |
| 组件析因 | $p=4$、16 轮时移除 DS 触发多轮训练不稳定；BRAT（SymMax + DS）在 MATH-500、OlympiadBench、Minerva-Math 三个贪心基准与竞赛 Avg@16 上领先 |
| 复用深度 | $p\in\{1,2,4\}$ 中 BRAT 在全部五个指标上**单调改善**（对比 SymMax+Linear 在 $p=2$ 达峰、$p=4$ 退化） |
| 信任半径 | 论文给出 $\delta$ 的消融曲线（MATH-500 Pass@1） |
| 与 SPO/SAPO 对比 | BRAT 在竞赛 Pass@16 保持率上优于 SymDS 与 SAPO 等替代加权方案 |

---

## 局限性

- 诊断依赖"held-out rollout"作为 KL 正则化目标的无偏参照，在真实训练中需要额外生成 held-out rollout，成本不低（论文用缓存提示池做近似）。
- BRAT 的乘子形式在 $\rho$ 远离 1 时线性外推的行为依赖具体形状，超参 $\delta$ 仍需按任务调（虽然比 PPO 类方法参数更少）。
- 实验集中在数学推理任务与 Qwen3-8B-Base 一个骨干，代码生成、多轮 RL、工具使用等场景未验证。
- SymMax 的归一化依赖二值奖励结构（$R_i\in\{0,1\}$），连续/部分奖励下 $A=0$ 的"全对组"性质不再成立。
- 论文为预印本，未见同行评审与开源代码。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：为摊销生成成本而复用 rollout 的 RLVR 训练流水线（尤其是复用轮数 $\ge 4$ 时）；GRPO/Dr.GRPO 训练在多轮复用下出现崩溃或策略漂移时的替代目标；需要控制梯度范数增长、优化更稳的后训练配方。
- **值得复现**：是（改动局限在优势归一化与 token 权重两项，工程量小；其"held-out alignment"诊断本身也可作为独立诊断工具复用到其他 RLVR 论文中）

---

**相关论文**：[[GRPO]], [[Dr-GRPO]], [[SPO]], [[SAPO]]
**主题标签**：#LLM #NLP #RLVR #Post-Training #Stability
