---
type: paper
created: 2026-11-06
updated: 2026-11-06
tags: [paper, 渲染, 3DGS, 网格高斯, 高斯分配, 感知复杂度, 变形, 可编辑, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.07979
---

# P-MGS: 感知优先于几何——重新思考网格泼溅中的高斯分配

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Perception Over Geometry: Rethinking Gaussian Allocation in Mesh-based Splatting |
| **作者** | Yuting Wang, Yang Zhao, Shanding Diao, Penglin Wang, Yuan Chen, Wei Jia, Ronggang Wang（深圳大学等） |
| **发表** | arXiv 2026-11-05（cs.GR），10 pages, 7 figures |
| **链接** | [原文](https://arxiv.org/abs/2611.07979) · [HTML](https://arxiv.org/html/2611.07979v1) |
| **DOI** | — |
| **代码** | 论文未提供公开仓库链接 |

---

## 核心贡献

> **现有网格高斯方法给每个三角面分配固定数量的高斯——这隐含假设「几何细分密度 = 表达容量需求」。但几何与外观描述的是表面的不同属性：网格拓扑决定空间离散，多视图观测才决定渲染所需的信息密度。** 本文把外观建模与几何控制**解耦**：先按**感知复杂度**分配高斯并**无约束优化**，**事后**再绑定回网格。

1. **感知复杂度引导的高斯分配（perceptual complexity guided allocation）**：从多视图观测估计每个面的**需求分数** $Q_f$，在共享预算下按需求分配高斯数量。
2. **事后网格绑定（post-hoc binding）**：高斯**不受网格约束**地优化 → 保留自适应精化的灵活性；优化完成后再关联回原网格 → 保留网格拓扑。
3. **局部仿射变形传递（local affine deformation transfer）**：网格编辑时，把网格的**局部仿射形变**同时传给高斯的**中心与协方差** → 减少错位与「漂浮」伪影。
4. **实证证据支持「几何/外观复杂度错配」**：GaMeS(Mesh-Init) 在 Chair 上比 3DGS 低 **5.12 dB**、Hotdog 低 **4.29 dB**；在 Lego 上即使用 **8.5× 的高斯数量**仍比 3DGS 低 **2.58 dB**。

---

## 技术方案

### 核心思想

**现有做法的隐含假设**：
```
网格面 f 上固定放 K 个高斯（n_f = K, ∀f）
```
这自然保留了几何对应关系，但**把「网格细分密度」误当成了「外观重建所需表达容量」**。

**论文的核心论证（非常干净的因果链）**：
- 几何与外观描述**表面的不同属性**
  - 网格拓扑 → **空间离散**（spatial discretization）
  - 多视图观测 → **渲染所需的感知信息密度**
- 因此**外观复杂度高但几何简单**的区域（Chair 的绿色布料、Hotdog 的高光表面）会**分配不足** → 表现就是 GaMeS 在 Chair/Hotdog 上大幅落后 3DGS
- 反过来，**增加表示规模并不能自动弥补**：Lego 上 GaMeS(Mesh-Init) 用 **10,176K** 高斯（≈3DGS 的 **8.5×**）仍低 **2.58 dB** → 说明**问题出在分配方式，不是容量**
- 而 Drums/Ship（几何细节多、外观简单）的差距就小（0.82 dB / 1.57 dB）→ 进一步印证

**解法三步**：
```
① 可见覆盖 + 外观变化 → 引导高斯初始化
② 无约束 3DGS 优化（保留重建灵活性）
③ 事后绑定建立高斯-网格对应 + 局部仿射变形传递（保持编辑一致性）
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **可见性掩码** | $h_{fv}(p)=\chi_{fv}(p)\,a_v(p)$，$\chi$ 表示相机光线**首次相交**的面 $f$，$a_v(p)\in[0,1]$ 为前景 alpha |
| **局部外观变化度量** | $\rho_v(p)=\dfrac{1}{3}\sum_{c\in\{R,G,B\}}\|\nabla I_{v,c}(p)\|_2^2+\epsilon$（RGB 归一化到 $[0,1]$） |
| **需求分数 $Q_f$** | $Q_f=\dfrac{1}{V}\sum_{v=1}^{V}A_{fv}^{2}\,\bar\rho_{fv}$，其中 $A_{fv}=\sum_p h_{fv}(p)$ 为可见投影覆盖，$\bar\rho_{fv}=\dfrac{\sum_p h_{fv}(p)\rho_v(p)}{A_{fv}}$（$A_{fv}=0$ 时置 0） |
| **$Q_f$ 的推导逻辑** | 局部线性图像信号下，**常值 cell 的积分平方误差**随梯度能量和 cell 面积平方缩放 → 把可见区域近似成 $n_f$ 个等面积 cell，求和得误差 $\propto \dfrac{A_{fv}^2\bar\rho_{fv}}{n_f}$ → 跨视图平均即 $Q_f$。**$A^2$ 项对应 cell 尺寸，梯度能量对应外观变化** |
| **分配优化问题** | $\min_{\mathbf{n}\in\mathbb{Z}_{\ge0}^{\lvert\mathcal{F}\rvert}}\mathcal{E}(\mathbf{n})=\sum_{f\in\mathcal{P}}\dfrac{Q_f}{n_f}$，s.t. $\sum_f n_f=B$（共享预算）、$\ell_f\le n_f\le u_f$（面级上下界）、$\sum_f n_f T_{fv}\le W_v$（**逐视图光栅化负载上限**） |
| **负载约束的意义** | $T_{fv}$ = 该面高斯在视图 $v$ 上触及的图像 tile 数。**投影足迹不同 → 同样的高斯总数在不同视图上负载不同** → 必须逐视图约束，否则会牺牲某些视图的性能 |
| **下界的语义** | 正需求面 $\ell_f\ge 1$（每个合格面至少保留一个初始基元）；零需求面只保留最小值 |
| **近似求解：拉格朗日负载定价** | 面计数从 $k$ 增到 $k+1$ 减少的代理误差为 $Q_f/[k(k+1)]$，各视图增加归一化负载 $T_{fv}/W_v$ → 得到定价后的边际收益 $S_f(k)=Q_f/k - \sum_v \lambda_v T_{fv}/W_v$，用**逐视图价格 $\lambda_v\ge0$** 做贪心分配 |
| **事后绑定** | 无约束重建后建立高斯-网格对应。参考 GaMeS 的重心坐标参数化 $\mu_i=\alpha_{i,1}\mathbf{v}_1+\alpha_{i,2}\mathbf{v}_2+\alpha_{i,3}\mathbf{v}_3$，$\sum\alpha=1$ |
| **局部仿射变形传递** | 网格编辑时，用**局部仿射变换**同时更新高斯的**中心与协方差** → 减少错位与漂浮伪影 |

---

## 公式

**需求分数（含近似误差模型推导）**：

```math
h_{fv}(p)=\chi_{fv}(p)\,a_v(p)
```

```math
\rho_v(p)=\frac{1}{3}\sum_{c\in\{R,G,B\}}\|\nabla I_{v,c}(p)\|_2^2+\epsilon
```

```math
A_{fv}=\sum_p h_{fv}(p),\qquad
\bar{\rho}_{fv}=\frac{\sum_p h_{fv}(p)\rho_v(p)}{A_{fv}}
```

```math
Q_f=\frac{1}{V}\sum_{v=1}^{V}A_{fv}^{2}\,\bar{\rho}_{fv}
```

**带负载约束的分配问题**：

```math
\min_{\mathbf{n}\in\mathbb{Z}_{\geq 0}^{|\mathcal{F}|}}
\mathcal{E}(\mathbf{n})=\sum_{f\in\mathcal{P}}\frac{Q_f}{n_f}
```

```math
\text{s.t.}\quad
\sum_f n_f=B,\quad \ell_f\leq n_f\leq u_f,\ \forall f
```

```math
\sum_f n_f T_{fv}\leq W_v,\quad \forall v
```

**拉格朗日负载定价（边际收益）**：

```math
S_f(k)=\frac{Q_f}{k}-\sum_v \lambda_v\frac{T_{fv}}{W_v}
```

**3DGS 基元与渲染（预备知识）**：

```math
\mathcal{G}_i=\{\boldsymbol{\mu}_i,\boldsymbol{r}_i,\boldsymbol{s}_i,\alpha_i,\mathbf{c}_i\},\qquad
G_i(\mathbf{x})=\exp\!\left(-\frac{1}{2}(\mathbf{x}-\boldsymbol{\mu}_i)^{T}\boldsymbol{\Sigma}_i^{-1}(\mathbf{x}-\boldsymbol{\mu}_i)\right)
```

```math
\boldsymbol{\Sigma}_i=R_iS_iS_i^T R_i^T,\qquad
\mathbf{C}(\mathbf{p})=\sum_{i\in\mathcal{N}(\mathbf{p})}T_i(\mathbf{p})\,\widetilde\alpha_i(\mathbf{p})\,\mathbf{c}_i
```

**重心坐标参数化（网格绑定）**：

```math
\boldsymbol{\mu}_i=\alpha_{i,1}\mathbf{v}_1+\alpha_{i,2}\mathbf{v}_2+\alpha_{i,3}\mathbf{v}_3,\qquad
\alpha_{i,1}+\alpha_{i,2}+\alpha_{i,3}=1
```

---

## 实验结论

- **数据集**: NeRF-Synthetic（8 场景）、DTU（真实物体）
- **基线**: 3DGS、GaMeS（用输入网格）、**GaMeS△**（无网格的 Triangle Soup 变体）、Mani-GS
- **网格高斯基线的分配设定**: 论文中**统一给每个面分配 5 个高斯**（表格注释）

**NeRF-Synthetic 静态新视角合成（Tab. 1）**：

| 方法 | Avg PSNR↑ | Avg SSIM↑ | Avg LPIPS↓ | #GS↓ |
|------|-----------|-----------|-----------|-------|
| GaMeS△ | — | — | — | — |
| GaMeS (Mesh-Init) | 33.25（低于 3DGS 5.12/4.29 dB 的场景拖累） | — | — | 大 |
| Mani-GS | 33.25 | — | — | 2,684K |
| 3DGS | — | — | — | — |
| **P-MGS (Ours)** | **34.00** | — | — | **545K** |

- **P-MGS 达到最高平均 PSNR 34.00 dB，同时高斯数最少（545K）**
- 相比 **Mani-GS：PSNR +0.75 dB，高斯数减少 79.7%**
- 相比 3DGS：渲染质量与表示效率**双赢**，且额外支持网格驱动编辑

**DTU（Tab. 2）**：

| 方法 | PSNR↑ | SSIM↑ | LPIPS↓ | #GS↓ |
|------|-------|-------|--------|-------|
| GaMeS△ | 30.91 | 0.8732 | 0.0995 | 603K |
| Mani-GS | 30.79 | 0.9067 | 0.1295 | 316K |
| **P-MGS (Ours)** | **32.36** | **0.9416** | **0.0943** | **191K** |

- **全指标最优且高斯数最少**（191K vs Mani-GS 316K vs GaMeS△ 603K）

**几何-外观复杂度错配的量化证据（本文最有说服力的部分）**：

| 场景 | GaMeS(Mesh-Init) 相对 3DGS 的 PSNR 差 | 几何/外观特征 |
|------|--------------------------------------|-------------|
| Chair | **−5.12 dB** | 几何复杂度不足以反映丰富的表面外观 |
| Hotdog | **−4.29 dB** | 同上 |
| Lego | −2.58 dB（尽管用了 **10,176K** 高斯 = 3DGS 的 **8.5×**） | 容量不是问题，分配才是 |
| Drums | −0.82 dB | 几何细节多、外观简单 |
| Ship | −1.57 dB | 同上 |

**定性结果**：
- **Chair**：P-MGS 的绿色布料**更平滑连贯**，保留纹理细节，**减少 GaMeS△ 与 Mani-GS 的颗粒噪声**
- **Building**：GaMeS△ 在**窗户内产生假颜色**；Mani-GS 产生**模糊、局部不连续的窗框 + 噪声**；P-MGS **保持窗户颜色与结构边界**
- **编辑渲染**（无 GT，无法用 PSNR 评）：GaMeS△ 与 Mani-GS 在形变后出现**明显的高斯漂浮伪影或高斯-网格错位**，在编辑区域尤其明显；P-MGS 表现连贯

---

## 局限性

- 论文未给出公开代码仓库链接（复现成本较高）
- 事后绑定需要在优化后再建立对应关系，**网格面与高斯数量不匹配时的绑定策略**（面内如何分配）在正文中描述较简略（见附录 7.4）
- 负载上限 $W_v$ 需要**标定**（论文用均匀参考初始化标定），换场景需重新标定
- 编辑评估**缺少定量指标**（无变形后 GT 图像，只能定性对比）
- 10 pages / 7 figures，篇幅较短，实验覆盖有限（仅 NeRF-Synthetic + DTU，未在真实大规模场景验证）

---

## 相关工作

- [[2026-11-06_T2-Splat-Adaptive-Topology-Mesh-Splatting]] — **同期同方向工作**（网格泼溅的拓扑自适应分配），值得对照阅读
- [[2026-11-06_HIBS-Hierarchical-Incremental-Beta-Splatting]]
- GaMeS（网格引导高斯，重心坐标参数化）、Mani-GS
- 3DGS（Kerbl et al.）

---

## 实现建议

- **实现难度**: **中**。核心是一个带约束的整数分配问题（可用拉格朗日定价贪心近似求解），加上事后绑定 + 仿射变形传递三块工程
- **预期性能**: 相比等容量基线 **PSNR +0.7~1.5 dB**，**高斯数减少约 40–80%**（DTU 上 191K vs 603K），且保持网格可编辑
- **适用场景**:
  - 需要**网格可编辑性**的高斯场景（游戏资产、CAD 混合流程）
  - **外观复杂度与几何复杂度错配**的场景（纹理丰富但几何简单）— 这是最大收益点
  - 需要紧凑表示的场景（VRAM/下载体积敏感）
- **可借鉴的通用技巧**:
  1. **「几何 ≠ 外观复杂度」的错配诊断** — 一个非常实用的 sanity check：如果你用网格引导高斯且 PSNR 莫名落后 3DGS 好几 dB，**大概率是分配问题而非容量问题**
  2. **需求分数的构造法** — 用「近似误差 ∝ 梯度能量 × 面积²」构造代理目标，再转成 $\sum Q_f/n_f$ 的分配问题。这个「用误差模型反推容量分配」的思路可迁移
  3. **逐视图负载约束** — 只看总容量会忽略投影足迹差异；$\sum_f n_f T_{fv}\le W_v$ 是很实用的一招
  4. **解耦「重建自由度」与「编辑约束」** — 先自由优化再事后绑定，比全程加约束更灵活。这是「约束 vs 灵活性」的通用权衡
  5. **变形时同时传递中心与协方差** — 只传中心会让高斯形状与网格形变不一致
- **优先级建议**: 🟡 **P1** — 若自研管线涉及网格+高斯混合，**「先诊断错配再决定是否投入」**，这个诊断成本极低而收益明确
