# 每日论文收集报告

**日期**: 2026-05-21 (UTC)
**收集范围**: arXiv physics.flu-dyn 最近24-48小时

---

## 📑 论文列表

### 2026-05-21 (今日)

| ID | 标题 | 分类 |
|----|------|------|
| [2605.21444](#260521444) | CoDeS: 压缩方向熵应力方法 | 可压缩流, shock capturing |
| [2605.21354](#260521354) | 含纳米颗粒乳液液滴的微爆 | 多相流, 燃烧 |
| [2605.21329](#260521329) | 湍流气味羽流的智能导航策略 | 湍流, 强化学习 |
| [2605.21196](#260521196) | LES中网格各向异性与SGS模型效应 | LES, 云层CFD |
| [2605.21191](#260521191) | 角动量视角下的流体流动 | 基础理论, 涡量 |
| [2605.21030](#260521030) | Buckley-Leverett冲击捕获的多小波方法 | 多相流, 输运 |
| [2605.20778](#260520778) | DRL抑制串列圆柱流致振动 | 流致振动, DRL |
| [2605.20571](#260520571) | 城市冠层模型的多尺度流动分析 | 城市CFD, NWP |
| [2605.20565](#260520565) | 大尺寸差异粒子负载流的模拟 | 多相流, LBM, 气泡-粒子 |
| [2605.20472](#260520472) | 可压缩欧拉方程的熵稳定离散 | 高阶格式, 熵稳定 |
| [2605.20250](#260520250) | PINN卷积神经网络多孔介质流动 | PINN, 多孔介质 |

### 2026-05-20

| ID | 标题 | 分类 |
|----|------|------|
| [2605.20046](#260520046) | 均匀各向同性湍流的两点熵定律动力学 | 湍流, DNS |
| [2605.19921](#260519921) | 湍流中速度梯度关联的奇偶相关标度 | 湍流理论 |
| [2605.19774](#260519774) | 含固体颗粒液柱的自相似断裂 | 多相流, 液柱断裂 |
| [2605.19468](#260519468) | 中等雷诺数范围内的最优翼型 | 空气动力学, 翼型设计 |
| [2605.19565](#260519565) | 高保真CFD数据集(高升力飞机) | 数据集, AI surrogate |
| [2605.19286](#260519286) | 稀薄微喷管壁面热通量控制 | 微尺度流动, DSMC |
| [2605.19589](#260519589) | PINN图神经网络预测牙科纳米颗粒弥散 | GNN, 医疗CFD |

---

## 📝 论文详情

### 2605.21444
**标题**: A Compression-Directional Entropic Stress Method for Shock-Regularized Compressible Flow

**作者**: (待补充)

**领域**: 可压缩流, shock capturing, 高阶有限体积法

**控制方程**:
- Navier-Stokes / 可压缩欧拉
- 新型正则化: $\boldsymbol{\Pi}_{\Sigma}=\sigma\boldsymbol{M}$
- $\sigma$ from modified-Helmholtz equation
- $\boldsymbol{M}$ 来自速度梯度张量压缩特征空间

**创新点**:
1. 将标量多维熵压替换为与主压缩方向对齐的张量应力
2. 正则化在膨胀、刚体旋转、理想接触面消失
3. 在平面冲击处恢复1D IGR机制
4. 同一张量应力用于动量通量和应力功能通量

**数值方法**:
- 有限体积法
- 高阶精度 (WENO/TENO兼容)
- 压缩选择性 shock regularization

**测试案例**: 1D/2D/3D膨胀, 双稀疏, Sod管, 多维Riemann流, 粘性冲击管, 两流体三相点, Mach-3槽射流, 超音速Taylor-Green涡

**结论**: 3D Taylor-Green结果与7阶WENO/TENO参考相当或更高能量

**链接**: https://arxiv.org/abs/2605.21444

---

### 2605.21354
**标题**: Micro-explosion of emulsion droplets with nanoparticles at high temperature

**作者**: Zhizhao Che et al.

**领域**: 多相流, 燃烧, 燃油雾化

**摘要**:
- 研究含纳米颗粒的乳液液滴微爆
- 实验方法: 高速摄影, 数字图像处理, 光学显微镜, SEM
- 碳纳米颗粒显著提高微爆强度和概率
- 机理: 纳米颗粒在蒸发过程中聚集, 吸收辐射能, 抑制过热蒸汽扩散

**关键发现**:
1. 纳米颗粒存在 → 微爆强度和概率大幅提高
2. 碳纳米颗粒效果最佳
3. 纳米颗粒质量分数和水含量增加 → 促进微爆

**应用**: 燃油雾化, 燃烧优化, 排放减少

**链接**: https://arxiv.org/abs/2605.21354

---

### 2605.21329
**标题**: Smart strategies to navigate turbulent odor plumes reorienting to local wind

**作者**: Lorenzo Piro et al.

**领域**: 湍流, 强化学习, 机器人嗅觉

**创新点**:
1. 风相对强化学习框架
2. 单内部变量: 距上次气味检测经过的时间
3. 通过指数记忆核估计本地风方向
4. 在DNS湍流中训练和评估

**方法**:
- 直接数值模拟 (DNS) 捕获多尺度速度和气味场
- 策略使用局部估计的风向
- 在中等平均风中, 学习策略优于cast-and-surge
- 在各向同性湍流中, 性能在中间风记忆时间达到峰值

**发现**: 时间风整合是领域相关资源

**链接**: https://arxiv.org/abs/2605.21329

---

### 2605.21196
**标题**: Effect of grid anisotropy, resolution, and subgrid-scale models in pseudo-spectral LES of low-level clouds

**作者**: Davide Selvatici et al.

**领域**: LES, 云层CFD, 大气边界层

**方法**:
- 伪谱平流 + 各向异性最小耗散 (AMD) SGS模型
- 两个场_campaign_: DYCOMS-II RF01, ASTEX
- 覆盖非降水和降水层积云

**关键发现**:
1. AMD + 伪谱平流 → 跨网格分辨率的稳健准确预测
2. 无需参数调优
3. 推荐网格各向异性: 垂直间距 ≈ 水平间距的1/3
4. 误差分析与理论预测一致

**链接**: https://arxiv.org/abs/2605.21196

---

### 2605.21191
**标题**: Beyond Vorticity: An Angular Momentum Perspective on Fluid Flow

**作者**: (待补充)

**领域**: 流体力学基础理论, 涡量理论

**核心创新**:
1. 引入角动量密度场 $\mathbf{L} = \mathbf{r} \times \mathbf{u}$
2. 推导广义输运方程, 显式平衡宏观扭矩和旋转动量

**理论优势**:
1. 粘性扭矩新分解: 扩散分量 + 局部自旋耗散项
2. 解释粘性边界层中升力产生机制和失速
3. 流体力学冲量公式重构: 膨胀+体积+旋转通量分离
4. 统一非循环附加质量和循环升力
5. 直接计算粘性附加质量力
6. 简化地球流体力学: 吸收行星旋转为轴向角动量
7. 识别rotlet为Stokes regime下L输运方程的基本Green函数
8. 斜冲击和涡层作为L的奇异源

**链接**: https://arxiv.org/abs/2605.21191

---

### 2605.21030
**标题**: A Fixed-Grid Affine-Constrained Multiwavelet Coefficient Method for Buckley-Leverett Shock Capturing

**作者**: Christian Tantardini et al.

**领域**: 多相流, 输运, 油藏模拟

**方法**:
- 固定网格保守仿射约束模态/多小波系数方法
- 局部正交系数基: mean/detail结构
- 流入边界条件作为线性迹约束, 通过仿射提升强制执行
- 单调数值通量 + troubled-cell限制器

**验证**: Berea岩心水驱基准 vs pywaterflood参考解

**结论**: p=2 (分段线性) 提供最佳精度-成本权衡

**链接**: https://arxiv.org/abs/2605.21030

---

### 2605.20778
**标题**: Deep Reinforcement Learning Discovers a Novel Control Algorithm for Mitigating Flow-Induced Vibrations in Underactuated Tandem Cylinders

**作者**: Hussam Sababha et al.

**领域**: 流致振动, DRL, 圆柱绕流

**关键结果**:
1. **全驱动**: DRL发现高频锁相bang-bang控制 → 抑制振动 >95%
2. **欠驱动(仅上游圆柱)**: 非对称奖励权重 → 低频锁定策略 → 上游70%, 下游90%抑制
3. **交错排列**: 课程学习 → 双谐波旋转控制信号

**发现**:
- 物理可解释的学习过程: 先识别最佳相位关系, 再细化驱动频率
- 欠驱动控制策略降低能耗和硬件复杂度

**链接**: https://arxiv.org/abs/2605.20778

---

### 2605.20571
**标题**: Multi-scale flow analysis for scale-aware urban-canopy models

**作者**: (待补充)

**领域**: 城市CFD, NWP, 建筑解析LES

**方法**:
- 多尺度粗粒化框架 (van Reeuwijk & Huang 2025)
- 布里斯托大学校园建筑解析LES
- 两种形态: 原始布局 vs 填充配置

**关键发现**:
1. 特征城市长度尺度: 原始~256m, 修改后~64m
2. 邻居尺度组织在下一代NWP分辨率下仍然重要
3. 参数化在足够粗糙分辨率表现合理
4. 更细分辨率下保真度迅速下降

**链接**: https://arxiv.org/abs/2605.20571

---

### 2605.20565
**标题**: Simulations of Particle-Laden Flows with Large Dispersed-Phase Size Disparities Using Highly Scalable Parallel Adaptive Methods

**作者**: (待补充)

**领域**: 多相流, LBM, 气泡-粒子交互

**方法**:
- 格子玻尔兹曼方法 (LBM) + 浸入边界法 (IBM)
- 动态自适应八叉树网格
- 并行主机单元搜索算法

**验证**:
- 振荡圆柱感生流动
- 球体沉降

**应用**:
- 气泡-颗粒碰撞 (浮选)
- 均匀各向同性湍流中气泡与惯性点粒子交互

**结果**: 准确捕获水动力拦截机制, 再现理论碰撞效率标度律

**链接**: https://arxiv.org/abs/2605.20565

---

### 2605.20472
**标题**: Entropy-stable discretizations for the compressible Euler equations using simple adaptive averages

**作者**: Carlo De Michele et al.

**领域**: 高阶格式, 熵稳定, 可压缩欧拉

**方法**:
- 适应性平均值应用于密度和内能
- 简化对称均值: 算术, 几何, 谐波
- 渐近熵守恒的相应展开

**特性**:
- 非线性鲁棒性
- 保留动能和压力平衡
- 中心对流项

**链接**: https://arxiv.org/abs/2605.20472

---

### 2605.20250
**标题**: Physics-informed convolutional neural networks for fluid flow through porous media

**作者**: (待补充, cross-list from cs.LG)

**领域**: PINN, 多孔介质, CNN

**方法**:
- 卷积编码器-解码器架构 (带跳跃连接)
- 自定义损失函数:
  - 速度重建
  - 不可压缩性
  - 固体内无流动
  - 周期性约束
  - 全局弯曲度指数一致

**结论**: 作为LBM初始条件使用 → 收敛加速 >90%案例

**链接**: https://arxiv.org/abs/2605.20250

---

### 2605.20046
**标题**: Two-point enstrophy dynamics in homogeneous isotropic turbulence

**作者**: Gabriele Boga, Carlos B. da Silva, Sergio Chibbaro, Andrea Cimarelli

**领域**: 湍流, DNS, 熵定律

**DNS参数**: $140 \lesssim Re_{\lambda} \lesssim 400$

**关键发现**:
1. 两点熵定律预算: $r > 10\eta$ 完全由涡拉伸产生的生产项决定
2. 较小尺度: 扩散输运主导, 阻止惯性熵输运范围出现
3. 惯性熵通量具有双重性质: 直接和反向跨尺度输运的组合
4. 这种双重性质与涡拉伸机制严格相关

**链接**: https://arxiv.org/abs/2605.20046

---

### 2605.19921
**标题**: Parity-Dependent Scaling of Velocity-Gradient Correlations in Turbulence

**作者**: (待补充)

**领域**: 湍流理论, 速度梯度

**关键发现**:
1. 二阶梯度相关与速度相关的Laplacian精确相关
2. 惯性范围标度: $C_2^{1,1}(r)\sim r^{-4/3}$
3. 奇-奇相关: 接近 $r^{-4/3}$, 对阶数弱依赖
4. 偶-偶相关: 系统性不同指数
5. 来源: 梯度场的符号结构
6. 偶-偶指数与间歇性梯度结构的盒计数维度一致

**结论**: 奇偶性是湍流关联的基本组织原则

**链接**: https://arxiv.org/abs/2605.19921

---

### 2605.19774
**标题**: Self-similar breakup of a liquid ligament with a solid particle

**作者**: Sanjay Shukla et al.

**领域**: 多相流, 液柱断裂, Rayleigh-Plateau不稳定性

**发现**:
1. 颗粒诱导扰动触发粘性域中的通用夹断动力学
2. 一旦液柱表面接近颗粒, 断裂变得自相似, 与颗粒大小无关
3. 解析夹断时间表达式 (基于液柱拉伸和Rayleigh-Plateau不稳定性的相互作用)

**链接**: https://arxiv.org/abs/2605.19774

---

### 2605.19468
**标题**: Optimal airfoils in the intermediate Reynolds number range

**作者**: (待补充)

**领域**: 空气动力学, 翼型设计, 低Re数

**参数范围**: Re = 1 ~ 3000 (小型动物和微型飞行器)

**方法**:
- Joukowski翼型
- 滑翔比/续航因子最大化
- 稳态层流N-S求解器 (保角映射 + 二阶有限差分)

**发现**:
1. 零厚度弧形翼型在整个Re范围内全局最优
2. 最优攻角随Re单调递减
3. 最优弯度在 Re≈50-60 附近有显著最大值
4. 低Re (≲100): 大范围弧形形状在最佳值的几个百分点内
5. 高Re (≳1000): 性能景观锐定位在单一首选设计

**链接**: https://arxiv.org/abs/2605.19468

---

### 2605.19589
**标题**: Physics-Informed Graph Neural Network Surrogates for Turbulent Nanoparticle Dispersion in Dental Clinical Environments

**作者**: (待补充, cross-list from cs.LG)

**领域**: GNN, 医疗CFD, 齿科气溶胶

**方法**:
- ELGIN: Eulerian-Lagrangian Graph Interaction Network
- 多头图Transformer + Jacobi预条件学习压力投影 + 湍流闭包头
- sigmoid-gated Lagrangian Interaction Network
- symplectic Stormer-Verlet积分器推进
- 四阶段物理知情课程

**训练**: foam-extend 4.1 OpenFOAM reactingParcelFoam

**结果**: 平均粒子位移误差从19.56%降至16.20%

**链接**: https://arxiv.org/abs/2605.19589

---

### 2605.19565
**标题**: High-Fidelity Computational Fluid Dynamics Dataset for High-Lift Aircraft Aerodynamics

**作者**: Neil Ashton, Adam Clark, Liam Heidt 等 (14位作者)

**领域**: CFD数据集, AI surrogate, 高升力飞机

**数据集**: 1800样本 (180几何变体 × 10攻角)
**几何**: NASA Common Research Model (CRM), 高升力配置
**用途**: AIAA高升力预测研讨会系列

**特点**: GPU加速高保真CFD

**链接**: https://arxiv.org/abs/2605.19565

---

### 2605.19286
**标题**: Prescribed Wall-Heat-Flux Control of Blockage and Impulse in a Rarefied Micro-Nozzle

**作者**: (待补充)

**领域**: 微尺度流动, DSMC, 稀薄流

**方法**: DSMC (直接模拟蒙特卡罗) 氮气流动

**参数**: $Q_w/E$ 从 -10.5% 到 97.3%

**关键发现**:
1. 加热 → 强壁面-体热分层: 壁温超过入口值5倍
2. 冷却 → $T_w-T_b$ 变号区域, Nusselt型响应奇异
3. 加热收缩有效质量承载核心 → 阻塞增加, 质量流率降低
4. 强加热比冲从156s增至201s (热和压力推力增加 outweigh 质量流惩罚)

**链接**: https://arxiv.org/abs/2605.19286

---

## 📊 统计

- **今日 (2026-05-21)**: 11篇新论文
- **昨日 (2026-05-20)**: 19篇新论文  
- **总计**: 30篇 (筛选后约20篇相关)

### 主题分布
- 湍流/LES: 5篇
- 可压缩流/shock: 3篇
- 多相流: 4篇
- 机器学习+CFD: 4篇
- 基础理论: 2篇
- 应用: 3篇

---

## 🔗 相关链接

- [arXiv physics.flu-dyn](https://arxiv.org/list/physics.flu-dyn/recent)
- [arXiv cs.FL](https://arxiv.org/list/cs.FL/recent)

---
*生成时间: 2026-05-21 14:11 UTC*