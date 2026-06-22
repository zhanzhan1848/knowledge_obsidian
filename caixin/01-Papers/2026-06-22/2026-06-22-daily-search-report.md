# Daily Search Report: 2026-06-22

**搜索范围**: arXiv physics.flu-dyn (最近72小时内的论文)  
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence  
**搜索时间**: 2026-06-22 14:09 UTC

---

## 论文发现概况

共发现 **81篇** physics.flu-dyn 论文（6月16-21日），筛选出 **12篇** 高相关度论文：

| 序号 | arXiv ID | 标题 | 关键词 | 相关度 |
|------|----------|------|---------|--------|
| 1 | 2606.20511 | State estimation of Rayleigh-Bénard convection with reduced-order models | ROM, EKF, Navier-Stokes | ⭐⭐⭐ |
| 2 | 2606.20352 | Planar Lagrangian transport and scalar-gradient in turbulent reacting shear layer | DNS, turbulence, LCS | ⭐⭐⭐⭐ |
| 3 | 2606.20320 | Restarts of bursts in turbulence in a log-minimal channel | Navier-Stokes, turbulence, bursts | ⭐⭐⭐⭐ |
| 4 | 2606.20139 | A high-fidelity numerical database for free-stream transition | iLES, RANS, Navier-Stokes, CFD | ⭐⭐⭐⭐ |
| 5 | 2606.19562 | Advances in Scientific Machine Learning for Coupled Fluid Flow | SciML, Navier-Stokes, surrogate | ⭐⭐⭐⭐ |
| 6 | 2606.18995 | Intermittency in Shell Models of Turbulent Cascades | Shell model, turbulence, intermittency | ⭐⭐⭐⭐ |
| 7 | 2606.18927 | APU-Accelerated Large Eddy Simulation with GALÆXI | LES, DG, GPU, CFD | ⭐⭐⭐⭐ |
| 8 | 2606.18232 | Quartic Lyapunov functions for global fluid stability | Navier-Stokes, stability, Lyapunov | ⭐⭐⭐ |
| 9 | 2606.17795 | Dynamics of a vortex column of supercritical fluid | Vortex, supercritical fluid | ⭐⭐⭐ |
| 10 | 2606.17448 | Curvilinear Moving Overset Method for High-order Schemes | CFD, overset grids, high-order | ⭐⭐⭐ |
| 11 | 2606.17330 | Turbulence Without the Viscous Tilting of Vorticity | Turbulence, vortex stretching | ⭐⭐⭐⭐ |
| 12 | 2606.16587 | Geometry-Conditioned Latent Surrogate for Spray Formation | VOF, ML surrogate, spray | ⭐⭐⭐ |

---

## 重点论文摘要

### 1. ROM + EKF 状态估计 (2606.20511)
**State estimation of Rayleigh-Bénard convection with reduced-order models**
- 将 Galerkin ROM 与扩展卡尔曼滤波(EKF)结合用于RB对流状态估计
- 从PIV-like速度测量重建温度场
- 速度重建误差<14%，温度<9%

### 2. 湍流间歇性与Shell模型 (2606.18995)
**Intermittency in Shell Models of Turbulent Cascades**
- 多分支shell模型研究湍流级联中的间歇性
- 分支结构增强间歇性（异常标度指数）
- 与Sabra模型对比，揭示乘性湍流特征

### 3. 高阶DG求解器GPU加速 (2606.18927)
**APU-Accelerated LES with GALÆXI**
- AMD MI300A APU上运行DGSEM求解器
- 跨音速压缩机叶栅wall-resolved LES验证
- 激波-湍流边界层干扰的高保真捕捉

### 4. 高阶移动重叠栅格方法 (2606.17448)
**Curvilinear Moving Overset Method for High-order Non-dissipative Schemes**
- 6阶精度中心差分+单层重叠界面处理
- 移动网格特征值分析保证稳定性
- 验证：圆柱旋转、翼型俯仰振荡等

### 5. 涡量粘性倾斜机制 (2606.17330)
**Turbulence Without the Viscous Tilting of Vorticity**
- 从DNS中移除粘性涡量倾斜
- 破坏-5/3惯性区标度
- 证明粘性倾斜是湍流的本质特征

---

## 技术趋势观察

1. **SciML融合**: 多篇论文将ML/DL与CFD结合（ROM、PINN、VAE、Surrogate）
2. **GPU/异构计算**: DGSEM、DNS大规模并行化
3. **湍流理论**: Shell模型、间歇性、涡量动力学持续受关注
4. **CFD基准数据库**: 高置信度数值数据库用于RANS模型评估
5. **移动边界问题**: 重叠栅格、浸入边界、FSI

---

## 相关性说明
- ⭐⭐⭐⭐: 核心CFD/湍流方法论文，与关键词高度匹配
- ⭐⭐⭐: 应用导向论文，包含相关技术元素

