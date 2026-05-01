# Daily Search Report - 2026-05-01

## 搜索概况
- **搜索时间**: 2026-05-01 14:12 UTC
- **搜索范围**: arXiv physics.flu-dyn, cs.FL (最近24小时)
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **论文总数**: 11 篇 (physics.flu-dyn: 11, cs.FL: 0)

---

## 今日论文列表

### physics.flu-dyn (11 篇)

| ID | 标题 | 领域 |
|----|------|------|
| [2604.27999](2026-05-01-2604.27999-N-phase-NS-CH-Mixture.md) | Mixture-aware closure of N-phase Navier-Stokes-Cahn-Hilliard | 多相流, Phase-field |
| [2604.27827](2026-05-01-2604.27827-Gravity-Currents-Heterogeneous-Porous.md) | Mixing of gravity currents in heterogeneous porous media | 多孔介质, 对流 |
| [2604.27687](2026-05-01-2604.27687-CH-Contact-Line-High-Friction.md) | Cahn-Hilliard captures nanoscale contact line dynamics | 润湿, MD-CFD耦合 |
| [2604.27680](2026-05-01-2604.27680-Stall-Cell-3DVar-DA.md) | Variational DA of 3D stall-cell flow past airfoil | 空气动力学, PIV, RANS |
| [2604.27388](2026-05-01-2604.27388-Asymmetric-Freezing-Sliding-Droplet.md) | Asymmetric freezing of sliding droplet on incline | 凝固, 润湿, 润滑近似 |
| [2604.27255](2026-05-01-2604.27255-Particle-Turbulence-SGS-Closure.md) | Training SGS particle-turbulence closures with particle data | 湍流, LES, 机器学习 |
| [2604.27158](2026-05-01-2604.27158-FNO-LBM-Hybrid.md) | Hybrid Fourier Neural Operator-Lattice Boltzmann Method | LBM, Neural Operator, 加速 |
| [2604.27088](2026-05-01-2604.27088-Compressible-NS-Schrodinger.md) | Compressible Navier-Stokes in Schrödinger-type variables | Cole-Hopf变换, 量子算法 |
| [2604.27348](2026-05-01-2604.27348-Viscoelastic-Microswimmer.md) | Propulsion of linked-sphere viscoelastic microswimmers | 微流体, 活性物质 |
| [2604.27301](2026-05-01-2604.27301-AGN-Jet-Wind-Suppression.md) | AGN jet-wind interaction suppressing star formation | 天体流体力学, 湍流 |
| [2604.28152](2026-05-01-2604.28152-Immersed-Boundary-High-Order.md) | Beyond first-order accuracy in immersed boundary methods | 浸入边界法, 高阶格式 |

---

## 交叉列表 (Cross-list)

| ID | 标题 | 来源 |
|----|------|------|
| 2604.27348 | Viscoelastic microswimmer propulsion | cond-mat.soft |
| 2604.27301 | AGN feedback & star formation suppression | astro-ph.GA |
| 2604.28152 | High-order immersed boundary methods | math.NA |

---

## 重点论文分析

### 1. FNO-LBM Hybrid (2604.27158) - ⭐ 推荐实现
- **创新点**: 神经算子与LBM混合加速框架
- **加速效果**: 稳态收敛加速70%, 非稳态通过super-time-stepping加速
- **数值方法**: Fourier Neural Operator + LBM
- **适用场景**: 多孔介质流动, 弱可压缩流

### 2. N-phase NS-CH Mixture (2604.27999) - ⭐ 推荐实现
- **创新点**: 热力学一致的N相Phase-field闭合
- **核心公式**: Maxwell-Stefan型迁移率
- **数值方法**: Cahn-Hilliard + Navier-Stokes
- **适用场景**: 多相流, 界面动力学

### 3. Particle-turbulence SGS Closure (2604.27255) - ⭐ 推荐实现
- **创新点**: 仅用粒子数据训练SGS模型
- **关键发现**: 粒子动能谱训练优于全时空数据
- **应用**: 稀疏粒子实验数据推断SGS物理

### 4. Compressible NS Schrödinger Formulation (2604.27088) - ⚠️ 学术价值高
- **创新点**: 首个可压缩NS的精确Cole-Hopf型Schrödinger变换
- **二维分解**: Helmholtz分解为压缩和涡旋势
- **应用**: 量子算法, QPDE求解器

---

## 知识点提炼

### Phase-field方法进展
- N相混合物的热力学一致闭合条件
- MD与Phase-field模型的定量标定协议
- 接触线摩擦系数标定方法

### 机器学习CFD
- FNO与LBM的混合加速策略
- 仅粒子数据的SGS闭合训练范式
- 谱训练优于全时空数据训练

### 高阶数值方法
- 浸入边界法超越一阶精度的理论框架
- 连续力法的二阶收敛性证明

---

*生成时间: 2026-05-01 14:12 UTC*