# IB-Flows: an open-source multi-GPU immersed boundary code for fluid-structure interaction

## 论文信息
- **arXiv ID**: 2609.19130
- **发表日期**: 2026-09-17 (updated)
- **类别**: physics.flu-dyn, physics.comp-ph
- **关键词**: immersed boundary, fluid-structure interaction, multi-GPU, DNS, Navier-Stokes, CUDA Fortran
- **开源**: https://github.com/xxxxx/IB-Flows

## 核心创新点

### 1. 求解器架构
- **流体**: 二阶有限差分分数步 Navier-Stokes 求解器
- **网格**: 交错笛卡尔网格 (staggered Cartesian grid)
- **两种浸入边界方法**:
  - Lagrangian 方法: moving least-squares (MLS) 插值
  - Eulerian sharp-interface 方法

### 2. 固体求解器
- **刚体**: 基于四元数的 Newton-Euler 求解器
- **可变形表面**: 基于相互作用势的结构求解器
- **耦合**: predictor-corrector scheme，支持松散或强耦合

### 3. 非牛顿流体
- 剪切变稀/剪切变稠流变学
- 应变率相关粘度
- LES 子网格尺度涡粘度模型

### 4. 并行化
- CUDA Fortran + MPI 域分解
- GPU 执行所有 fluid、interpolation 和 structural kernels
- cuDecomp 库加速 Poisson 和隐式求解器的分布式转置
- 近理想的节点内扩展和良好的多节点效率

### 5. 验证场景
- 壁约束湍流
- 刚体和可变形体流固耦合
- 生物医学应用

## 数值方法
- 有限差分 (FDM)
- 分数步法 (Fractional-step)
- 浸入边界法 (Immersed Boundary Method)
- 大涡模拟 (LES)

## 计算成本
- 多 GPU 并行
- GPU 加速通信

## 链接
- arXiv: https://arxiv.org/abs/2609.19130
- GitHub: 待发布

## 标签
#immersed-boundary #fluid-structure-interaction #multi-GPU #open-source #CUDA #Navier-Stokes #LES
