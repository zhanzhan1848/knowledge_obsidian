# 每日论文收集 — 2026-07-17

> 来源: arXiv physics.flu-dyn (2026-07-16/17 更新)  
> 收集时间: 2026-07-17 14:10 UTC

---

## 📋 今日论文列表

| 序号 | arXiv ID | 标题 | 标签 |
|------|----------|------|------|
| 1 | 2607.14796 | Exploring 2D turbulent properties in anisotropic and disordered Fourier space | turbulence, inverse cascade, 2D turbulence |
| 2 | 2607.14944 | Harnessing Machine Learning for Hybrid Constitutive Modelling of Viscoelastic Fluid Flows | ML, viscoelastic, constitutive model |
| 3 | 2607.15087 | Split Complex-Valued Physics-Informed Neural Networks for Forward and Inverse Nonlinear PDEs | PINN, neural network, N-S equation |
| 4 | 2607.14298 | Orientation Dynamics of Rigid Fibers in a Microfluidic Burgers-like Vortex | fiber dynamics, microfluidics, vortex |
| 5 | 2607.14322 | Interfacial-Thermo-Fluid-Adhesion Dynamics of Evaporating Capillary Bridges | multiphase, evaporation, capillary |
| 6 | 2607.15078 | A Thermodynamically Consistent Manifold Model for Premixed Deflagrations & Detonations | combustion, LES, detonation |
| 7 | 2607.15199 | Diffusioosmosis of electrolyte solutions in axisymmetric channels | microfludics, diffusioosmosis |
| 8 | 2607.15239 | Flow in a porous non-axisymmetric annular conduit: Coupling wall compliance and peristalsis | porous media, FSI, peristalsis |
| 9 | 2607.15155 | The Effect of Heat Loss During the Early Stages of Flame Propagation and Tulip Flame Formation | combustion, DNS, flame dynamics |
| 10 | 2607.15122 | Fluidic hysterons and memory in flow networks | hysteron, flow networks, memory |

---

## 📝 详细笔记

---

### Paper 1: 2607.14796 — Exploring 2D turbulent properties in anisotropic and disordered Fourier space

**作者**: Francesco Carbone et al.  
**链接**: https://arxiv.org/abs/2607.14796  
**DOI**: https://doi.org/10.48550/arXiv.2607.14796  
**发表**: 2026-07-16  
**领域**: [[turbulence]], [[2D turbulence]], [[inverse cascade]]

#### 核心创新点
- 在 "low-density" Galerkin-truncated 系统中研究 2D 湍流特性
- 使用有序伪对数分布和无序分布采样傅里叶空间中的主动三向相互作用
- 可调节的各向异性和"三向密度"，研究对逆能量串级和粒子对扩散的影响

#### 控制方程/模型
- 准对数分布和无序分布的主动三向采样
- 湍流双串级: $k^{-5/3}$ 逆串级（大尺度）和 $k^{-3}$ 正串级（小尺度）
- Richardson 超扩散标度: $\ell^2(t) \sim t^3$
- 长时退化为经典布朗标度: $\ell^2(t) \sim t$

#### 数值方法
- Galerkin 截断方法
- 傅里叶空间离散化

#### 关键发现
- 非均匀各向异性网格成功捕捉 2D 湍流标度律
- 各向异性主要影响涡量场组织和逆能量通量效率
- 各向异性不影响粒子对的超扩散标度，只影响振幅
- 短期 Lagrangian 涡流扩散在各向异性方向增强

#### CFD 相关性
- ✅ 湍流建模参考
- ✅ 2D 湍流逆串级研究
- ✅ Lagrangian 粒子追踪方法

---

### Paper 2: 2607.14944 — Harnessing Machine Learning for Hybrid Constitutive Modelling of Viscoelastic Fluid Flows

**作者**: Monica Oliveira et al.  
**链接**: https://arxiv.org/abs/2607.14944  
**DOI**: https://doi.org/10.48550/arXiv.2607.14944  
**发表**: 2026-07-16  
**领域**: [[machine learning]], [[viscoelastic]], [[constitutive model]]

#### 核心创新点
- 结合 Tensor Basis Neural Networks (TBNN) 和 Universal Differential Equations (UDE)
- 提出降维张量基 formulation，增强物理一致性和数值稳定性
- UDE 架构嵌入开源有限体积求解器
- 仅用振荡剪切流数据训练，泛化到未见过的流动类型

#### 模型框架
- TBNN + UDE 混合架构
- 框架不变量 (frame-invariant) 本构模型
- 运行时根据局部流体条件动态生成本构响应

#### 验证案例
- 4:1 突然收缩流动
- Cross-slot 流动
- 粘弹性 extensional flows
- 2D 和 3D 基准流动

#### 关键发现
- 训练数据: 振荡剪切流
- 可捕捉强 extensional flow 中流动诱导弹性不稳定性的启动和增长
- 外推精度随外推程度降低
- 加入第一正应力差信息可进一步提高精度

#### CFD 相关性
- ✅ 数据驱动本构模型
- ✅ 有限体积法求解器集成
- ✅ 粘弹性流体 CFD

---

### Paper 3: 2607.15087 — Split Complex-Valued Physics-Informed Neural Networks for Forward and Inverse Nonlinear PDEs

**作者**: Biswanath Barman et al.  
**链接**: https://arxiv.org/abs/2607.15087  
**DOI**: https://doi.org/10.48550/arXiv.2607.15087  
**发表**: 2026-07-16  
**领域**: [[PINN]], [[neural network]], [[Navier-Stokes]]

#### 核心创新点
- 提出 Split Complex-Valued PINN (SCV-PINN)
- 网络参数和隐表示定义在复数域
- Split 复数值激活函数: 独立应用实值激活到实部和虚部
- 同时学习振幅和相位信息

#### 验证的 PDEs
| 案例 | 类型 |
|------|------|
| Burgers | Forward |
| Allen-Cahn | Forward |
| Korteweg-de Vries | Forward |
| 非线性 Schrödinger | Forward |
| Helmholtz | Forward |
| Poisson | Forward |
| Kovasznay flow (Re=20) | Forward |
| Lid-driven cavity (Re=100) | Forward |
| Lorenz system | Forward |
| Inverse Burgers | Inverse |
| Inverse Navier-Stokes (Re=100) | Inverse |
| 3D Navier-Stokes Beltrami flow | Inverse |

#### 关键结果
- Beltrami 基准: 相对 L2 误差 $4.07 \times 10^{-5}$
- 相比 RV-PINNs 和现有 PINN 变体始终更低相对 L2 误差
- 更准确的参数识别

#### CFD 相关性
- ✅ PINN 求解 N-S 方程
- ✅ 流体力学反问题
- ✅ 高频/振荡动力学

---

### Paper 4: 2607.14298 — Orientation Dynamics of Rigid Fibers in a Microfluidic Burgers-like Vortex

**作者**: Marine Aulnette et al.  
**链接**: https://arxiv.org/abs/2607.14298  
**DOI**: https://doi.org/10.48550/arXiv.2607.14944  
**发表**: 2026-07-15  
**领域**: [[fiber dynamics]], [[microfluidics]], [[vortex]], [[Jeffery equation]]

#### 核心创新点
- 结合微流控实验、理论和数值模拟
- 研究中等雷诺数下稳态流向涡流中刚性中性纤维的取向动力学
- 3D 流动，取向动力学却很简单

#### 理论模型
- Jeffery 方程 + Burgers 涡流模型
- 纤维绕涡轴均匀进动，同时因应变与涡量对齐
- 两个运动解耦:
  - 对齐时间尺度由局部应变率和纤维长径比决定

#### 关键发现
- 有限粒子尺寸和惯性导致轻微偏离基准流线
- 取向动力学基本不受影响
- 为理解拉伸涡流中细长颗粒行为提供简单框架

#### CFD 相关性
- ✅ 纤维/颗粒悬浮 CFD
- ✅ 涡流-颗粒相互作用
- ✅ 微流控

---

### Paper 5: 2607.14322 — Interfacial-Thermo-Fluid-Adhesion Dynamics of Evaporating Capillary Bridges

**作者**: Purbarun Dhar et al.  
**链接**: https://arxiv.org/abs/2607.14322  
**DOI**: https://doi.org/10.48550/arXiv.2607.14322  
**发表**: 2026-07-15  
**领域**: [[multiphase]], [[evaporation]], [[capillary]], [[level set]]

#### 核心创新点
- 研究弯曲固体基底间蒸发毛细桥的粘附动力学
- 开发完全耦合瞬态数值框架
- Level set 方法确定平衡毛细轮廓
- ALE (Arbitrary Lagrangian Eulerian) 框架追踪移动气液界面

#### 研究参数
- 基底曲率
- 表面润湿性
- 固体热导率

#### 关键发现
- 亲水和超疏水毛细桥蒸发特性受基底曲率和热导率强烈影响
- 增加基底曲率和热导率有利于增强界面传质
- 非均匀蒸汽通量产生空间变化的蒸发冷却，驱动内部热毛细循环
- Marangoni 流动主导浮力诱导流动
- 增加基底曲率降低总毛细力

#### CFD 相关性
- ✅ 多相流 CFD
- ✅ 界面追踪方法
- ✅ Level Set + ALE 方法

---

### Paper 6: 2607.15078 — A Thermodynamically Consistent Manifold Model for Premixed Deflagrations & Detonations

**作者**: John Boerchers et al.  
**链接**: https://arxiv.org/abs/2607.15078  
**DOI**: https://doi.org/10.48550/arXiv.2607.15078  
**发表**: 2026-07-16  
**领域**: [[combustion]], [[LES]], [[detonation]], [[turbulent combustion]]

#### 核心创新点
- 流形基湍流燃烧模型，确保模型和流动求解器间热力学状态完全一致
- 通过迭代程序实现一致性
- 重现温度、自由基物种和源项分布

#### 解决的问题
- 现有方法依赖低马赫扰动或无热力学一致性的表格化 ZND 爆轰的局限性

#### 验证
- 1D 数据
- 高保真 RDE 类数据

#### 关键发现
- 在宽范围可压缩火焰工况下性能优于现有方法
- 涵盖爆燃和爆轰
- 可应用于旋转爆轰发动机和其他超音速燃烧系统

#### CFD 相关性
- ✅ LES 湍流燃烧
- ✅ 可压缩流
- ✅ 爆轰建模

---

### Paper 7: 2607.15199 — Diffusioosmosis of electrolyte solutions in axisymmetric channels

**作者**: Elena Silkina F et al.  
**链接**: https://arxiv.org/abs/2607.15199  
**DOI**: https://doi.org/10.48550/arXiv.2607.15199  
**发表**: 2026-07-16  
**领域**: [[microfluidics]], [[diffusioosmosis]], [[electrokinetics]]

#### 核心创新点
- 建立长轴对称通道中盐溶液流动理论
- 由端部浓度和压力差驱动
- 适用于薄静电扩散层（相对于局部半径）

#### 关键发现
- 圆柱中扩散渗流流率 $Q_{DO}$ 与等直径缝中相同
- 变截面通道可减速或增强流动，取决于几何形状
- 压力差 $\Delta p \neq 0$ 产生额外贡献 $Q_P$，不影响 $Q_{DO}$
- 圆柱近似可用于变截面通道

#### CFD 相关性
- ✅ 微纳流体力学
- ✅ 电解质溶液
- ✅ 微流控器件设计

---

### Paper 8: 2607.15239 — Flow in a porous non-axisymmetric annular conduit: Coupling wall compliance and peristalsis

**作者**: Ivan Christov et al.  
**链接**: https://arxiv.org/abs/2607.15239  
**DOI**: https://doi.org/10.48550/arXiv.2607.15239  
**发表**: 2026-07-16  
**领域**: [[porous media]], [[fluid-structure interaction]], [[peristalsis]]

#### 核心创新点
- 研究偏心环形管道流动
- 结合多孔介质拖曳和双向往耦合流固相互作用（柔顺外壁与脑脊液）
- Darcy-Brinkman 项考虑多孔介质拖曳

#### 应用背景
- 脑周空间 (Periarterial Space, PAS) 流动
- 穿透性 PAS 形成多孔通道

#### 关键发现
- 小振幅蠕动波可获得解析解
- 蠕动和柔顺壁位移对水力阻力的影响可通过微扰方法处理
- 简化为单个非线性偏微分方程

#### CFD 相关性
- ✅ 多孔介质流动
- ✅ 流固耦合
- ✅ 生物流体力学

---

### Paper 9: 2607.15155 — The Effect of Heat Loss During the Early Stages of Flame Propagation and Tulip Flame Formation

**作者**: Michael (Mikhail) Liberman A. et al.  
**链接**: https://arxiv.org/abs/2607.15155  
**DOI**: https://doi.org/10.48550/arXiv.2607.15155  
**发表**: 2026-07-16  
**报告编号**: NORDITA-2026-087  
**领域**: [[combustion]], [[DNS]], [[flame dynamics]], [[tulip flame]]

#### 核心创新点
- 使用完全可压缩反应 N-S 方程直接数值模拟 (DNS)
- 耦合通道壁内热传导
- 高阶数值方法 + 详细化学动力学 + 输运模型
- 氢-空气燃烧

#### 热损失建模
- 热燃烧产物到内壁表面对流热传递
- 通过壁的热传导
- 外壁到周围环境的对流和辐射热损失

#### 关键发现
- 再现实验观察到的火焰动力学主要特征
- 壁热损失和几何约束共同影响受限通道中火焰动力学
- 特别关注郁金香火焰形成及其向扭曲郁金香结构的后续转变

#### CFD 相关性
- ✅ DNS 可压缩 N-S
- ✅ 燃烧 CFD
- ✅ 热传导耦合

---

### Paper 10: 2607.15122 — Fluidic hysterons and memory in flow networks

**作者**: Amir Pahlavan et al.  
**链接**: https://arxiv.org/abs/2607.15122  
**DOI**: https://doi.org/10.48550/arXiv.2607.15122  
**发表**: 2026-07-16  
**领域**: [[hysteron]], [[flow networks]], [[memory]], [[elastohydrodynamics]]

#### 核心创新点
- 通过流体力学途径实现 hysteron 物理
- 单根弹性纤维在微流控通道中产生双稳态
- 非线性流固耦合反馈: 粘性载荷→纤维变形→水力阻力变化→流动再分配→载荷修改

#### 关键机制
- 弹性纤维的非线性流固动力反馈
- 尖点灾变在几何控制参数中组织双稳态
- 并联旁路通道作为几何负载线

#### 关键发现
- 从非相互作用 Preisach 区（返回点记忆）到相互作用区（雪崩式切换和返回点记忆违反）的转变
- 记忆从流动结构反馈和全局水力约束中涌现

#### CFD 相关性
- ✅ 流固耦合
- ✅ 微流控
- ✅ 非线性流动网络

---

## 🔬 方法论分布

| 方法 | 论文数 |
|------|--------|
| DNS / 直接数值模拟 | 1 |
| LES (大涡模拟) | 1 |
| PINN / 深度学习 | 1 |
| 解析/半解析 | 3 |
| 有限体积法 | 1 |
| 实验+理论+数值 | 2 |
| 流形/Reduced-order | 1 |

## 🏷️ 主题分布

| 主题 | 论文数 |
|------|--------|
| 湍流 / 涡流 | 2 |
| 燃烧 / 火焰 | 2 |
| 微流控 | 3 |
| 多相流 | 1 |
| 可压缩流 | 1 |
| 机器学习/PINN | 1 |
| 软物质/流变学 | 1 |
| 多孔介质 | 1 |

---

*由 [[鲜毛肚]] 自动收集于 2026-07-17 14:10 UTC*
