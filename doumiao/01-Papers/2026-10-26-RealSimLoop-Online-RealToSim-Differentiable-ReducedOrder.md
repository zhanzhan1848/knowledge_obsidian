---
type: paper
title: "RealSimLoop: Online Real-to-Sim Adaptation via Differentiable Reduced-Order Simulation with Vision Feedback"
date: 2026-10-26
agent: doumiao
domain: fluid-rendering
category: [surface-rendering, particle-rendering]
tags: [real-to-sim, differentiable-simulation, neural-subspace, adjoint-method, 3DGS, differentiable-rendering, online-adaptation, deformable]
venue: SIGGRAPH Asia 2026
doi: 10.1145/3829340.3842376
arxiv: 2609.09828
status: completed
---

# RealSimLoop — 用可微降阶仿真 + 视觉反馈实现在线 Real-to-Sim 适配

## 📌 基本信息

| 项目 | 值 |
|------|---|
| **作者** | Zhihao Cen¹, Chuhua Xian¹\*, Hailin Sun², Yuliang Liufu², Zhen Zhang², Xiangyu Chu²⁴, Hongmin Cai¹, Yunbo Zhang³, Guoxin Fang²\* |
| **单位** | ¹ 华南理工大学 · ² 香港中文大学 · ³ 香港科技大学（广州）中国科学院 · ⁴ 多尺度医疗机器人中心（香港） |
| **会议** | SIGGRAPH Asia 2026 Conference Papers（2026-12-01~04, 吉隆坡） |
| **DOI** | [10.1145/3829340.3842376](https://doi.org/10.1145/3829340.3842376) |
| **arXiv** | [2609.09828](https://arxiv.org/abs/2609.09828) （v1 2026-09-09, v2 2026-09-14）· cs.GR / cs.CV / cs.RO · CC BY 4.0 |
| **ISBN** | 979-8-4007-2842-6/2026/122752 |
| **项目页** | https://online-r2s.github.io/ |
| **视频** | https://www.youtube.com/watch?v=1HF4mFlgFvI （[CRML @ CUHK 频道](https://www.youtube.com/@CRML-CUHK)） |
| **代码** | "coming soon"（论文承诺接收后发布） |
| **页数** | arXiv HTML 全文可读 |

> **收录理由**：这是本库中**少见的"可微物理 + 神经降阶 + 可微渲染"三者闭环**的工作。虽然主战场是可变形体（而非流体），但其**降阶可微仿真 + 伴随法反向传播**的管线，对未来"神经流体仿真"（neural fluid simulation）的落地路径极具参考价值。

---

## 🎯 核心问题：Real-to-Sim 鸿沟

真实世界的观测**稀疏或仅表面级**（动捕标记点、单目图像），但下游任务需要**隐藏的物理量**：内部形变、应力场、交互力。物理仿真能补全这些量，但在线适配面临**三大障碍**：

1. **全空间优化代价高昂** —— 反复仿真 + 反复微分物理动力学，无法实时
2. **反馈有限** —— 传统方法依赖动捕标记或专用测力/探针装置；视觉数据更密但更难用
3. **材料属性时变** —— 真实材料随温度、老化、外载变化，单一固定参数集无法跟踪

**现有离线方法的失败模式**：
- 离线 Real2Sim（Real2Sim, Hahn et al. 2019；GiC, Cai et al. 2024）只拟合一段预录序列 → **开环漂移**，无法适应时变属性或突发环境变化
- 离线精度**在大伸长（>100%）时崩溃**，即使用 Yeoh 这类复杂本构模型
- 纯视觉场景重建能对齐外观，但**丢失物理量**

---

## 🔬 方法

### 1. 降阶神经子空间

学习一个低维子空间 `z^t ∈ ℝ^r`（r ≪ n，n 为全空间自由度），把仿真状态映射到子空间坐标：

```
x_g^t = B(φ(z^t))
```

- `φ`：非线性映射（神经隐式）
- `B(·)`：**几何映射** —— 每个高斯点的位置表示为其所在四面体顶点的重心插值：
  ```
  x_g = Σ_{i=1..4} w_i · p_i,   s.t. Σ w_i = 1
  ```
  其中 `p_i` 为第 i 个顶点坐标。

**关键点**：每次在线迭代时，高斯中心位置 `x_g^t` 与形变网格 `M(t)` **同步更新**，保证渲染图元与底层几何严格空间对齐。由于四面体网格运动由物理模型支配，GS 渲染的外观变化天然遵循物理动力学 —— 这同时缓解了稀疏视角带来的伪影。

**可微性**：重心插值是**可微**的，支持链式法则梯度传播。

### 2. 滑动窗口在线目标函数

核心创新：引入 **window（滚动缓冲区）** 概念，取代离线的"全历史数据集"。

```
L_r2s-vision^online = Σ_{t ∈ {T_e−w+1, …, T_e}}  Σ_{c=1..K} | R(G_t) − I_real^c |
```

- `R(·)`：基于 **3DGS 的可微渲染器**（Kerbl et al. 2023）
- `I_real^c`：真实采集图像（K 个视角）
- 窗口大小 `w` 的**双向权衡**（论文明确指出）：
  - **小窗口** → 参数更新快，但**更易受噪声影响**
  - **大窗口** → 更新慢，但结果更稳定准确

### 3. 梯度优化：伴随法（Adjoint Method）

**优化问题**（Eq. 8）：

```
argmin_{θ, G_t}  L_r2s-vision^online(G_t)    s.t.  R(Z, θ) = 0
```

约束 `R(Z,θ)=0` 是降阶仿真的离散状态方程。

#### 3.1 视觉 → 状态 的梯度回传（Eq. 9）

```
∂L/∂z^t = (∂L/∂I^t) · (∂I^t/∂G^t) · (∂G^t/∂x^t) · J(z^t)
```

前两项把**像素级梯度聚合到 GS 几何**，第三项把几何梯度**投影进降阶仿真子空间**（J 是子空间映射的 Jacobian）。

#### 3.2 物理残差与正交条件（Eq. 10）

定义物理残差 `J(z^t)ᵀ r(z^t, y^t, θ)`，要求其与子空间映射的切空间正交：

```
h(z^t, z^{t−1}, z^{t−2}, θ) := J(z^t)ᵀ r(z^t, y^t, θ) = 0
```

#### 3.3 伴随变量反向递推（Eq. 11）

引入伴随变量 `λ_t ∈ ℝ^r`，**从 t_e 向前到 t_s 反向求解**线性系统：

```
Σ_{k=t}^{t+2} (∂h^k/∂z^t)ᵀ λ_k = −∂L/∂z^t
```

左侧矩阵是**降序切线刚度矩阵的转置**。其高效计算方式（Eq. 12）：

```
∂h^t/∂z^t   = (∂J(z^t)ᵀ/∂z^t)·r^t + J(z^t)ᵀ·(∂r^t/∂z^t)
∂h^{t+1}/∂z^t = J(z^{t+1})ᵀ·(∂r^{t+1}/∂z^t)
∂h^{t+2}/∂z^t = J(z^{t+2})ᵀ·(∂r^{t+2}/∂z^t)
```

> **伴随法的工程意义**：无需显式构造仿真轨迹对 θ 的稠密 Jacobian，同时高效利用系统稀疏性。

#### 3.4 材料参数梯度累积（Eq. 13）

```
dL/dθ = Σ_{t=T_e−w+1}^{T_e} λ_tᵀ (∂h^t/∂θ)
      = Σ_t λ_tᵀ ( −J(z^t)ᵀ · ∂f(z^t,θ)/∂θ )
```

---

## 📊 实验结果

### 1. 计算效率（论文 Table 1，NVIDIA RTX 4090）

> 时间含**前向仿真 + 梯度计算 + 3DGS 渲染**

| 模型 | 全空间 DOF n | 子空间维度 r | 窗口 w | 相机数 c | **T_r（子空间/帧）** | T_f（全空间/帧） | **加速比** |
|------|------|------|------|------|------|------|------|
| Material Bar (Fig. 1) | 10K | 30 | 3 | 4 | **0.53 s** | 3.30 s | **6.23×** |
| Eiffel Tower (Fig. 3, 8) | 12K | 10 | 3 | 2 | **0.18 s** | 1.36 s | **7.56×** |
| Dinosaur (Fig. 4, 7) | 15K | 100 | 5 | 8 | **1.01 s** | 7.77 s | **7.69×** |
| Gingerbread Joy (Fig. 5, 6) | 3.6K | 8 | — | — | 0.58 s | 1.46 s | **2.52×** |

Material Bar 的细分耗时：**前向 0.17 s + 反向 0.14 s + 3DGS 0.22 s = 0.53 s/帧**

> **注**：论文明确说明 **high-speed ball 案例使用全空间仿真**，因为降阶求解器未收敛（见局限）。

### 2. 视觉反馈 vs 标记点反馈

- Dinosaur 实验中，**稠密图像反馈**比稀疏标记轨迹产生**更稳定的材料估计**和**更低的形变误差**
- **平均 sim-to-real 误差从 7.1 mm 降到 4.6 mm**（标记法 → 视觉法）

### 3. 应用场景

| 应用 | 结果 |
|------|------|
| **双机器人臂软棒操作** | 仿真中优化的形状控制指令**无需再调参**直接应用到真实机器人；结果几何更接近扫描目标；并能重建**von Mises 应力场** |
| **多材料识别 + 应力重建** | 缆驱埃菲尔铁塔含两种不同刚度硅胶；RealSimLoop **分别估计两个杨氏模量**并收敛到参考值；可从**新视角**渲染应力场；计算时间 **1.36 s → 0.18 s/帧（7.56×）** |
| **外部力预测** | 从重建的物理状态预测缆绳张力，与力传感器实测在 **5 个目标构型**下对比 |
| **温度相关刚度跟踪** | 聚己内酯（PCL）桁架 + 硅胶体，从 **45°C 冷却到 27°C**，刚度上升；在线自适应跟踪变化的力学响应（实测推力 + 估计杨氏模量） |
| **在线适应变材料** | 杨氏模量**分步从 10 变到 40 kPa**；在线估计跟随变化，而离线拟合保持单一常数 |

### 4. 消融

论文报告了**子空间维度、窗口大小、相机数量**三个参数的消融（Dinosaur 实验）：子空间维度与窗口大小在**计算时间与重建精度**间权衡；相机数量同时影响视觉反馈的成本与质量。

---

## ⚠️ 局限与未来工作（论文 5.3.4 节）

1. **逐元素材料分布难以扩展**：多材料场景已支持"明确定义的区域"，但**逐元素材料分布**会大幅扩大参数空间并复杂化优化 —— 可能需要更强正则化或用神经表示建模连续材料变化
2. **降阶模型在高度动态系统中可能不收敛**，且对**未见过的形变模式或超范围材料参数外推能力有限**
3. **应对策略**：此类场景（如高速球）**回退到全空间仿真**。即便没有模型降阶，在线框架仍比离线方法更准
4. **未来工作**：自适应精化（保留降阶效率的同时处理高动态场景）、无监督学习提升外推能力

---

## 🩸 可行性分析：可微降阶仿真 + 视觉反馈

### 渲染方法
- **类型**：表面渲染（可变形体）+ 可微渲染管线（3DGS）
- **技术**：神经降阶子空间 + 伴随法反向传播 + 可微 3DGS + 滑动窗口在线优化

### 视觉质量
- **逼真度**：⭐⭐⭐⭐（几何精度提升有 7.1mm → 4.6mm 的实测支撑）
- **风格化支持**：不适用（面向物理仿真保真）

### 性能预期
- **帧率**：**准实时**（0.18 ~ 1.01 s/帧，降阶后加速 2.52×~7.69×）
- **GPU 需求**：NVIDIA RTX 4090（3DGS 渲染为主）
- **内存占用**：子空间维度 r 极小（8~100），内存开销低

### 实现建议
- **着色器复杂度**：高（需可微渲染 + 伴随法反向传播）
- **管线要求**：需 (a) 可微物理求解器，(b) 降阶/子空间表示，(c) 可微渲染器。三者必须端到端打通
- **推荐度**：⚠️ **有条件推荐** —— 对可变形体/Robotics 价值极高；但**门槛高**，且本文**无流体应用**（子代理已确认：无流体仿真/倾倒场景，纯可变形固体）。对流体渲染的价值主要是**方法论参考**（神经降阶 + 伴随法可微流体的路线图）

### 对本库算法 Agent 的落地建议
1. 若要实现"神经流体 + 可微优化"，RealSimLoop 是一份**完整的管线参考**：降阶子空间 → 可微渲染 → 视觉损失 → 伴随法反向 → 滑动窗口在线更新
2. **窗口机制**是可直接移植的设计：离线全历史 → 在线滑动窗口，同时解决"参数跟不上时变"与"计算量爆炸"
3. **降阶的收敛边界要正视**：高动态场景需要回退全空间，这在做流体时同样成立（湍流/自由面破碎恰是降阶最弱的场景）
4. 注意：**逐元素材料参数化会爆炸** —— 流体中若要逐涡/逐区域调参，需改用神经场表示连续参数

---

## 🔗 关联笔记

- [[Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — SA2026 半拉格朗日平流
- [[Power-Partitioner-Optimal-Transport-Distributed-Sim]] — SA2026 分布式仿真分区
- [[DiffPhD-Unified-Differentiable-Solver-Heterogeneous-Elastodynamics]] — SA2026 可微投影动力学
- [[RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder]] — 本笔记

## 📚 参考文献（论文关键引用）

- Cai, W. et al. 2024. *GiC: A Giant Unified Image-to-Physics Model for Robot Manipulation*（离线 Real2Sim 基线）
- Hahn, D. et al. 2019. *Teaching robots to imitate: Real-to-Sim transfer in physical world*.
- Barbič, J., James, D. L. 2005. *Real-time subspace integration for St. Venant-Kirchhoff deformable models*（降阶仿真奠基）
- Benchekroun, O. et al. 2023. *Fast complementary dynamics via skinning eigenmodes*（子空间动力学）
- Kerbl, B. et al. 2023. *3D Gaussian Splatting for Real-Time Radiance Field Rendering*.
- Sharp, N. et al. 2023. *Diffeomorphic Neural Maps*（降阶模型外推局限）
- Lyu, C. et al. 2024. *Neural Reduced-order Model for the Simulation of Complex Deformable Bodies*.
- Barbenet, B. & Witkin, D. 2023. *Large Steps in Cloth Simulation*.
- Smith, B. et al. 2018. *Neo-Hookean Subspace Simulation*.
