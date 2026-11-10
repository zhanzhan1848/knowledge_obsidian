---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, latent-reasoning, reasoning, efficiency]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2606.02248
arxiv: 2606.02248
---

# Geometric Latent Reasoning Induces Shorter Generations in LLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Latent Reasoning Induces Shorter Generations in LLMs |
| **作者** | Shashi Kumar, Petr Motlicek, Ina Kodrasi, Andrea Cavallaro 等（Idiap Research Institute, EPFL, BUT） |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.02248) |
| **arXiv** | arXiv:2606.02248 |
| **分类** | cs.CL |
| **代码** | [github.com/idiap/GLR](https://github.com/idiap/GLR)（[项目页](https://glr-llm.github.io/)） |

---

## 核心贡献

> 把潜在推理重新表述为"预训练 token 嵌入空间中的几何路径逼近"问题，提出轻量过渡头 GLR；结果显示模型无需任何长度惩罚就会自发产生显著更短的生成。

1. **几何化表述**：把文本 CoT 视为模型预训练嵌入空间中的一条离散轨迹，假设轨迹周围的局部邻域同样是有意义的中间推理状态，从而避免"无约束隐状态回灌"的分布错配与"外部潜变量模块"的蒸馏依赖。
2. **GLR 轻量过渡头**：在隐藏状态上加一个线性过渡头 `g_φ: R^d → R^d`，预测嵌入空间中的**方向更新（displacement）**而非下一个 token 嵌入本身；训练时用位置折扣的 MSE 把连续更新锚定到真实离散轨迹。
3. **推理期固定步数潜在自回归**：推理时先做固定 K 步连续潜变量更新，再恢复标准文本解码；潜状态始终保留在上下文中供后续生成条件化。
4. **涌现式长度缩短**：在数学推理基准上 GLR 在没有显式长度目标的情况下自发产生更短生成；Qwen3-1.7B 上 CoT-SFT 的正确样本中位生成约 2,000 token，而 GLR-10 / GLR-20 把中位数压到约 350 步。

---

## 技术方案

### 核心思想

GLR 的出发点是：连续思维（把原始隐状态直接回灌）、软 trace 蒸馏、外部潜模块三条路各有痛点——隐状态回灌有嵌入空间错配，蒸馏引入复杂依赖，外部模块与预训练表示几何不对齐。GLR 换了个视角：既然 token 嵌入空间本身承载了有用的计算结构，那就不必另建潜空间，只需学习"沿嵌入空间做小步位移"。训练分两趟前向：第一趟在原始离散序列上前向，收集相邻推理 token 之间的真实嵌入位移 `Δ_k^t` 与过渡头预测的位移 `Δ̂_k^t`；第二趟把离散思维 token 的嵌入替换为第一趟得到的连续潜状态 `ê^t`，模型在此序列上前向，计算最终目标——答案 token 上的标准交叉熵（保住生成能力）+ 把第二趟过渡头输出 `Δ̂̂_k^t` 锚定到真实离散位移 `Δ_k^t` 的过渡损失（位置折扣，允许靠后的潜状态偏离原始文本更多）。推理时从当前隐状态出发做 K 步连续更新（每步把预测位移累加到当前输入嵌入），再接回正常 token 解码。K 控制"连续计算预算 vs 显式生成长度"的分配。

### 关键公式

```math
# CoT 作为嵌入空间轨迹
\mathbf e_i^t=E_{\mathrm{in}}(t_i),\qquad
F_\theta(\mathbf e_i^t+\delta\mathbf e\mid q_{1:n},t_{<i})\approx F_\theta(\mathbf e_i^t\mid q_{1:n},t_{<i})

# 过渡头预测位移
g_\phi:\mathbb{R}^d\to\mathbb{R}^d,\qquad
\Delta\hat{\mathbf e}_i^t=g_\phi(\mathbf h_{i-1}^t)

# 方向归一化与位置折扣的过渡目标
d_\ell^g=v_\ell^g/\|v_\ell^g\|_2
\mathcal{L}_{\mathrm{transition}}=\sum_k \gamma^{\,k}\left\|\Delta\hat{\mathbf e}_k^t-\Delta\mathbf e_k^t\right\|_2^2
```

### 关键组件
- **Latent Transition Head**：单层线性映射 `g_φ`，加在模型隐藏状态上；Qwen3-0.6B 约加 1M 参数、Qwen3-1.7B 约加 4M 参数。
- **Position-Discounted Transition Objective**：允许靠后的潜状态更大程度偏离原文本轨迹。
- **Two-Pass Training Pipeline**：先收集真实位移，再用潜状态替换离散嵌入重跑前向算损失。
- **Fixed Latent-Step Inference**：推理时固定 K 步连续潜变量自回归，之后恢复文本解码。
- **Embedding-Space Geometry Analysis**：用上下文隐状态相似度把潜状态对齐到 CoT 轨迹位置，计算 progress（对齐位置/轨迹长度）与 drift（余弦距离），并用 FutureHit@10 检验最近词表 token 是否能还原参考 token。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 模型 | Qwen3-0.6B、Qwen3-1.7B（均从预训练 checkpoint 初始化） |
| 训练数据 | Open-R1 Mixture-of-Thoughts 数学划分随机采样 10K 条 CoT 轨迹，过滤超 8,192 token 样本 |
| 基准 | GSM8K、MATH500、SVAMP |
| 对比基线 | CoT-SFT（同 10K 轨迹、next-token 交叉熵）；附录 D 另有不冻结嵌入的 CoT-SFT 基线 |
| 长度压缩 | Qwen3-1.7B 上正确样本 CoT-SFT 中位生成约 **2,000 token**，GLR-10 / GLR-20 降至约 **350 步** |
| 预算受限表现 | 在严格受限生成预算下（GSM8K ≤256 步、MATH500 ≤512 步），CoT-SFT 准确率接近 0（轨迹被截断）；GLR 显著更高 |
| 预算充分时 | 最大预算（GSM8K 2048 步、MATH500 4096 步）下 CoT-SFT 恢复并常反超 GLR |
| 潜状态分析 | 正确生成的 progress 在三个基准上都高于错误生成；drift 两者相近；FutureHit@10 < 0.3%（最近 token 投影几乎无法还原对齐窗口内的 token） |

---

## 局限性

- 收益高度依赖生成预算：预算充分时 CoT-SFT 往往反超 GLR，GLR 的优势集中在"输出预算紧张"的场景。
- 实验规模有限（0.6B/1.7B 两个小模型、10K 训练样本、3 个数学基准），未验证更大模型与通用任务。
- 连续潜状态与显式 CoT 的语义可解释性存疑：FutureHit@10 < 0.3% 说明潜状态对应的 token 语义与文本轨迹差异很大，难以直接读出中间推理内容。
- 需要额外前向（两趟训练），训练成本高于标准 SFT。
- 固定步数 K 的最优值随模型与任务变化，论文未给出自动选择机制。

---

## 建议

- **是否推荐使用**：是（作为"潜变量推理"方向的简洁几何化基线）
- **适用场景**：输出 token 预算受限、需要压缩推理链长的推理服务；研究潜在推理/连续计算的表示几何；与 CoT 蒸馏、软 token 方法做对照实验。
- **值得复现**：是（代码与项目页已公开，训练规模小易复现）

---

**相关论文**：[[2026-11-10-SWEET-Spurious-Feature-Weight-Editing]] [[2026-11-10-DAWN-Dependency-Aware-dLLM-Inference]]
**主题标签**：#LLM #NLP #LatentReasoning #Reasoning #Efficiency
