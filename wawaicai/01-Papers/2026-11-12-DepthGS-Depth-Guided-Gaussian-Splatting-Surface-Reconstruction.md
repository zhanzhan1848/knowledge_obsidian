---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, 几何处理, 表面重建, 高斯泼溅, 3DGS, 深度正则化, 几何一致性, PGSR, TSDF, 测地法]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.13628
---

# DepthGS: Depth-Guided Gaussian Splatting with Adaptive Regularization — 深度引导的高斯泼溅自适应正则化

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DepthGS: Depth-Guided Gaussian Splatting with Adaptive Regularization for High-Quality Surface Reconstruction |
| **作者** | Xiao Ren, Yu Liu, Ning An, Jian Cheng, Xin Qiao, You-Fu Li, **He Kong（通讯）** |
| **单位** | 南方科技大学 自动化与智能制造学院；中国煤炭科工集团 矿山人工智能研究院；西安交通大学 人工智能与机器人研究院；香港城市大学 机械工程系 |
| **发表** | arXiv 2026-11-10 (cs.CV)，**将发表于 IEEE TPAMI** |
| **链接** | [原文](https://arxiv.org/abs/2611.13628) ｜ [HTML 全文](https://arxiv.org/html/2611.13628v1) |
| **DOI** | 10.48550/arXiv.2611.13628 |
| **代码** | 未在摘要中给出（基线 PGSR 为开源） |
| **资助** | 国家重点研发计划 2024YFB4710900；NSFC U24A20265；深圳市科技计划 KQTD20221101093557010；广东省科技计划 2024B1212010002 |

---

## 核心贡献

> **首次给出"深度差 ↔ 重建误差"的严格上界**，并把 $D_u$ 与 $D_{\mathcal{D}}$ 两种深度表示之间的差值 $\lvert\Delta D\rvert$ 直接当作**局部几何可靠性度量**，用来自适应调制法向约束的强度；多视图情形再推广出跨视图深度一致性正则。

1. **理论上界（Lemma 1 / Lemma 2）**：证明无偏深度重建误差 $E_{sv} \le \int w(p)\left(\epsilon_{\mathcal{D}}^{sv}(p)+\lvert\Delta D(p)\rvert\right)^2 dp$，其中 $\lvert\Delta D(p)\rvert$ **恰好等于** $X_u$ 与 $X_{\mathcal{D}}$ 两点的欧氏距离。跨视图版本给出 $E_{mv} \le 2\sum_{(i,j)}\int w_{ij}\!\left[\left(\epsilon_{\mathcal{D},ij}^{mv}\right)^2+r_{\Delta,ij}^2(p)\right]dp$，并把 $r_\Delta^2$ 精确分解为 $(\Delta\delta)^2+(\Delta D^{\mathcal{V}_c})^2\sin^2\theta$。
2. **单视图自适应法向正则**：权重 $\mathcal{W}_{\Delta D}(p)=1-\dfrac{\lvert\Delta D(p)\rvert-\Delta D_{\min}}{\Delta D_{\max}-\Delta D_{\min}+\sigma}$。**深度差小 → 权重高 → 法向约束强；深度差大 → 权重低 → 约束放松**，避免把不可靠的局部几何误差"传染"到整条法向场。
3. **跨视图深度一致性正则**：把当前视图的 $D_u$ / $D_{\mathcal{D}}$ 沿相机射线变换到邻居视图，构造 $\Delta\delta$ 残差做一致性约束，配合联合有效性掩码 $\mathcal{M}(p)$ 剔除越界/无效深度。
4. **端到端可落地**：基线 PGSR 的超参几乎全部沿用，仅新增 $\sigma=10^{-6}$ 与 $\lambda_5=0.008$ 两个量。单张 RTX 4090，30k 迭代。

---

## 技术方案

### 核心思想

3DGS 的表面重建路线里，渲染器同时产出两个深度：

$$\mathcal{D}(p)=\sum_{i\in N}T_i\alpha_i d_i,\qquad D_u(p)=\frac{\mathcal{D}(p)}{\mathbf{N}(p)\cdot v(p)}$$

- $D_{\mathcal{D}}$（rendered distance）：各高斯平面到相机的距离按 $\alpha$ 混合；
- $D_u$（unbiased depth）：用渲染法向 $\mathbf{N}(p)$ 校正射线方向后的深度（沿 PGSR）。

两者的差 $\Delta D(p)=D_u(p)-\mathcal{D}(p)$ 在论文中被证明**不是一个纯经验量，而是重建误差的一阶上界项**。论文观察到：$\lvert\Delta D\rvert$ 大的区域往往对应**高斯分布不规则**的区域（图 2）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **误差传递（Lemma 1）** | 由三角不等式 $\epsilon_u^{sv}\le\epsilon_{\mathcal{D}}^{sv}+\lVert\pi^{-1}(p,D_u)-\pi^{-1}(p,\mathcal{D})\rVert_2$，后者化简为 $\lvert\Delta D(p)\rvert$（利用 $\lVert v(p)\rVert_2=1$） |
| **可靠性权重** | 深度差 → 归一化 → 反向映射为 $[0,1]$ 权重；$\sigma>0$ 防除零；$\Delta D_{\min/\max}$ 取有效像素上的极值 |
| **边缘感知调制** | 完整权重 $\mathcal{W}(p)=\mathcal{W}_{\Delta D}(p)\left(\overline{\nabla I}(p)\right)^2$，其中图像梯度项继承自 PGSR |
| **联合有效性掩码** | $\mathcal{M}(p)=\mathbb{I}[$四个重投影坐标在 $[0,W)\times[0,H)$ 内 **且** $\hat{D}_u^{\mathcal{V}_n}>\tau_d$ **且** $\hat{D}_{\mathcal{D}}^{\mathcal{V}_n}>\tau_d]$；$\tau_d=0.1$ |
| **共享目标射线构造** | 将变换后的深度投影到目标视图射线上，得到标量残差 $\Delta\delta=\lvert\Delta D^{\mathcal{V}_n}-\Delta D^{\mathcal{V}_c}\cos\theta\rvert$ |
| **法向–射线一致性** | 用 $\mathbf{N}(p)\cdot v(p)$ 量化法向是否与视线对齐（理想值 1.0）作为诊断指标 |

### 公式

```math
% ---- 单视图误差上界 (Lemma 1) ----
E_{sv} \triangleq \int_{\Omega} w(p)\left(\epsilon_u^{sv}(p)\right)^2 dp
\le \int_{\Omega} w(p)\left(\epsilon_{\mathcal{D}}^{sv}(p)+|\Delta D(p)|\right)^2 dp

% ---- 深度差 = 两点欧氏距离 ----
\left\|\pi^{-1}(p,D_u)-\pi^{-1}(p,\mathcal{D})\right\|_2
= |\mathcal{D}(p)|\left|\frac{1}{\mathbf{N}(p)\cdot v(p)}-1\right|
= |\Delta D(p)|

% ---- 可靠性权重 ----
\mathcal{W}_{\Delta D}(p)=1-\frac{|\Delta D(p)|-\Delta D_{\min}}
                              {\Delta D_{\max}-\Delta D_{\min}+\sigma},
\qquad \sigma=10^{-6}

% ---- 单视图自适应法向正则 ----
\mathcal{L}_{svgeo}=\frac{1}{|\Omega_{D_{\mathcal{D}}}|}
\sum_{p\in\Omega_{D_{\mathcal{D}}}}\mathcal{W}(p)
\left\|\mathbf{N}_d(p)-\mathbf{N}(p)\right\|_1

% ---- 多视图误差上界 (Lemma 2) ----
E_{mv}\le 2\sum_{(i,j)\in\mathcal{P}}\int_{\Omega_{ij}}w_{ij}(p)
\left[\left(\epsilon_{\mathcal{D},ij}^{mv}(p)\right)^2+r_{\Delta,ij}^2(p)\right]dp

% ---- 深度差残差的精确分解 ----
r_{\Delta}^2=(\Delta\delta)^2+(\Delta D^{\mathcal{V}_c})^2\sin^2\theta
```

### 复杂度

- **时间复杂度**：$O(n_{G} \cdot n_{pix})$ —— 与 PGSR 同阶（高斯排序 + 光栅化 + 两遍 depth/normal 渲染）。新增的权重计算是逐像素 $O(1)$；跨视图一致性需额外一次邻居视图的深度/法向重投影，仍是 $O(n_{pix})$。
- **空间复杂度**：$O(n_{G} + n_{pix})$。相比基线需多存两张 $\lvert\Delta D\rvert$ 相关图与权重图，量级 $O(n_{pix})$，可在线融合。
- **训练开销**：30k 迭代，单张 RTX 4090（DTU 单场景 17min → 本文约同等量级）。

---

## 实验结果

### DTU 表面重建（Chamfer distance, mm ↓）

| 方法 | Mean CD | 时间 |
|------|---------|------|
| NeRF / VolSDF / NeuS | 0.86 / 0.86 / 0.84 | >12h |
| 2DGS | 0.79 | 8.5min |
| GOF | 0.83 | 33min |
| GFSGS | 0.63 | 9.9min |
| GS-Pull | 0.64 | 22min |
| GS-UDF | 0.68 | 25min |
| **PGSR（基线）** | **0.53** | 17min |
| GSDF | 0.80 | 32min |
| QGS | 0.59 | 48min |
| GSPrior | 0.50 | 42min |
| **DepthGS（本文）** | **0.51** | ≈ 同基线 |

> 相对基线 PGSR **0.53 → 0.51 mm**；绝对值略逊于 GSPrior（0.50），但训练时间仅其 1/2.4。

### Tanks and Temples（F1-score ↑，Mean）

| 方法 | Mean F1 |
|------|---------|
| 3DGS | 0.090 |
| 2DGS | 0.263 |
| GOF | 0.458 |
| PGSR | 0.495 |
| GS-Pull | 0.430 |
| QGS | 0.500 |
| GSPrior | **0.507** |
| **DepthGS** | **0.503** |

### Mip-NeRF360 新视角合成（Overall）

| 方法 | SSIM ↑ | PSNR ↑ | LPIPS ↓ |
|------|--------|--------|---------|
| 3DGS | 0.837 | 28.13 | 0.198 |
| PGSR | 0.841 | 27.45 | 0.181 |
| GSPrior | 0.844 | 27.69 | 0.178 |
| **DepthGS** | 0.841 | **27.72** | **0.175** |

> 渲染质量与几何质量**同时不降**，这是本文的重要卖点——几何正则没有牺牲外观保真度。

---

## 实现难度与数值稳定性

- **算法复杂度**：**中**。工程上是 PGSR 之上的两个 loss 项 + 一个权重图，不需要改渲染器内核（法向、unbiased depth 均已由 PGSR 提供）。
- **数值稳定性**：
  - $\sigma=10^{-6}$ 防止 $\Delta D_{\max}=\Delta D_{\min}$（全零深度差）时除零 ✅
  - 权重被裁剪在 $[0,1]$ 内，不会出现负权重放大噪声 ✅
  - 跨视图项用 $\tau_d=0.1$ 剔除无效深度，避免 $\mathbf{N}\cdot v$ 接近 0 时 $D_u$ 爆炸 ✅
  - ⚠️ **风险点**：`$D_u = \mathcal{D}/(\mathbf{N}\cdot v)$` 在法向近乎垂直于视线时（grazing angle）分母趋零，仍可能产生离群深度。论文靠 $\tau_d$ 掩码而非软化处理，工程实现时建议额外对 $\lvert\mathbf{N}\cdot v\rvert$ 设下限。
  - ⚠️ $\Delta D_{\min}/\Delta D_{\max}$ 是**全局**统计量，若场景深度动态范围大，归一化后小深度差区域权重会被压低。可考虑改用分位数截断或局部窗口极值。
- **依赖项**：PyTorch + diff-gaussian-rasterization（PGSR 代码库）；无需 libigl / CGAL。

---

## 推荐结论

### ✅ 推荐实现

**理由**：
1. **改动极小、收益明确**：在已有 PGSR 管线里加两个 loss + 一张权重图，DTU CD 降 0.02 mm，渲染指标不退化。
2. **理论可迁移**：$\lvert\Delta D\rvert$ 作为"局部几何可靠性"这一思想**不限于 3DGS**——任何"两种几何估计不一致"的问题都可以套用（法向场 vs 位置场、深度 vs 网格距离场）。可迁移到我们自己的几何管线做**自适应正则强度调度**。
3. **工程成本低**：无需新数据、无需新模型结构、训练时间不变。

**建议落地方式**：
- 若我们已有基于 TSDF/SDF 的表面重建后端，可把"深度差"换成"预测 SDF 与渲染距离图的残差"，得到同构的自适应权重机制。
- 直接移植 PGSR + DepthGS 两个 loss 到我们的重建管线，作为**法向/位置正则的自适应加权基线**。

---

## 开源参考

- **PGSR（基线）**：`https://github.com/dvlab-research/gaussian-splatting` 相关分支（unbiased depth + multi-view regularizer）
- **2DGS**：平面高斯表示，`https://github.com/hbb1/2d-gaussian-splatting`
- **GSPrior**：自约束几何先验，`https://github.com/YYXin/GSPrior`
- **libigl**：若需要从 TSDF 提取网格后的后处理（清理、自交检测、法向一致化），可用 `igl::copy_sign_coplanar`、`igl::orient_outward`
- **CGAL**：`CGAL::Polygon_mesh_processing::orient_polygon_soup`、`CGAL::Polygon_mesh_processing::remove_self_intersections`（TSDF marching cubes 后的清理）

---

## 相关笔记

- [[2026-11-10-Spaghetti-Splatting-Curvilinear-Dirac-Masses]]
- [[2026-11-06-GPU-Native-Real-Time-Textured-Mesh-Reconstruction]]
- [[2026-11-09-Dynamic-GPU-Sparse-Grids-NanoVDB]]
- [[2026-11-06-Representation-Aware-Closed-Surface-Parameterization]]

> 本笔记由 wawaicai（🥬）每日几何处理论文搜索任务生成，2026-11-12。
