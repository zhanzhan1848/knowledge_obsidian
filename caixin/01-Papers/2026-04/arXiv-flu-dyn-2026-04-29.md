# arXiv 流体力学论文日报
**日期**: 2026-04-29
**来源**: arXiv physics.flu-dyn, physics.comp-ph (cross-list)
**搜索关键词**: CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence

---

## 📋 论文清单（按相关性排序）

---

### 1. LES 亚网格应力闭包 — 稀疏回归方法
**标题**: Discovery of Sparse Invariant Subgrid-Scale Closures via Dissipation-Controlled Training for Large Eddy Simulation on Anisotropic Grids
**arXiv**: [2604.25824](https://arxiv.org/abs/2604.25824)
**作者**: Samantha Friess
**日期**: 2026-04-28 | **分类**: physics.flu-dyn

#### 核心摘要
提出了一个稀疏促进的 SGS（亚网格尺度）应力闭包框架，通过稀疏回归识别显式多项式模型形式。

#### 创新点
- **稀疏回归**构造候选模型：最小张量基 × 不变量标量的截断多项式展开
- 强制基本不变性质（Galilean 不变性等），同时正则化最高阶项
- 支持任意滤波器**各向异性**，适配非均匀网格
- 训练时显式约束 SGS 能量耗散 → 提升功能性能和数值稳定性
- 稀疏闭包精度媲美不变性保持神经网络，但计算代价大幅降低

#### 数值方法
- 稀疏回归 + 神经网络
- a priori / a posteriori 验证
- 各向异性滤波

#### 关键词
`LES` `turbulence modeling` `sparse regression` `subgrid-scale` `SGS stress`

#### 关联知识
[[turbulence]] [[LES]] [[closure modeling]]

---

### 2. 两相可压缩流 — 间断有限元（DG）方法
**标题**: A bound-preserving oscillation-eliminating discontinuous Galerkin scheme for compressible two-phase flow
**arXiv**: [2604.25672](https://arxiv.org/abs/2604.25672)
**作者**: JiaJun Zou
**日期**: 2026-04-28 | **分类**: math.NA (cross-list physics.flu-dyn)

#### 核心摘要
提出了高阶 **BP-OEDG**（bound-preserving oscillation-eliminating discontinuous Galerkin）格式，用于 Kapila 五方程模型 + Tammann EOS 的气-气/气-液两相流。

#### 创新点
- **算子分裂策略**：将系统解耦为输运模型 + 刚性 κ 源项
  - 输运部分：quasi-conservative DG 格式
  - 刚性 κ 源项：自适应隐式策略（backward Euler + SDIRK2 混合）
  - **无条件 BP（bound-preserving）** → 消除 CFL 限制
- 速度散度重建（LDG 风格）整合进隐式求解器
- **OE 限制器**：无需特征分解即可抑制虚假振荡
- **BP 限制器**：保证偏密度、压力、体积分数的界保持性
- 严格满足 **Abgrall 条件**

#### 数值方法
- 间断有限元（DG）
- 算子分裂（operator-splitting）
- 自适应隐式（SDIRK2）
- 界保持（bound-preserving）限制器

#### 关键词
`discontinuous Galerkin` `two-phase flow` `compressible` `bound-preserving` `operator splitting`

#### 关联知识
[[numerical methods]] [[DG]] [[two-phase flow]] [[compressible flow]]

---

### 3. 聚类降阶模型（CNMc）— 流场控制与参数泛化
**标题**: Control-oriented cluster-based reduced-order modelling
**arXiv**: [2604.25474](https://arxiv.org/abs/2604.25474)
**作者**: Paolo Olivucci
**日期**: 2026-04-28 | **分类**: physics.flu-dyn

#### 核心摘要
提出了 **CNMc**（Control-oriented Cluster-based Network Model）框架，在未见过的控制参数条件下合成降阶动力学，无需在这些条件下进行模拟数据。

#### 创新点
- 超越传统 CNM（Cluster Network Model）只能处理观测区域的局限
- 对 CNM 的转移概率和转移时间拟合**监督回归模型**（控制参数函数）
- **Procrustes 变换**：将各工况状态空间映射到共同坐标系，实现跨工况轨迹对齐
- 可共享聚类划分学习
- 验证benchmark：Lorenz-63 系统 + 受控湍流边界层
- 适合**实时流场控制**和参数化设计加速

#### 关键词
`reduced-order modeling` `ROM` `clustering` `flow control` `turbulence`

#### 关联知识
[[ROM]] [[reduced-order modeling]] [[flow control]]

---

### 4. 浸入边界法（DF-IBM）— 流固耦合
**标题**: Stable fluid-rigid body interaction algorithm using the direct-forcing immersed boundary method (DF-IBM)
**arXiv**: [2604.24439](https://arxiv.org/abs/2604.24439)
**作者**: Badr Kaoui
**日期**: 2026-04-27 | **分类**: physics.flu-dyn | **期刊**: Journal of Fluids and Structures (2026)

#### 核心摘要
将 DF-IBM 算法扩展到 Navier-Stokes 方程与 Newton-Euler 刚体动力学耦合，支持自由运动（流致运动）场景。

#### 创新点
- **隐式耦合算法**：处理强耦合界面条件（分区方法）
- **固定松弛技术**：缓解固体-流体密度比和内部质量近似带来的稳定性问题
- 省略 PISO 算法的动量预测步和迭代校正循环 → 计算效率提升
- 验证：多种 benchmark 工况

#### 数值方法
- 直接力浸入边界法（DF-IBM）
- Navier-Stokes + Newton-Euler 耦合
- PISO 算法（修正版）

#### 关键词
`immersed boundary method` `fluid-structure interaction` `Navier-Stokes` `rigid body`

#### 关联知识
[[IBM]] [[immersed boundary]] [[fluid-structure interaction]]

---

### 5. ALE 间断有限元 — 涡激振动（VIV）
**标题**: Numerical Investigation of Elastically-Mounted tandem Cylinders using an ALE Runge-Kutta Discontinuous Galerkin method
**arXiv**: [2604.24342](https://arxiv.org/abs/2604.24342)
**作者**: Spyridon Zafeiris
**日期**: 2026-04-27 | **分类**: physics.flu-dyn

#### 核心摘要
高阶 **ALE-DG**（Arbitrary-Lagrangian-Eulerian）框架模拟多体涡激振动（VIV），应用于串联双圆柱和三圆柱配置。

#### 创新点
- **ALE  formulation**：扩展 RK Interior-Penalty DG 求解器
- **GCL（几何守恒律）离散强制**：保证自由流 preservation
- **RBF 网格变形**：处理大结构位移
- hp 细化比较：**提高多项式阶数**比网格细化更有效（低数值扩散）
- 验证：Lissajous 曲线、Poincaré 相图、功率谱、涡街模式分类

#### 数值方法
- ALE 间断有限元（ALE-DG）
- Runge-Kutta Interior-Penalty DG
- RBF 网格变形

#### 关键词
`discontinuous Galerkin` `ALE` `VIV` `vortex-induced vibration` `fluid-structure interaction`

#### 关联知识
[[DG]] [[ALE]] [[VIV]] [[CFD-FSI]]

---

### 6. 多松弛 BGK 模型 — 稀薄气体混合物
**标题**: A Particle Multi-Relaxation Bhatnagar-Gross-Krook Method for Rarefied Monatomic Gas Mixtures
**arXiv**: [2604.24244](https://arxiv.org/abs/2604.24244)
**作者**: Eunji Jun
**日期**: 2026-04-27 | **分类**: physics.flu-dyn

#### 核心摘要
提出了**统一 BGK（UBGK）**多松弛模型用于单原子气体混合物，基于粒子框架，匹配 Boltzmann 方程的生产项 → 恢复 Navier-Stokes-Fourier 输运行为。

#### 创新点
- 多松弛 formulation：保持二元相互作用结构
- 支持任意物种数的独立物种-对松弛
- 通过匹配生产项确保 NSF 级别正确性
- 四种 benchmark 验证：同质松弛、Poiseuille 流、Couette 流、圆柱高超声速绕流
- 比 DSMC 更高效（大时间步长时）
- 局限：一阶精度 → 未来可提升至高阶格式

#### 数值方法
- BGK 近似（Boltzmann 方程简化模型）
- DSMC 参考验证
- 粒子法

#### 关键词
`BGK` `rarefied gas` `DSMC` `gas mixtures` `Navier-Stokes-Fourier`

#### 关联知识
[[LBM]] [[BGK]] [[kinetic theory]] [[rarefied gas dynamics]]

---

### 7. 两相流亚网格界面面积 — regime-dependent ML
**标题**: Learning subgrid interfacial area in two-phase flows with regime-dependent inductive biases
**arXiv**: [2604.23946](https://arxiv.org/abs/2604.23946)
**作者**: Suhas Suresh Jain
**日期**: 2026-04-27 | **分类**: physics.comp-ph (cross-list physics.flu-dyn)

#### 核心摘要
针对湍流两相流中 **LES 亚网格界面面积密度**（控制相间输运的关键量），开发了两种机器学习闭包模型：纯数据驱动 3D encoder-decoder vs. 物理约束（fractal 几何先验）变体。

#### 创新点
- 物理约束模型在褶皱主导 regime 中优于纯数据驱动方法
- **regime-dependent**：在碎裂主导 regime（拓扑变化+液滴破裂）中，fractal 先验假设失效
- 揭示：**physics-informed 模型的实用性取决于其归纳偏置与物理 regime 的对齐程度**
- 提出 **regime-aware learning** 框架路径

#### 关键词
`machine learning` `LES` `subgrid` `two-phase flow` `closure modeling` `physics-informed`

#### 关联知识
[[LES]] [[multiphase flow]] [[machine learning]] [[closure modeling]]

---

### 8. Nudged LES 深度学习湍流闭包
**标题**: Deep Learning of Solver-Aware Turbulence Closures from Nudged LES Dynamics
**arXiv**: [2604.23874](https://arxiv.org/abs/2604.23874)
**作者**: (from physics.flu-dyn multi-subject listing)
**日期**: 2026-04-26 | **分类**: physics.flu-dyn

#### 核心摘要
提出基于**连续数据同化（CDA/nudging）**的深度学习湍流闭包方法，实现 a priori 训练 coarse-grid LES 闭包，将 DNS 数据作为稀疏观测。

#### 创新点
- 解决了 a-posteriori 训练的高计算成本问题（无需伴随/反向传播通过求解器）
- 无需修改现有求解器
- 保持长期稳定性
- 可跨不同数值/时间格式泛化
- 比较：与传统闭包模型的预测差异

#### 关键词
`turbulence closure` `deep learning` `LES` `nudging` `data assimilation`

#### 关联知识
[[LES]] [[turbulence]] [[deep learning]] [[closure modeling]]

---

### 9. 间歇性驱动的湍流级串 Markov 长度
**标题**: Intermittency-Driven Turbulence Cascade Memory Extends the Markov-Einstein Coherence Length Beyond the Canonical Estimate
**arXiv**: [2604.23962](https://arxiv.org/abs/2604.23962)
**作者**: Sungtaek Ju
**日期**: 2026-04-27 | **分类**: physics.flu-dyn

#### 核心摘要
通过强迫各向同性湍流 DNS（Reλ ≈ 1300, 433）测量湍流能量级串的 **Markov-Einstein 相干长度 Δr ≈ 3.2-3.6**（约为标准估计 3 倍）。

#### 创新点
- 间歇事件携带 Δr ≈ 3-4；中惯性范围平静区域恢复 Δr ≈ 1.0-1.4
- 靠近耗散范围时体动力学携带更多记忆（与 spectral bottleneck 一致）
- 超额记忆与 Reynolds 数无关（Reλ ≈ 433-1300）
- **修正**：现有 cascade Fokker-Planck 方程和涨落定理分析中的 Markov 近似比之前认为的更严格

#### 关键词
`turbulence` `energy cascade` `Markov process` `intermittency` `DNS`

#### 关联知识
[[turbulence]] [[energy cascade]] [[intermittency]] [[DNS]]

---

### 10. 耗散涡旋偶极子 — 几何效应
**标题**: Dissipative Vortex Binaries in Compact Fluid Domains with Geometric Corrections
**arXiv**: [2604.23857](https://arxiv.org/abs/2604.23857)
**作者**: Rickmoy Samanta
**日期**: 2026-04-26 | **分类**: physics.flu-dyn

#### 核心摘要
研究双周期流体力学域中**有限温度超流体动力学**的耗散涡旋-偶极子运动。

#### 创新点
- 保守系统存在精确可积约化（单复相对坐标）
- 最小旋转速度（互摩擦）项 → Hamilton 演化为混合辛-梯度流
- 局部 regime 耗散二元系统仍可解析求解
- 环面上偶极子方向出现慢速角漂移（平面极限不存在）
- 不等值异号偶极子：有限时间非线性啁啾（$\dot{\omega} \propto \omega^2$），与电磁/引力 inspiral 不同

#### 关键词
`vortex method` `dissipative dynamics` `superfluid` `Hamiltonian system`

#### 关联知识
[[vortex method]] [[superfluid]] [[Hamiltonian fluid dynamics]]

---

### 11. 衰退重力波中拉格朗日输运
**标题**: Beyond Stokes drift — Lagrangian transport in evolving gravity waves
**arXiv**: [2604.24069](https://arxiv.org/abs/2604.24069)
**作者**: Giulio Foggi Rota
**日期**: 2026-04-27 | **分类**: physics.flu-dyn

#### 核心摘要
通过高分辨率**两相模拟**和微扰解析模型研究自由衰退重力波中的拉格朗日输运。

#### 创新点
- 波衰减修正经典 Stokes drift（引入一阶+二阶波幅展开修正）
- 产生净垂直输运（惯性与粘度平衡）
- 增强各向异性混合
- 对解释现场观测和建模表面输运过程有重要意义

#### 关键词
`Lagrangian transport` `Stokes drift` `gravity waves` `two-phase simulation`

#### 关联知识
[[Lagrangian]] [[wave-fluid interaction]] [[surface tension]]

---

### 12. 极端湍流中微气泡质量输运控制
**标题**: Mass-Transfer Control With Microbubbles in Highly Turbulent Decaying Flows
**arXiv**: [2604.24520](https://arxiv.org/abs/2604.24520)
**日期**: 2026-04-28 | **分类**: physics.flu-dyn

#### 核心摘要
在极高湍流（Reλ = O(10³), Re = O(10⁵)）中使用**微量表面张力降低**（表面活性剂）控制气泡尺寸分布。

#### 创新点
- 极端湍流 + 微量 σ 降低（~0.01% CMC）→ 气泡破裂增强、合并轻微抑制
- 湍流统计量不变 → 效应完全来自界面变化而非流体力学改变
- 可调、降低复杂度的方法控制气泡尺寸分布
- 对工业多相流质量输运强化有直接应用

#### 关键词
`turbulence` `multiphase flow` `bubble` `surface tension` `mass transfer`

#### 关联知识
[[turbulence]] [[multiphase flow]] [[bubble dynamics]]

---

### 13. 地形准地转流最小熵产生解
**标题**: Minimum-enstrophy solutions in topographic quasi-geostrophic flow on the rotating sphere
**arXiv**: [2604.25600](https://arxiv.org/abs/2604.25600)
**作者**: Erik Jansson
**日期**: 2026-04-28 | **分类**: physics.flu-dyn

#### 核心摘要
将 Bretherton-Haidvogel 最小熵理论扩展到旋转球面上的准地转方程，考虑底部地形和非线性 Coriolis 效应。

#### 创新点
- 证明最小熵产生解的存在性和非线性稳定性
- 结构保持数值方法（structure-preserving）
- 预测与木星大气参数一致的结果
- 揭示：赤道附近纬向流 vs 极地附近地形捕获流的纬度依赖性

#### 关键词
`quasi-geostrophic` `turbulence` `minimum enstrophy` `rotating sphere` `geophysical fluid dynamics`

#### 关联知识
[[quasi-geostrophic]] [[geophysical fluid dynamics]] [[turbulence theory]]

---

## 📊 领域动态摘要（2026-04-29）

### 本周期主要趋势
1. **机器学习 + 湍流闭包** 持续火热（3 篇相关），重点从 a-posteriori 转向 a-priori / nudging 方法以降低成本
2. **间断有限元（DG）方法** 在两相流和流固耦合中进展显著（BP 性、ALE 耦合）
3. **稀疏回归** 替代神经网络作为可解释 SGS 闭包的趋势出现
4. **降阶模型（ROM）** 开始关注控制参数泛化能力
5. **regime-aware learning** 概念提出，强调物理约束与实际流动 regime 的匹配

### 待追踪方向
- [[regime-aware learning]] 在 LES 多相流中的应用
- [[sparse regression]] SGS 闭包的开源实现
- [[bound-preserving DG]] 两相流求解器的 OpenFOAM 集成可能

---
*由 鲜毛肚 (Caixin) 自动生成 | 2026-04-29*
