---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, zeroth-order-optimization, riemannian, fine-tuning, PEFT]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10792
arxiv: 2611.10792
---

# Zeroth-Order Riemannian Optimization on Fixed-Rank Manifolds for LLM Fine-Tuning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Zeroth-Order Riemannian Optimization on Fixed-Rank Manifolds for LLM Fine-Tuning |
| **作者** | Xinjue Wang, Xiuheng Wang, Yejun Zhang, Sergiy A. Vorobyov, Esa Ollila（华南理工大学、Aalto University） |
| **发表** | arXiv preprint（32 页，2 图，23 表） |
| **链接** | [原文](https://arxiv.org/abs/2611.10792) |
| **arXiv** | arXiv:2611.10792 |
| **分类** | cs.LG, math.OC |
| **代码** | 未提供 |

---

## 核心贡献

> 把前向-only（零阶）微调重新表述为"在固定秩矩阵流形上优化持久加性更新"，构造黎曼零阶梯度估计器与 ZO-RGD / ZO-RGD-S 两个算法，在 13 个任务上相对 MeZO/LOZO 取得广泛但非全面的优势。

1. **更新即优化状态**：不再用因子分解（`ΔW = BA`，表示非唯一）或限制单步有限差分方向，而是令每个加性更新块 `ΔW_t` 始终留在**固定秩矩阵流形** `M_r^{m×n}` 上——秩约束施加于整个优化轨迹而非单次 ZO 步。
2. **黎曼 ZO 梯度估计器**：把随机矩阵投影到当前切空间，投影会引入依赖秩与层形状的尺度失配，因此再做归一化修正——仅需两次前向、每步无需额外 retraction。
3. **ZO-RGD 与平滑变体 ZO-RGD-S**：前者基于归一化切向估计器做黎曼梯度下降；后者以相同前向代价递归平滑有限差分标量。
4. **理论保证**：证明所实现的"环境有限差分"与其 retraction 后版本在领先阶一致；归一化估计器在期望上恢复黎曼梯度（偏差 `O(ε²)`）；在实现轨迹的适当正则性条件下建立 ZO-RGD 的非渐近收敛保证。

---

## 技术方案

### 核心思想

一阶微调在长上下文场景下显存开销巨大（激活值主导），零阶（ZO）微调只用函数值估计下降方向，无需存储激活，天然适合显存受限微调。现有的低秩 ZO 方法分两支：因子法（LoRA 式 `BA`）因 `(BQ)(Q⁻¹A) = BA` 表示非唯一而使优化冗余；扰动/子空间法把每个有限差分方向限制为低秩。本文把两者统一到黎曼几何视角：把加性更新 `ΔW` 本身作为优化变量，约束在秩为 `r` 的矩阵流形上（`r ≪ min{m,n}`），预训练权重 `W_0` 冻结。在每一步，把高斯随机矩阵 `Z` 用 Frobenius 度量正交投影到切空间 `T_X M_r` 得到 `P(Z)`，再归一化以抵消投影导致的尺度损失，得到与黎曼梯度一致的估计；更新后用秩-r 截断 SVD 做 retraction 把更新拉回流形。实验用 OPT-1.3B/13B/30B 上的 MeZO/LOZO 十一任务套件评测，并额外做自跑同协议对照以消除引用数字的报告不对称问题。

### 关键公式

```math
# 固定秩流形与切空间投影
\mathcal{M}_r^{m\times n}=\{\boldsymbol{X}\in\mathbb{R}^{m\times n}:\operatorname{rank}(\boldsymbol{X})=r\},\quad d_r=r(m+n-r)
P_{T_X\mathcal{M}_r}(\boldsymbol{Z})=\boldsymbol{U}\boldsymbol{U}^\top\boldsymbol{Z}
+\boldsymbol{Z}\boldsymbol{V}\boldsymbol{V}^\top-\boldsymbol{U}\boldsymbol{U}^\top\boldsymbol{Z}\boldsymbol{V}\boldsymbol{V}^\top

# Retraction（秩-r 截断 SVD）
\mathcal{R}_X(\boldsymbol{Y})=\mathcal{H}_r(\boldsymbol{X}+\boldsymbol{Y})

# 零阶两点估计器
\widehat{\nabla}F(\boldsymbol{X};\xi)=\frac{F(\boldsymbol{X}+\epsilon\boldsymbol{Z};\xi)-F(\boldsymbol{X}-\epsilon\boldsymbol{Z};\xi)}{2\epsilon}\,\boldsymbol{Z}

# 估计器性质
\mathbb{E}[\text{归一化估计器}]=\nabla_{\mathcal{M}}F+O(\epsilon^2),\qquad
\text{环境有限差分}\approx \text{retraction 后对应量}\ (\text{领先阶})
```

### 关键组件
- **Fixed-Rank Additive Update Formulation**：更新轨迹始终在 `M_r` 上，秩约束是持久状态属性。
- **Tangent Projection**：Frobenius-正交投影随机矩阵到当前切空间。
- **Normalized Tangent Estimator**：修正投影引起的尺度失配，只需两次前向、无需每步额外 retraction。
- **ZO-RGD**：黎曼零阶梯度下降。
- **ZO-RGD-S**：递归平滑有限差分标量的变体，前向代价与 ZO-RGD 相同。
- **Retraction via Truncated SVD**：保证更新始终是秩-r 矩阵。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 主评测套件 | OPT-13B / OPT-30B 上的 MeZO/LOZO **11 任务套件**（SST-2、RTE、CB、BoolQ、WiC、MultiRC、ReCoRD、SQuAD、WSC、COPA、DROP） |
| 训练配置 | 1000 训练样本，20,000 次更新，每次更新 2 次前向 |
| OPT-13B 相对最强引用 ZO 行 | ZO-RGD-S 在 **11 个任务中的 6 个**更优；ZO-RGD 在 10 个已报告任务中的 **4 个**更优 |
| 覆盖面 | 88 个任务中至少有一个变体超过最强引用行；WSC、COPA、DROP 上引用基线更强 → 优势广泛但非全面 |
| OPT-30B | 优于引用 LOZO 行于 SST-2、RTE、WiC；BoolQ 打平；WSC、SQuAD 保持竞争力 |
| 学习率敏感性 | 在 10⁻⁷ 处 LOZO 达 80.9，两个黎曼变体达 85.x → 黎曼方法对学习率更鲁棒 |
| 归一化机制消融 | 归一化切向有限差分在 SST-2 上优于所测替代方案，包括经学习率补偿的环境随机矩阵 |
| 跨家族可迁移性 | 在 Llama-3.1-8B、Qwen2.5-7B 上收益延续，机制归因于切空间归一化与流形参数化 |
| 代码 | 论文附 23 张表，含逐种子数值与完整 OPT-1.3B 对照 |

---

## 局限性

- 秩约束只施加于选定的矩阵块（加性更新块），未覆盖全模型参数；秩 `r` 的选择影响显著。
- 切空间投影与 retraction 带来额外计算开销（论文专门给出其代价统计）。
- 收敛证明依赖"实现轨迹的正则性"等条件，属于条件性结果。
- 与 LoRA 相比适配器表示能力受限（固定秩、无冗余因子是优点，但表达自由度也受限）。
- 主要在 OPT 系列的 11 个分类/QA 任务上验证，生成式任务上的表现未充分测试。
- 论文未提供代码。

---

## 建议

- **是否推荐使用**：是（对显存受限的前向-only 微调研究有直接价值）
- **适用场景**：长上下文 / 大模型下无法承受激活存储的场景；希望低秩约束与 ZO 免梯度性质兼得的 PEFT 研究者；与 MeZO / LOZO 系列做基线对比。
- **值得复现**：是

---

**相关论文**：[[2026-11-10-Deletion-Tuning-LLM-Post-Training]] [[2026-11-10-Sequential-MTL-Mental-Health-PEFT]]
**主题标签**：#LLM #NLP #ZerothOrder #RiemannianOptimization #PEFT #FineTuning
