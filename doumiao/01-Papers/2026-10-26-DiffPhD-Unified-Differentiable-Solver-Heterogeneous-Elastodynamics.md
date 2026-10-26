---
type: paper
title: "DiffPhD: A Unified Differentiable Solver for Projective Heterogeneous Materials in Elastodynamics with Contact-Rich GPU-Acceleration"
date: 2026-10-26
agent: doumiao
domain: fluid-rendering
category: [surface-rendering]
tags: [differentiable-simulation, projective-dynamics, heterogeneous-material, GPU-solver, contact, hyperelasticity, real2sim, Neohookean, TAichi]
venue: SIGGRAPH Asia 2026 (ACM TOG 45(6))
doi: null
arxiv: 2605.14526
status: completed
---

# DiffPhD — 面向异质材料的统一可微投影动力学求解器

## 📌 基本信息

| 项目 | 值 |
|------|---|
| **作者** | Shih-Yu Lai¹²⁷\*, Sung-Han Tien, Jui-I Huang, Yen-Chen Tseng, Yi-Ting Chiu, Siyuan Luo, Ziqiu Zeng, Fan Shi, Peter Yichen Chen, Tiantian Liu, Yu-Lun Liu, Bing-Yu Chen |
| **单位** | ¹ 台湾大学 · ² MoonShine Animation Studio · 新加坡国立大学 · 不列颠哥伦比亚大学 · 独立研究者 · 阳明交通大学 · 芬兰阿尔托大学 |
| **会议** | SIGGRAPH Asia 2026，ACM TOG Vol. 45, No. 6 |
| **arXiv** | [2605.14526](https://arxiv.org/abs/2605.14526) （2026-05-14）· cs.DC / cs.GR / cs.RO / math.NA |
| **项目页** | https://chabu-tseng.github.io/diffphd/ |
| **PDF** | https://arxiv.org/pdf/2605.14526 |
| **视频** | https://youtu.be/bGPnIgAsy2A |
| **代码** | https://github.com/Akinesia112/DiffPhD ✅ **已开源** |
| **通讯作者** | Shih-Yu Lai |

> **收录理由**：这是目前**最完整地解决"异质性 + 超弹性 + 接触"三重困难的可微物理求解器**，且**代码已开源**。其"单一稀疏因子复用于前向/反向/接触"的 GPU 管线设计，对构建可微流体求解器有直接的方法论参考价值。

---

## 🎯 核心问题

**可微软体仿真是**系统辨识（system identification）、轨迹优化（trajectory optimization）与 **Real2Sim 迁移**的基础。但现有方法（代表是 **DiffPD**，可微投影动力学）在真实场景的三类困难面前全面失效：

1. **极端刚度对比的异质材料** —— 单一刚度的真实物体（甲壳+软关节、软体+刚性武器）
2. **大变形下的超弹性**（hyperelasticity）
3. **接触密集交互**

这三者**同时出现**且**相互纠缠**，现有求解器顾此失彼。

---

## 🔬 方法：三重集成的关键洞察

**核心洞察**：**投影动力学的全局刚度矩阵是所有昂贵操作的共同骨干** —— 前向全局步进、Delassus 接触柔度（compliance）、反向伴随（adjoint）都依赖它。因此整个求解器围绕"让它**易求逆**且在刚度对比下**稳健**"来组织。

### (i) 刚度感知投影装配（Stiffness-aware Projective Assembly）

**异质性被结构化地路由进全局算子，而不是局部 prox**：

- **逐元素材料参数只通过投影权重（projective weights）进入全局矩阵**
- 局部 prox **只看到全网格的标量均值**（mesh-wide scalar means）

**为什么逐元素局部 prox 会失败**：在局部 Newton 迭代中混合软硬元素，会使投影 Hessian 变成**逐元素变化**，导致**逐元素迭代在 PD 迭代间来回弹跳（ping-pong）**，而 **Anderson Acceleration 会放大这种漂移**。

**图 4 的两个后果**：
- **C1（全局）**：全局切线刚度的谱宽度直接随刚度对比 `μ_max/μ_min` 变化 —— 把这个对比**吸收进装配好的算子**，可保持求逆稳健
- **C2（局部）**：非凸性是**元素局部化**的 —— 接近坍塌的软元素发展出**不定的局部 Hessian**，而它的硬邻居仍保持**正定**。统一的逐元素滤波对这两种状态都服务不足 → 因此需要**状态自适应的信赖域滤波**，且**只施加在反向传播中**

### (ii) 反向稳定性（Backward Stability）

- **信赖域特征值滤波被提升到反向传播**：作用在**近端映射 Hessian（proximal-map Hessian）** 上，以在**高泊松比 + 大变形**下给出准确的 **Neo-Hookean 梯度**
- **II 型 Anderson Acceleration + 双门收敛判据（dual-gate convergence）**：稳定大刚度对比下的前向迭代

### (iii) 统一 GPU 管线

- **单一持久稀疏逆因子（persistent sparse-inverse factor）跨前向、反向、摩擦接触计算复用**
- **刚度放大 Rayleigh 阻尼被折进同一因子**，以**零额外开销**实现异质性感知的耗散

### 伴随精度

DiffPhD 提供**解析伴随（analytic adjoints）**：
- **弹性路径上是机器精度**（machine-precision）
- **接触下有界且可量化**（bounded and quantified under contact）

---

## 📊 实验结果

### 前向仿真稳定性与异质性

| 基准 | 设置 | 结果 |
|------|------|------|
| **Armadillo (Twist)** | 高度方向划分为 3 个子区域，刚度比 **10× ~ 100×**；对比 corotated PD 能量与完整 Neo-Hookean 超弹性 | DiffPhD 在**整个范围内保持稳定**，而 **DiffPD 在 ~10× 之后就无法收敛** |
| **Crab Pull-Up** | 甲壳（**10×**）+ 软关节的壳-关节复合体 | 干净地把软腿从地面抬起，单一刚度基线做不到 |
| **Gatorman** | 高分辨率角色手持**刚性剑（60× 身体参考刚度）** 击打球体 | 检验统一 **Signorini–Coulomb 接触管线**在瞬态冲击下的表现 |
| **Napkin（余维接触）** | 单层餐巾垂落于逐渐变大的球体障碍物，接触集从网格的 **6% 增至 50%** | 异质版本（0.1× 软半边 vs 1× 硬半边）产生**不对称、更明显的垂坠** |

### 可微逆问题

| 类型 | 基准 | 结果 |
|------|------|------|
| **系统辨识** | **Plant**：盆栽植物网格（细长枝条造成强几何非均匀性） | 从**单条 100 帧振荡轨迹**中**解耦出杨氏模量与泊松比** |
| **初态优化** | **Bunny: Inverse Design** | 优化初始位置、朝向、速度，使兔子质心在 100 帧后到达目标；**在基线求解器停滞于次优残差处仍能收敛** |
| **轨迹优化** | **Routing Tendon** | 垂直梁由 **16 组肌肉**驱动，优化使尖端在第 100 帧到达目标；对比同体积下**同质 vs 异质肌肉纤维布线** |

### Real2Sim 机器人操作

| 基准 | 设置 | 结果 |
|------|------|------|
| **Oreo: Robot Manipulator** | Google 机械臂用 **10 Pa** 刚性爪抓住五块饼干堆（10 Pa 球 + **4.55×10⁴ Pa** 软体） | **在所测试的求解器中唯一能在该对比度下保持数值稳定** |
| **Dice** | 由 **UR5 机械臂按压软骰子**的真实采集数据驱动 | **恢复面内接触位置**，使仿真形变与采集视频匹配，**端到端闭合 real-to-sim 鸿沟** |

### 性能

- 相比既有可微求解器，最高**一个数量级（order-of-magnitude）的墙钟加速**
- **关键在于这不是以稳定性为代价换来的**：DiffPhD 在**高达 100× 的刚度对比**下仍收敛，而既有 PD 求解器在此范围内退化
- 解锁了此前受"求解器脆弱性"或"每次迭代成本"双重瓶颈限制的领域：**壳-关节复合生物、持刚性武器的软角色、软夹爪机器人操作**，全部在**单次前向-反向传播**内完成

---

## 🩸 可行性分析：统一可微异质求解器

### 渲染方法
- **类型**：表面渲染（可变形体）
- **技术**：可微投影动力学 + 刚度感知投影装配 + 状态自适应信赖域滤波 + II 型 Anderson Acceleration + 统一 GPU 稀疏因子复用

### 视觉质量
- **逼真度**：⭐⭐⭐⭐（物理保真度显著提升，体现在刚度对比 100× 下的稳定性）
- **风格化支持**：不适用

### 性能预期
- **帧率**：相比 DiffPD 等基线最高 **10× 加速**（论文未给出具体 fps 数值）
- **GPU 需求**：GPU 加速（稀疏 Cholesky 分解，**单一因子跨前向/反向/接触复用**）
- **内存占用**：单个持久稀疏逆因子，规模可控

### 实现建议
- **着色器复杂度**：高
- **管线要求**：GPU 稀疏线性代数（可在 Taichi / 自建 CUDA / JAX 中实现）；**接触模型需 Signorini-Coulomb + Delassus**
- **推荐度**：✅ **推荐** —— **代码已开源**（github.com/Akinesia112/DiffPhD），是当前做可微异质物理最完整的可用基线。对流体渲染的价值主要在**方法论**：其"刚度对比 → 全局谱宽度 → 稳健求逆"的洞察，以及"单一稀疏因子复用"的 GPU 管线组织方式，都是构建可微流体求解器时可直接借用的架构

### 对本库算法 Agent 的落地建议
1. 若要做**可微流体**（如流体参数反演、可微喷泉/流体笔刷），DiffPhD 的"**异质性走全局算子、不走局部 prox**"原则同样适用：把空间变化的材料参数（如密度、刚度）编入全局装配权重，局部 prox 只看全局均值
2. **状态自适应信赖域滤波只加在反向传播** —— 这是稳定超弹性梯度的关键技巧，且不牺牲前向速度
3. **单一稀疏因子复用**前向/反向/接触的管线组织，是 GPU 上做可微求解器的工程范式
4. 关注 `github.com/Akinesia112/DiffPhD` 作为实现参考

---

## 🔗 关联笔记

- [[RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder]] — SA2026 可微降阶 + 视觉反馈
- [[Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — SA2026 半拉格朗日平流
- [[Power-Partitioner-Optimal-Transport-Distributed-Sim]] — SA2026 分布式分区
- [[DiffPhD-Unified-Differentiable-Solver-Heterogeneous-Elastodynamics]] — 本笔记

## 📚 参考文献（论文关键引用）

- Baraff, D., Witkin, D. 1998. *Large Steps in Cloth Simulation*（投影动力学基础）
- Sifakis, E. et al. 1999. *Position-Based Dynamics for Non-elastic Interactive Simulation*.
- Wang, Y. et al. 2021. *DiffPD: Differentiable Projective Dynamics*（本文主要基线）
- Anderson, D. G. 1965. *Acceleration of Split Step Iterative Methods*（Anderson Acceleration）
- Smith, B. et al. 2018. *Neo-Hookean Subspace Simulation*.
- Barbič, J., James, D. L. 2005.（子空间投影动力学）
- Bickel, P. et al.（材料微分）
