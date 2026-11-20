---
type: paper
created: 2026-11-20
updated: 2026-11-20
tags: [paper, 几何处理, 网格优化, 重建, 重网格化, Laplacian预条件, 曲率自适应, 曲面对齐渲染, nvdiffrast, 3D资产]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.25414
---

# MODL: Watertight Mesh Optimization of Textured Objects

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Watertight Mesh Optimization of Textured Objects |
| **作者** | Nathaniel Burgdorfer, Philippos Mordohai |
| **单位** | Stevens Institute of Technology（计算学院） |
| **发表** | arXiv 2026-11-19（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2611.25414) ｜ [HTML 全文](https://arxiv.org/html/2611.25414v1) ｜ [项目页](https://nburgdorfer.github.io/modl/) |
| **DOI** | 10.48550/arXiv.2611.25414 |
| **代码** | 项目页已上线，代码未明确公布（License: CC BY 4.0） |
| **平台** | NVIDIA TITAN RTX，nvdiffrast 光栅化 |

---

## 核心贡献

> **首个仅从图像（RGB + 相机位姿 + 稀疏点）直接优化出「水密（watertight）三角形网格 + 视角相关外观」的框架**，无需分割掩码、深度图、法线图或 alpha 混合。

1. **统一表示的直接网格优化**：把几何和外观同时优化在**一个连通、水密、不透明**的三角网格上，取代「radiance field → 事后网格提取」的两段式管线。消除了后处理（TSDF 融合 / Poisson 重建 / Marching Cubes）对几何的破坏性。
2. **Laplacian 预条件优化**（Laplacian-preconditioned optimization）：在**差分坐标（differential coordinates）**上做梯度下降，把图像域的噪声梯度沿网格连通性扩散成空间相干的顶点更新。继承 Nicolet et al. 的思路，但**首次推广到真实世界带纹理物体**（原文工作仅在合成场景、常量 albedo 下验证）。
3. **曲率自适应重网格化**（curvature-adaptive remeshing）：基于**局部法向变化估计的曲率**分配目标边长，把三角形预算集中到高曲率区域；配合 Botsch & Kobbelt 的各向同性重网格化算子（split / collapse / edge flip / tangential relaxation）保持三角形形状良好。
4. **多视图 NCC 几何约束**：用**基于网格表面的重投影**计算邻接相机间的归一化互相关（NCC），**每像素用精确的到网格表面距离做 warping**（而非平面 homography），直接用图像光度一致性约束几何。
5. **评估范式升级**：同时报告**几何精度（Chamfer）、新视角合成（PSNR/SSIM）、内在网格质量（SIR / NMVR / NMER / BER / AR）**——论文明确批评现有工作「只测渲染不测网格内在质量」。

---

## 技术方案

### 核心思想

现有 3D 重建方法存在**结构性缺陷**：

| 路线 | 渲染质量 | 几何质量 | 网格内在质量 | 根本问题 |
|------|---------|---------|------------|---------|
| 3DGS | ✅ 优秀 | ❌ 多层高斯 | ❌ 无连通性 | 需事后提取 |
| 2DGS | 中 | 中 | ❌ 需 TSDF 融合 | TSDF 丢失细节 |
| Triangle Splatting | ✅ 优秀 | ❌ triangle soup | ❌ 无连通性 | TSDF 融合破坏外观 |
| MeshSplatting | 中 | 中 | ⚠️ 非流形 | 部分连通 + 自交 |
| **MODL** | 中 | ✅ 优秀 | ✅ 优秀 | — |

直接优化连通网格的核心困难在于：**图像域梯度噪声大、空间不相干**，会导致顶点位置剧烈震荡、收敛差，需要极小的学习率与强正则化——而这些又与主目标冲突。**Laplacian 预条件**正是解药：它不显式惩罚局部几何不一致，而是把梯度沿曲面传播。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Laplacian 预条件** | $\mathbf{M}=(1-\alpha)\mathbf{I}+\alpha\mathbf{L}$，$\mathbf{L}=\mathbf{D}-\mathbf{A}$（组合 Laplacian）。在差分坐标 $\mathcal{U}=\mathbf{M}\mathcal{V}$ 上优化，$\mathcal{V}=\mathbf{M}^{-1}\mathcal{U}$。是 Nicolet 的 $\mathbf{I}+\lambda\mathbf{L}$ 的缩放形式，$\lambda=\alpha/(1-\alpha)$，$0\leq\alpha<1$ |
| **自定义优化器** | 在 $\mathcal{U}$ 上跑带偏差修正的一/二阶矩估计（$\hat{\mathbf{m}}_t=\mathbf{m}_t/(1-\beta_1^t)$），梯度经 $\mathbf{M}^{-1}$ 回传到顶点。**因为 Laplacian 平滑了梯度，所以可以用比普通 Adam 大得多的学习率** |
| **曲率估计** | $\kappa_i=\left[\frac{1}{|\mathcal{N}(i)|}\sum_{j\in\mathcal{N}(i)}\frac{\|\mathbf{n}_i-\mathbf{n}_j\|_2^2}{\|\mathbf{v}_i-\mathbf{v}_j\|_2^2}\right]^{1/2}$——法向差的平方除以边长平方，**允许在长边上检测出大曲率** |
| **面积加权平均曲率** | $\bar{\kappa}=\frac{1}{A}\sum_{i}a_i\kappa_i$，$a_i$ 为顶点关联三角形面积的三分之一 |
| **曲率自适应边长** | $h_i=\sqrt{\frac{4A}{\sqrt{3}B}\cdot\frac{1+w\bar{\kappa}}{1+w\kappa_i}}$，$w\geq0$ 控制曲率敏感度。$w=0$ → 均匀边长；**曲率越大 → 边长越短 → 高曲率区获得更多三角形预算** |
| **边级目标长度** | $\bar{h}_{ij}=(h_i+h_j)/2$，据此决定 split（边长 > 目标）/ collapse（边长 < 目标） |
| **各向同性重网格化** | Botsch & Kobbelt 流程：split / collapse / **edge flip**（改善顶点 valence 分布）/ **tangential relaxation**（顶点移向 one-ring 质心并在局部切平面内投影后投影回曲面）。目标：近似等边三角形，**不施加显式角度或长宽比约束** |
| **面预算上限** | 达到预算 $B$ 后禁用 split，防止无界边分裂 |
| **Skybox 梯度汇** | 用同款 SH 外观模型的包围 skybox 网格表示背景。**因为不依赖分割掩码，skybox 充当背景信息的梯度汇（gradient sink）**，让优化网格专注前景物体 |
| **逐顶点球谐外观** | $\mathcal{C}\in\mathbb{R}^{N\times B\times 3}$，degree $d=3$；0 阶为视角无关颜色，高阶建模方向性外观 |
| **多视图 NCC** | 投影 patch $\Omega_p$ 到支撑相机，用双线性插值取 $\Omega_s$；**每像素按到网格表面的精确距离做 warping**（非 homography）。仅当所有像素都投影到网格且落在源图内时该 patch 才贡献 |

### 公式

**Laplacian 预条件与差分坐标**

```math
\mathbf{L}=\mathbf{D}-\mathbf{A},\qquad
\mathbf{M}=(1-\alpha)\mathbf{I}+\alpha\mathbf{L},\quad 0\leq\alpha<1
```

$$\mathcal{U}=\mathbf{M}\mathcal{V},\qquad\mathcal{V}=\mathbf{M}^{-1}\mathcal{U}$$

**带偏差修正的矩估计（自定义优化器）**

```math
\mathbf{m}_t=\beta_1\mathbf{m}_{t-1}+(1-\beta_1)\mathbf{G}_t,\qquad
\mathbf{s}_t=\beta_2\mathbf{s}_{t-1}+(1-\beta_2)(\mathbf{G}_t\odot\mathbf{G}_t)
```

$$\hat{\mathbf{m}}_t=\frac{\mathbf{m}_t}{1-\beta_1^t},\qquad\hat{\mathbf{s}}_t=\frac{\mathbf{s}_t}{1-\beta_2^t}$$

**曲率自适应边长**

$$\kappa_i=\left[\frac{1}{|\mathcal{N}(i)|}\sum_{j\in\mathcal{N}(i)}\frac{\|\mathbf{n}_i-\mathbf{n}_j\|_2^2}{\|\mathbf{v}_i-\mathbf{v}_j\|_2^2}\right]^{1/2},\qquad \bar{\kappa}=\frac{1}{A}\sum_{i}a_i\kappa_i$$

$$h_i=\sqrt{\frac{4A}{\sqrt{3}B}\frac{1+w\bar{\kappa}}{1+w\kappa_i}},\qquad \bar{h}_{ij}=\frac{h_i+h_j}{2}$$

**总损失**

$$\mathcal{L}_{\mathrm{ssim}}=(1-\eta)|\hat{\mathbf{I}}-\mathbf{I}|+\eta\big(1-\mathrm{SSIM}(\hat{\mathbf{I}},\mathbf{I})\big)$$

$$\mathcal{L}_{\mathrm{ncc}}=\frac{1}{|\mathcal{P}|}\sum_{|\mathcal{P}|}\big(1-\mathrm{NCC}(\Omega_p,\Omega_s)\big),\qquad \mathcal{L}=\lambda_{\mathrm{ssim}}\mathcal{L}_{\mathrm{ssim}}+\lambda_{\mathrm{ncc}}\mathcal{L}_{\mathrm{ncc}}$$

**内在网格质量：平均归一化长宽比（AR）**

$$\mathrm{AR}=\frac{1}{|\mathcal{F}|}\sum_{f\in\mathcal{F}}\frac{\sqrt{3}\,\ell_f^2}{4A_f}$$

> 等边三角形时 AR = 1，细长碎片时 AR 增大。

### 复杂度

- **每次重网格化**：$O(|\mathcal{F}|)$（局部操作，每个顶点/边常数次邻域访问）
- **Laplacian 预条件**：稀疏 $\mathbf{M}^{-1}$ 应用，$O(|\mathcal{V}|)$ 每步（稀疏 Cholesky 分解可预计算）
- **NCC 项**：$O(\text{patch 数} \times \text{pixel 数})$ 每相机对
- **总体**：$O(K\cdot (|\mathcal{F}| + |\mathcal{V}|))$ per iteration，$K=5000$ iterations

---

## 实验结论

- **数据集**：**DTU**（scan055/065/106/110/114/118/122，7 个物体中心场景，结构光参考几何，相机轨迹仅覆盖前半面、多个仰角）；**AriaDTC DSLR**（8 个场景：BirdHouseRedRoofYellowWindows / DecorativeBox / Gnome / LionKing / Angel / GargoyleBronze / BlueHairFairy / BlueBirdsYellowBirdsVase，**360° 环绕相机**，配精细参考网格）
- **设置**：nvdiffrast 光栅化，SH degree $d=3$，5000 iterations，batch size 4，**每 150 次迭代重网格化一次，4500 步停止**，$\lambda_{\mathrm{ssim}}=1.0$、$\lambda_{\mathrm{ncc}}=2.0$，所有图像**半分辨率**处理

### DTU 三维资产评估

| 方法 | Acc.(mm)↓ | Comp.(mm)↓ | Ovr.(mm)↓ | SSIM↑ | PSNR↑ | AR↓ | SIR↓ | BER↓ | NMVR↓ | NMER↓ | Primitives(K)↓ |
|------|-----------|-----------|-----------|--------|--------|------|------|------|--------|--------|--------------|
| 2DGS（原表示） | – | – | – | 0.950 | 32.49 | – | – | – | – | – | – |
| TriangleSplatting（原表示） | 3.55 | 0.17 | 1.86 | 0.947 | 33.32 | 2.28 | 0.88 | 1.00 | 0.00 | 0.00 | 369 |
| 2DGS + TSDF 融合 | 1.15 | 0.82 | 0.99 | 0.715 | 19.78 | 8.45 | 0.00 | 0.02 | 0.00 | 0.00 | 825 |
| TriangleSplatting + TSDF 融合 | 1.35 | 0.92 | 1.13 | 0.688 | 19.10 | 11.34 | 0.00 | 0.05 | 0.00 | 0.00 | 739 |
| MeshSplatting | 1.38 | 0.39 | 0.88 | 0.901 | 28.92 | 3.63 | 0.83 | 0.43 | 0.34 | 0.21 | 776 |
| **MODL** | **1.10** | 0.70 | 0.90 | 0.888 | 25.33 | **1.19** | **0.00** | **0.00** | **0.00** | **0.00** | **497** |

→ **几何精度（Ovr 0.90）与最好基线持平（MeshSplatting 0.88）**，但 **AR 1.19 vs 3.63–11.34（三角形形状好 3–9.5×）**、**SIR/NMVR/NMER 全为 0（完美流形无自交）**，且**面数更少（497K vs 739–825K）**。渲染质量略低于 2DGS/TriangleSplatting 的原始 radiance field（PSNR 25.33 vs 32–33），但**后者不可直接渲染成网格**。

### AriaDTC（360° 相机）评估

| 方法 | Acc.(mm)↓ | Comp.(mm)↓ | Ovr.(mm)↓ | SSIM↑ | PSNR↑ | AR↓ | SIR↓ | BER↓ | NMVR↓ | NMER↓ | Primitives(K)↓ |
|------|-----------|-----------|-----------|--------|--------|------|------|------|--------|--------|--------------|
| MeshSplatting†（6 场景均值） | 6.18 | 10.93 | 8.56 | 0.612 | 16.95 | 10.43 | 0.98 | 0.52 | 0.39 | 0.17 | 339 |
| **MODL** | **0.88** | **1.23** | **1.06** | **0.858** | **26.04** | **1.60** | **0.00** | **0.00** | **0.00** | **0.00** | 485 |

→ **几何误差降低 8 倍**（Ovr 8.56 → 1.06 mm）。† 注：MeshSplatting 在 angle 和 bird-vase 两个场景**完全无法产生可测几何**，故取 6 场景均值——进一步说明 2DGS/TSDF 路线在真实纹理物体上的脆弱性。

### 消融实验（DTU）

| 配置 | Acc.(mm)↓ | Comp.(mm)↓ | Ovr.(mm)↓ | SSIM↑ | PSNR↑ | AR↓ | Primitives(K)↓ |
|------|-----------|-----------|-----------|--------|--------|------|--------------|
| w/o $\mathcal{L}_{\mathrm{ncc}}$ | 3.01 | 2.31 | 2.66 | 0.858 | 25.32 | 1.24 | 496 |
| w/ $\mathcal{L}_n$ | 1.27 | 0.71 | 0.99 | 0.887 | 25.32 | 1.19 | 497 |
| w/ Adaptive Isotropic Remeshing [Dunyach et al.] | 2.16 | 1.41 | 1.79 | 0.812 | 22.13 | 2.24 | 499 |
| w/o Skybox | 1.20 | 0.73 | 0.97 | 0.862 | 21.63 | 1.18 | 498 |
| **MODL（完整）** | **1.10** | **0.70** | **0.90** | **0.888** | **25.33** | 1.19 | 497 |

→ **NCC 项是几何精度的关键**（去掉后 Ovr 2.66 → 0.90，**几何精度几乎腰斩三倍**）；**曲率自适应重网格化显著优于 Dunyach 的自适应各向同性方案**（Ovr 1.79 vs 0.90，AR 2.24 vs 1.19——原文归因于后者「用绝对曲率近似导致三角形更不接近等边且梯度流更慢」）；**skybox 移除后 PSNR 从 25.33 掉到 21.63**。

---

## 局限性

1. **渲染质量不是 SOTA**：PSNR 25.33 明显低于 2DGS 的 32.49。直接优化显式网格的表达能力弱于辐射场——**几何质量与渲染质量的权衡仍未解决**
2. **依赖 SfM 稀疏点**：需要相机位姿 + 稀疏点，且**初始网格取稀疏点的凸包**——若 SfM 在纹理缺失区域失败，初始化即失效
3. **相机覆盖敏感**：AriaDTC 表现远好于 DTU，说明**需要较完整的相机覆盖**才能约束网格；DTU 只拍到前半面
4. **需要逐场景长时间优化**：5000 次迭代 + 4500 步前的每 150 步重网格化，无法实时
5. **半分辨率训练**：所有图像以半分辨率处理，高频纹理细节受限
6. **作者尝试过但失败的方向**（值得记录）：
   - 类似 Elastic Triangle Splatting 的**法向正则化**——「对顶点过约束」
   - Dunyach et al. 的**自适应重网格化**——三角形更差、梯度流更慢

---

## 相关工作

- **Nicolet et al.** — Laplacian 预条件可微网格优化的奠基工作（仅合成场景 + 常量 albedo）
- **Botsch & Kobbelt** — 各向同性重网格化算子（split / collapse / flip / tangential relaxation）
- **Dunyach et al.** — 自适应重网格化（本文消融中被超越）
- **MeshSplatting** — 受限 Delaunay 三角剖分 + 渐进不透明度（本文最强基线）
- **Triangle Splatting / 2DGS** — triangle soup 与 surfel 路线
- **DMesh++** — 内在网格质量指标（SIR / NMVR / NMER / AR）的来源
- **Worchel et al.** — 多视图网格重建的分析-综合方法（需分割掩码）
- **Gao et al.** — 自适应重网格化 + 重参数化 Adam + 周期粗化精化（需已知 genus）

---

## 实现建议

- **实现难度**：**中**。三个核心组件都有成熟参考实现：
  - Laplacian 预条件 → 稀疏线性代数（Eigen / SuiteSparse）
  - 各向同性重网格化 → libigl `remesh` 系列 / OpenMesh `isotropic_exact_remeshing` / VTK `vtkWindowedSincPolyDataFilter` + `vtkLinearSubdivisionFilter`
  - 可微光栅化 → nvdiffrast / PyTorch3D / softRast
  - **难点**：① 差分坐标优化器的正确实现（梯度要经 $\mathbf{M}^{-1}$ 回传，且因梯度已平滑可放大学习率）；② 重网格化与优化器的交替（每次 remesh 后 $\mathbf{M}$ 需重算）；③ 多视图 NCC 的精确表面距离 warping（需要 mesh 查询加速结构）
- **数值稳定性**：**中-好**。$\mathbf{M}=(1-\alpha)\mathbf{I}+\alpha\mathbf{L}$ 因 $0\leq\alpha<1$ 而**严格对角占优正定**，$\mathbf{M}^{-1}$ 良态。但：① $\alpha$ 接近 1 时梯度过度平滑（细节丢失）；② 重网格化后 $\mathbf{M}$ 突变，若 $\mathbf{M}^{-1}$ 未同步更新会导致优化不稳；③ NCC 项在弱纹理区域梯度噪声大
- **适用场景**：
  - ✅ **需要同时要渲染 + 网格的产品级 3D 资产生成**（这是它最大的卖点——单一表示，无后处理）
  - ✅ 对网格内在质量（流形性、无自交、三角形形状）有硬要求的管线（AR 1.19、SIR=0）
  - ✅ 相机覆盖较完整的物体级重建
  - ⚠️ 若只求渲染质量 → 直接用 3DGS/2DGS，不必上这条路
  - ❌ 实时 / 大规模批量（5000 迭代 + 周期重网格化开销大）
  - ❌ 大场景（方法定位是单个物体）
- **落地建议**：
  1. 先做**纯几何版**验证：去掉 SH 外观，只优化几何 + 深度/NCC，验证 Laplacian 预条件 + 重网格化管线
  2. **曲率自适应边长公式可直接复用**——这是本文最可独立提取的贡献，与重建表示无关
  3. **把内在网格质量指标（SIR/NMVR/NMER/BER/AR）加入 CI**——原文正确指出这是现有基准的盲区
  4. 接入时注意：初始化依赖 SfM 凸包，对失败场景需要 fallback（球 / 包围盒）

---

## 相关笔记

- [[2026-11-20-Facet-SLAM-Real-Time-Triangle-Splatting-SLAM]]
- [[2026-11-20-TRoPE-Topology-Aware-Relative-Positional-Encoding-4D]]
- [[2026-11-13-Sprint3D-Accelerating-3D-Asset-Generation-Pipeline-Optimization]]

---

## 开源参考

- **libigl**：`igl::remesh`（各向同性重网格化）、`igl::min_quad_with_fixed_bp`（Laplacian 坐标平滑的二次型求解）
- **OpenMesh**：`OM::TriConnectivity`、`OM::remove_degenerate`（重网格化基础算子）
- **nvdiffrast**：可微光栅化（本论文所用）
- **Open3D / trimesh**：网格质量与自交检测（AR / SIR 指标计算）
- **CGAL**：`CGAL::Polygon_mesh_processing::isotropic_remeshing`（各向同性重网格化的现成实现）

已传递给 @墨鱼丸。
