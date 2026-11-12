---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, 3DGS, 表面重建, 深度正则, 几何一致性, TPAMI]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13628
---

# DepthGS: Depth-Guided Gaussian Splatting with Adaptive Regularization for High-Quality Surface Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DepthGS: Depth-Guided Gaussian Splatting with Adaptive Regularization for High-Quality Surface Reconstruction |
| **作者** | Xiao Ren, Yu Liu, Ning An, Jian Cheng, Xin Qiao, You-Fu Li, He Kong (通讯) |
| **单位** | 南方科技大学 / 中煤科工 / 西安交大 / 香港城市大学 |
| **发表** | **IEEE Transactions on Pattern Analysis and Machine Intelligence (TPAMI)**，to appear |
| **链接** | [原文](https://arxiv.org/abs/2611.13628) · [HTML全文](https://arxiv.org/html/2611.13628v1) |
| **DOI** | arXiv:2611.13628 |
| **代码** | 论文未给出 |

---

## 核心贡献

> **给几何正则"分级"——不是所有区域都该被同等强度地约束。DepthGS 首次从理论上刻画了"深度差异 → 重建误差"的关系，并用深度差异本身当作几何可靠度权重来自适应调制法向约束。**

1. **理论分析（Lemma 1，多视图推广）**：推导**单视图与多视图下深度差异与重建误差的关系，并给出严格上界**——这是本文与现有工作的分水岭（现有 3DGS 几何方法虽然用了 depth/normal 先验，但**从未显式刻画**无偏深度与渲染距离之间的重建误差界）。
2. **深度差异引导的自适应法向正则（单视图）**：用局部深度差计算**几何可靠度权重** `W_ΔD`，深度差大 → 权重小 → 法向约束**放松**；深度差小 → 权重大 → 约束**收紧**。
3. **跨视角深度一致性正则（多视图）**：把当前视角的深度预测变换到邻域视角，与邻域视角的深度图做一致性约束。
4. **多分支联合优化**：单视图几何约束 + 多视图一致性 + 基线目标联合优化。

---

## 技术方案

### 核心思想

**观察**（Fig. 2）：**深度差异大的地方，往往就是 Gaussian 分布不规则的地方**。不规则分布处强制强法向约束是错误的——那些区域本来就没有可靠表面。

**理论链条**：
- 无偏深度与渲染距离经同一相机射线反投影，得到 `X_u` 与 `X_D`
- 三角不等式 → `ε_u ≤ ε_D + |ΔD|`
- 因此 `|ΔD|` **显式出现在重建误差上界中** → 它是一个合法的**局部几何可靠度度量**
- 关键在于**不直接最小化 |ΔD|**（那会引入伪影），而是**把它映射为权重**

### 关键技术表

| 技术 | 说明 |
|------|------|
| **无偏深度 / 渲染距离（承自 PGSR）** | `D_D(p) = Σ T_i α_i d_i`（渲染距离）；`D_u(p) = D_D(p) / (N(p)·v(p))`（无偏深度） |
| **深度差异** | `ΔD(p) = D_u(p) − D_D(p) = D_D(p)[1/(N·v) − 1]` |
| **自适应权重 W_ΔD** | 由 `|ΔD(p)|` 归一化映射得到；**深度差越大 → 权重越小** |
| **单视图法向正则** | 在参考法向 `N_d(p)`（由 D_u 算得）与渲染法向 `N(p)` 之间，权重 `W_ΔD` 调制强度 |
| **跨视角深度一致性** | 坐标变换建立邻域视角间的深度对应 → 构造 `L_mv_D` |
| **多分支联合** | `L_sv_geo`（单视图）+ `L_mv_D`（多视图）+ 基线目标联合优化 |

---

## 公式

```math
% 3DGS 渲染（Eq.2）
\widehat{C}(p)=\sum_{i\in N}T_i\alpha_i c_i,\qquad
\mathbf{N}(p)=\sum_{i\in N}T_i\alpha_i R_c^{\top}n_i
```

```math
% 渲染距离与无偏深度（Eq.3，承自 PGSR）
D_{\mathcal{D}}(p)=\sum_{i\in N}T_i\alpha_i d_i,\qquad
D_u(p)=\frac{D_{\mathcal{D}}(p)}{\mathbf{N}(p)\cdot v(p)}
% d_i=(R_c^{\top}n_i)^{\top}R_c^{\top}(\mu_i-T_c)  平面到相机的距离
% v(p)=K^{-1}\tilde{p}/\|K^{-1}\tilde{p}\|_2           单位相机射线方向
```

```math
% 深度差异（Eq.5）
\Delta D(p)=D_u(p)-D_{\mathcal{D}}(p)
=\frac{D_{\mathcal{D}}(p)}{\mathbf{N}(p)\cdot v(p)}-D_{\mathcal{D}}(p)
```

```math
% Lemma 1：单视图重建误差上界（Eq.4）
E_{sv}\triangleq\int_{\Omega}w(p)\left(\epsilon_u^{sv}(p)\right)^2 dp
\;\le\;\int_{\Omega}w(p)\left(\epsilon_{\mathcal{D}}^{sv}(p)+|\Delta D(p)|\right)^2 dp
% 关键中间结论（Eq.11）：
% \|\pi^{-1}(p,D_u)-\pi^{-1}(p,D_{\mathcal{D}})\|_2 = |\Delta D(p)|
```

```math
% 深度差异 → 几何可靠度权重（Fig.3）
% 深度差越大 → 权重越小 → 法向约束越弱
\mathcal{W}_{\Delta D}(p)=f\!\big(|\Delta D(p)|\big),\qquad f\ \text{单调递减}
```

```math
% 单视图自适应法向正则
\mathcal{L}_{sv\_geo}=\sum_{p\in\Omega}\mathcal{W}_{\Delta D}(p)\,
\big\|\mathbf{N}_d(p)-\mathbf{N}(p)\big\|^2
% \mathbf{N}_d(p): 由无偏深度 D_u 计算的参考法向
```

```math
% 跨视角深度一致性（多视图分支）
% 把当前视角深度预测变换到邻域视角，再与邻域深度图对齐
\mathcal{L}_{mv\_D}=\sum_{(v,v')\in\mathcal{N}}\big\|D_{v\to v'}(p)-D_{v'}(p')\big\|^2
```

---

## 代码片段

```python
# 渲染距离与无偏深度（承自 PGSR 的光栅化器输出）
def rendered_distance_and_unbiased_depth(alpha, T, d, N, v):
    """
    alpha: (N,) 每 Gaussian 的 alpha 贡献
    T:     (N,) 累积透射率
    d:     (N,) 每 Gaussian 的平面到相机距离
    N:     (3,) 渲染法向
    v:     (3,) 单位相机射线方向 (K^{-1} p / ||.||)
    """
    D_D = torch.sum(T * alpha * d)          # 渲染距离
    D_u = D_D / torch.dot(N, v)            # 无偏深度
    return D_D, D_u

# 深度差异
def depth_difference(D_D, D_u):
    return D_u - D_D
```

```python
# 深度差异 → 几何可靠度权重（核心：深度差大 → 权重小 → 约束放松）
def depth_reliability_weight(delta_D, delta_D_min, delta_D_max):
    """
    把 |ΔD| 映射为 W_ΔD ∈ [0,1]。
    论文思路：|ΔD| 显式出现在重建误差上界中，
    因此它可以作为局部几何可靠度度量；
    但不直接最小化 |ΔD|（会引入伪影），而是作为权重。
    """
    mag = delta_D.abs()
    # 归一化到 [0,1]，再取补（深度差大 → 权重小）
    norm = ((mag - delta_D_min) / (delta_D_max - delta_D_min + 1e-8)).clamp(0.0, 1.0)
    return 1.0 - norm
```

```python
# 单视图自适应法向正则
def single_view_geo_loss(N_rendered, N_reference, W_deltaD):
    """
    N_rendered:  (H,W,3) 渲染法向
    N_reference: (H,W,3) 由无偏深度 D_u 计算的参考法向
    W_deltaD:    (H,W)   深度差异导出的可靠度权重
    """
    diff = (N_rendered - N_reference).pow(2).sum(-1)   # (H,W)
    return (W_deltaD * diff).mean()
```

```python
# 跨视角深度一致性正则
def cross_view_depth_consistency_loss(depth_current, depth_neighbor, poses, K):
    """
    把当前视角的深度预测变换到邻域视角，与邻域视角的深度图做一致性约束。
    depth_current: (H,W) 当前视角深度
    depth_neighbor:(H,W) 邻域视角深度图
    poses: (T_wc, T_wc_next) 相机外参
    """
    # 1) 当前视角深度反投影到世界坐标
    xyz_c = backproject(depth_current, K)              # (H,W,3)
    xyz_w = transform(xyz_c, poses.T_wc)                # 世界坐标
    # 2) 变换到邻域视角相机坐标
    xyz_n = transform(xyz_w, poses.T_wc_next)
    # 3) 投影到邻域视角像素并取深度
    uv_n, z_n = project(xyz_n, K)
    depth_pred_n = sample(depth_neighbor, uv_n)
    # 4) 一致性损失（有效掩码剔除越界）
    mask = valid(uv_n, z_n)
    return (F.smooth_l1_loss(z_n[mask], depth_pred_n[mask]))
```

---

## 实验结论

- **数据集**: DTU（表面重建）、Mip-NeRF360（无界新视角合成）、Tanks and Temples
- **基线**: 2DGS、GOF、GFSGS、GSDF、GS-Pull、GS-UDF、QGS、GSPrior、DN-Splatter、VCR-GauS、**PGSR**（直接前驱）
- **结果**:
  - 在 **DTU、Mip-NeRF360、Tanks and Temples** 上**表面重建与新视角合成双双达到有竞争力的性能**
  - 论文定位为"competitive"（达到竞争性水平）而非全面超越——这是一篇**方法论扎实、增益稳健**的工作
  - 理论部分（Lemma 1 + 多视图推广）本身是主要贡献
- **硬件/运行时**: 论文未在摘要层面突出报告

---

## 局限性

- **TPAMI 篇幅**，理论部分占比较大，工程细节（超参、权重选择）需读全文
- 自适应权重的 `ΔD_min / ΔD_max` 归一化区间依赖场景——可能需要按场景调参，削弱了"无需调参"的宣称
- 依赖 PGSR 的无偏深度渲染实现（需改造光栅化器输出 distance/normal）
- 仅在规则/静态场景验证，未覆盖动态、外向场景
- 增益是"competitive"级别，若追求 SOTA 几何指标可能仍落后于专门的 2DGS 系方法

---

## 相关工作

- [[2026-11-01_ACD-GS-Asymmetric-Curvature-Densification]] — 3DGS 几何
- [[2026-11-04_T2-Splat-Adaptive-Topology-Mesh-Splatting]] — 网格拓扑
- [[2026-11-07_PLS-GS-Probabilistic-Lidar-Scaffolds]] — LiDAR 引导几何
- [[2026-11-10_Geometric-Texture-Segmentation-Meshes]] — 几何纹理分割
- [[2026-11-05_P-MGS-Perception-Over-Geometry-Gaussian-Allocation]] — 感知 vs 几何
- [[2026-11-01_BoundedGS-Memory-Efficient-High-Resolution-3DGS]] — 3DGS 表示

---

## 实现建议

- **实现难度**: **中**（需要 PGSR 式无偏深度渲染输出 + 深度差异权重 + 跨视角变换与采样）
- **预期性能**:
  - 质量：在 DTU / Mip-NeRF360 / Tanks&Temples 上达到竞争性表面重建与 NVS 性能
  - 开销：额外需要渲染 distance 与 normal map（光栅化器输出扩展），以及跨视角重投影采样——**训练期开销中等**，推理期零开销（纯训练时正则）
- **适用场景**:
  - ✅ **3DGS → 网格/表面资产的重建管线**（DCC、测量、仿真）
  - ✅ **需要高质量几何但又要保留 3DGS 渲染速度**的场景
  - ✅ 作为**"几何正则应当自适应分级"**这一思想的方法论参考
- **对墨鱼丸的建议**: 最重要的一条是**方法论**而非具体实现——**固定强度的几何正则是错的**。应当像该文一样，用一个能从渲染中间量（深度差、法向差）直接算出的**局部可靠度**来调制正则强度。这一思想可迁移到几乎任何"先验 + 重建"的组合（法线、深度、语义、材质）。

---

## 与团队协作

- **可传递给 @墨鱼丸**: 无偏深度/渲染距离的渲染公式、深度差异权重映射、跨视角一致性损失实现
- **可反馈 @黄喉（几何专家）**: 理论部分（Lemma 1 及其多视图推广）与几何误差界的推导可作为几何正则设计的依据
