# 每日论文搜索报告 - 2026-06-08

## 搜索配置
- **时间范围**: 最近 24 小时
- **搜索源**: arXiv physics.flu-dyn, cs.FL
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

## 发现论文统计
- physics.flu-dyn: 74 篇 (2026-06-03 至 2026-06-08)
- 相关论文: 10 篇

## 相关论文摘要

### 1. SPH / 粒子方法

**arXiv:2606.06247** - "A high-order Fourier Continuation (FC)-based spectral incompressible SPH scheme for wall-bounded domains"
- **作者**: Meixuan Lin
- **日期**: 2026-06-04
- **领域**: SPH, spectral methods, incompressible flow
- **核心创新**: 将 Fourier Continuation (FC) 技术引入谱 SPH，实现高阶收敛 + 非周期边界条件
- **方法**: 投影时间积分 + 谱 PPE 求解器 + FFT
- **验证**: 经典 CFD benchmarks
- **链接**: https://arxiv.org/abs/2606.06247

### 2. DNS / 湍流 / 粒子输运

**arXiv:2606.06374** - "Statistical orientation and distribution of columnar ice crystals in turbulent flows"
- **作者**: Bernhard Mehlig
- **日期**: 2026-06-04
- **领域**: DNS, Navier-Stokes, turbulence, particle-laden flow
- **核心发现**: 柱状冰晶优先垂直于重力方向排列；湍流波动抵消排列效应；沉降速度随 ε 增加而增强
- **方法**: 直接数值模拟 (DNS) + 非球形粒子追踪
- **应用**: 云物理中冰晶碰撞频率
- **链接**: https://arxiv.org/abs/2606.06374

### 3. 涡旋相互作用

**arXiv:2606.06766** - "Vortex gust interactions with a freely-flying rigid airfoil"
- **作者**: Bingfei Yan
- **日期**: 2026-06-04
- **领域**: vortex method, aerodynamics, fluid-structure interaction
- **核心发现**: 自由飞翼与孤立涡相互作用模型；预测了挥舞轨迹；发现了涡脱落的复杂性
- **方法**: CFD 数值模拟 + 简化解析模型
- **链接**: https://arxiv.org/abs/2606.06766

### 4. 湍流壁函数

**arXiv:2606.06876** - "A Wall Function for Turbulent Boundary Layers under Rotation via Symbolic Regression"
- **作者**: Yao Ma
- **日期**: 2026-06-05
- **领域**: turbulence modeling, wall functions, rotating flows
- **核心创新**: 使用符号回归推导旋转湍流边界层的白盒壁函数表达式
- **发现**: 迎风面收缩，背风面膨胀；迎风面趋于再层流化
- **链接**: https://arxiv.org/abs/2606.06876

### 5. 湍流减阻 (RL)

**arXiv:2606.06227** - "Drag reduction or reward hacking? Recurrent multi-agent reinforcement learning for wall turbulence"
- **作者**: Giorgio Maria Cavallazzi
- **日期**: 2026-06-04
- **领域**: turbulence, reinforcement learning, drag reduction
- **核心发现**: 发现传统 RL 策略存在 reward hacking 问题；提出三项修正：可微投影 + 循环策略 + 真实壁功率奖励
- **结果**: 诚实核算下获得 17% 减阻
- **链接**: https://arxiv.org/abs/2606.06227

### 6. 格子玻尔兹曼 / 动理论

**arXiv:2606.05938** - "High-order thermodynamic nonequilibrium in 3D compressible flows: Kinetic moment closure and multigradient coupling"
- **作者**: Yanbiao Gan
- **日期**: 2026-06-04
- **领域**: kinetic theory, DBM (discrete Boltzmann method), Burnett-level closures
- **核心创新**: 三维超Burnett级 D3V91 模型 (91个离散速度)；识别高阶TNE的多梯度起源而非单梯度
- **方法**: Chapman-Enskog 分析；13个约束条件
- **链接**: https://arxiv.org/abs/2606.05938

### 7. 弹性Burgulence

**arXiv:2606.06496** - "Functional Renormalization for Elastic Burgulence"
- **作者**: Johannes Conrad
- **日期**: 2026-04-20 (but in recent list)
- **领域**: turbulence, Martin-Siggia-Rose formalism, elastic turbulence
- **核心创新**: 在 MSR 路径积分框架下推导 Ward identities；提出扩展 Burgers 方程作为弹性湍流模型
- **链接**: https://arxiv.org/abs/2606.06496

### 8. 壁面剪切应力反演

**arXiv:2606.06313** - "Wall Shear Stress Reconstruction from Concentration: Differentiable Physics and PINNs"
- **作者**: Amirhossein Arzani
- **日期**: 2026-06-04
- **领域**: CFD, inverse problems, physics-informed neural networks, hemodynamics
- **核心发现**: 从被动标量浓度场重建壁面剪切应力；可微分层方法优于 PINNs
- **应用**: 心血管流体力学
- **链接**: https://arxiv.org/abs/2606.06313

### 9. 对流控制 (DRL)

**arXiv:2606.06191** - "Deep reinforcement learning with spatial and temporal awareness for active boundary control of buoyancy-driven convection"
- **作者**: Giorgio Maria Cavallazzi
- **日期**: 2026-06-04
- **领域**: convection, DRL, flow control, Rayleigh-Bénard
- **核心创新**: 卷积策略网络 + GRU 记忆 + off-policy 训练 + 动作平滑约束
- **结果**: Nu 降低至 1.83 (比基准低 26%)；盐指系统热传输增强 19.1%
- **链接**: https://arxiv.org/abs/2606.06191

### 10. 薄膜稳定性

**arXiv:2606.07192** - "Effect of Spatially Heterogeneous Mucin Coverage on Tear Film Stability and Rupture"
- **作者**: Deepak Kumar
- **日期**: 2026-06-05
- **领域**: thin film, Marangoni flow, tear film dynamics
- **核心发现**: 非均匀 mucin 覆盖导致泪膜优先在 mucin 缺乏区域破裂
- **方法**: Floquet-Bloch 线性稳定性分析 + 非线性模拟
- **链接**: https://arxiv.org/abs/2606.07192

---
*报告生成时间: 2026-06-08 14:08 UTC*
*同步至 GitHub: 待执行*