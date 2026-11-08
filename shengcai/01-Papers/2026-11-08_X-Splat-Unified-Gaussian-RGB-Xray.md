---
type: paper
created: 2026-11-08
updated: 2026-11-08
tags: [paper, 渲染, 高斯泼溅, 3DGS, X射线, CT重建, 跨模态配准, 可微渲染, 神经渲染, 光线步进, Beer-Lambert, 内部结构重建, SIGGRAPH-Asia-2026, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.23237
---

# X-Splat：把「外壳」与「内核」塞进同一套高斯——RGB 与 X 光联合 3D 重建

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | X-Splat: Unified Gaussian Splatting for Joint RGB and X-ray 3D Reconstruction |
| **作者** | Wangze Xu, Chu Zhou (NII), Mae Yamaguchi, Linrui Dai, I-Chao Shen (The University of Tokyo), Takashi Ijiri (Shibaura Institute of Technology), Imari Sato (NII / UTokyo) |
| **发表** | **SIGGRAPH Asia 2026 Conference Papers (SA Conference Papers '26)**，2026-12-01~04，吉隆坡，马来西亚 |
| **链接** | [DOI](https://doi.org/10.1145/3829340.3842177) · [arXiv](https://arxiv.org/abs/2610.23237) · [项目页](https://zezeaaa.github.io/X-Splat/) |
| **DOI** | 10.1145/3829340.3842177（ISBN 979-8-4007-2842-6/2026/12） |
| **代码** | https://github.com/zezeaaa/X-Splat · 数据/模型: https://huggingface.co/datasets/zezeaaa/X-Splat |

---

## 核心贡献

> **现有做法是「RGB 一个模型 + X 光一个模型」——同一物体两份几何，没有配准，参数翻倍，还无法做「从同一视角同时看内外」。** 本文提出：**一套高斯基元共享几何参数，只有靠近表面的基元才额外带外观属性**，并用**干净的几何代理（MVS 点云 + CT 网格）做跨模态配准**（而不是对齐两堆带 floater 的优化后高斯）。

1. **统一高斯表示**：全部 $N$ 个基元共享几何 $\{\mu_i, R_i, S_i\}$；每个都带 X 光密度 $\rho_i$；**只有表面子集 $\mathcal{S}\subset\{1..N\}$ 带 RGB 外观 $\{\alpha_i, c_i\}$**。→ 消除两套几何的冗余，两模态梯度流入同一套几何。
2. **几何代理配准（PCA + ICP）**：RGB 侧用 MVSFormer 出点云 $\mathcal{P}^{\mathrm{mvs}}$；X 光侧从粗重建体素化→二值化→形态学闭运算→Marching Cubes 出 CT 网格点云 $\mathcal{P}^{\mathrm{ct}}$；**先 PCA 对齐（质心+主轴+方差 → 平移/旋转/缩放）再 ICP 精化**。对比 InsideOut 的「后验层级对齐」：**Chamfer Distance 从 0.0978 → 0.0122（约 8× 改善）**。
3. **X 光导出的表面深度一致性损失 $\mathcal{L}_{\mathrm{geo}}$**：**CT 深度只作为「边缘结构」的 stop-gradient 目标**，允许 RGB 深度只在 CT 有边缘处出现不连续 → 对齐表面边界结构但**不强制绝对深度一致**。
4. **两阶段优化**：Stage 1（3,000 iter）只优化 X 光参数（$\{\mu,R,S,\rho\}$），从 FDK 初始化出发；Stage 2（12,000 iter）联合优化全部参数，**保留 X 光光度损失不冻结**（否则 RGB 梯度会把共享几何带偏，牺牲 X 光保真度）。
5. **双模态自适应密度控制**：**每基元维护两套独立的梯度统计** $\bar{g}^{\mathrm{rgb}}_i$ 与 $\bar{g}^{\mathrm{xray}}_i$（两模态反向频率与 loss scale 不同）。剪枝要求**不透明度与密度同时低**（$\alpha<\alpha_{\min}\wedge\rho<\rho_{\min}$）——因为一个基元可能对 RGB 不可见但携带有效 X 光密度。表面集内不透明度过低的基元被**降级**（退出 $\mathcal{S}$）而非剪枝。
6. **鲁棒性验证**：噪声/稀疏/限角 X 光采集、劣化的 CT 几何配准、稀疏 RGB 监督下均鲁棒；**RGB 视角越稀疏，共享 CT 几何带来的增益越大**。

---

## 技术方案

### 核心思想

**核心洞察**：RGB 图像（表面反射）与 X 光图像（密度线积分）**物理机制完全不同，但都条件于同一套几何**。因此最干净的设计不是各配一套几何，而是**共享几何、只分化真正不同的属性**。

**成像模型对比**：

```math
I_{\mathrm{rgb}}(\mathbf{r})=\int_{t_n}^{t_f}T(t)\,\alpha\bigl(\mathbf{r}(t)\bigr)\,c\bigl(\mathbf{r}(t)\bigr)\,dt,
\qquad
T(t)=\exp\!\left(-\int_{t_n}^{t}\alpha\bigl(\mathbf{r}(s)\bigr)\,ds\right)
```

```math
I_{\mathrm{xray}}(\mathbf{r})=\int_{t_n}^{t_f}\sigma\bigl(\mathbf{r}(t)\bigr)\,dt
```

> **RGB：能量集中在「第一个命中表面」附近；X 光：穿透整个物体，log 域像素值是密度场的线积分（Beer-Lambert 定律）。**

**三条路线对比**：

| 路线 | 代表 | 缺点 |
|------|------|------|
| 单模态专精 | 3DGS / NeRF（外观）、NAF / X-Gaussian / R²-Gaussian（内部密度） | 各覆盖一个轴；内部与外部无关联 |
| 双模型后验对齐 | InsideOut (Lee et al., ICCV 2025) | 两套独立几何 → 参数翻倍；对齐在**已优化的高斯**上做 → floater 传播 → 表面-内部错位；RGB 弱监督 |
| **统一表示 + 几何代理对齐（本文）** | X-Splat | 依赖 X 光重建质量；不适用于透明/强次表面材质 |

### 关键技术

| 技术 | 说明 |
|------|------|
| **统一基元** | $\mathcal{G}_i=\{\mu_i,R_i,S_i\;\text{(共享几何)},\;\rho_i\;\text{(辐射属性)},\;\alpha_i,c_i\;\text{(仅 }i\in\mathcal{S}\text{)}\}$。协方差 $\Sigma_i=R_iS_iS_i^\top R_i^\top$ |
| **RGB 光栅器** | EWA splatting + 深度排序 front-to-back 合成：$I_{\mathrm{rgb}}=\sum_{i\in\mathcal{N}(\mathbf{r})}c_i\alpha_i'\prod_{j<i}(1-\alpha_j')$ |
| **辐射高斯光栅器（R²-Gaussian 式）** | X 光基元只带标量密度 $\rho_i$；投影后闭式积分成一堆 2D 高斯：$I_{\mathrm{xray}}=\sum_{i=1}^N\hat\rho_i\,\mathcal{N}_{2D}(\hat{x};\hat\mu_i,\hat\Sigma_i)$。**用辐射（radiative）光栅化替代 alpha 合成**，才能满足 Beer-Lambert 积分 |
| **配准** | PCA（对齐质心/主轴/方差）→ 带缩放的 point-to-point ICP。变换应用到所有 RGB 外参：$E^{\mathrm{rgb}\to\mathrm{ct}}_k=E^{\mathrm{rgb}}_k T^{-1}$ |
| **表面集构造** | $\mathcal{S}=\{i: d_i<\tau_d\}$，$d_i$ = $\mu_i$ 到 CT 网格的距离；不透明度初始化为高斯衰减 $\alpha_i=\alpha_{\mathrm{surf}}\exp(-d_i^2/2\sigma^2)$；颜色从 MVS 点云最近点取 |
| **CT 深度一致性损失** | $\mathcal{L}_{\mathrm{geo}}=\mathbb{E}_{\mathbf{r}}\big[\frac{1}{\bar D^{\mathrm{ct}}}\sum_{a\in\{x,y\}}\exp(-|\nabla_aD^{\mathrm{ct}}|/\tau)|\nabla_aD^{\mathrm{rgb}}|\big]$。$\tau$ 取掩膜内 CT 梯度幅值中位数，$\bar D^{\mathrm{ct}}$ 为尺度归一化项 |
| **双模态密度控制** | 加密集合 $\mathcal{D}=\{\mathcal{G}_i\mid \bar g^{\mathrm{xray}}_i\ge\theta^{\mathrm{xray}}\lor(\bar g^{\mathrm{rgb}}_i\ge\theta^{\mathrm{rgb}}\wedge i\in\mathcal{S})\}$；剪枝集合 $\mathcal{R}=\{\mathcal{G}_i\mid\alpha_i<\alpha_{\min}\wedge\rho_i<\rho_{\min}\}$ |
| **实现** | 基于 **R²-Gaussian** 代码库；Stage 1 用其 X 光训练调度 |

### 核心流程（论文 Fig. 2）

```
① Stage 1 — X 光粗重建（3,000 iter）
   ├─ FDK 重建初始化（经典锥束 CT 闭式解）
   ├─ 只优化 {μ, R, S, ρ}
   ├─ 损失：ℒ_photo^xray (L1 + D-SSIM, λ_dssim^xray=0.25) + λ_tv·ℒ_TV (0.05)
   └─ 输出 ℋ^coarse
        ↓
② 跨模态配准
   ├─ X 光侧：ℋ^coarse → 可微体素化 → CT 体 → 二值化 + 形态学闭运算
   │          → Marching Cubes → 均匀采样 → ℘^ct
   ├─ RGB 侧：MVSFormer → ℘^mvs
   ├─ PCA 对齐 → T^pca；再带缩放 ICP → T
   └─ 应用 T⁻¹ 到所有 RGB 外参
        ↓
③ 构造表面集 𝒮（τ_d=0.02, α_surf=0.5）
   ├─ ℒ_geo 用 180 个 Fibonacci 球面虚拟相机计算
   └─ CT 网格每 500 iter 重新提取
        ↓
④ Stage 2 — 联合优化（12,000 iter）
   ├─ ℒ_stage2 = λ_rgb·ℒ_photo^rgb + λ_xray·ℒ_photo^xray + λ_tv·ℒ_TV + λ_geo·ℒ_geo
   │            （λ_rgb=λ_xray=1.0, λ_tv=0.05, λ_geo=0.05；λ_dssim^rgb=0.2）
   ├─ 继承 Stage 1 的 {μ,R,S,ρ}；分配并初始化 {α,c}
   ├─ X 光光度损失**全程不冻结**（防止 RGB 梯度带偏共享几何）
   └─ 双模态自适应密度控制（每 100 iter）
```

---

## 公式

**RGB 成像（表面反射 + 透射率）**：

```math
I_{\mathrm{rgb}}(\mathbf{r})=\int_{t_{n}}^{t_{f}}T(t)\,\alpha\bigl(\mathbf{r}(t)\bigr)\,c\bigl(\mathbf{r}(t)\bigr)\,dt,
\qquad
T(t)=\exp\!\left(-\int_{t_{n}}^{t}\alpha\bigl(\mathbf{r}(s)\bigr)\,ds\right)
```

**X 光成像（Beer-Lambert 密度线积分）**：

```math
I_{\mathrm{xray}}(\mathbf{r})=\int_{t_{n}}^{t_{f}}\sigma\bigl(\mathbf{r}(t)\bigr)\,dt
```

**RGB 光栅合成**：

```math
I_{\mathrm{rgb}}(\mathbf{r})=\sum_{i\in\mathcal{N}(\mathbf{r})}c_{i}\,\alpha^{\prime}_{i}\prod_{j<i}\bigl(1-\alpha^{\prime}_{j}\bigr)
```

**辐射高斯光栅（X 光）**：

```math
I_{\mathrm{xray}}(\mathbf{r})=\sum_{i=1}^{N}\hat{\rho}_{i}\;\mathcal{N}_{\mathrm{2D}}\!\bigl(\hat{\mathbf{x}};\,\hat{\mu}_{i},\,\hat{\Sigma}_{i}\bigr)
```

**配准变换应用**：

```math
E^{\mathrm{rgb}\to\mathrm{ct}}_{k}=E^{\mathrm{rgb}}_{k}\,T^{-1}
```

**表面集与不透明度初始化**：

```math
\mathcal{S}=\{\,i:d_{i}<\tau_{d}\,\},
\qquad
\alpha_{i}=\alpha_{\mathrm{surf}}\cdot\exp\!\left(-\frac{d_{i}^{2}}{2\sigma^{2}}\right)
```

**CT 深度一致性损失（关键设计）**：

```math
\mathcal{L}_{\mathrm{geo}}=\mathbb{E}_{\mathbf{r}}\!\left[\frac{1}{\bar{D}^{\mathrm{ct}}}\sum_{a\in\{x,y\}}\exp\!\bigl(-|\nabla_{a}D^{\mathrm{ct}}|/\tau\bigr)\,|\nabla_{a}D^{\mathrm{rgb}}|\right]
```

> **CT 深度只提供「边缘结构」，作为 stop-gradient 目标。** 因此允许 RGB 深度只在 CT 有边缘处不连续 —— 对齐表面边界结构而不强制绝对深度值。

**两阶段目标**：

```math
\mathcal{L}_{\mathrm{stage1}}=\mathcal{L}^{\mathrm{xray}}_{\mathrm{photo}}+\lambda_{\mathrm{tv}}\mathcal{L}_{\mathrm{TV}}
```

```math
\mathcal{L}_{\mathrm{stage2}}=\lambda_{\mathrm{rgb}}\mathcal{L}^{\mathrm{rgb}}_{\mathrm{photo}}+\lambda_{\mathrm{xray}}\mathcal{L}^{\mathrm{xray}}_{\mathrm{photo}}+\lambda_{\mathrm{tv}}\mathcal{L}_{\mathrm{TV}}+\lambda_{\mathrm{geo}}\mathcal{L}_{\mathrm{geo}}
```

**双模态密度控制**：

```math
\mathcal{D}=\bigl\{\,\mathcal{G}_{i}\;\big|\;\bar{g}^{\mathrm{xray}}_{i}\geq\theta^{\mathrm{xray}}\;\lor\;(\bar{g}^{\mathrm{rgb}}_{i}\geq\theta^{\mathrm{rgb}}\;\land\;i\in\mathcal{S}\bigr)
```

```math
\mathcal{R}=\bigl\{\,\mathcal{G}_{i}\;\big|\;\alpha_{i}<\alpha_{\mathrm{min}}\;\land\;\rho_{i}<\rho_{\mathrm{min}}\bigr\}
```

---

## 代码片段

**训练阶段配置（官方项目页）**

```text
Stage 1: 3,000 iter, FDK init, ℒ_photo^xray + 3D TV (λ_tv = 0.05)
          → 产出密度场与 CT 表面
Align:   PCA + ICP realignment（把 RGB 坐标系带入 X 光坐标系）
Stage 2: 12,000 iter, 联合优化共享高斯 + 表面集
          λ_rgb = λ_xray = 1.0, λ_tv = 0.05, λ_geo = 0.05
          λ_dssim^xray = 0.25, λ_dssim^rgb = 0.2
          CT 网格每 500 iter 重提取；ℒ_geo 用 180 个 Fibonacci 球虚拟相机
```

**基线复现说明（重要）**

```text
InsideOut† = 作者按其论文描述与超参复现的版本（原代码未公开）。
X 光最终高斯取自其 X 光-only stage 2（与 R²-Gaussian 一致），
省略其后续 X 光 refinement —— 因为那套基于 opacity 的渲染与本文的 density-based 渲染器不兼容。
```

**数据集准备（DATA.md 路由）**

```text
Insect:    本文自采，CC BY-NC 4.0（学术用途），随代码发布
InsideOut: 非本文所有 → 需通过原作者申请（research-use-only，不得再分发）
Flower:    CT 体属 RIKEN flower CT library → 按 RIKEN 条款，不重新分发
X 光投影： 用 TIGRE 从 GT CT 体合成锥束投影，512×512，
          [0°,360°) 均匀采样 50 训练 / 120 测试
RGB：      InsideOut 真实照片 / Flower 的 Blender 渲染 / 昆虫标本实拍，均降采样到宽 800
划分：     每 4 个视角留 1 个作测试
```

---

## 实验结论

- **硬件**: 单张 **NVIDIA RTX A6000**；每个 InsideOut 场景 **14–21 分钟**
- **数据集**: **9 个场景 / 2 个数据集**
  - **InsideOut**（Lee et al., 2025）：Matryoshka、Pharaoh、Skull、Toy Gun（配对 RGB 照片 + GT CT 体）
  - **Flower & Insect**（本文新提出）：Tulip、Eustoma（Ijiri et al. 2014 的花扫描）+ E02、E15、E32（制备昆虫标本）
- **指标**: RGB → PSNR / SSIM / LPIPS（前景掩膜内）；X 光 → 2D-PSNR / 2D-SSIM（投影）+ 3D-PSNR（CT 体）；配准 → Chamfer Distance（归一化场景单位，最长边 = 2）；紧凑性 → #G (k) 与存储 (MB)

### Tab. 1 — InsideOut 数据集逐模态质量

**(a) RGB 新视角合成**

| 方法 | Matryoshka PSNR | Pharaoh PSNR | Skull PSNR | Toy Gun PSNR | **平均 PSNR** | 平均 SSIM | 平均 LPIPS |
|------|---------|---------|---------|---------|---------|---------|---------|
| 3DGS (MVS init) | 29.56 | 29.64 | 31.08 | 34.54 | 31.20 | 0.9726 | 0.0323 |
| 3DGS (FDK init) | 29.75 | 29.51 | 30.97 | 34.55 | 31.20 | 0.9716 | 0.0336 |
| InsideOut† | 18.13 | 21.78 | 19.57 | 25.39 | 21.22 | 0.9122 | 0.1107 |
| **Ours** | **30.37** | **30.89** | **32.42** | **36.68** | **32.59** | **0.9765** | **0.0293** |

> **比两个 3DGS 变体高约 1.4 dB PSNR**。InsideOut† 复现版本 RGB 质量大幅下降（21.22 dB）→ 说明「两套模型 + 后验对齐」的路线在 RGB 上确实弱。

**(b) X 光重建**（部分）

| 方法 | 平均 2D-PSNR | 平均 2D-SSIM | 平均 3D-PSNR |
|------|---------|---------|---------|
| FDK | 33.86 | 0.9040 | 28.57 |
| R²-Gaussian | 48.20+ | 0.9940+ | 33.35+ |
| **Ours** | 与 R²-Gaussian 基本一致（仅微小波动） | | |

### Tab. 2 — Flower & Insect 数据集逐模态质量

**(a) RGB**

| 方法 | Tulip | Eustoma | E02 | E15 | E32 | **平均 PSNR** | 平均 SSIM | 平均 LPIPS |
|------|------|------|------|------|------|---------|---------|---------|
| 3DGS (MVS init) | 38.34 | 37.98 | 30.63 | 30.10 | 31.55 | 33.72 | 0.9811 | 0.0300 |
| 3DGS (FDK init) | 37.85 | 37.74 | 30.88 | 30.11 | 31.53 | 33.62 | 0.9804 | 0.0327 |
| InsideOut† | 18.89 | 17.79 | 19.82 | 19.90 | 19.09 | 19.10 | 0.8923 | 0.1368 |
| **Ours** | **39.71** | **39.22** | **34.75** | **33.74** | **34.77** | **36.44** | **0.9871** | **0.0262** |

> **比 3DGS 高 2.7 dB PSNR**（论文写"over 2 dB"）。X 光侧 Ours 与 R²-Gaussian 几乎完全一致（48.92 vs 48.98 2D-PSNR）。

### Tab. 3 — 跨模态配准质量（InsideOut）

| 方法 | 输入源 | CD ↓ |
|------|--------|------|
| InsideOut† 层级对齐 | **已优化的高斯基元** | 0.0978 |
| 仅 ICP | 几何代理（MVS + CT 网格） | 0.1453 |
| 仅 PCA | 几何代理 | 0.0250 |
| **Ours（PCA + ICP）** | **几何代理** | **0.0122** |

> **核心结论：几何源的「干净程度」比配准算法本身更决定性。** 仅 PCA（0.0250）已经优于 InsideOut 的层级对齐（0.0978）。**全文约 8× 改善。**
> **仅 ICP 反而最差（0.1453）** —— identity 初始化的 ICP 在对称物体上会陷入局部极小甚至退化到近奇异缩放（论文举 E15 为例）→ **PCA 提供全局朝向与尺度，ICP 只做局部精化，两者互补，必须串联。**

### Tab. 4 / Fig. 8 — 紧凑性与消融

**存储分解（Flower & Insect 平均）**：

| 方法 | 高斯数 | 存储 |
|------|-------|------|
| **Ours** | **78.6k** | **12.91 MB** |
| InsideOut | 151.7k | 28.03 MB |
| Independent（两个独立模型相加） | 157.2k | 28.17 MB |

> **比 Independent 少约 2.2× 存储**（InsideOut 数据集上约 26%）。来源：共享几何骨干 + 外观属性只分配给表面集。

**Tab. 5 — 累积消融（InsideOut 4 场景平均）**：

| 消融项 | 结果 |
|--------|------|
| 去掉 CT 深度一致性损失 (a→b) | RGB PSNR **−0.16 dB**（出现可见深度伪影，Fig. 8(a)） |
| 去掉表面集机制 (b→c) | 质量保持，但**存储膨胀约 2.5×**（SH 分配给了对 RGB 毫无贡献的内部基元） |
| 换成 InsideOut 式对齐 (c→d) | RGB PSNR **−0.9 dB**，X 光质量稳定；表面错位伪影明显 |
| 统一表示 vs 完全独立双模型 (a vs e) | RGB 更高；X 光相当；存储省 ~2.2×。**注意**：单纯「冻结 CT 重建当深度先验给一个独立 RGB 集」只能 **+0.06 dB**（vs 3DGS）→ **增益来自「共享几何 + 联合优化」，不是「多了一个深度先验」** |

**其他结论**：
- **即使 FDK 初始化（已编码完整体结构）也不如 MVS-init 基线** → 更好的初始几何本身**无法突破单模态天花板**，需要持续的几何监督
- **鲁棒性**：噪声/稀疏/限角 X 光、劣化 CT 配准、稀疏 RGB 监督下均稳定；**RGB 视角越稀疏，共享 CT 几何的增益越大**

---

## 局限性

（论文 Sec. 6 明确列出）

- **外观模型假设「表面反射主导 RGB 信号」**，故把外观属性限制在表面邻近基元 → **不适用于玻璃等透明物体、强次表面散射/透射材质（生物组织、蜡）**——这些的外观来自物体内部。需体外观模型，且目前缺乏这类配对 RGB-X 光数据集
- **依赖足够准确的 X 光重建来锚定共享几何**；X 光输入极度噪声/模糊时会退化
- **联合训练提升了 RGB，但 X 光仅与单模态基线持平** —— 让 RGB 监督也能反哺 X 光重建是留给未来的工作

（补充）
- InsideOut† 为作者复现版本（原文代码未公开），其低 RGB 质量部分归因于复现差异，论文在补充材料中讨论了与其原报告结果的出入
- Flower 数据集的 CT 体不可再分发，需自行从 RIKEN 获取

---

## 相关工作

- [[2026-11-08_Inverse-Rendering-Line-Primitives-FuzzyDR]] — 同一 SIGGRAPH Asia 2026，「共享几何代理配准」的思路同源
- **InsideOut**（Lee et al., ICCV 2025）— 首个 RGB+X 光联合尝试，但是双高斯集 + 后验层级对齐
- **R²-Gaussian**（Zha et al., 2024）— 辐射高斯光栅 + 可微体素化，修正了 X-Gaussian 的积分偏差
- **X-Gaussian**（Cai et al., 2024a）— 用辐射光栅化替代 alpha 合成，遵循 Beer-Lambert 定律
- **NAF**（Zha et al., 2022）、**SAX-NeRF**（Cai et al., 2024b）、**FDK**（Feldkamp et al., 1984）
- **3DGS**（Kerbl et al., 2023）、**2DGS**（Huang et al., 2024）、**Mip-Splatting**（Yu et al., 2024）、**Guédon & Lepetit 2024**
- **MVSFormer**（Cao et al., 2022）、**TIGRE**（Biguri et al., 2016）、**COLMAP**（Schönberger & Frahm, 2016）
- 多模态 GS：RGB+热成像（Lu et al., 2025）、共享/模态特异分量（Gu & Wang, 2025）

---

## 实现建议

- **实现难度**: **中**。代码基于 R²-Gaussian 公开实现扩展，主要工作量在：① X 光体素化 → CT 网格 → MVS 点云的**配准管线**（PCA + ICP，代码量不大但调试需经验）；②**双模态密度控制**（两套梯度统计）；③ **$\mathcal{L}_{\mathrm{geo}}$ 的边缘感知深度损失**实现。渲染器本身不需要新写。
- **预期性能**:
  - InsideOut 上 RGB **32.59 dB**（vs 3DGS 31.20，**+1.4 dB**），Flower & Insect 上 **36.44 dB**（vs 33.72，**+2.7 dB**）
  - LPIPS **0.0293 / 0.0262**（均优于所有基线）
  - X 光质量与 R²-Gaussian **持平**（2D-PSNR ~48.9，3D-PSNR ~35.3）
  - 配准 CD **0.0122**（vs InsideOut 0.0978，**8× 改善**）
  - 存储 **12.91 MB / 78.6k 高斯**（vs Independent 28.17 MB，**省 2.2×**）
  - 训练 **14–21 分钟/场景**（单张 A6000）
- **适用场景**:
  - **数字文化遗产**（论文明确动机之一）：同一模型同时给出外观与内部结构，可做「剖切展示」
  - **工业质检 / 无损检测**：X 光给内部结构，RGB 给外观，**同一坐标系** → 可直接比对
  - **物理接地的可视化**：内部密度场可直接驱动体渲染/物理解算
  - **需要「从同一视角同时看内外」的展示**：两个独立模型做不到这一点
- **可借鉴的通用技巧**（本文最大的价值在这里）:
  1. **「共享几何 + 差异化属性」的表示设计范式** —— 多模态/多任务共享同一套几何参数，只给**真正需要的部分**分配属性预算。实测省 2.2~2.5× 存储而质量不降。**这个模式可以推广到任何「同一几何、多个渲染路径」的场景**（如：同一网格既做 EWA splatting 又做线框/法线/AOV 渲染）
  2. **「几何代理配准」比「优化结果配准」更稳**（**本文最可迁移的一条**）—— 跨模态/跨数据集配准时，**先各自提取干净的几何代理（MVS 点云 / 体数据表面网格），再在代理上配准**，不要直接对齐优化后的产品（floaters、欠拟合细节会把误差传播）。**论文用消融量化了这一点：仅 PCA 代理配准（0.0250）就优于 InsideOut 的全套层级对齐（0.0978）**
  3. **「PCA 找全局 + ICP 做局部」的两段式配准** —— identity 初始化的 ICP 会陷入局部极小甚至在对称物体上退化缩放。**PCA 必须要先做**
  4. **「边缘结构可迁移、绝对值不可迁移」的损失设计** —— $\mathcal{L}_{\mathrm{geo}}$ 用 CT 深度做 stop-gradient 目标、只约束**梯度结构**而非绝对值。这是一个**弱监督跨模态约束**的漂亮范式，可用于任何「两个模态共享结构但尺度/偏移不同」的场景
  5. **「停止优化某部分的损失以防耦合漂移」** —— Stage 2 里**保留 X 光光度损失不冻结**，理由是 RGB 梯度会把共享几何带偏以改善外观、牺牲 X 光保真度。**多任务联合优化时的通用防御手段**
  6. **多模态密度控制要维护多套梯度统计**（两模态反向频率/loss scale 不同）；**剪枝条件要用 AND 不是 OR**（一个基元可能对模态 A 不可见但对模态 B 有效）—— 这个「模态感知的剪枝」思路很实用
  7. **「降级」代替「剪枝」** —— 表面集内不透明度过低的基元**降级退出表面集**而非删除，仍参与 X 光渲染。软性移除比硬删除更安全
  8. **更精细的初始几何不等于更好的结果** —— FDK 初始化（已含完整体信息）反而不如 MVS 初始化。**持续的几何监督 > 一次性的好初始化**
- **优先级建议**: 🟡 **P2 — 特定场景推荐，通用技巧强烈推荐借鉴**。若做数字遗产/工业质检/内外同显 → 直接可用（代码开源，数据部分可获取）。对所有团队，**第 2、4、5、6 条技巧是即插即用的设计模式**，尤其第 2 条在多模态融合管线中价值很高
