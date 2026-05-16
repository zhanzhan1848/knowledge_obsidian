# 每日流体力学论文搜索报告
**日期**: 2026-05-16
**时间**: 14:10 UTC
**搜索范围**: arXiv physics.flu-dyn, cs.FL (最近24小时)

---

## 统计概览
- physics.flu-dyn 新论文: 67篇
- cs.FL 新论文: 27篇
- 筛选相关论文: 14篇

---

## 筛选结果

### 🏆 核心 CFD / 数值方法论文

#### 1. [2605.14505] LBM 格子玻尔兹曼方法 - 分层湍流
**标题**: Systematic Evaluation of Stencil Configuration, Forcing Scheme, and Resolution Effects in the Stratified Taylor--Green Vortex: A Lattice Boltzmann Study
**作者**: Hongxuan Zhang
**领域**: LBM, 湍流, 分层流动
**创新点**:
- D3Q27×19 stencil 配置最优
- 256³ 分辨率为定量收敛最低要求
- 速度偏移强迫方案误差减少 45.54%
**数值方法**: LBM, D3Q27, Boussinesq近似
**URL**: https://arxiv.org/abs/2605.14505

#### 2. [2605.14022] 深度强化学习湍流控制 - DNS
**标题**: Policy-DRIFT: Dynamic Reward-Informed Flow Trajectory Steering
**作者**: Atharva Mahajan
**领域**: DRL, 壁湍流, DNS
**创新点**:
- Reτ=180 通道流 DNS
- 49% 阻力减少 (比 DRL 基线高 16%)
- 能耗降低 37×
**数值方法**: DNS, CFM, TRG
**URL**: https://arxiv.org/abs/2605.14022

#### 3. [2605.13892] 量子 PINN - 方腔驱动流
**标题**: A QPINN Framework with Quantum Trainable Embeddings for the Lid-Driven Cavity Problem
**作者**: Nahid Binandeh Dehaghani
**领域**: PINN, Navier-Stokes, 量子计算
**创新点**:
- QNN 可训练量子嵌入
- 参数效率高，训练稳定
- 11 pages, 9 figures
**数值方法**: QPINN, variational quantum circuit
**URL**: https://arxiv.org/abs/2605.13892

#### 4. [2605.13912] Vision Transformer + Koopman - 流固耦合
**标题**: A Few-Shot Learning Model for Coupled Fluid-Porous Media Flows with Interface Conditions
**作者**: -
**领域**: 深度学习, Stokes/Darcy, 多物理场
**创新点**:
- ViT-K 框架: Vision Transformers + Koopman operator
- 线性误差增长（非指数）
- 少样本学习
**数值方法**: Few-shot learning, Koopman operator
**URL**: https://arxiv.org/abs/2605.13912

#### 5. [2605.12723] DeepONet 稀薄气体喷管
**标题**: Shock-Centered Low-Rank Structure and Neural-Operator Representation of Rarefied Micro-Nozzle Flows
**作者**: -
**领域**: DSMC, 神经算子, 稀薄流
**创新点**:
- 跳跃尺度坐标提升 POD 紧凑度至 98.33%
- 融合-DeepONet surrogate
- 误差从 9.75%-22.27% 降至 4.51%
**数值方法**: DSMC, DeepONet, POD
**URL**: https://arxiv.org/abs/2605.12723

### 🔬 物理机制论文

#### 6. [2605.13654] 自由表面湍流变形
**标题**: Free-surface deformations induced by three-dimensional turbulence
**作者**: Eric Falcon
**领域**: 湍流, 自由表面
**关键发现**:
- 表面变形标准差与亚表面速度波动线性相关
- 功率谱指数 -2.5, -7/3
- 线性响应模型预测成功
**URL**: https://arxiv.org/abs/2605.13654

#### 7. [2605.13552] 负混合物马兰戈尼凝结
**标题**: Unexpected Marangoni Condensation in Negative Binary Mixtures
**作者**: Patricia Weisensee
**领域**: 多相流, 相变传热
**关键发现**:
- 水-乙二醇/三甘醇负混合物中发现马兰戈尼凝结
- 热扩散效应驱动
- 传热增强 >6×
**URL**: https://arxiv.org/abs/2605.13552

#### 8. [2605.12621] T型接头湍流振荡
**标题**: Turbulent oscillation in unbalanced T-junction flows
**作者**: Dongjie Jia
**领域**: 湍流, 混合
**关键发现**:
- 发现新的振荡行为 (Strouhal数恒定)
- 雷诺数自相似现象
- 湍流产生新模式
**URL**: https://arxiv.org/abs/2605.12621

#### 9. [2605.13633] 非牛顿流体自然对流
**标题**: Effects of Thermal Boundary Conditions on Natural Convection and Entropy Generation in Non-Newtonian Power-Law Fluids
**作者**: -
**领域**: 非牛顿流, 对流, 熵产生
**关键发现**:
- 剪切稀化增强浮力驱动循环
- 均匀加热产生更强对流结构
- Gridap.jl 有限元框架
**URL**: https://arxiv.org/abs/2605.13633

#### 10. [2605.13195] 多孔介质湍流传热
**标题**: Influence of Prandtl number on heat transfer over a permeable wall
**作者**: Wojciech Sadowski
**领域**: 湍流, 多孔介质, 传热
**关键发现**:
- Pr=0.71, 0.1, 0.05 三种情况
- 低 Pr 下项不可忽略
- 湍流热传递滤波分析
**URL**: https://arxiv.org/abs/2605.13195

#### 11. [2605.12696] CO2驱油孔隙尺度
**标题**: Time-Resolved Pore-Scale Imaging of Multiphase Dissolution during CO2-Saturated Brine Injection
**作者**: -
**领域**: 多相流, 孔隙尺度, 碳酸盐岩
**关键发现**:
- 三阶段溶解动力学
- 碳氢化合物膨胀 vs 簇迁移竞争
- 有效反应率降低两个数量级
**URL**: https://arxiv.org/abs/2605.12696

#### 12. [2605.14789] 氢气预混火焰声学激励
**标题**: Evolution of lean hydrogen-air premixed flames under high-frequency acoustic forcing
**作者**: Um
**领域**: 燃烧, 火焰动力学
**关键发现**:
- 频率 35-500 kHz
- 热-扩散不稳定性
- 位移速度与拉伸率线性关联
**URL**: https://arxiv.org/abs/2605.14789

#### 13. [2605.14951] PEM燃料电池冷启动
**标题**: Effect of startup modes on cold start performance of PEM fuel cells
**作者**: -
**领域**: 燃料电池, 流场
**关键发现**:
- 金属泡沫流场优于蛇形流场
- 恒压模式 0.3V 最佳
- 变量电流模式改善冷启动
**URL**: https://arxiv.org/abs/2605.14951

#### 14. [2605.12393] 不均匀表面液滴运动
**标题**: Variational approach to droplet motion on uneven solid surfaces
**作者**: Andrew Archer
**领域**: 液滴, 接触线, 蒸发
**关键发现**:
- Onsager变分原理
- 毛细管整流器机制
- 接触线动力学
**URL**: https://arxiv.org/abs/2605.12393

---

## 技术分类

| 类别 | 论文数 | 主要贡献 |
|------|--------|----------|
| 神经算子/深度学习 | 3 | DeepONet, QPINN, ViT-K |
| LBM 方法 | 1 | 分层湍流系统评估 |
| DNS/湍流 | 2 | 壁湍流控制, 自由表面 |
| 多相流 | 3 | 马兰戈尼, 孔隙尺度, 液滴 |
| 非牛顿流 | 1 | 幂律流体对流 |
| 燃烧 | 1 | 氢气火焰声学 |
| 燃料电池 | 1 | PEMFC冷启动 |

---

## 值得关注的趋势
1. **神经算子崛起**: DeepONet, QPINN, ViT-K 三种不同路径探索物理驱动深度学习
2. **量子PINN**: 从 classical PINN 向 quantum 扩展
3. **湍流控制**: DRL + 生成模型结合 (CFM) 成新范式
4. **孔隙尺度**: 4D X-ray 微层析成多相流研究标配
5. **马兰戈尼效应**: 负混合物中意外发现扩展了传统认知

---
*由 鲜毛肚 自动生成 | [[daily-search-2026-05-16]]*