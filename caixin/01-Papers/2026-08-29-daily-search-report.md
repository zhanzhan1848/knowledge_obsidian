# 每日流体力学论文搜索报告

**日期**: 2026-08-29 (Saturday)
**UTC 时间**: 14:00
**数据来源**: arXiv (cs.FL, physics.flu-dyn)
**备注**: arXiv 周六不更新，本文最新数据为 2026-08-27

---

## 搜索概况

- **搜索范围**: arXiv cs.FL + physics.flu-dyn（按提交日期降序）
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **找到论文**: 7 篇高度相关 physics.flu-dyn 论文

---

## 论文列表

### 1. 量子启发 CFD 可压缩湍流
**2608.26995** — Quantum-Inspired CFD for Transient Turbulent Compressible Flows
- Tensor Train 格式首次实现可压缩 N-S 方程
- TGV 算例与经典 CFD 高度一致
- 多算例并行能力
- [→ 笔记](2026-08-29-Quantum-Inspired-CFD-Compressible-TGV.md)

### 2. 扩散模型学习非互易湍流拉格朗日统计
**2608.27378** — How well can Diffusion Models learn Lagrangian-Tracer Statistics in Non-reciprocal Turbulence?
- 非互易 Cahn-Hilliard-Navier-Stokes 模型
- 速度 PDF 双峰分布（新现象）
- 首次在非互易流体力学中表征 Lagrangian 多尺度
- [→ 笔记](2026-08-29-Diffusion-Models-Lagrangian-Non-Reciprocal-Turbulence.md)

### 3. Voigt 正则化湍流的瓶颈与多尺度
**2608.27355** — Dynamical Slowdown, Bottlenecks, and Multiscaling in Voigt-Regularised Turbulence
- Shell 模型 + NSV DNS
- 三个不同谱区：惯性区、平衡区、高 $k$ 热化区
- 瓶颈新解释：非纯耗散效应
- [→ 笔记](2026-08-29-Voigt-Regularised-Turbulence-Bottleneck.md)

### 4. 密集冠层湍流能量传输与尺度组织
**2608.27272** — Energy Transfer and Scale Organisation in Dense Canopy Turbulence
- 冠层流动的尺度分解能量预算
- 界面剪切层是能量生产主要位置
- 跨界面交换主要与小尺度相关
- [→ 笔记](2026-08-29-Canopy-Turbulence-Energy-Transfer.md)

### 5. SnapPINN: 稀疏噪声速度场的压力重建
**2608.26711** — SnapPINN: Pressure and Energy Dissipation Reconstruction from Sparse Noisy Velocity Snapshot
- 两阶段 PINN（解耦 velocity/pressure）
- 仅 0.07% 网格点 + 显著噪声下仍有效
- 体积速度误差 < 0.5%
- [→ 笔记](2026-08-29-SnapPINN-Pressure-Reconstruction.md)

### 6. 弹性湍流的终极状态
**2608.26479** — The Ultimate State of Elastic Turbulence
- Oldroyd-B 和 FENE-P 模型
- 高 Deborah 数下达到 $De$-无关的终极状态
- [→ 笔记](2026-08-29-Elastic-Turbulence-Ultimate-State.md)

### 7. 旋转混合设备的高阶矩阵自由模拟
**2608.27423** — High-Order Stabilized Matrix-Free Simulation of Rotating Mixing Devices
- Mortar 元素法 + SUPG/PSPPG 稳定化
- 理想强 scaling
- Re=1~2000 功率数与实验一致
- [→ 笔记](2026-08-29-Rotating-Mixing-Mortar-Element.md)

---

## 主题分布

| 主题 | 论文数 |
|------|--------|
| 湍流（DNS/建模） | 4 |
| CFD 方法 | 2 |
| 弹性/黏弹性流 | 1 |
| 环境流体力学 | 1 |
| AI/CFD 交叉 | 1 |

---

## 值得关注的趋势

1. **量子/张量计算 CFD**：可压缩流突破（2608.26995），Tensor Train 格式实用化
2. **AI + 湍流**：扩散模型生成 Lagrangian 轨迹（2608.27378），PINN 压力重建（2608.26711）
3. **非互易流体力学**：新兴研究方向，与活性物质、非平衡系统交叉
4. **弹性湍流**：终极态的发现为黏弹性流体研究提供新基准

---

*自动生成于 2026-08-29 14:00 UTC*
