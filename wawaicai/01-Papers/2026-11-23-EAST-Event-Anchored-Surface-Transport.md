---
type: paper
created: 2026-11-23
updated: 2026-11-23
tags: [paper, 几何处理, 三维重建, 事件相机, 有符号距离场, Gaussian Splatting, 表面重建, 神经隐式]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2611.27224
---

# EAST: Event-Anchored Surface Transport for Event-Based Gaussian Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | EAST: Event-Anchored Surface Transport for Event-Based Gaussian Reconstruction |
| **作者** | Ke Luo, Wei Zhai, Yuliang Wu, Pengfei Yu, Yang Cao |
| **发表** | arXiv 2026-11-23（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2611.27224) |
| **DOI** | 10.48550/arXiv.2611.27224 |

---

## 核心贡献

> **针对事件相机重建的核心病态——「外观变化可以补偿深度误差」——提出用「法向流（normal flow）」锚定射线-表面交点深度的事件约束 SDF + Gaussian 联合方案。**

1. **病态诊断**：在事件监督的 Gaussian 重建中，**渲染外观的变化可以补偿深度错误**，同时保持预测的亮度变化正确 → 深度不可辨识。
2. **三角化支持的候选锚定零集**：用三角化（triangulation）产生的候选点**锚定 SDF 的零等值面（zero set）**，给几何提供硬约束起点。
3. **事件时序测量的法向流约束交点深度**：从事件的时间戳测量**法向流（normal flow）**，直接约束射线与表面的交点深度——这是对抗「外观补偿深度」的关键。
4. **有界的高斯中心修正**：Gaussian 中心从「实时场 vs 冻结初始参考」的**描述子差**中获得**有界修正**；修正**在初始化时为零**，但**把图像梯度传导给实时场**。
5. **可从学到的场中高效提取网格**（efficient mesh extraction from the learned field）。

---

## 技术方案

### 核心思想

**事件相机**（event camera）以异步方式报告**每像素亮度变化**，而不是绝对亮度。这带来高时间分辨率和高动态范围，但也带来根本困难：

> **深度不确定性**：如果把某点的深度调错，渲染出的亮度变化也可以保持正确 → 优化有「作弊」空间。

EAST 的对策是引入**与深度直接绑定**的约束，而不是仅靠光度重投影：

- **法向流（normal flow）**：事件相机的时间戳携带**运动方向信息**。场景点的表观运动 $I_x \frac{\partial t}{\partial \lambda}$ 包含**法向分量**——法向流 $u_n = \frac{\partial L}{\partial t}$ 直接正比于深度 $\lambda$。这是**深度的一阶导约束**，比亮度约束更具辨识力。

### 关键技术

| 技术 | 说明 |
|------|------|
| **事件约束 SDF** | 用有符号距离场 $f_\theta(\mathbf{x})$ 表示表面，零集为等值面 |
| **三角化锚定** | 从事件数据三角化得到候选 3D 点，用作零集的**锚点**（硬约束） |
| **法向流深度约束** | 从事件时序测量的法向流约束射线-表面交点深度 $\lambda$ |
| **Gaussian + SDF 耦合** | 高斯负责渲染外观，SDF 负责几何；两者通过**描述子差**耦合 |
| **冻结初始参考场** | 保存初始时刻的场 $f_0$，与实时场 $f_t$ 比较得描述子差 |
| **有界修正** | 修正量被 clamp，保证几何不会崩坏；**初始化时为零**保证初始状态不被污染 |
| **梯度传导** | 修正虽在初始化为零，但随训练进行，图像梯度能通过修正传导进实时场 |
| **网格提取** | 学到的场可直接高效提取网格（Marching Cubes / Dual Contouring） |

### 公式

**事件模型与法向流**

```math
e_k = \log I(x_k, t_k) - \log I(x_k, t_k - \epsilon) = C + \sigma
```

$$\text{标定后：}\quad \hat{e}_k = \frac{e_k - C}{\sigma}$$

**法向流与深度的关系**

```math
I_x \frac{\partial t}{\partial \lambda} = \frac{u_n}{\cos\theta}, \qquad
u_n = \hat{\mathbf{n}}^\top \frac{\partial \mathbf{X}}{\partial t}
$$

$$\text{事件相机无法直接测深度，但法向流}\ u_n \propto \lambda^{-1}$$

> $\theta$ 为光线与表面法向夹角。**这是深度的一阶约束**——深度错了，法向流就错了。

**三角化锚定约束**

```math
\mathcal{L}_{\text{anchor}} = \sum_{j} \big| f_\theta(\mathbf{p}_j^{\text{tri}}) \big|^2
```

> $\mathbf{p}_j^{\text{tri}}$ 为三角化候选点。要求场的零集通过它们。

**法向流约束（深度）**

```math
\mathcal{L}_{\text{nf}} = \sum_{(v, k)} \Big\| u^{\text{pred}}_v(\lambda) - u^{\text{meas}}_v \Big\|^2
```

**Gaussian 中心的有界修正**

```math
\Delta \mathbf{c}_v = \mathrm{clamp}\Big( \beta \cdot \big( \psi(f_t(\mathbf{c}_v)) - \psi(f_0(\mathbf{c}_v)) \big),\; -\epsilon, +\epsilon \Big)
$$

$$\mathbf{c}_v^{\text{new}} = \mathbf{c}_v + \Delta \mathbf{c}_v, \qquad
\Delta \mathbf{c}_v\big|_{t=0} = 0$$

> $\psi$ 为场的描述子（如特征向量 / 法向 / 梯度）。**初始化为零**保证起点干净；**clamp** 保证有界。

**总损失**

```math
\mathcal{L} = \lambda_{\text{ev}}\mathcal{L}_{\text{event}} + \lambda_{\text{anc}}\mathcal{L}_{\text{anchor}} + \lambda_{\text{nf}}\mathcal{L}_{\text{nf}} + \lambda_{\text{gs}}\mathcal{L}_{\text{gs}} + \lambda_{\text{reg}}\mathcal{L}_{\text{reg}}
$$

### 复杂度

- **SDF 网络前向**：$O(N_{\text{ray}} \cdot N_{\text{sample}})$（每条射线采样 SDF）
- **事件重建**：事件数量通常远小于帧数 → 内存与计算都省
- **Gaussian 渲染**：标准 3DGS 复杂度 $O(|G|)$
- **网格提取**：Marching Cubes $O(|\text{grid}|)$，Dual Contouring 类似
- **相对帧式重建**：事件流的时间分辨率优势 → 采样密度更高但单帧数据量小

---

## 实验结论

- **数据集**：**PAEv3D**（事件相机 3D 数据集）、**NeRF Synthetic**（合成数据上验证事件模拟）
- **对比**：Gaussian 重建基线
- **结果**：
  - **表面精度（surface accuracy）提升**
  - **参考视角渲染质量提升**
  - **从学到的场中高效提取网格**——这是本文相对纯 Gaussian 方法的关键增量（Gaussian 本身不能直接给出连续表面）
- **消融**：验证了三角化锚定、法向流约束、有界修正各组件的贡献

---

## 局限性

1. **事件相机的硬件门槛**——需要 DAVIS / Prophesee 等事件传感器，普通 RGB 相机无法直接用（需事件模拟，引入域差距）
2. **依赖三角化提供锚点**——在低纹理 / 极弱运动事件下三角化会失败，锚点缺失则几何无硬约束
3. **法向流需要已知运动模型**（或已知光流）——相机运动未知的场景需先解运动
4. **SDF + Gaussian 双表示的一致性维护**是工程难点——两个表示在优化中可能互相打架
5. **描述子 $\psi$ 的选择敏感**——不同描述子对修正方向的影响未系统研究
6. **网格提取的质量未与专门重建方法（如 TSDF fusion）对比**——只声称「高效」

---

## 相关工作

- **3D Gaussian Splitting** — 原始工作
- **2DGS / GOF / PGSR** — 对齐 3DGS 到表面的方法（本文的主要竞争者）
- **事件相机重建** — E2VID、EventNeRF、ES-NeRF 等
- **法向流（normal flow）** — 事件视觉的核心工具；也见于 [[2026-03-26-WorldMesh-Mesh-Conditioned-Image-Diffusion-3D-Scenes]] 相关的几何约束思路
- **SDF / 神经隐式表面** — DeepSDF、VolSDF、NeuS
- **Marching Cubes / Dual Contouring** — 网格提取
- **Dual Contouring（SIGGRAPH 2026 条目）** — 见 [[SIGGRAPH2026-Dual-Contouring-SDF]]

---

## 实现建议

- **实现难度**：**高**。需要：
  - 事件相机预处理（去噪、时间戳对齐、事件张量构造）
  - SDF + Gaussian 双表示的联合优化框架
  - 法向流计算（需要光流或运动模型）
  - **难点**：① 事件-帧的时序对齐；② SDF 与 Gaussian 的联合渲染（不同表示如何共同出图）；③ 有界修正的梯度路径（clamp 处的梯度处理）
- **数值稳定性**：**中**。风险点：
  - **clamp 的梯度截断**——修正量被 clamp 时梯度为零，可能导致优化停滞；需用 straight-through 或软 clamp
  - SDF 网络的梯度在零集附近不稳定（表面附近梯度大）
  - 法向流的数值微分对噪声敏感 → 需时序窗口平滑
- **适用场景**：
  - ✅ **高速运动 / 极端动态范围**下的重建（事件相机的独特优势区间）
  - ✅ 需要**连续可提取表面**的 3DGS 场景（本文相对纯 3DGS 的增量）
  - ✅ 工业检测（高速运动、隧道、振动场景）
  - ⚠️ 静态常规场景（普通 RGB + 多视角更简单）
  - ❌ 无事件硬件且无高质量事件模拟器的团队
- **落地建议**：
  1. **「几何与外观解耦 + 有界修正」这个耦合方式是本文最可迁移的部分**——即便不用事件相机，把 3DGS 对齐到 SDF 时也可用「冻结初始参考场 + 描述子差 + clamp」来稳定几何
  2. 先做**无事件的基线**：用普通多视角 + SDF（NeRF/NeuS 路线）确认管线，再接入事件约束
  3. 有界修正建议用**软 clamp**（tanh 型）替代硬 clamp，避免梯度消失
  4. 若目标只是要表面，**直接用 2DGS / PGSR** 可能更省事——EAST 的独特价值在高速动态

---

## 相关笔记

- [[SIGGRAPH2026-Dual-Contouring-SDF]]
- [[2026-03-26-WorldMesh-Mesh-Conditioned-Image-Diffusion-3D-Scenes]]

---

## 开源参考

- **PyTorch3D**：Gaussian 渲染参考
- **tiny-cuda-nn / gsplat**：3DGS 渲染实现
- **nerfstudio**：SDF/NeuS 管线参考
- **libigl**：`igl::MarchingCubes`、`igl::DualContouring`（网格提取）
- **Open3D**：TSDF fusion（对比基线）
- **event-camera-tools / DV / metavision**（ Prophesee SDK）：事件数据处理
- **libuvc / ROS**：事件相机驱动

已传递给 @墨鱼丸。
