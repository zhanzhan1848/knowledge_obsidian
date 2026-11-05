---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 渲染, 全局光照, 光线追踪, 高斯表示, 光传输方程, 神经辐射度, 实时渲染, MITSUBА, Taichi, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2609.11430
---

# Gaussian Light Transport: 13D 高斯混合直接求解光传输方程

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gaussian Light Transport |
| **作者** | Patrick Attimont（ENS）, Kartic Subr（ENS/Université Paris-Saclay）, Cyril Soler（ENS） |
| **发表** | arXiv 2026-09-10（cs.GR），**SIGGRAPH Asia 2026 / ACM TOG** |
| **链接** | [原文](https://arxiv.org/abs/2609.11430) · [HTML](https://arxiv.org/html/2609.11430v1) |
| **DOI** | — |
| **代码** | 论文未提供公开仓库（实现基于 Mitsuba 3 + PyTorch + Taichi） |

---

## 核心贡献

> **把全局光照解显式表示为「位置 × 方向 × 法线 × 材质」的 13 维高斯混合模型**，直接最小化渲染方程残差来估计参数，**绕开 Neumann 级数**；配合世界空间 tile-based 剔除实现**分钟级优化 + 实时渲染**。

1. **13D 高斯辐射场**：$L_\theta(\mathbf{x},\omega)$ 用 $M$ 个 13 维高斯（$\mathbf{q}=(\mathbf{x},\omega,\mathbf{n},a,r)\in\mathbb{R}^{13}$）加权求和表示，**法线与材质进入表示空间**，使得函数数量大幅减少、评估更快。
2. **残差直接优化**：不同于 Neural Radiosity 用神经网络拟合，改为显式高斯核的**显式参数化** + 渲染方程残差最小化（$\theta^*=\arg\min_\theta\|r_\theta\|^2$），可按空间/角度频率内容**自适应地增删核**。
3. **两级剔除策略**：64-bit Morton code 分块 + 13 维保守包围区间 → Gaussian/tile 相交测试，**Bedroom 场景平均每像素仅评估 76 个核（总计 22K）**。
4. **视图无关（view-independent）**：一次求解整个光场，新视角直接「切片」得到，无需重算，天然适配飞行浏览式多视图渲染。

---

## 技术方案

### 核心思想

传统路径追踪用 Neumann 级数蒙特卡洛积分求解渲染方程，视图相关、噪声大。Galerkin 方法（radiosity）给出全局解但难表达高频（反射、焦散、阴影）。

**本文取中间路线**：把光传输方程的解当作一个**显式的、有限支撑的核函数集合**，像 3DGS 那样优化高斯参数，但把「位置」扩展成「位置 + 方向 + 法线 + 材质」13 维空间。

关键洞察：**把场景属性（法线、albedo、roughness）放进高斯表示里**，不同位置但材质/法线相同的表面可以**共享同一个高斯核**，大幅减少所需函数数量。

### 关键技术

| 技术 | 说明 |
|------|------|
| **13D 高斯混合** | $\mathbf{q}=(\mathbf{x}\in\mathbb{R}^3,\omega\in\mathbb{R}^3,\mathbf{n}\in\mathbb{R}^3,a\in\mathbb{R}^2,r\in\mathbb{R}^1)$；位置/方向/材质/法线视为**独立子空间**，高斯分解为各子空间高斯之积（牺牲跨子空间相关性，换取 3D 空间局部性） |
| **协方差分解** | $\Sigma=\mathbf{R}\mathbf{S}\mathbf{S}^\top\mathbf{R}^\top$（沿用 3DGS），$\mathbf{v}^\top\Sigma^{-1}\mathbf{v}=\|\mathbf{L}^{-1}\mathbf{v}\|^2$，退化为一次 13D 三角线性求解 |
| **半梯度（semi-gradient）** | 仿 Cho & Cho (2024)，**丢掉内积分的梯度**，只对 $r_\theta$ 反传 → 牺牲少量偏差，换取显著降低的梯度方差 |
| **分裂（splitting）** | 对特定子空间梯度大的高斯，沿该子空间主轴分裂；每次只分裂一个子空间，**优先空间维度**；子核偏移 $d=0.5\times$ 主尺度，协方差沿该轴缩放 $k=0.8$ |
| **生成（spawning）** | 残差驱动的**新增**（分裂无法在无覆盖区域引入基元）：选残差贡献 top-k 样本点初始化新高斯，$c_k=E(\mathbf{x},\omega)+\mathbf{T}L_\theta(\mathbf{x},\omega)$ |
| **剪枝（pruning）** | 按**相对归一化贡献** $r_k$（限制在有效支撑域 $\mathcal{D}_k$，指数阈值 $\beta=-14$）剪枝，阈值 $\tau=8\times10^{-3}$，使亮区与暗区一致处理 |
| **两级 tile 剔除** | 64-bit Morton code（shape 索引 + 3D 位置）→ 排序 → 截断前缀分 tile → 并行归约求 13 维保守包围范围 → Gaussian/tile 相交测试；利用可分离性做**逐子空间 Mahalanobis 距离**早退（先 1D 子空间，后 3D 空间/方向） |
| **各向异性惩罚** | $\mathcal{P}(\theta)$：$\mathrm{ReLU}(\sum_n(s_{i,n}-\bar{s}_i)^2-\epsilon)$，$\epsilon=2.5$，$\lambda_{\text{aniso}}=0.008$；防止近共面接触区把高斯拉成细长条 |
| **归一化损失** | $\mathcal{L}=\left\|\frac{r_\theta}{\nabla_0(L_\theta)+\epsilon}\right\|^2$，按当前预测归一化，避免暗区被亮区牺牲 |
| **时序 EMA** | 高斯网格的指数滑动平均 $\alpha=0.15$ 抑制帧间闪烁 |

### 渲染模式

| 模式 | 做法 | 特性 |
|------|------|------|
| **GS** | 仅在主可见点 $\mathbf{x}$ 处评估 $L_\theta$，方向指向相机 | 最快；采样只买抗锯齿与镜面路径降噪 |
| **GS + MC** | 从相机追一条反弹射线，用 $L_i(\mathbf{x},\omega')=L_\theta(\mathbf{y},\omega'')$ 作为入射辐射 | 1 spp 时更噪，收敛后更准；**1024 spp 时反超 GS**；Rings 场景因次级射线大多出场景反而更便宜 |

---

## 公式

**渲染方程（Kajiya 1986）**：

```math
L(\mathbf{x},\omega)=E(\mathbf{x},\omega)+\int_{\Omega}L_{i}(\mathbf{x},\omega')f(\mathbf{x},\omega,\omega')\mathbf{n}\cdot\omega'\,d\omega'
```

**算子形式**：$L=E+\mathbf{T}L$

**残差最小化目标**：

```math
\theta^{*}=\arg\min_{\theta}\|r_{\theta}\|^{2},\qquad r_{\theta}=L_{\theta}-E-\mathbf{T}L_{\theta}
```

**完整损失函数**：

```math
\mathcal{L}(\theta)=\left\|\frac{r_{\theta}}{\nabla_{0}(L_{\theta})+\epsilon}\right\|^{2}
+\lambda_{\mathrm{aniso}}\mathcal{P}(\theta)
```

**13D 高斯辐射场**：

```math
L_{\theta}(\mathbf{x},\omega)=\sum_{k=1}^{M}c_{k}\exp\!\left(-(\mathbf{q}-\mathbf{m}_{k})^{\top}\Sigma_{k}^{-1}(\mathbf{q}-\mathbf{m}_{k})\right)
```

其中 $\mathbf{q}=(\mathbf{x},\omega,\mathbf{n},a,r)\in\mathbb{R}^{13}$。

**蒙特卡洛梯度估计**：

```math
\nabla_{\theta}\mathcal{L}(\theta)\approx\frac{1}{N}\sum_{j=1}^{N}
\frac{2r_{\theta}(\mathbf{x}_{j},\omega_{j})\nabla_{\theta}r_{\theta}(\mathbf{x}_{j},\omega_{j})}{p(\mathbf{x}_{j},\omega_{j})}
```

**剪枝的相对贡献**：

```math
r_{k}=\int_{\mathcal{D}_{k}}\frac{c_{k}G_{k}(\mathbf{q}(\mathbf{x},\omega)-\mathbf{m}_{k})}{L_{\theta}(\mathbf{x},\omega)}\,d\mathbf{x}\,d\omega
```

**各向异性惩罚**：

```math
\bar{s}_{i}=\frac{1}{3}\sum_{n=1}^{3}s_{i,n},\qquad
\mathcal{P}(\theta)=\frac{1}{N}\sum_{i=1}^{N}\mathrm{ReLU}\!\left(\sum_{n=1}^{3}(s_{i,n}-\bar{s}_{i})^{2}-\epsilon\right)
```

---

## 代码片段

```python
# 关键超参（论文原文）
# 初始化：10K 高斯，随机采样表面点与方向，低强度颜色
# Q = 32（每个出射方向的入射方向数 + 显式光样本数）
# Adam 学习率：(m, R, S, c) = (3e-4, 1e-3, 5e-3, 1e-2)
# 每 400 iter split 一次；每 500 iter spawn 500 个新核；15000 iter 后停止 split/spawn
# 每 2000 iter prune 一次
# lambda_aniso = 0.008, epsilon_aniso = 2.5, tau_prune = 8e-3, beta_support = -14
```

```text
// 剔除流程（论文 Sec 3.1 / Rendering）
1. 为每个 query 计算 64-bit Morton code (shape_id, 3D position)
2. 按 Morton code 排序，截断前缀分 tile
3. 对每个 tile 并行归约求出 13 维保守包围范围
4. 先在 1D 子空间（albedo/roughness）做 Mahalanobis 早退
5. 再对 3D 空间/方向用 tile 包围盒做保守 Mahalanobis 测试
6. 期望指数低于阈值 → 该核对该 tile 贡献可忽略 → 剔除
```

---

## 实验结论

- **数据集**: 6 个合成场景（Living Room / Bedroom / Rings / Chair 等），均为含 glossy 与 specular 材质、复杂几何与纹理的场景
- **基线**:
  - Neural Radiosity (NR, Hadadan et al. 2021)
  - NR + 多分辨率 hash grid (Müller et al. 2022)
  - **NR + Vertex Features (NR(VF), Su et al. 2025)** —— 最强基线
- **关键结果**:
  - **训练时间**：本文固定 30K iter（**7–12 分钟**）；基线需 40K–100K iter（**1.5–4.5 小时**）→ **10.0–23.4× 提速**
  - **渲染速度**：1 spp 下比 NR(VF) **快 2.2–4.5×**；Living Room 场景 1920×1080、1 spp、**63 fps**，训练仅 11m30s（基线 4h29m），**误差更低且快 3.7×**
  - **FLIP 误差**：6 个场景中 **5 个更低**
  - **模型体积**：**1 MB – 5.9 MB**（基线 hash grid 固定 35.7 MB，vertex features 0.9–26.4 MB）→ **由高斯数量决定，与网格分辨率/细分无关**
  - **GPU 显存**：训练 3.1–4.3 GB；GS 渲染 3.0–4.0 GB；GS+MC 3.9–6.1 GB
  - **剔除效率**：Bedroom 场景平均每像素仅评估 **76 个核**（总计 22K）
- **消融**: 关闭 splitting（初始高斯提到 30K 以公平比较）后 MSE 明显变差（Rings 除外，差距在随机方差内）。加入 albedo 维度后，纹理区域所需高斯从 37.9K 降到 35.2K。各向异性惩罚消除接触区的细亮条伪影。

---

## 局限性

- **不建模纯镜面表面上的光分布**：路径在第一个光滑表面处终止（沿用 Neural Radiosity 的做法），镜面方向的直接反射仍需 MC
- **有限核数量构成固有偏差**：即使 FLIP 表现良好，解仍是近似
- **静态场景**：整篇工作面向**静态场景的全局光照**求解，动态场景需另做处理
- **优化需评估模型两次**（出射辐射 + 入射辐射），虽通过张量拼接 + 复用剔除缓解，但仍有开销
- **子空间独立性假设**：位置/方向/材质/法线间相关性被忽略，论文称对质量影响相对小
- **完全镜面路径需要高 spp**：GS+MC 在 1024 spp 才全面超过 GS

---

## 相关工作

- [[Neural-Radiosity]] — Hadadan et al. 2021（直接对比基线）
- [[Vertex-Features-Neural-Radiosity]] — Su et al. 2025（最强基线）
- [[Gaussian-Splatting]] — Kerbl et al. 2023（协方差分解与 densification 借用）
- [[Radiance-Caching]] — Křivánek et al. 2008（预计算辐射度对比）
- [[Diffuse-Rendering-Equation]]
- [[GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]]

---

## 实现建议

- **实现难度**: **中**（Mitsuba 3 集成容易，但 13 维高斯 + Taichi 核 + Morton 剔除需要扎实的 CUDA/并行工程）
- **预期性能**: 训练 7–12 分钟出可用解；渲染 1080p @ 63 fps；模型 1–5.9 MB
- **适用场景**:
  - ✅ 静态建筑/室内场景的**飞行浏览**式多视图实时渲染
  - ✅ 需要**视图无关**光照解的场景（AR 预览、虚拟漫游）
  - ✅ 内存受限的嵌入式 viewer（模型仅几 MB，可轻松嵌入）
  - ❌ 动态场景
  - ❌ 纯镜面主导场景（焦散、纯反射）
- **落地建议**:
  1. 先用现成的 Neural Radiosity / Vertex Features 做基线，验证需求是否真的需要「视图无关」
  2. 高斯表示的 13 维扩展是本文最大创新，但**可先做 7 维（位置+方向+法线）**验证收益，再逐步加入材质维度
  3. 剔除策略是性能关键，** Morton 分块 + 逐子空间 Mahalanobis 早退**可独立移植到任何高斯辐射场实现
  4. 半梯度（丢掉内积分梯度）能显著降方差，是**低成本高收益**的技巧，值得在其他类似优化中借鉴
