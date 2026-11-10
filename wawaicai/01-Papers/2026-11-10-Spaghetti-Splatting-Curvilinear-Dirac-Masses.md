---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 几何处理, 神经渲染, 高斯泼溅, 线状图元, 体积渲染, 头发重建, cs.CV]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.12716
---

# Spaghetti Splatting: Differentiating Curvilinear Dirac Masses via Convolution

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Spaghetti Splatting: Differentiating Curvilinear Dirac Masses via Convolution |
| **作者** | George Shramko, Shrisudhan Govindarajan, Rudy Lam, Yizheng Xie, Daniel Rebain, David B. Lindell, Andrea Tagliasacchi |
| **单位** | Simon Fraser University / Wayve Labs / University of British Columbia / University of Toronto |
| **发表** | arXiv 2026-11-09 (cs.CV)，10 页 8 图 1 表，CC Zero 许可 |
| **链接** | [原文](https://arxiv.org/abs/2611.12716) |
| **DOI** | 10.48550/arXiv.2611.12716（arXiv DOI，DOI 10.48550 待注册） |
| **代码** | 论文承诺 "commit to fully release code"，**截至 2026-11-10 尚未公开仓库地址** |
| **并发工作** | Tojo 等 "Inverse rendering for modeling with line primitives"，ACM TOG 45(6)，**SIGGRAPH Asia 2026**（明确标注为 concurrent） |

---

## 核心贡献

> 把「Dirac 质量 + 低频核卷积」这一 3DGS/Poisson 重建的通用配方，沿**核**与**图元**两个方向推广到曲线状（curvilinear）图元，得到一个严格包含 3DGS 的可微表示。

1. **提出 Spaghetti Splatting**：将 3DGS 的点支撑替换为有限长度线段支撑，卷积各向异性高斯核（或 Beta 核）后得到**曲线状可微图元**，并证明折线的卷积随分段收缩**收敛到连续曲线的卷积**。
2. **闭式体积渲染**：推导沿相机射线的高斯卷积线段光学厚度闭式解，只需高斯误差函数 `erf`，**避免 Owen's T 函数**（高斯卷绕多边形才需要），把每个图元-像素对的计算压到常数级。
3. **逐段独立渲染 + 联合优化**：每段单独做体积渲染再沿射线合成，使连接段在关节处**不重复计数**；用 `L_connect` 吸引损失主动把邻近折线端点拉近，生长出长程连续发丝。
4. **原生抗锯齿**：在 EWA 线性化下同时支持 Mip-Splatting 的 3D + 2D 滤波器，**每像素只需 1 次采样**（并发工作 Line Primitives 需 4 次采样，因为不支持空间卷积）。
5. **严格超集**：当 `a = b`（零长度曲线）时精确退化为 3DGS 点核，因此泛化场景性能与 SOTA 持平，线状几何上**刷新 SOTA**。

---

## 技术方案

### 核心思想

论文把 3DGS、Poisson 重建、EWA splatting 统一到同一个 L2 目标下：

```math
\mathcal{L}_2 = \sum_c \Big\lVert \bm{I}_c - \mathcal{R}_c\Big(\sum_i \delta_i \circledast k_i\Big)\Big\rVert_2
```

其中 $\delta_i$ 是第 $i$ 个图元的 Dirac 测度，$k_i$ 是卷积核。**卷积核与 Dirac 测度是相互独立的自由度**，因此可沿两条轴推广：

| 方向 | 点质量 $\delta$ | 核 $k$ | 对应工作 |
|------|------|------|------|
| 核轴 | 点 | 高斯 | 3DGS |
| 核轴 | 点 | Beta | Deformable Beta Splatting (DBS) |
| 图元轴 | 线段 | 高斯/Beta | **本文** |
| 图元轴 | 三角 | — | 3D Triangle Splatting |
| 图元轴 | 曲线 | 高斯/Beta | **Spaghetti Splatting** |

### 关键技术

| 技术 | 说明 |
|------|------|
| **线段测度** | $\bm{x}(u) = \bm{a} + u\bm{v}$，$u\in[0,1]$，$\bm{v} = \bm{b}-\bm{a}$；测度 $m(\bm{x}) = \int_0^1 \delta(\bm{x}-\bm{x}(u))\,du$ |
| **卷积图元** | $\mathcal{P}(\bm{x}) = [m \circledast \mathcal{N}_{\bm{\Sigma}}](\bm{x})$，$\bm{\Sigma}$ 为各向异性协方差 |
| **密度场** | $\sigma(\bm{x}) = \rho \int_0^1 \mathcal{N}_{\bm{\Sigma}}(\bm{x}-\bm{x}(u))\,du$（Dirac sifting 性质化简） |
| **光学深度** | $\tau(\bm{r}) = \int_{-\infty}^{\infty}\sigma(\bm{r}(t))dt$，用 Tonelli 定理交换积分顺序（$\mathcal{N}_{\bm{\Sigma}} \ge 0$ 保证合法） |
| **射线边缘化** | 内层积分是沿射线的高斯积分，本身是段坐标 $u$ 上的一维高斯 $f(u)=f(\bar{u})e^{-\kappa^2(u-\bar{u})^2}$ |
| **闭式解** | $\tau(\bm{r}) = \frac{\rho f(\bar{u})\sqrt{\pi}}{2\kappa}\Big[\operatorname{erf}(\kappa\bar{u}) + \operatorname{erf}(\kappa(1-\bar{u}))\Big]$ |
| **EWA 线性化** | 每帧在中点算一次 EWA，再沿段用逆深度缩放，把每像素评估降为少量屏幕空间量 |
| **抗锯齿** | 3D 滤波器（限制到训练视图最大采样率）+ 2D 滤波器（亚像素高斯），两者在 EWA 线性化下直接叠加到投影核的协方差上 |
| **密集化** | 借鉴 3DGS-MCMC：按不透明度剪枝与重定位；**长段一分为二，短段克隆**。子段继承父段密度时图像空间渲染**完全不变**（保证可微性） |

### 关键推导（数学）

```math
// 段坐标的高斯边缘化参数
\kappa^2 = \lVert\bm{v}\rVert^2_{\bm{Q}_\perp}, \qquad
\bar{u} = \frac{\bm{v}^{\top}\bm{Q}_\perp(\bm{o}-\bm{a})}{\kappa^2}
```

其中 $\bm{Q} = \tfrac{1}{2}\bm{\Sigma}^{-1}$，$\bm{Q}_\perp = \bm{Q} - \bm{Q}\bm{d}\bm{d}^{\top}\bm{Q}/(\bm{d}^{\top}\bm{Q}\bm{d})$ 是 $\mathcal{N}_{\bm{\Sigma}}$ 沿相机射线的边缘矩阵。

```math
// 闭式光学深度核心
\tau(\bm{r}) = \rho\,f(\bar{u}) \frac{\sqrt{\pi}}{2\kappa}
\Big[\operatorname{erf}(\kappa\bar{u}) + \operatorname{erf}(\kappa(1-\bar{u}))\Big]
```

```math
// 总优化目标
\mathcal{L} = \mathcal{L}_{\mathrm{recon}} + \lambda_1 \mathcal{L}_{\mathrm{MCMC}} + \lambda_2 \mathcal{L}_{\mathrm{connect}}
```

其中 $\mathcal{L}_{\mathrm{recon}}$ 为标准 $L_1$ + D-SSIM 光度损失，$\mathcal{L}_{\mathrm{MCMC}}$ 为 3DGS-MCMC 的不透明度与宽度正则，$\mathcal{L}_{\mathrm{connect}}$ 为折线端点欧氏距离吸引项。

---

## 实验结论

### 泛化场景（23 个场景：Mip-NeRF 360 / Shelly / Fuzzy）

| 方法 | Mip-NeRF360 PSNR↑ | SSIM↑ | LPIPS↓ | FPS↑ | Shelly PSNR↑ | Fuzzy PSNR↑ |
|------|------|------|------|------|------|------|
| Line Primitives (Tojo 等, 并发) | 8.66 | 0.350 | 0.571 | 287 | 33.75 | 33.64 |
| Gaussian Frosting | 26.93 | 0.804 | 0.209 | 59 | 36.33 | 34.29 |
| 3DGS-MCMC + SV8 | 28.39 | 0.834 | 0.190 | 198 | 37.10 | 35.00 |
| DBS + SV8 | 28.71 | 0.837 | 0.189 | 125 | 37.22 | 34.98 |
| **Ours, Gaussian kernel** | 28.56 | 0.835 | 0.200 | 177 | **37.38** | **35.03** |
| **Ours, Beta kernel** | **28.78** | **0.838** | 0.193 | 129 | 37.12 | 34.90 |

- **数据集**：Mip-NeRF 360（室内降采样 2×、室外 4×，每 8 张留 1 测试）；Shelly（1920×1080，白背景，注意官方 train/test 有泄漏需人工剔除）；Fuzzy（4× 降采样）
- **训练**：30k 迭代（Mip-NeRF 360 室外按 SV8 惯例 20k）；MCMC 重定位在结束前 5k 停止，之后才做折线合并；图元数上限 Shelly/Fuzzy 为 500k
- **外观模型**：统一采用 Spherical Voronoi 8 sites (SV8)
- **结论**：Beta 核在 Mip-NeRF 360 上超越全部基线；高斯核在 Shelly / Fuzzy 上超越全部基线；帧率与 3DGS-MCMC 持平
- **Line Primitives 只有 8.66 PSNR**，因其光栅化等宽细线，无法建模真实场景

### 头发重建（GeomHair 8 种发型 + Yuksel 卷发模型）

| 方法 | PSNR↑ | SSIM↑ | LPIPS↓ | F1 @2mm | @3mm | @4mm |
|------|------|------|------|------|------|------|
| Gaussian Haircut | 29.56 | 0.923 | 0.064 | 46.9 | 63.5 | 72.7 |
| **Ours (Gaussian kernel)** | **32.25** | **0.940** | **0.043** | **61.2** | **80.3** | **88.9** |

- **几何指标**：按 Takimoto 等的标准——双方重采样到 0.5mm，若另一组中存在距离阈值内且切线夹角小于角度阈值的点则判为正确
- **协议**：GeomHair 400 种发型中选 8 种，置于头部网格，Blender 路径追踪 100 视角 1200×800，留出 88 训练 / 12 测试
- **优势来源**：无需 hair-specific 先验，而 Gaussian Haircut 需要；且默认会剪掉拟合球外的所有高斯（短发型会丢下巴与脖子）

### 消融实验

Midpoint splits / Segment cloning / Polyline merging / Attraction regularization 四个组件分别有贡献。

---

## 局限性

1. **高频纹理需要高频几何**：颜色高频 → 需要大量短线段，复现精细纹理代价高。作者建议配合可学习纹理图。
2. **核在端点间插值未探索**：若插值核，可扩展到锥体、三角形、梯形乃至曲面。
3. **真实头发重建仍困难**：需要更细致地融合学习到的头发先验。
4. **拓扑恢复是"副产品"**：作者明确声明「自动恢复拓扑的更广泛主张仍需进一步评估」——这是重要的诚实声明，生成的连续发丝是优化涌现的，不是有保证的拓扑重建算法。
5. 尚未探索前馈预测该表示。

---

## 相关工作

- [[3D-Gaussian-Splatting]] — 基础表示
- [[Deformable-Beta-Splatting]] — Beta 核
- [[Mip-Splatting]] — 抗锯齿
- [[Spherical-Voronoi]] — 外观建模
- [[3DGS-MCMC]] — 密集化策略
- [[EWA-Splatting]] — 投影线性化
- [[Poisson-Reconstruction]] — 卷积核思想来源
- [[Spaghetti-Splatting]]（本文）
- [[Line-Primitives-Tojo]] — 并发工作

---

## 实现建议

- **实现难度**：**高**。需要 CUDA kernel 实现 EWA 线性化的段投影 + 闭式 `erf` 计算 + tile-based 光栅化 + 前向/反向传播；反向传播涉及对 `erf` 和投影雅可比的链式求导。
- **数值稳定性**：
  - `κ = 0`（段长趋零或方向与视线平行）时 `1/(2κ²)` 与 `1/κ` 发散，需加 epsilon 保护；退化到点时正是 3DGS 的行为
  - `erf(κ·0.5) + erf(κ·0.5)` 在 κ 大时饱和到 2，数值稳定
  - 段细分时子段继承父段密度保证渲染不变，是保证优化稳定的重要性质
- **依赖项**：CUDA / C++，参考 3DGS rasterizer、diff-gaussian-rasterization；Beta 核可参考 DBS
- **预期性能**：RTX 4090 上 FPS 与 3DGS-MCMC 持平（Mip-NeRF360: 177 vs 198）
- **适用场景**：
  - **头发/毛发/纤维状几何重建**（最直接受益）
  - 细长结构：电线、绳索、树枝、自行车辐条
  - 需要可物理仿真对象的表示（长连通段可直接喂给物理引擎）
  - 建筑线稿提取、线状图元（wireframe）表示
- **对几何处理的意义**：这是"卷积核 + 图元"范式的第三个推广，把「可微图元」从点/三角形扩展到曲线，是把 CAD / 曲线表示引入神经渲染的关键一步。对做 CAD-神经渲染交叉（如 BRep 网络）的研究者，这是必读文献。

---

## 可视化建议

- 图 2（Kernel ⊛ Dirac）最能说明方法：横向是 Dirac 测度（点 → 线段 → 折线），纵向是核（高斯 / Beta / 各向异性 Beta）
- 图 5（收敛性）：4 / 8 / 16 / 32 段 Beta 折线的独立光栅化结果对比，展示关节处无结点
- 图 8（头发）：随机着色每根发丝，与 ground-truth 发丝对比
- 复现建议：先用高斯核 + 简单场景（如单个弯曲线条）验证闭式解正确性，再上 MCMC 密集化
