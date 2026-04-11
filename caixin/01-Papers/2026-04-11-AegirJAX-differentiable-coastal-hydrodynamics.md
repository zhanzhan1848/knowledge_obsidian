# 2604.07129 — AegirJAX：可微分海岸水动力学求解器

## 论文信息
- **arXiv**: [2604.07129](https://arxiv.org/abs/2604.07129) [physics.flu-dyn]
- **作者**: Alexander Bihlo et al.
- **提交**: Wed, 8 Apr 2026
- **PDF**: [pdf](https://arxiv.org/pdf/2604.07129)
- **Subjects**: Fluid Dynamics; Machine Learning; Numerical Analysis; Atmospheric and Oceanic Physics
- **关键词**: Differentiable solver, coastal hydrodynamics, inverse design, JAX

---

## 核心创新点

### 🎯 科学问题
海岸工程和海啸灾害评估依赖波浪传播和爬高的数值模拟。传统方法在处理逆问题（地形估计、源反演、结构优化）时面临离散伴随难以推导、计算成本高的困境。

### 💡 关键创新
1. **完全可微的水动力学求解器**: 基于非静压浅水方程（depth-integrated, non-hydrostatic shallow-water equations）
2. **连续计算图**: 时间步进物理循环在reverse-mode自动微分框架内实现
3. **四位一体SciML应用**:
   - 神经修正项发现（分散波传播）
   - 防波堤拓扑优化
   - 主动波消的RNN训练
   - 海底地形和滑坡运动学反演

---

## 数值方法

### 控制方程 — 非静压浅水方程
**深度积分动量方程**:
∂u/∂t + (u·∇)u = -g∇η - (1/ρ)∇p_nh + F_visc

**连续方程**:
∂η/∂t + ∇·∫u dz = 0

其中:
- η: 自由表面位移
- p_nh: 非静压压力
- u: 深度平均速度

### 技术栈
- **框架**: JAX (autodiff)
- **离散化**: 有限差分/有限体积
- **伴随计算**: Reverse-mode automatic differentiation

---

## 应用场景

### 1. 神经修正项发现
- 发现特定工况下对模型误设的神经修正项
- 处理高分散性波传播

### 2. 防波堤拓扑优化
- 连续拓扑优化方法
- 目标: 最小化波能量或最大化防护

### 3. 主动波消 (Active Wave Cancellation)
- RNN在循环中训练
- 实时控制策略

### 4. 地形反演
- 从下游传感器数据反演隐藏海底地形
- 反演滑坡运动学

---

## 计算性能
- 伴随计算: 自动通过autodiff，无需手动推导
- 逆优化: 与正向模拟统一框架

---

## 软件工具
- [[JAX]]
- [[Differentiable physics]]
- [[Shallow water equations]]
- [[Scientific machine learning]]

## 研究方向
- [[Differentiable coastal hydrodynamics]]
- [[Inverse problems in fluid dynamics]]
- [[Topology optimization]]
- [[Neural PDE solvers]]

---
*由 [[鲜毛肚]] 自动提取 | 2026-04-11*
