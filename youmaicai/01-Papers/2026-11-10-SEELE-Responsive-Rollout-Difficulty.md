---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, RLVR, curriculum, reasoning, math]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2509.06923
arxiv: 2509.06923
---

# Staying in the Sweet Spot: Boost Reasoning Evolution via Responsive Rollout Difficulty Manipulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Staying in the Sweet Spot: Boost Reasoning Evolution via Responsive Rollout Difficulty Manipulation |
| **作者** | Ziheng Li, Zexu Sun, Jinman Zhao, Erxue Min, Yongcheng Zeng, Hui Wu, Hengyi Cai, Shuaiqiang Wang, Dawei Yin, Xu Chen, Zhi-Hong Deng（北大、百度、多伦多大学、中科院自动化所） |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2509.06923) |
| **arXiv** | arXiv:2509.06923 |
| **分类** | cs.LG |
| **代码** | [github.com/ChillingDream/seele](https://github.com/ChillingDream/seele) |

---

## 核心贡献

> 理论证明 RLVR 的学习效率上界与 rollout 准确率呈二次关系并在 50% 处取峰，据此提出 SEELE：逐样本、实时地计算最优提示长度，把每道题动态调进"甜区"，在六个数学推理基准上比 GRPO 高 10.0 分、比 SFT 高 8.4 分。

1. **理论刻画**：形式化问题难度对 RLVR 学习效率的影响——量化 loss 下降幅度与 rollout 准确率的关系，证明学习效率上界关于 rollout 准确率是**二次曲线**，在 **50% 准确率**处取最大值（过难 → 奖励塌成 0；过易 → 优势值趋 0）。
2. **SEELE 框架**：把每个训练样本按需追加"提示"（完整解答的前若干步）以降低难度，且**为每一道题单独计算提示长度**，而非所有题统一用一个固定比例。
3. **IRT 驱动的实时难度预测**：把 rollout 采样分成多轮，用**项目反应理论（IRT）**模型拟合历史轮的 (准确率, 提示长度) 配对，预测下一轮使准确率达到目标 `a*`（≈50%）所需的提示长度。
4. **实例级、与模型能力同步的难度对齐**：难度随模型能力演化实时调整，取代既有 hint 方法"静态且无差别施加 off-policy 引导"的缺点。

---

## 技术方案

### 核心思想

RLVR 的效率高度依赖数据难度与模型能力的匹配：题太难，模型采样不出正确解，奖励全为 0，没有梯度；题太易，几乎全对，组内优势值接近 0，也没有学习信号。既有监督辅助方法（LUFFY、SRFT 把 off-policy 轨迹混入 rollout；UFT、TAPO、StepHint、Hint-GRPO、Prefix-RFT 追加解答前缀）虽能调节难度，但提示长度是**静态、无差别**的——难题提示不够仍学不动，易题提示过度反而阻碍模型形成自己的推理模式。SEELE 的做法是先从理论上确定"甜区"在哪：把"难度"量化为模型在该题上的预测准确率 `a_θ(x)`，分析 loss 下降幅度与 `a_θ(x)` 的关系，得到效率上界在 `a_θ(x)=0.5` 处最大。实现上，把 rollout 生成拆成若干轮；每轮用上一轮积累的 (hint 长度 → 准确率) 数据点拟合一个 IRT 回归模型 `f_φ`，预测当前题目达到目标准确率 `a*` 所需的提示长度 `l(i)`，再以该前缀作为 off-policy 引导追加到原题后参与 rollout，采样得到的奖励用于更新策略，同时也把新数据点喂回 IRT 模型。论文的分析基于 Dr.GRPO 的未归一化优势形式。

### 关键公式

```math
# RLVR 目标
\mathcal{L}(\theta)=\underbrace{-\mathbb{E}_{x\sim\mathcal{D},\,y\sim\pi_\theta(\cdot|x)}[A_{\theta_{old}}(x,y)]}_{\mathcal{L}_{pol}}
+\beta\underbrace{\mathbb{E}_{x\sim\mathcal{D}}[\mathrm{D}_{KL}(\pi_{\theta_{ref}}(\cdot|x)\|\pi_\theta(\cdot|x))]}_{\mathcal{L}_{KL}}

# Dr.GRPO 未归一化优势
A(x,y_i)=r(x,y_i)-\mathrm{mean}(\{r(x,y_j)\}_{j=1}^{n})

# 难度度量与效率上界（峰值在 50%）
a_\theta(x)=\mathbb{E}_{y\sim\pi_\theta(\cdot|x)}[r(x,y)]
\quad\Longrightarrow\quad
\text{效率上界}\propto \text{关于 } a_\theta(x)\text{ 的二次函数},\ \arg\max = 0.5

# IRT 难度预测与提示长度选择
f_\phi:\ \text{hint 长度}\ \mapsto\ \text{准确率},\qquad
l(i)=\arg\min_{l}\left|f_\phi(l)-a^*\right|,\quad a^*\approx 0.5
```

### 关键组件
- **Sweet-Spot 理论**：学习效率上界 ∝ 二次函数，准确率 50% 为最优难度。
- **Multi-Round Rollout Sampling**：把 rollout 生成切成多轮，逐轮更新难度预测。
- **IRT-based Accuracy–Hint Model**：用项目反应理论拟合历史轮 (hint, accuracy) 点，预测下一轮提示长度。
- **Instance-Level Hint Length**：逐题计算提示长度，而非全局统一比例。
- **Dr.GRPO 优势形式**：分析基于未归一化优势以消除优化偏差。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 模型 | Qwen2.5-Math-7B、Qwen2.5-1.5B（附录含更多模型） |
| 数学推理基准 | GSM8K、MATH500、Minerva、Olympiad、AIME24、AMC23（6 个） |
| 通用推理基准 | ARC-C、GPQA-D、MMLU-Pro（3 个） |
| Qwen2.5-Math-7B 数学均值 | SEELE **69.7** vs GRPO 60.2 / SFT 52.2 / UFT 66.6 / LUFFY 66.2 / Prefix-RFT 63.5 → **比 GRPO +10.0、比 SFT +8.4** |
| Qwen2.5-Math-7B 通用均值 | SEELE **59.0** vs GRPO 55.7 / SFT 50.4 / UFT 55.6 / Prefix-RFT 56.3 / LUFFY 55.7 |
| Qwen2.5-Math-7B 总均值 | SEELE **58.5**（最佳）vs UFT 57.3 / LUFFY 56.8 / Prefix-RFT 55.8 |
| Qwen2.5-1.5B 数学均值 | SEELE **30.4** vs GRPO 15.2 / SFT 16.4 / UFT 26.6 / LUFFY 16.5 → 提升更显著 |
| Qwen2.5-1.5B 通用均值 | SEELE **34.2** vs GRPO 24.2 / SFT 25.8 / UFT 30.4 |
| Qwen2.5-1.5B 总均值 | SEELE **42.6** vs GRPO 37.7 / SFT 39.9 / UFT 39.4 / Prefix-RFT 38.0 / LUFFY 38.6 |
| 相对最强监督辅助方法 | 平均高 **+3.8 个百分点** |

---

## 局限性

- 依赖每道题的**完整标注解答**以构造提示，适用面受数据集可得性限制。
- 多轮 rollout 采样 + IRT 拟合增加训练开销（论文讨论了额外采样成本，但相比单轮基线仍有代价）。
- 50% 甜区是理论模型给出的结论，实际最优准确率可能随任务与奖励设计而变。
- 提示是解答前缀而非任意自然语言引导，可能导致 off-policy 模仿（over-imitation），模型未必发展出自主推理模式。
- IRT 拟合需要足够多的历史 (hint, accuracy) 观测，早期轮次的预测可能不准。
- 未验证在非数学任务（代码、Agent 任务）上的有效性。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：RLVR 训练中探索效率低下、样本难度与模型能力不匹配的场景（训练初期尤其明显）；拥有高质量解题标注、需要逐题调整难度的大规模 RLVR 流程。
- **值得复现**：是（代码已公开）

---

**相关论文**：[[2026-11-10-Deletion-Tuning-LLM-Post-Training]] [[2026-11-10-GLR-Geometric-Latent-Reasoning]]
**主题标签**：#LLM #NLP #RLVR #Curriculum #MathReasoning #Exploration
