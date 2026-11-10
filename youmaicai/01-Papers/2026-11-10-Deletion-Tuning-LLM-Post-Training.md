---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, post-training, pruning, sparse, continual-learning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10866
arxiv: 2611.10866
---

# The Surprising Effectiveness of Deleting Weights in LLM Post-Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | The Surprising Effectiveness of Deleting Weights in LLM Post-Training |
| **作者** | Zhenbang Yang, Mike Lasby, Tejas Pote, Yani Ioannou, Mengye Ren（NYU、University of Calgary） |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2611.10866) |
| **arXiv** | arXiv:2611.10866 |
| **分类** | cs.LG, cs.CL |
| **代码** | 未提供 |

---

## 核心贡献

> 只需把预训练模型中 **不到 0.05%** 的权重置零（不写入任何新数值），就能在 RLVR、SFT、on-policy 蒸馏三种后训练范式上匹配全参数微调，且适配器体积小数百至上千倍、遗忘显著更少。

1. **Deletion Tuning**：在 transformer block 的 **gate 投影**上学习一个二值掩码（每个权重 1 bit），部署时保留原值或置零——整个适配器就是一个掩码，不写任何新权重值。
2. **三种后训练范式一致成立**：GRPO（RLVR）、标准 SFT、SDFT（self-distillation fine-tuning，on-policy 蒸馏）三条路线上均成立，覆盖两个模型家族、8 个 0.5B–30B 骨干（含 30B MoE），并做 in-distribution 与 out-of-distribution 评测。
3. **紧凑且少遗忘**：掩码比对应 FFT checkpoint 小数百到数千倍（比 LoRA r=1 还小）；RL 下前序任务准确率保持接近基座，而 FFT / LoRA / 随机稀疏微调最多掉 **5.4 个百分点**；forward KL 始终低，与既有"forward KL 预测遗忘"的结论一致。
4. **几何解释**：用 stable rank、spectrum drift、principal-weight overlap 三个几何量分析 RL 下的权重变化，Deletion Tuning 的更新几何比 LoRA 和随机稀疏微调**更接近 FFT**。

---

## 技术方案

### 核心思想

核心问题是"预训练 LLM 要改变多少才能获得新能力？"论文把答案推到极致：只学"哪些权重该删"。在 SwiGLU MLP 中 gate 投影乘法式地控制经 down 投影路由的中间通道，因此被选为掩码目标层。训练时基座 `W` 冻结，每个权重配一个可训练标量 logit `G`（形状与 `W` 相同），前向用 sigmoid 松弛掩码 `W̃ = W ⊘ σ(α(t)·G)`，sharpness `α(t)` 从 10³ 线性升到 10⁴ 把软掩码逐步逼向硬掩码；评测与 on-policy rollout 用硬掩码 `Ŵ = W ⊘ 1[G>0]`。`G` 用 Wanda 一次性剪枝分数初始化（`s_ij = |W_ij|·‖X_j‖_2`，按 η 分位数分别从两个高斯采样），但作者专门做了消融证明增益来自"学会掩码"而非 Wanda 先验本身。论文还从三个几何维度解释其有效性：stable rank（有效秩）、spectrum drift（谱漂移，RL 更新落在主权重之外且基本不改变谱）、principal-weight overlap（与预训练权重 top-magnitude 主成分的重叠度）。

### 关键公式

```math
# 软掩码前向与硬化调度
\widetilde{W}(t)=W\odot\sigma(\alpha(t)G),\qquad \sigma(x)=\frac{1}{1+e^{-x}}
\alpha(t)=\alpha_{\text{start}}+\frac{t}{T}(\alpha_{\text{end}}-\alpha_{\text{start}}),\quad
\alpha_{\text{start}}=10^3,\ \alpha_{\text{end}}=10^4

# 部署用硬掩码
\widehat{W}=W\odot\mathbf{1}[G>0]

# Wanda 先验初始化
s_{ij}=|W_{ij}|\cdot\lVert X_j\rVert_2

# GRPO 优势
A^{i}=\frac{r^{i}-\mathrm{mean}(r)}{\mathrm{std}(r)}
```

### 关键组件
- **Binary Mask over Gate Projection**：目标层为每个 transformer block 的 gate 投影（单个 MLP 权重），每个权重配一个 logit。
- **Mask Sharpening Schedule**：`α` 从 10³ 线性升到 10⁴，使软掩码在训练末尾收敛到硬掩码（部署用硬掩码替代软掩码精度差 ≤ 0.08）。
- **Wanda-Prior Initialization**：以剪枝重要性分数初始化 logit，随后由梯度学习。
- **三种后训练目标**：SFT 负对数似然、GRPO 裁剪策略目标、SDFT 前向 KL 蒸馏损失（教师权重为学生权重的 EMA）。
- **遗忘诊断**：forward KL 与前序任务准确率双指标。
- **几何分析三件套**：stable rank、spectrum drift、principal-weight overlap。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 模型规模 | 8 个骨干，0.5B → 30B，覆盖 Llama 与 Qwen 两个家族（含 Qwen3-30B-A3B MoE） |
| 后训练范式 | GRPO（RLVR）、标准 SFT、SDFT（on-policy 蒸馏） |
| Llama-8B GSM8K（GRPO） | Deletion Tuning **83.55%** vs FFT **83.24%** |
| Qwen-7B SimpleRL-Zoo 六基准均值（GRPO） | Deletion Tuning **52.32%** vs FFT **51.89%** |
| 适配器体积 | 比 FFT checkpoint 小数百至数千倍；比 LoRA r=1 还小 |
| 删除比例 | 置零权重占比 **< 0.05%** |
| 遗忘（RL 下前序任务） | Deletion Tuning 保持接近基座；FFT / LoRA / 随机稀疏微调最多掉 **5.4 个百分点** |
| forward KL | 训练至第 348 步 FFT 的 forward KL 达 1.x；LoRA 与 MTH 也达 0.x，Deletion Tuning 保持低位 |
| Wanda 先验消融 | 同一初始化下，随机稀疏基线相对基座仅提升 ≤4 个百分点，Deletion Tuning 最多提升 **53 个百分点** |
| 难题求解 | GRPO 下能解出基座模型 128 次采样全部失败的题目 |
| 几何一致性 | stable rank / spectrum drift / principal-weight overlap 三项上最接近 FFT |

---

## 局限性

- 仅对 gate 投影做掩码，其他权重矩阵不参与；方法能否推广到全模型掩码未验证。
- 掩码需与基座一同存储（虽然掩码本身只有 1 bit/权重，但推理时仍需完整基座）。
- 掩码不可逆：删除的权重无法在后续训练中恢复，对持续学习场景的长期可塑性存疑。
- Wanda 初始化仍是必需的归纳偏置，随机初始化下的表现未充分讨论。
- 结果依赖 RLVR/SFT/蒸馏的目标形式，对偏好优化（DPO）等场景未验证。
- 论文未提供代码。

---

## 建议

- **是否推荐使用**：是（尤其对持续学习与超低存储适配场景）
- **适用场景**：需要极小适配器体积（边缘部署、模型分发）的后训练；持续学习/灾难性遗忘敏感场景；想在不写新权重值的前提下做 RLVR 的团队；作为"参数高效后训练"的新基线。
- **值得复现**：是

---

**相关论文**：[[2026-11-10-Sequential-MTL-Mental-Health-PEFT]] [[2026-11-10-ZO-RGD-Riemannian-ZO-FineTuning]]
**主题标签**：#LLM #NLP #PostTraining #Pruning #PEFT #ContinualLearning
