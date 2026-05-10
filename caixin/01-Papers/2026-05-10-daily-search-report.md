# Daily Search Report — 2026-05-10

**搜索范围**: arXiv physics.flu-dyn 新提交 (2026-05-08 ~ 2026-05-10)  
**关键词**: CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence  
**收集时间**: 2026-05-10 14:13 UTC

---

## 新提交论文摘要 (14篇)

### 1. AI CFD Scientist — AI驱动CFD发现流程
- **arXiv**: [2605.06607](https://arxiv.org/abs/2605.06607)
- **作者**: Nithin Somasekharan (RPI)
- **摘要**: 首个覆盖文献调研→执行→视觉物理验证→代码修改→论文撰写的AI科学家框架。基于GPT-5.5 + OpenFOAM (Foam-Agent)。在周期山上发现Spalart-Allmaras修正，使Cf RMSE降低7.89%。视觉语言验证门检测出16个silent failures中的14个。
- **方法**: Vision-language physics-verification gate, 三个耦合路径
- **代码**: https://github.com/csml-rpi/cfd-scientist
- **标签**: #AI-for-CFD #OpenFOAM #LLM-agent #WMLES

---

### 2. 聚合物添加剂强化热输运 (1100%提升)
- **arXiv**: [2605.06657](https://arxiv.org/abs/2605.06657)
- **作者**: Guanhan Li
- **摘要**: 二维剪切Poiseuille流动中，聚合物可将对流模式热通量提升达1100%。"hook-like polymer-stress structures"机制——wall-attached hooks形成"polymer walls"重组流动为强反向旋转卷；unattached hooks作为"speed bumps"。
- **关键发现**: 弹性中心模仅提升~0.03%，但弹性增强对流模可达1100%
- **标签**: #polymer-additives #heat-transfer #elastic-fluids #non-Newtonian

---

### 3. 液压跃舍数值模型 (Fr 1.98-8.48系统分析)
- **arXiv**: [2605.05585](https://arxiv.org/abs/2605.05585) (Physics of Fluids, May 2026)
- **作者**: Leiza D'Angelo
- **摘要**: 三相混合模型 URANS 方法模拟液压跃舍。系统分析12种Fr数工况。与IDDES精度相当但网格减少400倍，计算成本降低300倍。湍流模型选择影响空气卷吸预测精度。
- **应用**: 水工结构设计
- **标签**: #hydraulic-jump #URANS #air-entrainment #multiphase-flow

---

### 4. 两流体热交换器拓扑优化 (Darcy-RANS多保真方法)
- **arXiv**: [2605.06026](https://arxiv.org/abs/2605.06026)
- **作者**: Hiroki Kawabe
- **摘要**: 低保真度Darcy流模型 + RANS校正的保真框架。性能评价准则(PEC)提升22%（vs 扭带增强基准）。优化构型促进流体混合同时保持流线型降低压降。
- **标签**: #topology-optimization #heat-exchanger #multifidelity #turbulent-flow

---

### 5. 液滴撞击LES (飞机结冰粗糙度预测)
- **arXiv**: [2605.05465](https://arxiv.org/abs/2605.05465)
- **作者**: Federico Zabaleta
- **摘要**: WMLES + Lagrangian粒子追踪用于预测飞机结冰粗糙度形成。激光扫描实际结冰表面（非理想光滑）。物理粗糙诱导的非均匀收集效率，形成自增强反馈循环，主动放大粗糙特征。
- **关键**: 光滑表面完全压制局部撞击峰值；实际粗糙度使峰值集中于迎风面
- **标签**: #WMLES #droplet-impingement #icing #Lagrangian-tracking

---

### 6. 粘塑性浅水降阶模型 (TROM/HOSVD)
- **arXiv**: [2605.06526](https://arxiv.org/abs/2605.06526)
- **作者**: Ilya Timofeyev
- **摘要**: 张量降阶模型(TROM)，基于高阶SVD快照分解。Encoder-decoder架构，压缩潜在表示。无需降阶动力学系统时间积分即可重建解轨迹。非侵入式框架，捕捉前流传播、塞区和剪切区、近停止动力学。
- **流体类型**: Herschel-Bulkley流体（屈服应力）
- **标签**: #reduced-order-modeling #HOSVD #visco-plastic #shallow-water

---

### 7. 旋转对流严格终极标度律
- **arXiv**: [2605.05574](https://arxiv.org/abs/2605.05574)
- **作者**: Gabriel Hadjerci
- **摘要**: 高速旋转Rayleigh-Bénard对流的精确稳态单模解。匹配渐近分析获得Nusselt和Reynolds数的显式标度律（含水平波数依赖）。特定波数下达到无扩散终极标度，含对数修正。
- **意义**: 为地球物理和天体物理对流提供严格数学框架
- **标签**: #rotating-convection #asymptotic-analysis #ultimate-scaling #geophysical

---

### 8. MeLISA: 自回归生成建模 (湍流长期预测)
- **arXiv**: [2605.05540](https://arxiv.org/abs/2605.05540) (cs.LG cross-list)
- **作者**: Tianyue Yang
- **摘要**: MeanFlow Long-term Invariant Spatiotemporal Consistency Autoregressive Models。无潜在变量，像素空间MeanFlow。Window-Consistency + Time-Increment Consistency损失。Kolmogorov flow 256×256和channel flow 192×192 benchmark。12×推理加速，参数效率3.7-5.7M。
- **标签**: #neural-operator #turbulence #autoregressive #long-horizon-forecast

---

### 9. 一致性蒸馏流匹配 (快速流场重建)
- **arXiv**: [2605.05975](https://arxiv.org/abs/2605.05975) (cs.LG cross-list)
- **作者**: Sicheng Ma
- **摘要**: 最优传输流匹配教师→一步一致性学生模型蒸馏。低FID观测初始化生成轨迹，实现无条件模型的条件重建。12×推理加速，参数减半。在Smoke Buoyancy、Channel Flow、Kolmogorov Flow上验证。
- **标签**: #flow-matching #distillation #surrogate-model #CFD

---

### 10. 头足类启发脉冲喷气机器人
- **arXiv**: [2605.05875](https://arxiv.org/abs/2605.05875) (cs.RO cross-list)
- **作者**: Yiyuan Zhang
- **摘要**: 刚-软混合折纸 mantle，排出体积减少75%，投影阻力面积减少75.7%。周期分解框架：喷气→滑翔→填充。峰值速度0.5 m/s (3.8 BL/s)，首周期平均速度>0.2 m/s (1.5 BL/s)。
- **标签**: #bio-inspired-robotics #jet-propulsion #pulsed-jet #rigid-soft

---

### 11. 薄膜冷却斜爆震发动机 (煤油燃料)
- **arXiv**: [2605.05874](https://arxiv.org/abs/2605.05874)
- **作者**: Songbai Yao
- **摘要**: 冷却策略对比：空气冷却、气态煤油膜冷却、液态煤油雾冷却。雾冷在1-3%质量比下提供最佳热保护与推进性能平衡；高注入比时气态煤油更有利。所有策略保持ODW稳定传播。
- **标签**: #film-cooling #oblique-detonation-engine #hypersonic #two-phase-cooling

---

### 12. 搅拌槽混合标度律 (密度差)
- **arXiv**: [2605.06144](https://arxiv.org/abs/2605.06144)
- **作者**: Michael Ronald Wagner
- **摘要**: 50/50液体搅拌DNS。Reynolds数和Richardson数系统变化。指数标度律：混合时间与Ri正相关；Re影响不显著。Power-Froude-Richardson数组合使数据折叠到一条主曲线。
- **标签**: #mixing #stirred-tank #density-difference #scaling-law

---

### 13. 量子-经典溶剂化流体动力学
- **arXiv**: [2605.05658](https://arxiv.org/abs/2605.05658) (physics.chem-ph cross-list)
- **作者**: Cesare Tronci
- **摘要**: 混合量子-经典流体框架。哈密顿方法处理非绝热演化。保留溶质-溶剂相关同时降低计算复杂度。纳入耗散项捕捉惯性效应和极化弛豫。马卡斯局域近似扩展。
- **标签**: #quantum-classical #solvation #hydrodynamics #dissipation

---

### 14. 2D非线性薛定谔模型自相似前缘动力学冷却
- **arXiv**: [2605.06396](https://arxiv.org/abs/2605.06396) (math-ph cross-list)
- **作者**: Simon Thalabard
- **摘要**: 波-动力学方程(WKE)和四阶微分近似模型(DAM)。准热核+紫外尾两个自相似范围，DAM额外红外自相似。自相似前缘驱动有效动力学冷却，趋向零温平衡。
- **标签**: #nonlinear-Schrodinger #self-similarity #wave-kinetics #cooling

---

## 交叉列表 (4篇)
- **2605.05540** MeLISA (cs.LG) — 见上文#8
- **2605.05975** Consistency-distilled Flow Matching (cs.LG) — 见上文#9  
- **2605.05875** Cephalopod robot (cs.RO) — 见上文#10
- **2605.05658** Quantum solvation (physics.chem-ph) — 见上文#13
- **2605.06396** 2D NLS cooling (math-ph) — 见上文#14

## 关键趋势
1. **AI+物理验证**: AI CFD Scientist代表AI agent完整闭环CFD发现的新方向
2. **多保真方法**: 降阶+多保真成为CFD/HTTP优化主流范式
3. **聚合物弹性流体**: 热输运增强1100%开辟新应用场景
4. **视觉语言验证**: VLM用于物理场真实性检查开始成熟

---
*由鲜毛肚自动收集于 2026-05-10*