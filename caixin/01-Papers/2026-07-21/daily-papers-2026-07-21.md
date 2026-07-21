# 流体力学论文日报 | 2026-07-21

> 关键词: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence  
> 数据来源: arXiv physics.flu-dyn (最近24小时)

---

## 1. SPH 方法

### 2607.16670: An SPH model with physically prescribed parameters for droplet dynamics on complex surfaces
- **作者**: Zhonghua Qiao, Yifan Wei, Xianmin Xu
- **链接**: https://arxiv.org/abs/2607.16670
- **日期**: 2026-07-18
- **摘要**: 提出一种基于物理参数标定的SPH (Smoothed Particle Hydrodynamics) 模型，用于模拟复杂表面上的液滴动力学。
  - 单相液滴建模策略降低计算成本
  - 界面处利用SPH核函数近似长程相互作用，压力描述短程相互作用
  - 建立分子势能与宏观表面张力系数之间的显式关系，减少经验参数标定
  - 验证：静态润湿模拟中平衡接触角与Young-Dupré方程吻合良好
  - 成功捕捉复杂动态润湿行为和液滴撞击过程

**创新点**: 
- 物理参数显式关系替代经验校准
- 单相建模提高效率

**数值方法**: SPH

**计算成本**: 相比传统两相SPH计算效率提升

---

## 2. 湍流建模

### 2607.17376: Solver-in-the-loop training of deep learning closures for large-eddy simulation
- **作者**: Priyesh Kakka, Jonathan F. MacArt
- **链接**: https://arxiv.org/abs/2607.17376
- **日期**: 2026-07-19
- **摘要**: 将求解器嵌入训练循环 (solver-in-the-loop)，训练深度学习大涡模拟 (LES) 湍流闭合模型。

**创新点**: 
- 端到端学习物理一致的LES闭合项
- 求解器反馈保证数值稳定性

**数值方法**: LES + Deep Learning

### 2607.17357: Differentiable Hybrid Neural-CFD Modelling of Wall-Bounded Turbulence: Coupled Learning
- **作者**: Xiantao Fan, Yi Liu, Meng Wang
- **链接**: https://arxiv.org/abs/2607.17357
- **日期**: 2026-07-19
- **摘要**: 提出可微分混合神经-CFD方法用于壁湍流建模，实现神经网络的耦合学习。

**创新点**: 
- 神经网络与CFD求解器联合训练
- 可微分编程实现梯度反传

**数值方法**: RANS/DNS混合 + Neural Network

### 2607.18058: A machine-learned probability distribution in the phase space of turbulent channel flow
- **作者**: Frederik Aerts, Dirk Nuyens, Johan Meyers
- **链接**: https://arxiv.org/abs/2607.18058
- **日期**: 2026-07-20
- **摘要**: 在湍流沟道流相空间中学习概率分布，用于改进湍流统计建模。

**创新点**: 
- 相空间概率分布的机器学习表示
- 高维湍流统计的降维建模

**应用场景**: 湍流通道流

### 2607.16654: Experimental and numerical investigation on preferential alignment of Kolmogorov-size fibers in turbulent channel flow
- **作者**: Eliza Coliban, Domenico Zaza, Alfredo Soldati
- **链接**: https://arxiv.org/abs/2607.16654
- **日期**: 2026-07-18
- **摘要**: 结合实验 (TU Wien湍流水洞) 和DNS研究Kolmogorov尺度纤维在湍流通道流中的优先对齐。
  - $Re_τ = 300, 550$
  - 纤维优先与当地涡量方向对齐
  - 最强对齐出现在Lagrangian拉伸的主方向

**创新点**: 
- 时间分辨体测量技术
- 纤维轨迹与速度梯度张量重建

**数值方法**: DNS + 实验

### 2607.16908: Large Eddy Simulation of Plunging Flows in Laboratory-Scale Bedrock Rivers
- **作者**: Jayanga T. Samarasinghe, Laura V. Alvarez, Max Hurson
- **链接**: https://arxiv.org/abs/2607.16908
- **日期**: 2026-07-18
- **摘要**: 使用LES模拟实验室尺度基岩河流的俯冲流 (plunging flows)。

**数值方法**: LES

**应用场景**: 水力学、地貌学

---

## 3. 稳定性分析与边界条件

### 2607.17864: Physically Consistent Outflow Boundary Conditions for Global Stability Analysis of Bluff Body Wakes
- **作者**: Guangyao Cui, Amit Sigawi, Michael Karp
- **链接**: https://arxiv.org/abs/2607.17864
- **期刊**: J. Comput. Phys., 565, 115191 (2026)
- **日期**: 2026-07-20
- **摘要**: 针对钝体尾迹流动的全局线性稳定性分析，研究出口边界条件的影响。
  - 重点：在保证精度的同时最小化计算域尺寸
  - 评估多种出口边界条件：Dirichlet, Neumann, 外推, 无应力, 海绵层, Robin条件
  - Robin条件（含局部线性稳定性分析预测）使全局模态在截断域内收敛
  - 适用于Floquet分析和可压缩构型扩展

**创新点**: 
- Robin边界条件结合局部线性稳定性预测
- 显著减小计算域同时保持精度

**数值方法**: 有限差分 + 全局稳定性分析 (Matrix-forming method)

### 2607.17702: Generalized Reynolds Analogy for Compressible Turbulent Boundary Layers: Unified Velocity-Temperature Relations from Mean to Fluctuating Field
- **作者**: You-sheng Zhang
- **链接**: https://arxiv.org/abs/2607.17702
- **日期**: 2026-07-20
- **摘要**: 推广雷诺 analogy (GRA) 到可压缩湍流边界层，建立从平均场到涨落场的统一速度-温度关系。
  - 瞬时相似律：广义总焓（减去壁面值）与当地速度成正比
  - 涨落场闭合关系：$T'_{rms}/u'_{rms} = |a_u^{-1/2}Pr^{-1/4}Pr_m^{-1/2}\,\partial\bar{T}/\partial\bar{u}|$
  - 从三个普适性导出：无自由参数
  - 精确恢复RSRA结果并解释其拟合系数

**创新点**: 
- 从普适性原理推导而非经验关系
- 统一描述平均场和涨落场

**数值方法**: 可压缩边界层DNS验证

---

## 4. CFD数值方法

### 2607.18123: A Low-Storage Implicit Dual-Time Finite-Volume Framework for Radio-Frequency Capacitively Coupled Plasma Fluid Simulations
- **作者**: Yuze Zhu, Hangkong Wu, Junzhe Cao
- **链接**: https://arxiv.org/abs/2607.18123
- **日期**: 2026-07-20
- **摘要**: 针对射频电容耦合等离子体(CCP)的低存储隐式双时间有限体积框架。
  - 克服低温等离子体建模中的严重数值刚性和时间步约束
  - 物理时间推进通过BDF (后向差分公式) 解耦显式稳定性限制
  - 伪时间迭代求解非线性系统
  - 局部块隐式松弛处理输运和化学源项
  - 半隐式Poisson方程加速静电耦合

**创新点**: 
- 低存储隐式格式
- 局部块隐式松弛避免大规模内存开销

**数值方法**: 有限体积 + 双时间推进 + BDF

**计算成本**: 比传统全隐式求解器内存友好

### 2607.17836: A coupled Eulerian Lagrangian approach for fluid and particle dynamics
- **作者**: Snehanshu Maiti, Rajaraman Ganesh
- **链接**: https://arxiv.org/abs/2607.17836
- **日期**: 2026-07-20
- **摘要**: 欧拉-拉格朗日耦合方法用于流体与粒子动力学。

**创新点**: 
- 欧拉与拉格朗日描述的无缝耦合

**数值方法**: Coupled Eulerian-Lagrangian

---

## 5. 多相流与对流

### 2607.17918: Transition to chaos in two-dimensional Rayleigh-Bénard convection: the role of the magnetic field
- **作者**: Francis F. Franco, Gabriel de T. Paula, Roman Chertovskih
- **链接**: https://arxiv.org/abs/2607.17918
- **日期**: 2026-07-20
- **摘要**: 研究外加磁场对二维Rayleigh-Bénard对流(RBC)转混沌的影响。
  - 无磁场基准：行波卷，过渡到混沌行波
  - 磁场增加行波动力学出现频率
  - 磁场促进对流卷的分裂/断裂，可能是二维湍流过渡机制
  - 鞍点和卷心的碰撞恢复系统原始拓扑
  - 碰撞时磁涡旋分裂为二（磁重联）

**创新点**: 
- 磁场控制对流到湍流的转变路径
- 发现磁重联在对流混沌化中的作用

**数值方法**: 2D DNS / RBC

### 2607.17057: Electric modification of mode competition in viscous films with insoluble surfactants
- **作者**: Jun Gao, Xiaocong Yang, Senlin Zhu
- **链接**: https://arxiv.org/abs/2607.17057
- **日期**: 2026-07-19
- **摘要**: 电场对含有不溶性表面活性剂的粘性薄膜模式竞争的电修饰。

**应用场景**: 薄膜流、表面活性剂

---

## 6. 其他

### 2607.17297: Multi-Granularity Conformal Prediction for Reliable Neural-Operator Automotive Applications
- **作者**: Chundong Jia, Chao Xia, Alexey Vdovin
- **链接**: https://arxiv.org/abs/2607.17297
- **日期**: 2026-07-19
- **摘要**: 面向神经算子汽车应用的多粒度保角预测可靠性方法。

**创新点**: 
- 不确定性量化用于神经算子预测

---

## 📊 论文统计

| 日期 | 论文数 | 关键词分布 |
|------|--------|-----------|
| 2026-07-21 | 13 | SPH(1), Turbulence(5), LES(2), Stability(1), CFD(2), DNS(2) |

## 🔬 技术趋势

1. **AI+CFD融合**: 4篇论文涉及机器学习/深度学习与CFD的结合
   - Deep learning closures for LES
   - Differentiable hybrid neural-CFD
   - Machine-learned probability distribution
   - Neural operator with conformal prediction

2. **边界条件研究**: 出口边界条件对稳定性分析精度的影响受到关注

3. **等离子体CFD**: 低存储隐式方法在低温等离子体模拟中的应用

---

*由 鲜毛肚 (Xianmaodu) 自动生成 | 数据来源: arXiv physics.flu-dyn*
