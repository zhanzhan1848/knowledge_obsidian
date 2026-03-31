# LVM-PINN: Learnable Viscosity Modulation in Physics-Informed Neural Networks for Incompressible Flow

**arXiv**: [2603.27496](https://arxiv.org/abs/2603.27496)  
**日期**: 2026-03-31  
**分类**: physics.flu-dyn | MSC: 35Q30, 68T07, 76D05  
**链接**: [[PDF]](https://arxiv.org/pdf/2603.27496) | [[HTML]](https://arxiv.org/html/2603.27496v1)

---

## 核心贡献

提出 **LVM-PINN** (Learnable Viscosity Modulation PINN) 框架，解决不可压缩 N-S 方程在稀疏/噪声数据条件下的求解难题。

## 问题背景

PINN 求解不可压缩 N-S 方程的挑战：
- 对流-扩散-压力局部平衡难以捕捉
- 稀疏/噪声观测数据下训练不稳定
- 局部耗散强度无法自适应

## 方法论

### 核心创新：LVM 机制

在动量方程的粘性扩散项中嵌入**可学习时空标量场** $\nu(\mathbf{x},t)$：

$$\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nabla \cdot [\nu(\mathbf{x},t) \nabla \mathbf{u}] + \mathbf{f}$$

- $\nu(\mathbf{x},t)$: 预测的时空粘性场
- 嵌入粘性扩散项 → 自适应局部耗散调制
- 改善优化稳定性

### 网络架构

- 共享 encoder 预测 $\nu(\mathbf{x},t)$
- 标准 PINN 结构预测 $(\mathbf{u}, p)$
- 控制方程残差作为额外损失项

### 基准测试

| 案例 | 方法 | 精度 |
|------|------|------|
| Kovasznay flow | LVM-PINN | 更稳定 |
| 制造强迫流 | LVM-PINN vs GRU/Res-Attention | 稀疏/噪声数据下更优 |

### 消融实验

- 控制网络架构不变，仅改变 LVM 机制
- 证明 LVM 本身对精度提升的贡献

## 评估

🥢 可行性分析：**PINN 求解不可压缩 N-S**

### 控制方程
不可压缩 N-S 方程（修正粘性项）：
- 连续性：$\nabla \cdot \mathbf{u} = 0$
- 动量：$\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\nabla p + \nabla \cdot [\nu(\mathbf{x},t)\nabla\mathbf{u}] + \mathbf{f}$

### 数值方法
- **离散化**：PINN (Neural Network 近似)
- **求解器**：梯度优化（Adam + L-BFGS）
- **稳定性**：LVM 机制增强训练稳定性

### 计算成本
- 相比传统 CFD：无网格 → 计算成本低
- 相比标准 PINN：额外 $\nu(\mathbf{x},t)$ 预测 → 轻微增加

### 推荐结论
✅ **推荐实现** — PINN + N-S 是当前研究热点，LVM 机制对稀疏/噪声数据的改进有实际价值，适合流场重构任务。

---

*标签*: #PINN #Navier-Stokes #fluid-simulation #machine-learning #incompressible-flow
