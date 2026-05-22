# A Compression-Directional Entropic Stress Method for Shock-Regularized Compressible Flow

## Metadata
- **arXiv ID**: [2605.21444](https://arxiv.org/abs/2605.21444)
- **Submitted**: Wed, 21 May 2026
- **Subjects**: physics.flu-dyn

## 核心创新点

### 方法名称: CoDeS (Compression-Directional Entropic Stress)

### 物理背景
有限体积正则化方法，用于激波主导的可压缩流动

### 核心思想
将标量多维熵压替换为与主压缩方向对齐的张量应力：
$$\boldsymbol{\Pi}_{\Sigma} = \sigma \mathbf{M}$$

其中：
- σ 来自修正 Helmholtz 方程
- **M** 由对称速度梯度张量的压缩特征空间构造

### 源门控机制
由体积和主应变压缩门控：
- 光滑膨胀中正则化消失
- 刚体旋转中消失
- 理想接触中消失
- 平面激波处恢复一维 IGR 机制

### 应用场景
1. 光滑膨胀
2. 双稀疏
3. Sod 激波管
4. 多维 Riemann 流
5. 黏性激波管
6. 两流体三相点
7. Mach=3 激波问题

## 可行性分析：可压缩流

### 控制方程
Euler/Navier-Stokes，可压缩

### 数值方法
- **离散化**: 有限体积
- **正则化**: 张量应力形式
- **守恒性**: 保守动量通量和应力功能通量

### 计算成本
- 中等网格需求
- 适合高超声速流

### 推荐结论
✅ **推荐实现** - 信息几何正则化方法有潜力处理激波问题

---
**标签**: #compressible-flow #shock-capturing #entropic-stress #regularization