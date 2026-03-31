# 每日论文汇总 | 2026-03-31

**搜索范围**: arXiv physics.flu-dyn, cs.FL (最近24小时新提交)  
**关键词**: CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence

---

## 今日概览

| 类别 | 数量 |
|------|------|
| physics.flu-dyn 新提交 | 14 篇 |
| physics.flu-dyn 跨领域 | 17 篇 |
| cs.FL 新提交 | 0 篇（形式语言理论） |

---

## 🔥 高优先级：CFD/数值方法相关论文

### 1. LVM-PINN: Learnable Viscosity Modulation in PINNs for Incompressible Flow
- **arXiv**: [2603.27496](https://arxiv.org/abs/2603.27496)
- **日期**: 2026-03-31
- **作者**: —
- **分类**: physics.flu-dyn
- **MSC**: 35Q30 (Primary), 68T07, 76D05 (Secondary)
- **链接**: [[arXiv]](https://arxiv.org/abs/2603.27496) | [[PDF]](https://arxiv.org/pdf/2603.27496)

**摘要**  
提出 LVM-PINN 框架，将**可学习粘性调制（LVM）**机制嵌入 PINN 残差。模型预测时空标量场，直接嵌入动量方程的粘性扩散项，实现局部耗散强度的自适应调制。改善了稀疏/噪声数据条件下的训练稳定性和流场重构精度。在 Kovasznay flow 和制造强迫流上进行验证。

**创新点**
- LVM 机制：学习粘性空间分布 → 自适应扩散调制
- 控制方程：不可压缩 N-S，粘性项被修改为 $\nu(\mathbf{x},t) \nabla^2 \mathbf{u}$
- 稀疏/噪声数据鲁棒性显著提升

**数值方法**
- PINN (Physics-Informed Neural Networks)
- 有限差分基准验证

**评估**: ⭐⭐⭐⭐⭐ — PINN + N-S 方法与 CFD 直接相关，适合流场重构

---

### 2. Drag Crisis in Fractal Trees Revealed by Simulation and Theory
- **arXiv**: [2603.27954](https://arxiv.org/abs/2603.27954)
- **日期**: 2026-03-31
- **作者**: —
- **分类**: physics.flu-dyn
- **链接**: [[arXiv]](https://arxiv.org/abs/2603.27954) | [[PDF]](https://arxiv.org/pdf/2603.27954) | [[HTML]](https://arxiv.org/html/2603.27954v1)

**摘要**  
研究城市树冠（分形树结构）在高雷诺数下的气动阻力。通过**格子玻尔兹曼方法（LBM）**进行大规模数值模拟，Re 范围 $2.5\times10^3 \leq Re_H \leq 1.2\times10^5$。解析模型将预测扩展至 $Re_H \sim 10^9$。发现阻力危机转变点约 $Re_H \approx 3\times10^6$，城市湍流流入使表观起始点移至 $Re_H \approx 1.5\times10^5$。

**创新点**
- LBM + 自适应网格细化（AMR）
- 分形树阻力系数新 scaling law
- Cauchy number 作为主要控制参数

**数值方法**
- **格子玻尔兹曼方法 (LBM)** — cumulant 格式
- 自适应网格细化 (AMR)
- 解析分支阻力模型

**评估**: ⭐⭐⭐⭐⭐ — 直接涉及 LBM 方法，分形树空气动力学

---

### 3. WSINDy for Vortex-Induced Vibrations (VIV)
- **arXiv**: [2603.27840](https://arxiv.org/abs/2603.27840)
- **日期**: 2026-03-31
- **作者**: —
- **分类**: physics.flu-dyn
- **链接**: [[arXiv]](https://arxiv.org/abs/2603.27840) | [[PDF]](https://arxiv.org/pdf/2603.27840) | [[HTML]](https://arxiv.org/html/2603.27840v1)

**摘要**  
使用**弱形式稀疏非线性动力学识别（WSINDy）**从数据中发现单自由度圆柱 VIV 的控制方程。结合 POD 提取流场主导时空结构。弱形式避免了数值微分，对非周期动力学特别鲁棒。

**创新点**
- WSINDy: 积分形式替代数值微分
- 流-固耦合数据驱动建模
- POD 降维

**数值方法**
- SINDy / WSINDy
- Proper Orthogonal Decomposition (POD)

**评估**: ⭐⭐⭐⭐ — 数据驱动 + 涡激振动，与涡方法直接相关

---

### 4. GEVP-LSA: Eigenvalue-based Linear Stability Analysis of Intrinsic Flame Instabilities
- **arXiv**: [2603.28099](https://arxiv.org/abs/2603.28099)
- **日期**: 2026-03-31
- **作者**: —
- **分类**: physics.flu-dyn
- **会议**: International Symposium on Combustion
- **链接**: [[arXiv]](https://arxiv.org/abs/2603.28099) | [[PDF]](https://arxiv.org/pdf/2603.28099)

**摘要**  
提出广义特征值问题线性稳定性分析（GEVP-LSA）框架，用于预测内禀火焰不稳定性的增长率和空间结构。在 Darrieus-Landau 配置上验证，可将计算成本降低 $10^8$ 倍。

**创新点**
- 从线性化 1D 基火焰方程直接构造 GEVP
- 替代 DNS，成本降低 $10^8$ 倍
- 适用于反应流稳定性分析

**数值方法**
- 线性稳定性分析 (LSA)
- GEVP 求解
- DNS 验证

**评估**: ⭐⭐⭐⭐ — 线性稳定性分析 + 燃烧流，精度媲美 DNS

---

### 5. SCALE-TRACK: Scalable Euler-Lagrange Particle Tracking on Heterogeneous Architecture
- **arXiv**: [2603.26691](https://arxiv.org/abs/2603.26691) (cross-list from cs.CE)
- **日期**: 2026-03-30 (submitted), listed 2026-03-31
- **作者**: —
- **分类**: cs.CE, physics.flu-dyn
- **会议**: Submitted to Journal of Computational Physics
- **链接**: [[arXiv]](https://arxiv.org/abs/2603.26691) | [[PDF]](https://arxiv.org/pdf/2603.26691)

**摘要**  
提出 SCALE-TRACK：面向异构超算环境的两向耦合欧拉-拉格朗日粒子追踪算法。支持异步耦合、缓存友好数据结构、基于 chunk 的分区。在单 GPU 上模拟 14 亿粒子，256 GPU 弱扩展至 2560 亿粒子。开源代码。

**创新点**
- 异构计算 (GPU + CPU)
- 异步耦合策略
- 两向耦合多相流

**数值方法**
- **欧拉-拉格朗日方法 (EL)**
- 颗粒-流体两向耦合

**评估**: ⭐⭐⭐⭐ — 高性能计算 + EL 粒子追踪，多相流 CFD

---

## 📋 其他 CFD/流体力学相关论文

### 6. Inertial effects near moving contact line (VOF)
- **arXiv**: [2603.28210](https://arxiv.org/abs/2603.28210) | [[PDF]](https://arxiv.org/pdf/2603.28210)
- 移动接触线惯性效应，VOF 方法验证，MWS 理论扩展

### 7. Reactive Flow in Turbulent H₂-air Flame via Resolvent Analysis
- **arXiv**: [2603.27675](https://arxiv.org/abs/2603.27675) | [[PDF]](https://arxiv.org/pdf/2603.27675)
- SPOD + Resolvent Analysis，湍流燃烧动力学

### 8. Gravity effects on lean H₂/air flame: RT instability
- **arXiv**: [2603.28249](https://arxiv.org/abs/2603.28249) | [[PDF]](https://arxiv.org/pdf/2603.28249) | [[HTML]](https://arxiv.org/html/2603.28249v1)
- 详细化学 DNS，Rayleigh-Taylor 不稳定性与火焰形态演化

### 9. Bio-fluid: Flagellated bacterium swimming in EVP fluid
- **arXiv**: [2603.27445](https://arxiv.org/abs/2603.27445) | [[PDF]](https://arxiv.org/pdf/2603.27445) | [[HTML]](https://arxiv.org/html/2603.27445v1)
- 两流体模型 + 细长体理论 (SBT)，低雷诺数生物流

### 10. Acoustic Black Hole Damper for Thermoacoustic Instability
- **arXiv**: [2603.28231](https://arxiv.org/abs/2603.28231) | [[PDF]](https://arxiv.org/pdf/2603.28231) | [[HTML]](https://arxiv.org/html/2603.28231v1)
- 声学黑洞宽带被动阻尼，氢燃料燃烧器

### 11. Kirigami mesostructure: lift/drag modulation
- **arXiv**: [2603.27227](https://arxiv.org/abs/2603.27227) | [[PDF]](https://arxiv.org/pdf/2603.27227) | [[HTML]](https://arxiv.org/html/2603.27227v1)
- 可重构kirigami结构，空气动力学柔性变形

### 12. Passive morphing of avian-inspired flexible foils
- **arXiv**: [2603.27794](https://arxiv.org/abs/2603.27794) | [[PDF]](https://arxiv.org/pdf/2603.27794) | [[HTML]](https://arxiv.org/html/2603.27794v1)
- 鸟翼 inspired，流固耦合扑翼

### 13. Turbulence in fusion devices (chaos/self-optimized)
- **arXiv**: [2603.28633](https://arxiv.org/abs/2603.28633) | [[PDF]](https://arxiv.org/pdf/2603.28633) | [[HTML]](https://arxiv.org/html/2603.28633v1)
- 边缘等离子体湍流，分布式混沌建模

### 14. Thermal buoyancy in convective dynamos
- **arXiv**: [2603.27327](https://arxiv.org/abs/2603.27327) | [[PDF]](https://arxiv.org/pdf/2603.27327) | [[HTML]](https://arxiv.org/html/2603.27327v1)
- 地球核心动力学，MAC 平衡，磁流体动力学

### 15. Bubble clogging in porous media (LBM)
- **arXiv**: [2603.28511](https://arxiv.org/abs/2603.28511) | [[PDF]](https://arxiv.org/pdf/2603.28511) | [[HTML]](https://arxiv.org/html/2603.28511v1)
- 颜色梯度 LBM，多孔介质气泡输运

### 16. Surfactant-covered droplet deformation (Phase-field)
- **arXiv**: [2603.27285](https://arxiv.org/abs/2603.27285) | [[PDF]](https://arxiv.org/pdf/2603.27285) | [[HTML]](https://arxiv.org/html/2603.27285v1)
- 相场模型，表面活性剂重定向，多相流

### 17. Shear-induced self-diffusivity in suspensions
- **arXiv**: [2603.27396](https://arxiv.org/abs/2603.27396) | [[PDF]](https://arxiv.org/pdf/2603.27396) | [[HTML]](https://arxiv.org/html/2603.27396v1)
- 弱排斥力悬浮液，渐近分析，粒子-流体相互作用

### 18. Unidirectional flow from broken symmetries (lymphatic)
- **arXiv**: [2603.27474](https://arxiv.org/abs/2603.27474) | [[PDF]](https://arxiv.org/pdf/2603.27474) | [[HTML]](https://arxiv.org/html/2603.27474v1)
- 淋巴系统，定向流动，非线性+对称性破缺

### 19. Granular jet penetration
- **arXiv**: [2603.27262](https://arxiv.org/abs/2603.27262) | [[PDF]](https://arxiv.org/pdf/2603.27262) | [[HTML]](https://arxiv.org/html/2603.27262v1)
- 颗粒介质，穿透动力学，分子动力学

### 20. Mineral replacement under advective flow (porous media)
- **arXiv**: [2603.27336](https://arxiv.org/abs/2603.27336) | [[PDF]](https://arxiv.org/pdf/2603.27336) | [[HTML]](https://arxiv.org/html/2603.27336v1)
- 孔隙网络模拟，反应渗流，自堵塞机制

---

## 方法论分类

| 数值方法 | 相关论文 |
|----------|----------|
| **LBM (格子玻尔兹曼)** | 2603.27954 (Drag crisis), 2603.28511 (Bubbles) |
| **PINN (物理信息神经网络)** | 2603.27496 (LVM-PINN) |
| **SINDy / WSINDy** | 2603.27840 (VIV) |
| **VOF (流体体积法)** | 2603.28210 (Contact line) |
| **Phase-field** | 2603.27285 (Surfactant) |
| **Euler-Lagrange** | 2603.26691 (Particle tracking) |
| **Linear Stability (GEVP)** | 2603.28099 (Flame instability) |
| **DNS** | 2603.28249, 2603.27675 |
| **Slender Body Theory** | 2603.27445 (Bacterium swimming) |
| **Resolvent Analysis** | 2603.27675 |

---

## 关键发现总结

1. **LBM 持续活跃**：树冠阻力 crisis 研究和气泡多孔介质输运均采用 LBM
2. **PINN + N-S 新进展**：LVM-PINN 通过学习粘性调制改善了不可压缩流场重构精度
3. **数据驱动方法渗透**：WSINDy 从数据中发现 VIV 控制方程，弱形式增强鲁棒性
4. **燃烧 CFD 热度不减**：3 篇氢燃烧相关论文（火焰不稳定、热声振荡、重力效应）
5. **高性能计算**：EL 粒子追踪实现 2560 亿粒子弱扩展

---
*生成时间: 2026-03-31 14:10 UTC | 来源: arXiv physics.flu-dyn*
