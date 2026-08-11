# 每日论文搜索报告
**日期**: 2026-08-11
**搜索范围**: arXiv physics.flu-dyn, cs.FL
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

## 统计
- physics.flu-dyn 本期新提交: 17 篇 (2026-08-11)
- 筛选相关论文: 12 篇
- 涉及主题: 湍流, 多相流, PINN, 液滴动力学, 气泡流, 微通道

---

## 今日发现的相关论文

### 1. Memory-Generated Transport Geometry (2608.09607)
- **主题**: 记忆生成传输几何——曲率、全息与不可逆性
- **关键词**: 非马尔可夫输运, 几何结构, 曲率不变量
- **领域**: 基础理论 / 输运理论
- **URL**: https://arxiv.org/abs/2608.09607

### 2. Exact Solution: Rigid Particle with S4/C2v Symmetry (2608.09585)
- **主题**: S4和C2v对称性刚性颗粒在粘性流体中的沉降精确解
- **关键词**: 低Re数, 椭圆积分, 准周期运动, 蓓蕾花形轨迹
- **领域**: 颗粒-流体相互作用 / 低Re数流
- **URL**: https://arxiv.org/abs/2608.09585

### 3. Turbulence Anisotropy in Bubbly Vertical Channel Flow (2608.08763)
- **主题**: 气泡垂直通道流中具有拓扑变化（破碎/合并）的湍流各向异性
- **关键词**: DNS, 气泡引起的湍流(BIT), 湍流各向异性, 扫掠事件
- **领域**: 多相湍流 / 通道流
- **URL**: https://arxiv.org/abs/2608.08763

### 4. Oldroyd B Drop in Alternating Electric Field (2608.08699)
- **主题**: 交变电场中Oldroyd-B液滴的变形动力学
- **关键词**: 电-hydrodynamics, 黏弹性流体, Basilisk, 液滴变形/破碎
- **领域**: 电-Hydrodynamics / 黏弹性液滴
- **URL**: https://arxiv.org/abs/2608.08699

### 5. Data-Driven Surrogate for Non-Newtonian Micromixing (2608.08547)
- **主题**: 正弦收敛-发散微通道中非牛顿流体微混合的数据驱动代理建模
- **关键词**: GPR代理模型, NSGA-II, Carreau-Yasuda流体, 微通道
- **领域**: Microfluidics / 机器学习CFD
- **URL**: https://arxiv.org/abs/2608.08547

### 6. K41 Scaling in Bubble-Induced Turbulence (2608.08502)
- **主题**: 气泡引起湍流中K41标度的单泡尾流起源
- **关键词**: DNS, Kolmogorov K41, 气泡尾流, 标度律
- **领域**: 湍流理论 / 多相流
- **URL**: https://arxiv.org/abs/2608.08502

### 7. Correlated Collisions and History Filtering (2608.08379)
- **主题**: 湍流中碰撞关联与历史滤波——从幽灵粒子框架解析和重现聚并粒子统计
- **关键词**: DNS, 碰撞核, 径向分布函数, 幽灵粒子, 聚并
- **领域**: 湍流颗粒相互作用 / 碰撞统计
- **URL**: https://arxiv.org/abs/2608.08379

### 8. Eikonal Regularisation in PINNs for 3D Level-Set Advection (2608.08322)
- **主题**: 3D Level-Set平流中Eikonal正则化PINN——2D设计原则的可迁移性
- **关键词**: PINN, Level Set, Eikonal正则化, FBPINN, 界面追踪
- **领域**: PINN / 界面方法
- **URL**: https://arxiv.org/abs/2608.08322

### 9. FBPINNs with Hard Constraints for Perforated Domains (2608.08114)
- **主题**: 有限基PINN与硬约束求解高渗透率多孔域粘性流体Stokes方程
- **关键词**: FBPINN, 硬约束, 多孔介质, Stokes方程, 领域分解
- **领域**: PINN / 多孔介质流
- **URL**: https://arxiv.org/abs/2608.08114

### 10. Splashing Velocity of Viscous Liquid Squeezed Between Disks (2608.07960)
- **主题**: 两平行圆盘挤压粘性液体的飞溅速度
- **关键词**: 挤压薄膜, 飞溅速度, 惯性效应, 理论框架
- **领域**: 液滴撞击 / 自由表面流
- **URL**: https://arxiv.org/abs/2608.07960

### 11. ABL Characterisation in 10'x5' Wind Tunnel (2608.07764)
- **主题**: 10'x5'风洞中大气边界层(ABL)的设置与表征
- **关键词**: 风洞, ABL, Irwin spires, LDA, 海上风电
- **领域**: 实验流体力学 / 风工程
- **URL**: https://arxiv.org/abs/2608.07764

### 12. Neural Operators for Immersed-Boundary Soft Swimmers (2608.07722)
- **主题**: 浸入边界软体游动器的神经算子代理模型
- **关键词**: 神经算子, 浸入边界法, 软体机器人, 流场预测
- **领域**: 机器学习CFD / 流固耦合
- **URL**: https://arxiv.org/abs/2608.07722

---

## 值得关注的新趋势

1. **PINN + 领域分解**: FBPINNs在多孔/穿孔域的应用，hard constraints替代soft penalties
2. **气泡湍流K41标度**: 证明K41标度来自单泡尾流叠加，为多相湍流建模提供新视角
3. **神经算子代理**: 浸入边界流的神经算子预测，3D压力场仍是挑战(19.2%误差)
4. **记忆生成几何**: 非马尔可夫输运的纯运动学不可逆性机制，无需涡度或对称性破缺

## 工具与数据集
- **DNS代码**: Basilisk (用于电-Hydrodynamics液滴模拟)
- **实验设备**: LDA, 多孔探针, Irwin spires风洞
- **代理模型**: GPR, NSGA-II, 神经算子 (DeepONet/福辐射神经网络)
