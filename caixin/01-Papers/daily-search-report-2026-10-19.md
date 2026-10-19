# 每日论文搜索报告 — 2026-10-19

## 任务概览

- **执行时间**: 2026-10-19 14:26 UTC
- **搜索源**: arXiv cs.FL + physics.flu-dyn
- **时间窗口**: 严格 24 小时（2026-10-18 14:26 → 2026-10-19 14:26 UTC）—— **空集**；arXiv 周末无新提交，最近公告日 2026-10-16
- **检索关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence, computational fluid dynamics, lattice Boltzmann, smoothed particle
- **检索源**: arXiv API (`export.arxiv.org/api/query?cat:physics.flu-dyn`)

## 检索结果

- arXiv physics.flu-dyn 严格 24 小时窗口：**0 篇**（arXiv 周末不发布新提交；最近公告 2026-10-16）
- arXiv cs.FL 严格 24 小时窗口：**0 篇流体相关**（cs.FL 全为形式语言/自动机理论）
- **2026-10-16 已发布的 11 篇候选**（最近一次 arXiv 公告日）→ **筛选 7 篇高相关度**

## 已处理论文（7 篇高相关度）

| # | arXiv ID | 标题 | 关键词匹配 | 笔记文件 |
|---|----------|------|------------|----------|
| 1 | 2610.23754 | Effects of Spanwise Curvature on Hypersonic Boundary Layer Transition in Görtler-driven Flows | DNS, Gortler, secondary instability, hypersonic | ✅ |
| 2 | 2610.23624 | Wake effects in a 100 GW North Sea offshore wind scenario | LES, mesoscale, Jensen/Bastankhah/TurbOPark | ✅ |
| 3 | 2610.23442 | Regularization of stochastic fluid dynamics and non-perturbative renormalization of shear viscosity | navier-stokes, RG, lattice, UV-finite | ✅ |
| 4 | 2610.22903 | PINN-LPCDD: PINN with Learnable and Physically Consistent Domain Decomposition for Compressible Multi-Medium | PINN, Euler, sharp interface, multi-medium | ✅ |
| 5 | 2610.23352 | A GENERIC-Informed Neural Network for Generative Rheology (GINNGER) | neural network, rheology, polymer, thermodynamics | ✅ |
| 6 | 2610.23285 | Advection-Driven Orientation Selection in Phase Separation around a Moving Cooling Source | Cahn-Hilliard, phase-field, advection, anisotropy | ✅ |
| 7 | 2610.23178 | Influence of Droplet Morphology on Fluid Dynamics and Impact Erosion of Wind Turbine Blades | FSI, droplet impact, multiphase, scaling | ✅ |
| 8 | 2610.23298 | How the elastic axis folds the transonic flutter boundary | aeroelastic, flutter, Isogai-A, conformal, active learning | ✅ |

## 主题分布

- **湍流基础与建模**：1 篇（hypersonic boundary layer transition）
- **大气/风电工程**：1 篇（North Sea wake intercomparison）
- **流体统计物理**：1 篇（stochastic NS + RG）
- **机器学习 × 流体**：2 篇（PINN-LPCDD, GINNGER）
- **多相流与界面**：1 篇（Cahn-Hilliard, 液滴 FSI）
- **气动弹性 / 跨声速**：1 篇（Isogai A flutter folding）

## 已忽略论文

- **cs.FL 全集**：形式语言/自动机理论，与流体无关
- **2026-10-12 ~ 2026-10-15 论文**：已被 2026-10-18 日报处理（避免重复）
- **2026-10-16 边缘候选**：
  - `2610.23444` 船尾推进（实验水动力学，关键词弱匹配）
  - `2610.22780` 振荡液柱 Weier 方向不稳定性（关键词弱匹配）

## 核心观察

1. **展向曲率延迟 Görtler 过渡**：通过降低等效 Görtler 数（机械展向边界层变薄），hypersonic 边界层过渡点推迟，正弦型二次不稳定性仍是主导路径（2610.23754）
2. **Jensen/Bastankhah/TurbOPark 全部系统性偏高风速**：0.60-0.70 m/s bias；LES 是必要参考（2610.23624）
3. **stochastic NS UV 有限 + RG-improved**：首次给出 2D 与 3D 剪切粘度反常维度的非微扰结果，配合 lattice DNS 验证（2610.23442）
4. **PINN + Sharp Interface Method**：通过每个介质一个子网络 + 人工粘性 Euler + 尺度不变性，处理 1000:1 压力比 multi-medium 流（2610.22903）
5. **GINNGER 把"构成方程发现"重构为"生成元学习"**：在 polymer 构象张量本征谱空间内，~10-50 参数模型跨剪切/拉伸协议通用（2610.23352）
6. **Cahn-Hilliard + 移动冷却源 → 空间热历史编码**：流速 + 冷却源速度协同决定相分离形貌（2610.23285）
7. **液滴投影面积标度律**：单一 `A_π` 参数（仅由初始形貌 + 朝向决定）即可统一预测 peak pressure / impact force / t_peak（2610.23178）
8. **GP-active-learning + conformal prediction**：仅 80 仿真即可高精度 map Isogai A 颤振边界，1.6% 错误率（2610.23298）