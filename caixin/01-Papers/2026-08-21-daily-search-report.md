# Daily Search Report - 2026-08-21

**搜索范围:** arXiv cs.FL + physics.flu-dyn (最近 24 小时)  
**关键词:** CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence  
**论文总数:** 12 篇

## 论文清单

| # | arXiv ID | 标题 | 类别 |
|---|----------|------|------|
| 1 | 2608.20006 | Dissipation-driven champion solitons in one-dimensional shallow-water waves | physics.flu-dyn |
| 2 | 2608.19632 | Complementary, Not Cumulative: Interaction Effects in PINNs for Navier-Stokes Vortex Shedding | physics.flu-dyn |
| 3 | 2608.19417 | Stability and nonlinear dynamics of three-layer viscous films inside a vertical cylindrical tube | physics.flu-dyn |
| 4 | 2608.19342 | Effect of Microscale Turbulent Structures Dynamics on Forced Convection in Turbulent Porous Media Flow | physics.flu-dyn |
| 5 | 2608.18923 | Mach-disk formation and shock-structure transitions in underexpanded coflowing jets | physics.flu-dyn |
| 6 | 2608.18890 | Orientation-dependent drag, lift, and torque correlations for Platonic polyhedral particles | physics.flu-dyn |
| 7 | 2608.18871 | Hydrodynamic Brachistochrone: Conflicting Paths of Time and Energy Minima within Viscous Media | physics.flu-dyn |
| 8 | 2608.18641 | Physics-informed neural network for inverse modeling of granular flows | physics.flu-dyn |
| 9 | 2608.18323 | Fully Parallel Dual-Grid Immersed-Boundary Framework for Flow-Induced Sound | physics.flu-dyn |
| 10 | 2608.18259 | Intrusive versus non-intrusive reduced-order modeling of generalized Newtonian fluid flows | physics.flu-dyn |
| 11 | 2608.17894 | A Residual Learning Approach for Unsteady Aerodynamic Load Prediction | physics.flu-dyn |
| 12 | 2608.17825 | Towards Rapid Prototyping of Spray Injectors: A Regime-Agnostic Neural Operator Surrogate | physics.flu-dyn |

## 主题分布

- **PINN/ML+CFD**: 4 篇 (#2, #8, #11, #12)
- **多相流**: 3 篇 (#3, #6, #12)
- **湍流/换热**: 2 篇 (#4, #5)
- **流固耦合/声学**: 1 篇 (#9)
- **降阶建模**: 1 篇 (#10)
- **浅水波/孤波**: 1 篇 (#1)
- **最优输运**: 1 篇 (#7)

## 亮点论文

### ⭐ 2608.19632 - PINN 技巧组合效应
**关键发现**: SIREN + 因果加权组合达到 4.1% L2 误差（vs OpenFOAM），单独使用均无效。更多技巧反而有害。

### ⭐ 2608.18871 - 流体力学最速降线
**关键发现**: 粘性耗散使时间最优和能量最优路径分裂，能耗最优路径呈非单调 S 形。

### ⭐ 2608.20006 - 耗散驱动的冠军孤子
**关键发现**: 反直觉地证明弱耗散可增强而非阻尼孤子，随机波起关键催化作用。

## 工具链
- 论文发现: arXiv API
- 内容获取: arXiv API + Jina (受限于 Cloudflare)
- 笔记格式: Markdown + Obsidian wikilinks
- 同步: git-sync.sh
