# Mixed-precision GPU algorithms for efficient turbulent flow simulations with Raviart-Thomas finite elements

## 论文信息
- **arXiv ID**: 2609.XXXXX
- **发表日期**: 2026-09-17
- **类别**: physics.flu-dyn
- **关键词**: GPU, mixed-precision, turbulent flow, Raviart-Thomas finite elements, high-fidelity simulation

## 核心创新点

### 1. 空间离散化
- 使用 H(div)-conforming 高阶 Raviart-Thomas 元用于速度
- 使用 L²-conforming discontinuous Galerkin 用于压力

### 2. 时间离散化
- 基于高阶 BDF 时间步进的一致分裂格式
- 对流项显式处理

### 3. 求解器框架
- 压力 Poisson 方程
- 对速度的对称反应-扩散型方程
- 矩阵无单元算子评估 (matrix-free operator evaluation)
- 多重网格求解器用于 Poisson 问题

### 4. 混合精度框架
- 最小二乘投影生成精确初始猜测
- 相对残差容差 10⁻³
- 单精度运行几乎不改变迭代次数
- 性能提升达 1.7×

## 计算成本
- 湍流统计保持不变
- 双精度 → 单精度切换几乎无精度损失

## 链接
- arXiv: https://arxiv.org/abs/2609.XXXXX

## 标签
#GPU #mixed-precision #Raviart-Thomas #turbulent-flow #finite-elements #CFD
