# 流体力学论文收集 | 2026-08-02

> 来源: arXiv physics.flu-dyn | 关键词: CFD, fluid simulation, Navier-Stokes, SPH, LBM, turbulence
> 收集时间: 2026-08-02 14:13 UTC

---

## Paper 1: Compressible Solved-Volatility Stochastic Fluid Thermodynamics

- **arXiv**: [2607.28333](https://arxiv.org/abs/2607.28333)
- **作者**: Hsieh-Chen Tsai
- **领域**: 可压缩湍流 / 随机流体热力学
- **日期**: 2026-07-30
- **链接**: [[2607.28333]](https://arxiv.org/abs/2607.28333)

### 核心创新点
- 为 solved-volatility stochastic-fluid 框架开发了**可变密度热力学扩展**
- 源一致的随机输运方程分离质量、动量和总能守恒
- **有限相关储层** + Green-Kubo 校准 + 平衡对消项
- **随机 Gibbs 恒等式** + Gaussian 相对熵 → Hencky 储层形式的条件熵容许性结果
- 零波动极限下恢复经典可压缩 Navier-Stokes-Fourier 方程
- 混合**双曲-抛物**漂移子系统 + 代数鞅约束

### 关键词
#随机流体 #可压缩流 #Navier-Stokes #湍流闭合 #熵容许性

---

## Paper 2: Mesh Adaptation for Immersed Boundary Methods

- **arXiv**: [2607.27580](https://arxiv.org/abs/2607.27580)
- **作者**: Jonatan Nunez
- **领域**: CFD / 网格生成 / 浸入边界法
- **日期**: 2026-07-30
- **链接**: [[2607.27580]](https://arxiv.org/abs/2607.27580)

### 核心创新点
- 针对**混合非结构网格**开发网格自适应预处理工具
- 支持四面体、六面体、棱柱、金字塔等混合单元
- 在浸入几何体周围精细化网格 → 准确高效的 CFD 求解
- 固定几何部分用 body-fitted mesh，变化几何部分用**浸入边界法 (IBM)**
- 验证案例: 圆柱绕流、NACA0012 翼型、多段翼 (slat+main+flap)
- 求解器: **有限体积法** + **间断 Galerkin** (RANS)
- 与实验数据吻合良好

### 关键词
#浸入边界法 #非结构网格 #网格自适应 #Navier-Stokes #RANS

---

## Paper 3: Modified Dynamic Mixed Subgrid-scale Models for Geophysical Flows

- **arXiv**: [2607.27567](https://arxiv.org/abs/2607.27567)
- **作者**: Anantha Narayanan Suresh Babu
- **领域**: LES / 湍流建模 / 大气海洋湍流
- **日期**: 2026-07-30
- **链接**: [[2607.27567]](https://arxiv.org/abs/2607.27567)

### 核心创新点
- 针对**地转湍流**的 LES 子网格尺度 (SGS) 模型改进
- **Dynamic Mixed Models (DMMs)**: 结合功能涡粘模型 + 结构闭合
- 问题: 经典最小二乘估计被结构分量主导 → 功能分量耗散正则化受限
- 提出 **Modified Gram-based 框架**: 可调结构-功能平衡的全新参数族
- 评估: Leith 模型 + 四阶非线性梯度模型
- **a priori** 结果: 结构主导模型与理想 SGS forcing 强一致
- **a posteriori** 发现: 结构主导模型有高频噪声 → 顺序 DMM 保留结构精度同时改善后验

### 关键词
#LES #湍流建模 #子网格尺度 #大尺度涡模拟 #地转湍流 #backscatter

---

## Paper 4: Kinetic Linear Stability Theory for High-Speed Compressible Flows

- **arXiv**: [2607.27440](https://arxiv.org/abs/2607.27440)
- **作者**: Irmak Taylan Karpuzcu
- **领域**: 可压缩流 / 激波稳定性 / 分子动理论
- **日期**: 2026-07-29
- **链接**: [[2607.27440]](https://arxiv.org/abs/2607.27440)

### 核心创新点
- 首次开发**动理论线性稳定性理论 (kLST)** 用于一维法向激波
- 将 **Boltzmann-BGK 方程** 线性化（而非 Navier-Stokes 或矩封闭）
- 扰动用约化分布函数 (VDF) 表示 → 稳定性算子作用于 VDF 而非封闭连续统系统
- 验证: 与压缩 Couette 特征值基准吻合
- 应用: 氩气激波 M∞=1.2, 3.0, 4.0
- 发现: 高马赫数下，动理论效应使谱移向**较不稳定区域**（连续统预测可能遗漏）
- 高性能计算: SLEPc/PETSc, shift-and-invert Arnoldi + MUMPS, Jacobi-Davidson + block-Jacobi ILU
- 最高达 O(10^5) 未知量 + 数十亿非零元

### 关键词
#Boltzmann-BGK #激波稳定性 #可压缩流 #动理论 #线性稳定性 #HPC

---

## Paper 5: Sub-grid-scale Model for Polydisperse Bubbly Flows

- **arXiv**: [2607.27426](https://arxiv.org/abs/2607.27426)
- **作者**: Anand Radhakrishnan
- **领域**: 多相流 / 气泡流 / 相变传热传质
- **日期**: 2026-07-29
- **链接**: [[2607.27426]](https://arxiv.org/abs/2607.27426)

### 核心创新点
- 多分散气泡流的**集合平均模型**改进
- 旧问题: 多项式状态方程忽略气泡壁面**传热传质**
- 新方法: **恒定传输方程** 用于气泡压力和蒸汽质量（条件双曲求积法）
- 每平衡半径 bin 产生 4 个联合半径-径向速度节点
- 实现于 **MFC** (Multiphase Flow Code)
- 恒定传输计算避免了多项式封闭的高频压力振荡
- 3D 气泡屏计算: 1.5% 相对 RMS 误差

### 关键词
#多相流 #气泡流 #传热传质 #Euler-Euler #MFC #多项式状态方程

---

## Paper 6: SPH Model with Physically Prescribed Parameters for Droplet Dynamics

- **arXiv**: [2607.16670](https://arxiv.org/abs/2607.16670)
- **作者**: Yifan Wei
- **领域**: SPH / 润湿动力学 / 接触角
- **日期**: 2026-07-18
- **链接**: [[2607.16670]](https://arxiv.org/abs/2607.16670)

### 核心创新点
- **物理参数预定的 SPH 模型** 用于复杂表面液滴动力学
- 单相液滴建模策略（降低计算成本）
- 界面处理: 长程相互作用用 SPH 核函数近似，短程相互作用用压力表示
- **显式关系**: 分子间势能 ↔ 宏观表面张力系数 → 减少经验参数标定
- 验证: 静态润湿模拟（接触角与 Young-Dupré 方程吻合良好）
- 动态润湿和液滴撞击仿真验证

### 关键词
#SPH #液滴动力学 #表面张力 #润湿 #接触角 #Young-Dupré

---

## Paper 7: SPH Methods in the Modelling of Compact Objects (Review)

- **arXiv**: [2607.14828](https://arxiv.org/abs/2607.14828)
- **作者**: Stephan Rosswog
- **领域**: SPH / 天体物理 / 致密天体
- **日期**: 2026-07-16
- **链接**: [[2607.14828]](https://arxiv.org/abs/2607.14828)

### 核心创新点
- **Living Reviews in Computational Astrophysics** 特邀综述（183页）
- 综述内容:
  1. SPH 作为牛顿理想气体动力学数值方法（基础 + 最新进展：meshless 导数、激波处理）
  2. **广义相对论 SPH**（包括狭义相对论极限）+ 完整数值相对论（时空与物质联合演化）
  3. 白矮星-白矮星、中子星-中子星、中子星-黑洞系统的引力波驱动并合模拟
- 强调自包含性，可作为 SPH 入门教程

### 关键词
#SPH #致密天体 #引力波 #广义相对论 #白矮星 #中子星 #并合

---

## Paper 8: Solved-Volatility Stochastic Turbulence Closure (Foundations)

- **arXiv**: [2607.25536](https://arxiv.org/abs/2607.25536)
- **作者**: Hsieh-Chen Tsai
- **领域**: 随机湍流闭合 / 随机微分方程
- **日期**: 2026-07-28
- **链接**: [[2607.25536]](https://arxiv.org/abs/2607.25536)

### 核心创新点
- 不同于大多数随机闭合（给定协方差张量/噪声基/涡粘场）
- **位移波动场与解析速度联合求解**（solved-volatility）
- 从单通道 Itô 配置映射出发
- 局部矩阵对数展开 → 物质 Hencky 增量 + 空间 Hencky 增量
- 恒定密度 + 路径等体积约束 → 随机 Reynolds 输运平衡的壳上形式
- 速度-波动-压力系统：**指数-1 微分-代数结构**
- 给出四个极限：平庸布朗传输限制、非零布朗传输限制、壁切向限制协方差秩等

### 关键词
#随机湍流闭合 #Itô演算 #Hencky应变 #solved-volatility #Reynolds输运

---

## Paper 9: Generative Diffusion Model for Turbomachinery Design

- **arXiv**: [2607.27093](https://arxiv.org/abs/2607.27093)
- **作者**: Yingfan Geng
- **领域**: 机器学习 / 透平机械设计 / 生成模型
- **日期**: 2026-07-29
- **链接**: [[2607.27093]](https://arxiv.org/abs/2607.27093)

### 核心创新点
- **去噪扩散模型** 用于 3D 透平机械逆设计（以离心压缩机为代表）
- 输入: 设计条件（质量流量、转速）+ 目标性能（压比、效率）
- 输出: 满足条件的 3D 压缩机几何
- **直接使用 3D 叶片几何坐标**训练（非参数化表示）
- 解精度达 99%，不可行设计 <1%
- 首次将坐标学习引入透平机械设计

### 关键词
#生成模型 #扩散模型 #透平机械 #CFD #逆设计 #机器学习

---

## Paper 10: Intermittent Flow Structures and Anomalous Scaling in Turbulence

- **arXiv**: [2607.26896](https://arxiv.org/abs/2607.26896)
- **作者**: Ritwik Mukherjee
- **领域**: 湍流 / 间歇性 / 多重分形
- **日期**: 2026-07-29
- **链接**: [[2607.26896]](https://arxiv.org/abs/2607.26896)

### 核心创新点
- 湍流中间歇性（强涡旋 + 尖锐耗散峰）→ Kolmogorov 自相似理论失效
- **滤波方法**: 涡量阈值化 + Biot-Savart 定律反演 → 生成滤波速度场
- 去除极端涡量贡献后: 能谱标度保持，bottleneck 平坦化，结构函数标度趋向 Kolmogorov 值
- 对横向指数更快生效
- 多重分形程度随间歇性过滤而降低
- **Biot-Savart 方法**可选择性去除间歇性影响

### 关键词
#湍流 #间歇性 #Biot-Savart #多重分形 #Kolmogorov #能量谱 #bottleneck

---

## Paper 11: Learning Backward Transport for Source Localization

- **arXiv**: [2607.26892](https://arxiv.org/abs/2607.26892)
- **作者**: Maurizio Carbone
- **领域**: 湍流输运 / 源定位 / Schrödinger 桥
- **日期**: 2026-07-29
- **链接**: [[2607.26892]](https://arxiv.org/abs/2607.26892)

### 核心创新点
- 流场中化学源定位问题
- 利用浓度场与拉格朗日迹线的对偶性
- **Schrödinger 桥** 框架: 发射位置 ↔ 检测点之间建立反向传播
- 通过 Langevin 动力学采样候选发射位置
- 揭示 chemotaxis 和 cast-and-surge 作为单一输运原理的互补行为
- 在 2D 湍流中验证: 单一 Galilean 不变学习传播器优于经典策略

### 关键词
#Schrödinger桥 #源定位 #被动示踪剂 #Langevin动力学 #湍流搜索

---

## Paper 12: Modified MRF Method for Propeller Resolution

- **arXiv**: [2607.24630](https://arxiv.org/abs/2607.24630)
- **作者**: Denis Andreev
- **领域**: 船舶 CFD / 螺旋桨 / MRF 方法
- **日期**: 2026-07-27
- **链接**: [[2607.24630]](https://arxiv.org/abs/2607.24630)

### 核心创新点
- **Modified Moving Reference Frame (mMRF)** 方法改进螺旋桨-船体相互作用
- 问题: 经典 MRF 无法捕捉非稳态相互作用；滑移界面 (SI) 计算昂贵
- 部分旋转网格在旋转和静止域之间引入速度场不连续
- **mMRF**: 参考坐标系旋转速率由空间变化函数平滑缩放（从螺旋桨附近 1 衰减到界面 0）
- 恢复速度和压力跨界面连续性
- 在 FreSCo⁺ RANS 求解器中实现
- 验证: Taylor-Couette 解析解 + 敞水螺旋桨 + JBC 自推进仿真

### 关键词
#MRF #螺旋桨 #船体相互作用 #RANS #滑移界面 #CFD

---

## 统计摘要

| 类别 | 数量 |
|------|------|
| 湍流建模 / LES | 3 |
| SPH 方法 | 2 |
| 可压缩流 / 激波 | 1 |
| 多相流 | 1 |
| 浸入边界 / 网格 | 1 |
| 机器学习 + CFD | 1 |
| 随机流体 / 湍流闭合 | 2 |
| 透平机械设计 | 1 |
| 源定位 / 输运 | 1 |
| 螺旋桨 CFD | 1 |

> 本地存储: `~/knowledge-vault/caixin/01-Papers/2026-08/`
