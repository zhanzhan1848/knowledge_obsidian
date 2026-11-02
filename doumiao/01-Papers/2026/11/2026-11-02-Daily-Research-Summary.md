---
type: summary
created: 2026-11-02
updated: 2026-11-02
tags: [daily-summary, fluid-rendering, arxiv-csGR, siggraph-asia-2026]
status: processed
domain: 流体渲染
agent: doumiao
---

# 2026-11-02 流体渲染每日研究摘要

## 检索概览

| 项目 | 结果 |
|------|------|
| **检索时间** | 2026-11-02 15:02 UTC |
| **检索范围** | arXiv cs.GR（最近 24h + 扩展窗口）、SIGGRAPH Asia 2026 论文集 |
| **关键词** | fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展（fluid/water/smoke/fire/ocean/particle/volumetric/liquid/rain/splash/foam/spray/vortex/Navier-Stokes/SPH/turbulence） |
| **检索源** | arXiv API（cs.GR）、arXiv RSS、physicsbasedanimation.com（Batty 维护的 SIGGRAPH Asia 论文列表）、SIGGRAPH Asia 官网、Brave Web Search |
| **新增独立笔记** | 1 篇（Unified Multi-Scale Two-Phase）+ 1 篇 SIGGRAPH Asia 全景综述 |
| **复核合并** | 7 篇（既有笔记已覆盖，本次仅补充确认元数据与链接） |

### ⚠️ 重要说明：24 小时窗口内无新增论文

**最近 24 小时（2026-10-31 ~ 11-02）arXiv cs.GR 无流体渲染相关新论文。** 本次 cs.GR 在该窗口内的新增条目为 0 条（arXiv 周末不发新稿，cs.GR 最近一次更新为 2026-10-30）。

因此本次检索改为**扩展窗口 + 会议论文补充**，覆盖：
1. **2026-10-16 ~ 10-19** 的 arXiv cs.GR 流体相关论文（3 篇）
2. **SIGGRAPH Asia 2026 完整流体论文列表**（16+ 篇，2026-12-01~04 吉隆坡，这是本轮最大信息增量）

---

## 一、SIGGRAPH Asia 2026 流体专题（本轮核心）

SIGGRAPH Asia 2026 是**流体模拟方法学的大年**。完整技术论文列表中 16 篇直接涉及流体/两相流/自由表面/涡量/粒子/PDE 求解器。完整综述见 → [[2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup]]

### 🏆 重点论文三篇

#### 1. A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows ⭐ 本期唯一新增独立笔记
**Wretborn, Stomakhin, Batty** — TOG (SIGGRAPH Asia 2026)

- **一句话**：共享欧拉网格 + 拉格朗日材质点相分数，把**分层流**（网格可解析）与**弥散流**（亚网格）统一进一个求解器。
- **亮点**：体积相间耦合力与压力**联合投影**（强耦合格式）→ 大时间步 + 高动态下稳定；单模拟覆盖瀑布 / 水轰炸机 / 水下气泡 / 间歇泉 / 拍岸海浪。
- **意义**：消除了「小气泡要上亿粒子、大瀑布要巨型网格」的尺度两难。
- 详情 → [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]]

#### 2. Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows
**Wang et al.** — TOG (SIGGRAPH Asia 2026), arXiv:2608.25203, DOI 10.1145/3842540

- **一句话**：用 Zakharov 典范形式的**非线性 + 色散** 2D 波动模型，与 3D NS 求解器做**规范一致双向耦合**。
- **性能**：平均波高误差比 SWE/BEM/Airy 低 **1.7–5×**；比 BEM 快 **>1000×**；整体比纯 GPU NB-FLIP 快 **>4×**。
- **意义**：直击「2D 廉价表面模型 + 3D 局部求解器」耦合中的**接缝反射伪影**这一经典痛点。
- 详情 → [[2026-10-25-Divisor-Dynamics-Surface-Fluid]]（已存在）

#### 3. Divisor Dynamics for Surface Fluid Simulation
**Veerkhare, Yin, Chern** — TOG (SIGGRAPH Asia 2026)

- **一句话**：把点涡的环流量看作 Riemann 曲面上的**因子（divisor）**，用因子类作为守恒不变量，让 vortex particle-on-mesh 方法**支持任意拓扑曲面**。
- **理论价值**：首次在图形学中建立**流体力学 ↔ 代数几何**的显式桥梁。
- **落地场景偏窄**（表面流动特效），但方法论启发性极强。
- 详情 → [[2026-10-25-Divisor-Dynamics-Surface-Fluid]]（已存在）

### 其余值得跟踪（标题 + 一句话）

| 论文 | 一句话 |
|------|--------|
| An Extended Full GKS Formulation... | 完整 GKS 双流体框架，高效率低内存 |
| Kinetic Predicted-Moment Flux Reconstruction | 动理学 + 预测矩通量，高阶高性能 |
| Primal SPH Solver for Strongly Coupled Multiphase | 原始型 SPH，高密度比强耦合多相 |
| Implicit velocity projection method for incompressible SPH | 隐式速度投影 → 不可压 SPH 更稳定 |
| Lanczos Advection | 近正交半拉格朗日平流重构，改进 FLIP 平流误差 |
| Flamescapes: Wildlandfire Urban Interface | 野火-城市界面模拟 |
| WorldParticle | Transformer 统一世界尺度粒子动力学 |
| DiffSurFlow | flow map surrogate 策略的可微流体优化 |
| RealSimLoop | 可微降阶模拟 + 视觉反馈在线 real-to-sim |
| A Practical Partitioner... Optimal Transport | 最优传输做稀疏动态域分布式分区 |
| BubbleGym | 气泡形状→声学频率模型 |
| Efficient Open-Boundary Poisson Solves | 开放边界 Poisson（工程组件） |
| Semi-Implicit Pairwise Descent | 非局部连续介质半隐式成对下降 |

---

## 二、arXiv cs.GR 近期流体渲染论文（2026-10-16 ~ 10-19）

### 4. SplashSplat: Reconstructing Splashing Liquids from Real-World Multi-View Videos
**arXiv:2609.20818** (2026-09-17, 补录)

- **贡献**：首个**真实世界溅射液体**多视角数据集（20 场景 / 7×4K@60fps / 人工精修 mask），并提出 SplashSplat。
- **核心原则**：**只在观测能约束的地方施加物理结构**（impose physical structure only where the observations can constrain it）。几何来自多视角 SDF 融合，帧间 level-set transport 导出粗速度场。
- **价值**：填补真实多视角溅射液体数据的空白，对实拍转 VFX 管线直接可用。
- 详情 → [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]]（已存在）

### 5. DELUGE: Decomposed Entropy-coded Live Unstructured Geometry Exchange for Real-time Particle Streaming
**arXiv:2609.19750** (2026-09-17) — IEEE TVCG / ISMAR 2026

- **贡献**：大规模粒子模拟（流体/烟雾/颗粒）的**亚帧延迟**实时流式传输。
- **洞察**：G-PCC / Draco 假设静态几何，动态粒子下编码延迟超帧周期；DELUGE 利用**时间连贯性 + 速度可预测性**编码残差。
- **指标**：解码 ≈ **20×** G-PCC，编码 ≈ **6×** Draco；Web + Apple Vision Pro 双端实现；通过双人协作任务研究验证手部追踪流体交互。
- 详情 → [[2026-10-19-DELUGE-Real-time-Particle-Streaming-VR]]（已存在）

### 6. ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering
**arXiv:2607.22956** (2026-07-24)

- **贡献**：用 3DGS 作为数亿级科学粒子数据的**可视化感知**压缩表示，直接以渲染图像质量为优化目标。
- **指标**：HACC 2.81 亿粒子，8 分块模型 @65× 压缩 → **30.03 dB PSNR**，比 SZ3 高 **5–8 dB**；含 VizMapper 推理期参数适配 + KD-tree 分块训练。
- 详情 → [[2026-08-02-ParticleGS-3DGS-Particle-Data-Compression]]（已存在）

### 7. Colour-Field Based Particle Categorization for Residual Stress Detection and Reduction in Solid SPH Simulations
**arXiv:2610.24210** (2026-10-16) — VISIGRAPP 2023

- 固体 SPH 中的**颜色场（colour field）**方法用于检测与消除残余应力、避免过早失效。属于 SPH 粒子可视化/诊断工具类，与流体渲染相关性次要，仅作存档。

---

## 三、趋势观察

### 1. 「混合欧拉-拉格朗日」已成主流范式
两相流（Unified Multi-Scale）、相分数、粒子流图（flow maps）系列全部收敛到同一范式：**欧拉承载速度/压力 + 拉格朗日承载被界面量**。

### 2. 结构保持 / Hamiltonian 思想回潮
Zakharov 波动模型、Hamiltonian 双向耦合与 2023–2024 的 *Fluid Simulation on Particle Flow Maps* 系列一脉相承。共同点是：**用变分/Hamilton 结构自动获得守恒律**，避免人工设计耗散项。

### 3. 从「完整物理」转向「选择性物理」
SplashSplat 的 "impose physical structure only where observations can constrain it" 是本周最值得借鉴的**方法论**：在数据驱动与物理驱动之间做显式分工，而非二选一。

### 4. 大规模模拟的分布式与流式是共识需求
SIGGRAPH Asia 的 Optimal Transport 分区器 + ISMAR 的 DELUGE 流式传输，共同指向"单一巨型网格/粒子集"范式的终结。

### 5. 3DGS 正在吞并「模拟结果的可视化表示」这一层
ParticleGS（科学粒子）、SplashSplat（溅射）、WildFireGS（野火）、FieryGS（火焰）、Make It Flow（水）——**用 GS 作为流体/粒子效果的可微代理**已成为 2026 年的明确趋势，把"离线模拟"连接到"实时可交互渲染"。

---

## 四、待办 / 后续跟踪

- [ ] SIGGRAPH Asia 2026 会议（2026-12-01~04）后补充完整论文 PDF 与补充材料 → 更新各篇笔记的公式细节
- [ ] 追踪 Primal SPH Solver / Extended Full GKS 的 arXiv 版是否上线（目前 TOG-only）
- [ ] 关注 FluidFormer（2508.01537）后续的粒子流体 Transformer 改进工作
- [ ] WorldParticle 的代码与 benchmark 是否发布
- [ ] SplahSplat 数据集的公开地址与许可
- [ ] 关注 "Divisor Dynamics" 是否延伸出 3D 涡量版本

---

## 关联笔记

**本期新增**
- [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — ⭐ 本期唯一新增独立笔记
- [[2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup]] — SA2026 流体论文全景（16 篇）

**复核合并（本次补充确认元数据）**
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]]
- [[2608.25203-hamiltonian-wave-coupling]]
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]]
- [[2026-10-19-DELUGE-Real-time-Particle-Streaming-VR]]
- [[2026-08-02-ParticleGS-3DGS-Particle-Data-Compression]]
- [[2026-10-13-Make-It-Flow-Water-3DGS]]
- [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]]

**相关既有笔记**
- [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]]
- [[2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]]
- [[2026-10-26-Power-Partitioner-Optimal-Transport-Distributed-Sim]]
- [[2026-10-26-RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder]]
- [[2026-10-26-REST3D-Single-Image-Physically-Stable-Scene]]
- [[2026-10-25-ML-Operator-Lexicon-PDE-Solvers]]
- [[2026-06-16_WorldParticle-Lagrangian-Particle-Dynamics-Transformer]]
- [[2026-04-16/FluidWorld-2603.21315]]
- [[2026-09-04/PrimalSPH_CGF2026]]
- [[2025-03-29_SIGGRAPH-Asia-2024-Fluid-Papers]]
- [[2025-03-29_Journey-into-SPH-Simulation]]
- [[2025-03-29_Fluid-Implicit-Particle-Simulation-CPU-GPU]]
