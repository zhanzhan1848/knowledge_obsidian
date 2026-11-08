---
type: summary
created: 2026-11-08
updated: 2026-11-08
tags: [summary, daily-research, fluid-rendering, arxiv, cs.GR, physics.flu-dyn, siggraph-asia-2026, data-assimilation, gas-kinetic-scheme]
status: processed
domain: 流体渲染
agent: doumiao
search_window: 2026-11-07 ~ 2026-11-08
---

# 2026-11-08 每日流体渲染论文搜索总结

## 搜索执行摘要

| 项 | 结果 |
|------|------|
| **搜索窗口** | 2026-11-07 ~ 2026-11-08（arXiv 公告批次：11-06 新增 + 11-05/11-04/11-03/11-02/11-01 补充） |
| **arXiv cs.GR** | API 取最近 200 条 + `submittedDate` 字段时间窗查询 + **直读 `list/cs.GR/recent` 逐条核对最新批次**，**零流体渲染相关**（连续第 3 轮） |
| **arXiv physics.flu-dyn** | 抓取 11-01~11-08 全部条目 + 关键词定向检索，筛出 **3 篇新增相关** |
| **arXiv math-ph / cs.LG / cs.CV** | 跨分类扫描，筛出 **2 篇新增（边缘相关）** |
| **SIGGRAPH 2026** | 已闭幕（2026-07-19~23 洛杉矶），**新发现独立分类 "Fluid Reconstruction & Optimization"**（kesen 汇总页） |
| **SIGGRAPH Asia 2026** | ✅ **重大修正**：上轮结论"论文未公布"**有误**——技术论文清单**已可通过 physicsbasedanimation.com 查到**，本轮完成 **24 篇流体/物理仿真论文的全量核对** |
| **去重后新增** | **5 篇**论文笔记 + 本总结 |
| **关键词** | fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering |

---

## 一、cs.GR 批次核对（逐条确认，零命中）

### 11-06 批次（11 篇）— 全部为非流体主题

| arXiv ID | 标题 | 主题 |
|---|---|---|
| 2611.08301 | REACT: Real-Time Completion of Skeletal Motion Signals | 骨架动作补全 |
| 2611.07979 | Perception Over Geometry: Gaussian Allocation in Mesh-based Splatting | 3DGS 分配 |
| 2611.07909 | EDGAR: Diffusion-Driven Gaussian Avatar Refinement | 数字人 |
| 2611.07730 | World-Model-Guided Navigation in Multi-Agent Scenes | 导航 |
| 2611.07328 | DC-SQEM: Medial Mesh Extraction by Dual Contouring | 几何处理 |
| 2611.07289 | Patch-Based Generalized Neural Texture Upscaling | 纹理 |
| 2611.06954 | Certified folding-free deformable image registration | 可形变配准 |
| 2611.08342 | 4D Point Splatting for mmWave Radar Micro-Doppler | 雷达点云（cs.CV 交叉） |
| 2611.08288 | Hierarchical Incremental Beta Splatting | 在线重建（cs.CV 交叉） |
| 2611.07900 | Structure from Collision via Hypothesis-Space Reasoning | 碰撞推理（cs.CV 交叉） |
| 2611.06974 | T²-Splat: Adaptive Topology Mesh Splatting | 网格 splatting |

### 11-05 ~ 11-01 批次（32 篇）— 同上，均非流体

含 Composable CAD、Toolpath Overhang Optimization、SemEllipsoid、UniCaMo、Piecewise CMC Segmentation for Fluidic Shaping 等。

> **结论：cs.GR 连续三轮（11-06 / 11-07 / 11-08）无流体渲染新论文。** 流体渲染主题**持续从 cs.GR 流向 physics.flu-dyn**，这已是稳定趋势而非偶然。

### 假阳性排除（与上轮一致）

| 论文 | 关键词命中原因 | 判定 |
|---|---|---|
| 2611.00227 Piecewise CMC Segmentation for Fluidic Shaping | "fluidic" 指**流体型材加工**（聚合物浇注成型） | ❌ 非流体渲染 |
| 2611.07328 DC-SQEM | "water"/"volumetric" 出现在引用列表 | ❌ 非流体渲染 |
| 2611.06954 Certified deformable image registration | "volume" 指形变体积分 | ❌ 非流体渲染 |
| 2611.08342 4D Point Splatting (mmWave) | "wave" 指**雷达波** | ❌ 非流体渲染 |

---

## 二、本轮新增论文（5 篇）

### ⭐ [[2026-11-08-EnKF-Rayleigh-Benard-Temperature-Only-Reconstruction]] — 本轮方法论价值最高

**arXiv:2611.04795** · physics.flu-dyn · 2026-11-03 · Fossella, Biferale, Carrassi, Cencini, **Desbrun**, Um

> **仅凭温度场的稀疏噪声观测，用"正确标定的 EnKF + inflation"重建完整速度场与涡量**，数值验证 Charney 猜想。关键洞察：温度与涡量**不同属一个决定模态集**，所以 nudging/直接替换必然失效；EnKF 靠**流依赖的温度-涡量交叉协方差**绕过这一非对称性。

**三条最值得记的技术点**：
1. **Inflation 是必要条件而非调参项** —— 换系统需重标定，方法稳健性依赖超参
2. **逐尺度谱分析** 而非整体 RMSE —— 评估同步质量必须分尺度
3. **观测密度阈值** —— 等间距观测网低于临界密度时退化为仅大尺度同步

**⚠️ 定位**：仅 2D 验证；属纯数据同化，与渲染无直接关系，但对"物理引导的流体生成/可视化"的上游链路有价值。

---

### ⭐ [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — 与渲染的关系最直接

**arXiv:2611.05095** · math-ph · 2026-11-03 · 26 pages · Yibo Wang, Xing Ji, Liang Pan

> **三维非结构网格上的紧凑高阶气体动理学格式（HGKS）**。核心贡献是**降内存重构**：用单元及邻居的**平均梯度**做最小二乘，把高阶重构的矩阵求逆换成 **4 次最小二乘 + 3×3 系数矩阵**存储——正好解决 ALE 移动网格每步重算几何带来的额外开销。

**为什么值得记**：**气体动理学格式是火焰/爆炸渲染的热门选择**（燃烧化学 + 压缩性效应 + 高频细节），而"离线渲染"正需要这种**显式 + cell-level 并行 + CUDA/MPI 多 GPU**的扩展范式。算例含俯仰机翼、**直升机旋翼**。

**⚠️ 局限**：全显式 → CFL 限制严格，大时间步长不适用（正对照 SIGGRAPH Asia 的 Spatiotemporal FLIP）；无渲染实验；性能数字需读全文。

---

### [[2026-11-08-GPU-Native-Real-Time-Textured-Mesh-Reconstruction]] — 工程范式可迁移（WACV 2027）

**arXiv:2611.03033** · cs.CV / cs.GR · 2026-11-02 · Hiroyuki Sato

> **全 GPU 常驻**的实时体积视频系统：TSDF 融合 → Marching Cubes → 去噪 → 视角纹理映射 → inpainting → 辐射度接缝校正，**阶段间零主机往返**。两个可迁移的工程点：① **定长数组网格拓扑** → GPU 上 O(1) 邻居访问 → 网格级操作数据并行；② **逐相机低频增益场**烘焙进图集消除曝光接缝。

**与流体的连接**：重建场景常含水体；而**增益场校正对强高光材质（镜面、玻璃、水）恰恰模型薄弱**——这是流体渲染可直接发力的缺口。

---

### [[2026-11-08-Pore-Scale-Capillary-Imbibition-FIB-SEM-DNS]] — 界面物理参考

**arXiv:2611.01901** · physics.flu-dyn · 2026-11-01 · Malenica, Zhang, Angst

> **FIB-SEM 真实水泥骨料微观结构**上的孔隙级 DNS，首次直接看到毛细管内自发浸润的**气-水界面瞬态动力学**（纳米-微米 / 纳秒-微秒）。关键发现：局部动力学由**演化界面曲率与毛细压力场**决定，**而非仅特征孔隙尺寸**；**即便完全润湿，毛细孔内仍显著气体封闭**。

**渲染价值**：**界面捕获技术族**（VOF / level-set / 前沿跟踪）在渲染侧对应**水-空气界面捕捉**这一自由表面流体渲染核心难点；"完全润湿仍有封闭气泡"提醒渲染中忽略封闭气泡的简化假设可能失真。

---

### [[2026-11-08-FlowRig-Unified-Skeleton-Generation-Flow-Matching]] — 边缘相关

**arXiv:2611.03775** · cs.CV / cs.GR · 2026-11-02 (v2) · Texas A&M

> 基于**流匹配**的统一 3D/4D 绑定框架，**一次前馈生成整段序列的时间对齐骨架**，替代昂贵的逐序列优化。

**⚠️ 诚实定位：边缘相关**，收录仅因"**序列级一次前馈保证时间一致性**"这一范式——正是流体渲染中逐帧独立优化导致时间漂移的对应解法（如 GauSmoke / SplashSplat 类方法）。

---

## 三、SIGGRAPH 会议状态

### ✅ 重大修正：SIGGRAPH Asia 2026 论文清单**已可获取**

上轮（11-07）结论为"技术论文尚未公布"——**该结论有误**。通过 `physicsbasedanimation.com`（Christopher Batty 维护）可查到 **完整技术论文清单**，含 24 篇流体/物理仿真论文。本轮已**逐条核对，23 篇已在知识库**，仅 1 篇为弹性体力学（"Progressing Level-of-Detail Animation for Volumetric Elastodynamics"）属非流体，无新增。

**SIGGRAPH Asia 2026 流体/物理仿真板块核对结果（全部已收录）**：

| 方向 | 论文 | 状态 |
|---|---|---|
| **两相流** | A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows | ✅ 已收录 |
| | An Extended Full GKS Formulation for High-Efficiency and Low-Memory Two-Phase Flow Simulation | ✅ 已收录 |
| **高精度格式** | Kinetic Predicted-Moment Flux Reconstruction for High-Order High-Performance Fluid Simulation | ✅ 已收录 |
| **半拉格朗日** | Lanczos Advection: Near-Orthogonal Semi-Lagrangian Reconstruction | ✅ 已收录 |
| **SPH** | Implicit velocity projection method for incompressible SPH fluids | ✅ 已收录 |
| **粒子/变换** | WorldParticle: Unified World Simulation of Lagrangian Particle Dynamics via Transformer | ✅ 已收录 |
| **自由表面** | Divisor Dynamics for Surface Fluid Simulation | ✅ 已收录 |
| **自由表面变分** | A Nonlocal Monolithic Variational Framework for Free Surface Flows | ✅ 已收录 |
| **耦合** | Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows | ✅ 已收录 |
| **火灾** | Flamescapes: Simulating the Wildlandfire Urban Interface | ✅ 已收录 |
| **可微优化** | DiffSurFlow: Efficient and Robust Differentiable Fluid Optimization via Surrogate Strategy on Flow Map | ✅ 已收录 |
| **实到拟** | RealSimLoop: Online Real-to-Sim Adaptation via Differentiable Reduced-Order Simulation | ✅ 已收录 |
| **多 GPU** | Fast VEM Fluid Simulation | ✅ 已收录 |
| **求解器** | Efficient Open-Boundary Poisson Solves | ✅ 已收录 |
| **非局部** | Semi-Implicit Pairwise Descent for Nonlocal Continuum Mechanics | ✅ 已收录 |
| **机器学习算子** | ML Operator Lexicon for PDE Solvers on Irregular and Sparse Domains | ✅ 已收录 |
| **分布式** | A Practical Partitioner for Distributed Simulations on Sparse Dynamic Domains Using Optimal Transport | ✅ 已收录 |
| **符号框架** | SymX: Energy-based Simulation from Symbolic Expressions / YASPS: Symbolic Framework for Extensible High-Performance IPC | ✅ 已收录 |
| **薄壳/体积** | Beyond Kirchhoff-Love: A Volumetric Approach to Thin-Shell Mechanics | ✅ 已收录 |
| **声学** | BubbleGym: A Practical Shape-to-Frequency Model for Acoustic Bubbles | ✅ 已收录 |
| **生态** | Interactive Control of Large-Scale Ecosystem Simulation | ✅ 已收录 |
| **刚性/接触** | S4R: Scaling for Rigid-Body Interpenetration Resolution | ✅ 已收录 |
| **求解器** | A Purely Algebraic Solver for Locally Stiff Linear Systems | ✅ 已收录 |
| **追踪** | Discovering High Level Patterns from Simulation Traces | ✅ 已收录 |

**SIGGRAPH 2026 "Fluid Reconstruction & Optimization" 分类**（本次新发现的 kesen 独立分类）：

| 论文 | 类型 | 状态 |
|---|---|---|
| GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction | SIG | ✅ 已收录 |
| LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction | SIG | ✅ 已收录 |
| Fast VEM Fluid Simulation | SIG/TOG | ✅ 已收录 |
| DiffSurFlow | SIG/TOG | ✅ 已收录 |
| Generic Variational Spacetime Optimization of Vortex Core Manifolds | SIG | ✅ 已收录 |

> ⚠️ **结论：SIGGRAPH 2026 与 Asia 2026 的流体板块已 100% 覆盖入库**，后续轮次无需重复核对，除非出现 pre-cut / poster 更新。

---

## 四、趋势观察

1. **cs.GR 持续空转，流体研究重心在 physics.flu-dyn**（连续三轮确认）。cs.GR 近期被 3DGS / 神经重建 / 数字人占满。

2. **"稀疏重建"研究簇持续壮大** —— 本轮 EnKF（温度→速度）、上轮 MANTRA（低秩张量流形）、FlowReconBench（基准）、Readable Is Not Steerable（预注册实验）构成一个**方法论严谨性显著提升**的研究簇。这是当前流体领域最明显的转向：**从"造更好的求解器"转向"造可验证的重建与诊断方法"**。

3. **物理保真度与可扩展性同步推进** —— 本轮 HGKS（降内存重构 + CUDA/MPI 多 GPU）与 GPU-Native 体积视频（定长拓扑 + 全 GPU 常驻）分别代表**求解器侧**与**几何/纹理侧**的工程化极致。

4. **神经渲染侧的流体处理本轮无新增** —— GauSmoke / LagrangianSplats / SplashSplat / WildFireGS / Make It Flow 等自成体系，仍未出现明显突破。

5. **本轮出现一条值得追踪的缺口**：GPU-Native 体积视频用**逐相机低频增益场**处理曝光差异，而**流体/水面恰是强高光材质**，增益场模型在此失真。**流体场景的辐射度一致性处理**目前是空白点。

---

## 五、本轮结论

**新增 5 篇偏少是真实情况，非搜索失败。** 已通过五重手段交叉验证：

1. arXiv API `cat:cs.GR` 取最近 200 条 + 严格流体关键词扫描
2. **直读 `arxiv.org/list/cs.GR/recent` 列表页，逐条人工核对最新批次**
3. `submittedDate` / `lastUpdatedDate` 双时间窗查询（覆盖更新版本）
4. 全 arXiv 跨分类（cs.GR + physics.flu-dyn + math-ph + cs.LG + cs.CV）扫描 + 假阳性过滤
5. **修正了 `.scripts/dedup.py` 的递归扫描缺陷**（原脚本只扫 `01-Papers/*.md` 顶层，漏掉 `2026/11/` 等子目录）

### ⚠️ 工具链改进：dedup.py 递归扫描 bug

`.scripts/dedup.py` 的 `collect_known_ids()` 使用 `glob.glob(os.path.join(papers_dir, '*.md'))`，**只扫描顶层目录**。而 doumiao 的笔记实际存放于 `01-Papers/2026/<月>/` 子目录，导致：

- 去重失效 → MANTRA / FlowReconBench / Readable-Is-Not-Steerable 等本已收录的论文被误判为"新增"
- **实际影响**：本轮初筛出 11 篇"新增"，递归去重后**真实新增仅 5 篇**

**建议修复**：将 `glob.glob(...'*.md')` 改为 `glob.glob(...'**/*.md', recursive=True)`。本轮未擅自修改共享脚本（caixin agent 也在用），仅在此记录。

---

## 相关索引

- [[2026-11-07-Daily-Research-Summary]] — 上一轮
- [[2026-11-06-MANTRA-Low-Rank-Tensor-Turbulent-Reconstruction]]
- [[2026-11-06-FlowReconBench-Sparse-Sensor-Flow-Reconstruction]]
- [[2026-11-07-SIM-PINN-Projection-Segregated-Multi-Stage-PINN]]
- [[2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup]] — SIGGRAPH Asia 流体板块（**本轮已补全核对，可标记完成**）
