---
type: paper
created: 2026-11-23
updated: 2026-11-23
tags: [paper, 几何处理, 触觉重建, 手物重建, 单目深度, 度量尺度, 接触感知, 具身智能]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.26764
---

# TacHOI: Contact-Aware Object Reconstruction and Tracking for Egocentric Videos

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | TacHOI: Contact-Aware Object Reconstruction and Tracking for Egocentric Videos |
| **作者** | Jackson Codd, Haoyu Li, Xianyi Cheng |
| **单位** | UNC Chapel Hill（Xianyi Cheng 组） |
| **发表** | arXiv 2026-11-23（cs.RO; cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2611.26764) |
| **DOI** | 10.48550/arXiv.2611.26764 |

---

## 核心贡献

> **用触觉接触约束打破单目视频重建的尺度-深度歧义——空间分离的触点充当「物理直尺」**，无需物体模板、无需深度传感器、免训练。

1. **触觉 + 单目视觉的联合框架**：从**预训练视觉估计**出发，用**触觉接触**约束物体相对手部的深度。
2. **度量化的手作为物理直尺**：手本身有**已知的度量尺寸**（经标定），因此**空间上分离的接触点**提供了物体尺度的**物理量尺**——这是打破尺度歧义的关键。
3. **免训练（training-free）**：不需要物体模板、不需要深度传感器、不需要训练数据。
4. **联合优化**：把触觉约束并入**手部姿态 + 物体轨迹 + 各向异性物体尺度**的联合优化中，同时保持视觉对齐。
5. **显著精度提升**：在 **100 条 ARCTIC / HO3D 序列**（合成触觉观测）上取得对比方法中最低的中位 ADD-S*，**ARCTIC 上误差从 15.6 cm 降到 3.6 cm**，HO3D 上 2.8 cm；并在 **OpenTouch** 上验证了真实触觉观测的适用性。

---

## 技术方案

### 核心思想

**问题**：第一人称（egocentric）视频是机器人学习的可扩展数据来源，但从中恢复**度量（metric）**的物体几何与运动有两个根本障碍：
1. **尺度-深度歧义**：单目深度估计的**绝对尺度未知**——物体可以整体缩小一半而视觉投影不变
2. **手部遮挡**：手在抓握时遮挡物体

**已有的先验都不够**：
- 图像导出的**接触先验**（contact prior）只知道「碰到了」，不知碰的是哪里
- 图像导出的**形状先验**（shape prior）不能唯一确定度量尺度
- **物体模板**要求知道这是什么物体

**TacHOI 的洞察**：**手是已知尺寸的**。经过度量的手模型 + 空间上分离的多个触点，就构成了一把**物理直尺**——接触点之间的实际距离已知（由手模型给出），因此物体的实际尺度被钉死。

### 关键技术

| 技术 | 说明 |
|------|------|
| **触觉接触约束** | 触觉观测给出接触点（在手表面的位置）；该点必须落在物体的表面上 |
| **手作为度量直尺** | 手模型经标定（已知骨骼长度）→ 接触点间距离有物理量纲 |
| **各向异性物体尺度** | 物体不是各向同性的 → 用**各向异性缩放**（3×3 矩阵或主轴 + 3 个缩放因子）而非单一 scale |
| **相对深度约束** | 触觉约束的是**物体深度相对手的关系**，而手深度由视觉给出 → 联合确定绝对尺度 |
| **免训练联合优化** | 从预训练视觉估计（手部姿态、物体轨迹、粗糙几何）出发，梯度优化所有量 |
| **视觉对齐项** | 保持优化结果与视觉观测（渲染/关键点）一致，防止触觉约束把解拉偏 |
| **接触感知跟踪** | 跟踪过程中触觉约束随时间更新物体位姿与尺度 |

### 公式

**触觉接触约束（接触点在物体表面上）**

```math
\mathcal{L}_{\text{contact}} = \sum_{i=1}^{N_c} \big\| \mathbf{X}^{\text{obj}}\big(\mathbf{c}_i; \mathbf{T}_t, \mathbf{S}\big) - \mathbf{p}_i^{\text{obs}} \big\|^2
```

> $\mathbf{c}_i$ 为第 $i$ 个触觉接触点在手表面的局部坐标；$\mathbf{X}^{\text{obj}}$ 为其经物体位姿 $\mathbf{T}_t$ 与尺度 $\mathbf{S}$ 变换后的世界坐标；$\mathbf{p}_i^{\text{obs}}$ 为触觉观测的位置。

**手作为物理直尺（尺度确定）**

```math
\mathbf{p}_i^{\text{world}} = \mathbf{T}^{\text{hand}}_t \big( \mathbf{J}^{\text{hand}}\,\boldsymbol{\theta}_t + \mathbf{c}_i \big)
```

$$\text{触点间距（已知量纲）：}\quad
d_{ij} = \big\| \mathbf{p}_i^{\text{world}} - \mathbf{p}_j^{\text{world}} \big\| \;\in\; \mathbb{R}_{\text{metric}}$$

> **这是尺度从哪来的关键**：$d_{ij}$ 由手的已知骨骼几何决定，单位是米/毫米，不是任意单位。

**各向异性物体尺度**

```math
\mathbf{S} = \mathbf{R}_{\text{axis}}\,\mathrm{diag}(s_1, s_2, s_3)\,\mathbf{R}_{\text{axis}}^\top
$$

$$\mathbf{X}^{\text{obj}} = \mathbf{T}_t \big( \mathbf{S}\,\mathbf{x} \big)$$

> 允许物体沿不同主轴有不同缩放（符合真实物体的长宽高差异）。

**相对深度约束（视觉给手深度，触觉给相对深度）**

```math
\mathcal{L}_{\text{reldepth}} = \sum_i \big\| \lambda_i^{\text{obj}} - \lambda_i^{\text{hand}} - \Delta_i \big\|^2
$$

> $\lambda$ 为沿视线方向的深度。视觉给出手的深度 $\lambda^{\text{hand}}$；触觉通过几何关系给出手上触点应处的物体深度 $\lambda^{\text{obj}}$，两者之差 $\Delta_i$ 是约束。

**联合目标函数**

```math
\mathcal{L} = \lambda_{\text{vis}}\mathcal{L}_{\text{visual}} + \lambda_{\text{con}}\mathcal{L}_{\text{contact}} + \lambda_{\text{tem}}\mathcal{L}_{\text{temporal}} + \lambda_{\text{reg}}\mathcal{L}_{\text{reg}}
$$

$$\mathcal{L}_{\text{reg}} = \|\mathbf{S} - \mathbf{I}\|_F^2 + \lambda_{\text{smooth}}\sum_t \|\mathbf{S}_{t+1} - \mathbf{S}_t\|_F^2$$

> 各向异性尺度是**严重欠约束**的（6 个自由度 vs 少量触点）→ **正则化与时间平滑是必需的**，否则会过拟合到单帧噪声。

### 复杂度

- **视觉估计初始化**：单帧/单目估计 → 预训练模型前向，秒级
- **联合优化**：每帧优化 $\boldsymbol{\theta}^{\text{hand}}$（手部姿态，~ 2×21 维）、$\mathbf{T}_t$（物体位姿，6 维）、$\mathbf{S}$（6 维）→ 参数少，**GPU 上每帧几十毫秒**
- **总**：100 序列 × 数百帧 → 分钟级（免训练，无需训练成本）
- **接触点提取**：触觉观测处理为线性

---

## 实验结论

- **数据集**：
  - **ARCTIC**（手-物交互数据集，100 序列，含合成触觉观测）
  - **HO3D**（手部物体交互，100 序列，合成触觉观测）
  - **OpenTouch**（真实触觉观测，用于验证实际适用性）
- **指标**：ADD-S*（对齐后的对称距离）
- **结果**：
  - **ARCTIC**：中位 ADD-S* **从 15.6 cm 降至 3.6 cm**（**降低 4.3×**）
  - **HO3D**：**2.8 cm**
  - 均为**评估方法中最低**
  - OpenTouch 上验证了**真实触觉观测**下的适用性
- **关键性质**：**免训练**、**无模板**、**无深度传感器**

---

## 局限性

1. **需要触觉硬件**（指尖传感器 / GelSight 类）——这是最硬的门槛；多数团队只有 RGB
2. **手模型必须经过度量标定**——不同人的手尺寸不同，标定误差直接传递到物体尺度
3. **触觉点数少**（通常每指尖 1 点，5–10 点）→ **各向异性尺度矩阵 6 个自由度严重欠约束**，重度依赖正则化
4. **假设「触点确实落在物体表面上」**——传感器噪声、滑动、软组织形变都会破坏这个假设
5. **只处理刚性物体**——软体形变不在模型内
6. **合成触觉观测与真实触觉有域差距**（作者在 OpenTouch 上做了验证，但仍是补充证据）
7. **无模板要求是双刃剑**——不利用类别先验，也失去了类别先验带来的精度

---

## 相关工作

- **单目物体重建 / 6D 位姿估计** — 尺度歧义的根本来源
- **HOI 检测与重建**（HOTR、GENOVA、CHORE）— 手物交互建模
- **ARCTIC / HO3D** — 评测数据集
- **触觉传感与触觉重建** — GelSight、DIGIT、软体触觉
- **接触先验（contact prior）** — 视觉导出的接触估计
- **度量手模型** — MANO、MediaPipe Hands
- **尺度恢复理论** — 单目度量深度（Deep IMU、Le-MAC 等）

---

## 实现建议

- **实现难度**：**中高**。需要：
  - 触觉数据接入（GelSight / DIGIT / 自研指尖传感器）
  - 手部姿态估计（MANO / MediaPipe）+ **度量标定**
  - 物体初始几何与轨迹（预训练单目方法）
  - 联合优化器（PyTorch autograd + 隐式微分）
  - **难点**：① 度量标定的实操；② 各向异性尺度的正则化调参（欠约束严重）；③ 触点-表面对应（触点位置需映射到手表面坐标系）
- **数值稳定性**：**中**。主要风险：
  - **尺度矩阵 $\mathbf{S}$ 的退化**——某些轴向的缩放趋向 0 会导致病态；需参数化为 $s_i = \exp(\sigma_i)$ 保证正定，或对 $\mathbf{S}$ 做条件数约束
  - **触点约束的残差是点到面距离**——优化对初值敏感，可能陷入局部最优
  - 时间平滑项的权重与序列长度耦合
- **适用场景**：
  - ✅ **机器人从人类演示中学习**（本文的目标场景）
  - ✅ 需要**度量精度**的物体几何恢复（医疗、精密装配）
  - ✅ 有触觉传感器的采集平台（如 OpenTouch 数据采集场景）
  - ⚠️ 有可靠物体类别先验的封闭场景——模板方法可能更准
  - ❌ 纯 RGB 团队（门槛太高）
- **落地建议**：
  1. **「手作为物理直尺」是本文最可迁移的思想**——任何有已知尺寸参照物的场景都能用同样的逻辑破尺度歧义（不限于触觉）
  2. 各向异性尺度建议**参数化为主轴 + 3 个 log-scale**，并在初始化时强约束接近单位阵，让优化从「小形变」开始
  3. 触点-表面距离用**点到三角面片的精确距离**（而非点到点云），libigl / CGAL 可直接用
  4. 建议先做**刚性（各向同性尺度）版本**验证管线，再放开到各向异性——刚性版欠约束问题小得多

---

## 相关笔记

- [[2026-11-23-GAAFormer-Point-Cloud-Denoising-Upsampling]]
- [[2026-11-23-SceneAnything-Agentic-Mesh-Scene-Reconstruction]]

---

## 开源参考

- **MANO (`smplx` / `manopth`)** — 度量手模型
- **MediaPipe Hands** — 手部关键点（实时）
- **libigl**：`igl::point_mesh_squared_distance`、`igl::signed_distance`（点到面距离）
- **CGAL**：`CGAL::Polygon_mesh_processing::measure`、`AABB_tree`（点到面查询）
- **Open3D / trimesh**：点云与网格处理
- **ARCTIC / HO3D / OpenTouch**：官方数据集与评测脚本

已传递给 @墨鱼丸。
