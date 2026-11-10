---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, 体积渲染, 高斯泼溅, 可微渲染, 反向渲染, EWA, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12716
arxiv_id: 2611.12716
---

# Spaghetti Splatting: Differentiating Curvilinear Dirac Masses via Convolution

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Spaghetti Splatting: Differentiating Curvilinear Dirac Masses via Convolution |
| **作者** | George Shramko, Shrisudhan Govindarajan, Rudy Lam, Yizheng Xie, Daniel Rebain, David B. Lindell, Andrea Tagliasacchi（多伦多大学 / NVIDIA / Apple 等） |
| **发表** | arXiv cs.GR, 2026-11-09（10 页, 8 图, 1 表） |
| **链接** | [原文](https://arxiv.org/abs/2611.12716) / [HTML 全文](https://arxiv.org/html/2611.12716v1) |
| **DOI** | —（arXiv 预印本） |
| **代码** | 论文未在摘要中给出（补充材料提及项目主页） |

---

## 核心贡献

> **把 3D Gaussian Splatting 的「Dirac 质量 ⊛ 低频核」配方推广到曲线基元**：用**线段的卷积**构造可微的曲线原语，天然支持抗锯齿，且输出的长连接「面条」可直接用于物理仿真——3DGS 的**严格超集**。

1. **统一配方**：论文指出 EWA splatting、Poisson 重建、3DGS 都是「Dirac 质量 ⊛ 低频核」，该配方沿**两个轴**推广——**核**与**基元**。点与三角形已被充分研究，本文沿第三个方向进攻：**曲线基元**。
2. **线段卷积基元**：用端点 $a,b$ 参数化有限长度线段，用各向异性高斯核卷积得到原语 $\mathcal{P}=[m\circledast\mathcal{N}_\Sigma]$；当 $a=b$ 时**退化为 3DGS 点基元**。
3. **闭式体渲染积分**：利用 Tonelli 定理交换积分次序 + Dirac delta 的 sifting 性质，把光线上的不透明度化为**单个一维高斯积分**，并用 $\mathrm{erf}$ 求出**闭式解**（可换任意核，如 Beta 核）。
4. **EWA 加速 + 解析抗锯齿**：每帧在中点算一次 EWA 并按逆深度沿线段缩放；3D + 2D 高斯预滤波在闭式解下**单采样即可完成**，**不需要多点采样抗锯齿**。
5. **头发重建上大幅超越专用方法**：比 Gaussian Haircut 高 **2.7 dB PSNR**、F1 分数高 **14.3 个百分点**（2 mm 阈值）。

---

## 技术方案

### 核心思想

**3DGS 作为卷积**：3D 高斯原语 $\mathcal{G}$ 可解释为 Dirac 质量与零均值高斯核的卷积

$$\mathcal{G}(\bm{x})=\big[\delta(\cdot-\bm{\mu})\circledast\mathcal{N}_{\bm{\Sigma}}\big](\bm{x}),\qquad \bm{x}\in\mathbb{R}^3$$

这个解释**把基元的支撑与核解耦**——核决定原语如何在 3D 空间延展。于是可以**只换支撑，不换核**：把点支撑换成线段支撑。

**线段基元**：端点 $\bm{a},\bm{b}\in\mathbb{R}^3$，$\bm{v}=\bm{b}-\bm{a}$，参数化 $\bm{x}(u)=\bm{a}+u\bm{v},\ u\in[0,1]$，其测度为

$$m(\bm{x})=\int_{0}^{1}\delta\big(\bm{x}-\bm{x}(u)\big)\,\mathrm{d}u$$

原语为该测度与各向异性高斯核的卷积：

$$\mathcal{P}(\bm{x})=\big[m\circledast\mathcal{N}_{\bm{\Sigma}}\big](\bm{x})$$

> **当 $\bm{a}=\bm{b}$ 时即恢复 3DGS 的点核 —— 故 Spaghetti Splatting 是 3DGS 表示的严格推广。**
> 该形式自然延伸到其他卷积核，如 DBS 的 Beta 核。

### 关键技术

| 技术 | 说明 |
|------|------|
| 密度场 | $\sigma(\bm{x})=\rho\,[m\circledast\mathcal{N}_\Sigma](\bm{x})=\rho\int_0^1 \mathcal{N}_\Sigma(\bm{x}-\bm{x}(u))\,\mathrm{d}u$（Dirac sifting property 塌缩内层积分） |
| 光学深度 | $\tau(\bm{r})=\rho\int_0^1 \underbrace{\int_{-\infty}^{\infty}\mathcal{N}_\Sigma(\bm{r}(t)-\bm{x}(u))\,\mathrm{d}t}_{f(u)}\,\mathrm{d}u$（Tonelli 定理允许换序，因 $\mathcal{N}_\Sigma\ge 0$） |
| 闭式解 | $f(u)$ 是关于 $u$ 的一维高斯，$\kappa^2=\lVert\bm{v}\rVert^2_{\bm{Q}_\perp}$，$\bar{u}=\frac{\bm{v}^\top\bm{Q}_\perp(\bm{o}-\bm{a})}{\kappa^2}$，$\bm{Q}=\tfrac12\bm{\Sigma}^{-1}$，$\bm{Q}_\perp$ 为沿相机射线的边缘协方差 |
| 抗锯齿 | 3D 滤波（band-limit 到训练视图最大采样率）+ 2D 滤波（亚像素屏幕空间高斯）。EWA 线性化下两者**都只是往投影核的协方差上加项**，故闭式解仍成立 → **每像素单采样** |
| 折线复合 | 每段**独立**做体渲染积分与不透明度计算，再作为独立原语沿射线复合——**避免接缝处重复计数** |
| 优化目标 | $\mathcal{L}=\mathcal{L}_{\mathrm{recon}}+\lambda_1\mathcal{L}_{\mathrm{MCMC}}+\lambda_2\mathcal{L}_{\mathrm{connect}}$，其中 $\mathcal{L}_{\mathrm{connect}}$ 是「吸引损失」，主动把邻近折线端点拉近 |
| 致密化 | 改造 3DGS-MCMC：**长段一分为二**（midpoint split），短段克隆（cloning）。关键性质：**子段继承父段密度时，图像空间的渲染结果完全不变** |
| 折线合并 | 训练中合并端点距离小于阈值的折线；合并在 relocation 停止后才运行 |

---

## 公式

```math
// 3DGS 作为卷积（式 5）
\mathcal{G}(\bm{x})=\big[\delta(\cdot-\bm{\mu})\circledast\mathcal{N}_{\bm{\Sigma}}\big](\bm{x})

// 线段测度（式 6）
m(\bm{x})=\int_{0}^{1}\delta\big(\bm{x}-\bm{x}(u)\big)\,\mathrm{d}u

// 原语：线段 ⊛ 各向异性高斯（式 7）
\mathcal{P}(\bm{x})=\big[m\circledast\mathcal{N}_{\bm{\Sigma}}\big](\bm{x})

// 密度场（式 8→11）
\sigma(\bm{x})=\rho\,[m\circledast\mathcal{N}_{\bm{\Sigma}}](\bm{x})
=\rho\int_{0}^{1}\mathcal{N}_{\bm{\Sigma}}\big(\bm{x}-\bm{x}(u)\big)\,\mathrm{d}u

// 不透明度（式 12）
\alpha(\bm{r})=1-\exp\!\big(-\tau(\bm{r})\big),\quad
\tau(\bm{r})=\int_{-\infty}^{\infty}\sigma\big(\bm{r}(t)\big)\,\mathrm{d}t

// 闭式光学深度（式 19）
\tau(\bm{r})=\frac{\rho\,f(\bar{u})\sqrt{\pi}}{2\kappa}
\Big[\operatorname{erf}\!\big(\kappa\bar{u}\big)+\operatorname{erf}\!\big(\kappa(1-\bar{u})\big)\Big]

// 其中
\kappa^2=\lVert\bm{v}\rVert^{2}_{\bm{Q}_{\perp}},\qquad
\bar{u}=\frac{\bm{v}^{\top}\bm{Q}_{\perp}(\bm{o}-\bm{a})}{\kappa^{2}},\qquad
\bm{Q}=\tfrac{1}{2}\bm{\Sigma}^{-1},\quad
\bm{Q}_{\perp}=\bm{Q}-\bm{Q}\bm{d}\bm{d}^{\top}\bm{Q}/(\bm{d}^{\top}\bm{Q}\bm{d})

f(\bar{u})=\sqrt{\frac{\pi}{\bm{d}^{\top}\bm{Q}\bm{d}}}\,
e^{-\lVert\bm{o}-\bm{x}(\bar{u})\rVert^{2}_{\bm{Q}_{\perp}}}
```

---

## 代码片段

```cpp
// EWA 快速渲染要点（论文 3.4）
// 逐段计算闭式解太慢 → 每帧只在中点算一次 EWA，沿段按逆深度缩放
// 好处：核可在屏幕空间变化，同时保持 3D 形状一致（for shorting 正确）
// 每像素评估量降为少量屏幕空间量

// 抗锯齿（论文 3.5，遵循 Mip-Splatting）
// 3D filter: band-limit 每个原语到训练视图的最大采样率
// 2D filter: 投影原语与亚像素屏幕空间高斯卷积
// 在 EWA 线性化下，两者都只是往投影核协方差上加项 → 闭式解仍可用
// → 每像素只需 1 个采样（对比 Tojo et al. 的 4 采样多点抗锯齿）

// 致密化（论文 3.6）
// 长段 split 成两半；短段 clone
// 关键：子段继承父段密度时，图像空间渲染完全不变

// 折线合并 + 吸引损失
// 合并端点距离 < 阈值的折线；L_connect 最小化邻近折线端点的欧氏距离
```

---

## 实验结论

- **数据集**：Mip-NeRF 360（23 场景中的子集，室内降采样 2×、室外 4×，每 8 张留 1 张测试）、Shelly（6 个含毛/羊毛/薄叶的合成物体，1920×1080 白底）、Fuzzy（8 个捕获的纤维状物体：仙人掌刺、毛、刷毛，降采样 4×）。全部使用 Spherical Voronoi SV8 外观模型。
- **基线**：3DGS-MCMC + SV8、DBS（Deformable Beta Splatting）+ SV8、Gaussian Frosting、**Line Primitives（Tojo et al.，并发工作）**。
- **结果（Table，通用场景）**：

| 方法 | M360 PSNR↑ | SSIM↑ | LPIPS↓ | FPS↑ | Shelly PSNR↑ | SSIM↑ | LPIPS↓ | FPS↑ | Fuzzy PSNR↑ | SSIM↑ | LPIPS↓ | FPS↑ |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Line Primitives | 8.66 | 0.350 | 0.571 | 287 | 33.75 | 0.932 | 0.068 | 731 | 33.64 | 0.939 | 0.055 | 858 |
| Gaussian Frosting | 26.93 | 0.804 | 0.209 | 59 | 36.33 | 0.955 | 0.047 | 121 | 34.29 | 0.948 | 0.043 | 124 |
| 3DGS-MCMC + SV8 | 28.39 | 0.834 | 0.190 | 198 | 37.10 | 0.959 | 0.050 | 464 | 35.00 | 0.956 | 0.041 | 422 |
| DBS + SV8 | 28.71 | 0.837 | 0.189 | 125 | 37.22 | 0.959 | 0.049 | 297 | 34.98 | 0.956 | 0.040 | 283 |
| **Ours, Gaussian 核** | 28.56 | 0.835 | 0.200 | 177 | **37.38** | **0.962** | 0.048 | 452 | **35.03** | **0.957** | 0.040 | 415 |
| **Ours, Beta 核** | **28.78** | **0.838** | 0.193 | 129 | 37.12 | 0.958 | 0.049 | 284 | 34.90 | 0.955 | **0.040** | 257 |

  - Beta 核在 Mip-NeRF 360 上**超越所有基线**；Gaussian 核在 Shelly 与 Fuzzy 上**超越所有基线**。
  - **FPS 与 3DGS-MCMC 持平**（而 Line Primitives 在 M360 上 PSNR 仅 8.66 ——因其光栅化定宽细线，无法建模真实场景）。
  - 可建模**宽的无纹理区域**（如阴影），这是 Line Primitives 做不到的。

- **结果（头发重建）**：GeomHair（8 个发型，100 视角 1200×800，Blender 路径追踪 + Chiang et al. 毛发着色模型）+ Yuksel 卷发模型。F1 阈值取 2mm/20°、3mm/30°、4mm/40°。

| 方法 | PSNR↑ / SSIM↑ / LPIPS↓ | F1 @ 2/3/4 mm ↑ |
|---|---|---|
| Gaussian Haircut | 29.56 / 0.923 / 0.064 | 46.9 / 63.5 / 72.7 |
| **Ours (Gaussian)** | **32.25 / 0.940 / 0.043** | **61.2 / 80.3 / 88.9** |

  → **PSNR 高 2.7 dB，F1 @ 2mm 高 14.3 个百分点**。定性上我们的发丝是**连续的、跟随边缘的长条**，而 Gaussian Haircut 的发丝结构散乱。

- **消融（Table 1，Fuzzy+Shelly+M360 平均）**：

| Midpoint split | Segment cloning | Polyline merging | Attraction loss | PSNR↑ | 平均连通分量大小 |
|---|---|---|---|---|---|
| ✗ | ✓ | ✓ | ✓ | 33.13 | 3.26 |
| ✓ | ✗ | ✓ | ✓ | **32.54** | 4.00 |
| ✓ | ✓ | ✗ | ✓ | 33.59 | 1.00 |
| ✓ | ✓ | ✓ | ✗ | 33.57 | 2.77 |
| ✓ | ✓ | ✓ | ✓ | 33.54 | 3.50 |

  - **段克隆最关键**：去掉后 PSNR 掉 1 dB（无法把表示容量重分配到需要短段的区域）。
  - **折线合并与吸引损失对重建指标几乎无影响**，但**决定结构连通性**：去掉合并后平均连通分量大小从 3.50 掉到 1.00（= 每段独立），折线彻底碎片化。
  - **midpoint split 移除后略降**，说明它对训练有贡献。

---

## 局限性

- 论文设有「Limitations and future work」小节（作者在正文中提及补充材料细节）。
- 折线合并与吸引损失**不提升重建质量**，仅改善结构连通性——若只关心图像指标可省略。
- **FPS 低于 Line Primitives**（M360 上 177 vs 287）——因为每段都是独立原语，计算量随段数增长。
- Gaussian 核在 M360 上 PSNR/LPIPS 略逊于 DBS（Beta 核），说明**核的选择影响显著**，Beta 核在通用场景更优。
- 依赖 Spherical Voronoi (SV8) 外观模型才能达到表中数字——**该对比未覆盖 SV8 之外的外观方案**。

---

## 相关工作

- [[2026-11-10_Spaghetti-Splatting-Curvilinear-Dirac-Masses]]
- 3DGS 谱系：[[3D Gaussian Splatting]] [[EWA Splatting]] [[Poisson 重建]]
- 卷积表面：[[卷积曲面]] (convolution surfaces)
- 几何基元：[[可微渲染]] [[逆渲染与线基元]]（Tojo et al. 2026，并发工作）
- 头发建模：[[Gaussian Haircut]] [[Hair Reconstruction]]
- 重要引文：Kerbl et al. 2023（3DGS）、3DGS-MCMC（Schied et al.）、DBS（Dewil et al.）、Mip-Splatting（Yu et al.）、HaloNet（Vaswani et al. CVPR'21）、Spherical Voronoi（Yu et al. 2024）

---

## 实现建议

- **实现难度**：**高**（需要推导闭式积分、实现 EWA 线性化、改造 MCMC 致密化逻辑、跑 3 个数据集的 30k 迭代训练）
- **预期性能**：RTX 4090 上 M360 177 FPS / Shelly 452 FPS / Fuzzy 415 FPS（Gaussian 核）；与 3DGS-MCMC 帧率相当
- **适用场景**：
  - ✅ **线状 / 纤维 / 细长几何**的重建（发丝、刷毛、仙人掌刺、轮辐、细叶）——这是相对 3DGS 的最大优势
  - ✅ 需要**连续连通结构**的场景（自动分段、光流、物理仿真）
  - ✅ 需要**可直接做物理仿真**的表示（长连接 strand）
  - ✅ 抗锯齿要求高但不想付多点采样的代价（单采样解析 AA）
  - ❌ 通用场景追求极致画质（Beta 核才勉强超越 DBS，且仅 +0.07 dB）
- **落地建议**：
  1. 先在**单一头发场景**上验证折线连通性（统计平均连通分量大小）——这是该表示的真正卖点，比 PSNR 更重要
  2. 段克隆（cloning）是致密化中**不可省略**的部分（掉 1 dB）
  3. 折线合并 + 吸引损失**不改善图像指标但决定结构**，若下游需要连通性则必须实现
  4. 优先尝试 **Beta 核**（M360 上最优），核与支撑解耦的设计使得换核只需替换卷积核
  5. 抗锯齿务必走「3D+2D 协方差加项」路线，可复用 EWA 闭式解，**避免 4 采样多点方案**
  6. 闭合不透明度用 $\mathrm{erf}$ 闭式，不要数值积分
- **优先级**：**中**——方法优雅且物理仿真场景独特，但通用场景增益有限
