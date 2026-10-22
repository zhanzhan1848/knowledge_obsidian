---
type: report
created: 2026-10-22
updated: 2026-10-22
tags: [daily-report, fluid-dynamics, arxiv, cs.FL, physics.flu-dyn]
status: processed
domain: fluid-dynamics
agent: caixin
---

# 每日论文搜索报告 — 2026-10-22

## 任务概览

- **执行时间**: 2026-10-22 14:08 UTC
- **搜索源**: arXiv API (`export.arxiv.org/api/query`)，按 `submittedDate` 降序
- **时间窗口**: 严格 24 小时（2026-10-21 14:08 UTC → 2026-10-22 14:08 UTC）
- **检索范围**: 主类 `cs.FL`、`physics.flu-dyn`（80 条）+ 跨类扫描 `math.NA`、`math.AP`、`math-ph`、`physics.comp-ph`、`cs.CE`、`cond-mat.soft`、`physics.ao-ph`、`cs.LG`、`physics.plasm-ph`（120 条，按关键词过滤）
- **检索关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence + turb/visc/∂·u/vortic/wave/hydrodyn/aero 等扩展词
- **代理**: 🥬 菜心 (Caixin) — 流体力学 Agent

## 抓取结果（24h 窗口）

### 主类 physics.flu-dyn / cs.FL

| # | arXiv ID | 标题（缩写） | 提交 v1 | 主类 | 笔记 |
|---|----------|--------------|---------|------|------|
| 1 | 2610.30012 | DiffVortex: quantum-inspired fast solver for incompressible flows | 10-21 16:43 | physics.comp-ph | ✅ |
| 2 | 2610.29899 | Acoustic control of Rayleigh-regime liquid-jet breakup (MHz transducer) | 10-21 15:42 | physics.flu-dyn | ➖ 实验，实验性 |
| 3 | 2610.29867 | Swarmlet: GPU-resident reformulated vortex particle method | 10-21 15:23 | math.NA | ✅ |
| 4 | 2610.29850 | Automated Discovery of DES Subgrid Length Scales via Agentic AI | 10-21 15:09 | physics.flu-dyn | ✅ |

### 跨类（按关键词过滤后）

| # | arXiv ID | 标题（缩写） | 提交 v1 | 主类 | 笔记 |
|---|----------|--------------|---------|------|------|
| 5 | 2610.30096 | Well-posedness of 2D inhomogeneous incompressible Euler + global solutions | 10-21 17:45 | math.AP | ✅ |
| 6 | 2610.30092 | Spatial Control of Compressible Active Fluids | 10-21 17:41 | cond-mat.soft | ✅ |
| 7 | 2610.30077 | Linear 2nd-order unconditionally energy-stable SAV scheme for CHQ | 10-21 17:27 | math.NA | ✅ |
| 8 | 2610.30038 | Long-time dynamics of viscous Gröbli triangles | 10-21 17:00 | math.AP | ✅ |
| 9 | 2610.29975 | Nonlinear Inviscid Damping of Couette Flow (boundary-supported vorticity) | 10-21 16:24 | math.AP | ✅ |
| 10 | 2610.29938 | PDE-guided neural operator + 2D anisotropic Boussinesq long-time relaxation | 10-21 16:08 | math.AP | ✅ |
| 11 | 2610.29930 | Topographically Forced Stationary Waves / Huygens winds on Titan | 10-21 16:03 | astro-ph.EP | ✅ |
| 12 | 2610.29818 | Super-Convergent Quasi-Discontinuous Galerkin for Advection-Diffusion | 10-21 14:44 | math.AP | ✅ |
| 13 | 2610.29859 | Time-asymptotic stability of NSFK viscous-dispersive shocks | 10-21 15:17 | math.AP | ✅ |

**共 12 篇建档**（主类 3 + 跨类 9）+ 1 篇实验性跳过

**窗口内总提交量偏小**（physics.flu-dyn + cs.FL 仅 4 条落入窗口），主因 10-21 为 arXiv 提交高峰、周末效应尚未到来。跨类扫描有效补偿了主类数量。

## 跳过

- **2610.29899** — `Acoustic control of Rayleigh-regime liquid-jet breakup`（physics.flu-dyn）：MHz 换能器控制射流破碎，纯实验（高速阴影成像 50,000 fps），无量纲破碎长度 $L_b/d$ 结果；与本库数值方法主线相关性低。**留作自由表面/射流实验参考**，不建独立笔记。

## 📁 本次新增笔记

目录：`~/knowledge-vault/caixin/01-Papers/2026-10-22-papers/`

1. `2026-10-22-DiffVortex-quantum-inspired-vortex-solver.md`
2. `2026-10-22-Swarmlet-rVPM-multirotor.md`
3. `2026-10-22-DEScover-agentic-AI-subgrid.md`
4. `2026-10-22-neural-operator-anisotropic-Boussinesq.md`
5. `2026-10-22-viscous-Grobli-triangles.md`
6. `2026-10-22-2D-inhomogeneous-Euler-well-posedness.md`
7. `2026-10-22-nonlinear-inviscid-damping-Couette.md`
8. `2026-10-22-SAV-CHQ-viscoelastic-phase-separation.md`
9. `2026-10-22-compressible-active-fluids-spatial-control.md`
10. `2026-10-22-QDG-superconvergent-advection-diffusion.md`
11. `2026-10-22-NSFK-viscous-dispersive-shock-stability.md`
12. `2026-10-22-Titan-topographic-stationary-waves-zonal-winds.md`

## ⭐ 本日主题：涡方法的三次复兴

窗口内出现**三篇独立的涡方法工作**，构成本日最强信号：

- **2610.30012 DiffVortex**（JHU Veerapaneni 组）：量子张量网络 MPS/QTT，**压缩 Biot–Savart 核而非流场**，Lagrangian 涡粒子 + 涡片浸没边界；$2^d r$ MPO rank 界与网格无关；PyTorch 端到端可微，单 GPU $6.7\times10^7$ 粒子。
- **2610.29867 Swarmlet**：rVPM 大涡格式 + GPU 常驻，**核外 4 核半径精确等于奇异 Biot–Savart**，treecode 多极远场零正则化误差；动态涡粘五件套守恒修正；与直接求和一致到 $5\times10^{-7}$，三阶时间收敛。
- **2610.30038 Viscous Gröbli triangles**（Dolce & Tirotta）：从**理论侧**给出涡核扩散 $\sigma(t)\propto t$ 的标度律，正是上述两类代码所需的核尺寸演化依据；并构造出 vortex burst 的零粘性实现。

三篇分别覆盖 **压缩算法 / 工程求解器 / 基础理论**，且互相引用同一物理对象。⚠️ 这是本季度最值得跟踪的方向。

## 🥢 传递给 @墨鱼丸 的算法/实现建议

| 论文 | 实现路径 | 难度 | 价值 |
|------|---------|------|------|
| 2610.30012 (DiffVortex) | PyTorch 张量网络卷积；FMM moment-to-local 改写为 QTT 收缩；涡粒子 + 涡片边界；梯度检查用 impulsively-started cylinder | **高** | **极高**（可微 CFD；设计优化/逆向问题；$O(\log N)$ 复杂度承诺） |
| 2610.29867 (Swarmlet) | rVPM 粒子内核（紧支撑、4 核半径外精确奇异 BS）+ treecode + 动态涡粘 + 投影松弛；六自由度耦合可直接用 JAX/PyTorch 写 | 中高 | **极高**（$5\times10^{-7}$ 对直接求和的验证标准；群体尺度编队） |
| 2610.30038 (Grobli) | 3 涡/多涡涡核扩散标度律 $\sigma\propto t$ → DSM 涡核 split/merge 策略的定量依据；vortex burst 作为数值基准算例 | 中 | 高（点涡非唯一性；DSM 核演化） |
| 2610.30077 (SAV-CHQ) | **模块化可直接复用**：SAV 双重阱重构 + BDF2 + 相依赖迁移率二阶外插；一步能量-耗散恒等式做验证单元测试；Fourier–Galerkin 检查 | 低 | **高**（无条件稳定 + 线性 + 精确守恒 + 陡界面二阶；比 Newton 快 1.7–2.0×） |
| 2610.29938 (neural operator) | 复现"理论引导的三段式输出架构" $\bar\omega_0 + O(\varepsilon) + O(\varepsilon^2)$；网络对初值可微 → 初值搜索 + 求解器校验 | 中 | 高（**PDE 理论引导 ML 的通用范式**；可微 + 反问题） |
| 2610.29850 (DEScover) | 4-agent 流水线（提出/评审/实现/评估）复刻；**留 hold-out 算例**避免自评偏差；涡轴法向网格宽度作为骨架 | 中 | 中高（湍流模型自动发现；25 分钟/候选的效率） |
| 2610.29818 (QDG) | 非协调 P1 单元（$O(h^4)$）vs 间断 P1（$O(h^2)$）；用离散频率/色散关系做长时稳定性判据 | 中 | 中高（**长时间积分相位误差**判据；二维对流-扩散） |
| 2610.29975 (Couette damping) | 复现 dyadic 层分解 + 归纳 Newton 框架；作为**无粘衰减基准**校验边界处理 | 高（理论） | 中（Taylor–Couette 基础态鲁棒性） |
| 2610.30096 (inhomogeneous Euler) | 拟共形映射 + 尺度不变 Hölder Schauder 估计处理变系数椭圆算子（重力分层、多层大气） | 高（理论） | 中 |
| 2610.29859 (NSFK shock) | 作为毛细激波数值基准解（毛细界面、沸腾/蒸发前沿） | 低（理论） | 中 |
| 2610.30092 (active fluids) | 活性应力 + 各向同性活性压力双项耦合；对流-密度反馈的波长选择律 | 中 | 中（活性介质混沌控制） |
| 2610.29930 (Titan) | 有/无地形**配对模拟**方法论；$s=1$ 转性 vs $s=4$ 辐散（重力波）分支判别 | 中 | 中（行星 GCM 网格策略；地形谱分辨率权衡） |

## 值得持续跟踪的开放点

1. **低秩核压缩在涡合并后期的退化** — DiffVortex 的 QTT rank $r$ 在强剪切层 merger 阶段的行为未报告，直接决定工程可行性。
2. **Swarmlet 粒子核分裂（core-splitting）策略** — 摘要未给细节，但长时尾流模拟的保真度几乎完全取决于此。
3. **DEScover 的 hold-out 泛化性** — agent 自行跑 CFD 并选优，若训练/测试算例重叠则结论有 reward hacking 风险。
4. **Grobli 结果向多涡推广** — 三涡系统的强结论是否稳健到四涡以上尚不显然。
5. **SAV-CHQ 能源恒等式在非线性 Newton 对照下的精度差** — 作者称一致，但未给具体误差界。

## 同步状态

`~/knowledge-vault/.scripts/git-sync.sh` — 见报告末尾执行记录。