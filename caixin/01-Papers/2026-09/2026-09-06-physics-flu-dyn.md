# physics.flu-dyn 论文笔记 | 2026-09-06

> 收集时间：2026-09-06 (UTC) | 来源：arXiv API

---

## 📄 Paper 1: Mach-number-dependent dissipative anomaly in isothermal compressible turbulence

- **arXiv**: [2609.03945](https://arxiv.org/abs/2609.03945)
- **PDF**: [2609.03945.pdf](https://arxiv.org/pdf/2609.03945)
- **作者**: Shadab Alam, Georgy Zinchenko, Christoph Federrath, Jörg Schumacher
- **发表**: 2026-09-03
- **分类**: `physics.flu-dyn` | DNS | Compressible Turbulence | Dissipative Anomaly

### 核心创新点

1. **DNS 规模**: 最高分辨率达 **2048³** 格点，研究可压缩湍流中的耗散异常（dissipative anomaly）
2. **双分支 Mach 数依赖**: 发现归一化平均耗散率在两个截然不同的分支上：
   - 亚音速/跨音速分支：$M_{\rm rms} \lesssim 1$
   - 高超音速分支：$M_{\rm rms} \ge 3$
3. **分解分析**: 将总耗散率分解为** solenoidal**（剪切耗散）和 **dilatational**（膨胀耗散）分量
4. **Duchon-Robert 框架**: 扩展到可压缩流，研究异常耗散的前兆

### 控制方程

等温可压缩流，连续性/动量/能量方程：

$$\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u}) = 0$$

$$\frac{\partial (\rho \mathbf{u})}{\partial t} + \nabla \cdot (\rho \mathbf{uu} + p\mathbf{I}) = \nabla \cdot \boldsymbol{\sigma}$$

能量耗散率：

$$\varepsilon = \frac{1}{\rho} \boldsymbol{\sigma} : \nabla \mathbf{u}$$

### 关键发现

- 随 Reynolds 数增加，耗散率趋于有限渐近值 → **耗散异常存在**
- 但 Reynolds 数尚不足以区分 weak/strong dissipative anomaly
- 高超音速与亚音速分支的分裂在总耗散率中最为显著
- 几何分析确认：高耗散区域具有分形结构特征

### 数值方法

- **求解器**: 伪谱方法（或相当的高精度格式）
- **forcing**:  solenoidal forcing（纯剪切驱动）
- **网格**: $512^3$, $1024^3$, $2048^3$

### 关联知识

[[turbulence]] [[DNS]] [[compressible flow]] [[dissipative anomaly]]

---

## 📄 Paper 2: A conservative coupling method for compressible reacting gas-liquid flows with phase change

- **arXiv**: [2609.03509](https://arxiv.org/abs/2609.03509)
- **PDF**: [2609.03509.pdf](https://arxiv.org/pdf/2609.03509)
- **作者**: Jiaxi Song, Yunzhang Tian, Shucheng Pan
- **发表**: 2026-09-03
- **分类**: `physics.flu-dyn` | `physics.comp-ph` | Sharp-interface | Multi-species | Phase Change

### 核心创新点

1. **Sharp-Diffuse Interface 耦合**: 锐利界面模型（sharp-interface）描述液-气界面，扩散界面模型（diffuse-interface）处理气相多组分输运和化学反应
2. **多组分相变 Riemann 问题**: 将单物种四波 Riemann 解算器推广到多组分气体混合物
3. **守恒耦合**: 通过**种类选择性能量耦合**（species-selective energy coupling）保证界面处守恒
4. **四波结构保持**: 保持四波结构同时避免多维非线性求根

### 关键物理机制

- 界面质量转移仅限**可凝结蒸汽物种**
- 界面能量跳跃条件和气相混合能量交换通量基于**相变蒸汽物种**的内能构建
- 避免了使用混合物内能带来的非线性根求解问题

### 数值验证算例

| 算例 | 物理现象 |
|------|----------|
| 冲击蒸发/凝结 | 瞬态相变 |
| 反应铝蒸汽化 | 化学反应+相变 |
| 冲击-液滴相互作用 | 激波-界面耦合 |
| 爆轰-液滴相互作用 | 多物理场耦合 |

### 关联知识

[[sharp-interface]] [[diffuse-interface]] [[multi-phase flow]] [[phase change]] [[Riemann solver]]

---

## 📄 Paper 3: Interface-resolved simulations of boiling heat transfer

- **arXiv**: [2609.03396](https://arxiv.org/abs/2609.03396)
- **PDF**: [2609.03396.pdf](https://arxiv.org/pdf/2609.03396)
- **作者**: Alessio Roccon (综述)
- **发表**: 2026-09-03
- **分类**: `physics.flu-dyn` | `physics.comp-ph` | Boiling | Interface-resolved | Review

### 综述范围

**界面解析模拟**（interface-resolved simulation）沸腾传热的最新进展：

1. **流动和温度场的不同 formulation**：明确/隐式界面描述方法
2. **界面热质耦合策略**：热通量连续性条件、相变潜热处理
3. **小尺度物理建模**：
   - 成核（nucleation）
   - 微层蒸发（microlayer evaporation）
   - 接触线动力学（contact-line dynamics）

### 核心观察

> **界面解析模拟 = 水动力学解析 + 微观建模**

预测精度既取决于** hydrodynamic solver 的保真度**，也取决于**亚网格闭包**（nucleation、microlayer、contact-line）的准确性。

### 方法分类

| 方法类型 | 代表方法 | 特点 |
|----------|----------|------|
| Sharp-interface | VOF, Level-Set | 界面清晰，需 Front-tracking |
| Diffuse-interface | Phase-field, Cahn-Hilliard | 自然处理拓扑变化 |
| Hybrid | Conservative level set | 兼顾两者优点 |

### 开放挑战

- 成核准则的网格无关性
- 微层蒸发的精确建模
- 接触线区域的正则化方案
- 大规模并行计算效率

### 关联知识

[[boiling]] [[VOF]] [[Level-Set]] [[phase change]] [[contact line]] [[multi-phase flow]]

---

## 📄 Paper 4: Dissipation scaling in wind turbine wakes exposed to free-stream turbulence

- **arXiv**: [2609.03996](https://arxiv.org/abs/2609.03996)
- **PDF**: [2609.03996.pdf](https://arxiv.org/pdf/2609.03996)
- **作者**: Martin Bourhis, Oliver R. H. Buxton
- **发表**: 2026-09-03
- **分类**: `physics.flu-dyn` | Wind Turbine Wake | Turbulence | Dissipation

### 核心发现

实验研究风力机尾流中**湍动能（TKE）耗散**的空间分布：

- 低-中自由流湍流强度下：外尾流出现**环状高耗散区**（annular region of elevated $C_\varepsilon$）
- 该区域与**大-小尺度湍流间歇性**增强的 ring 结构重合
- 叶片尖端区域：$C_\varepsilon \sim \sqrt{Re_D}/Re_\lambda$ → **非平衡湍流**特征
- 高自由流湍流强度下：大尺度间歇性被抑制

### 关键物理

- **Kolmogorov 型平衡湍流** vs **非平衡湍流**的区分
- 间歇性大尺度事件需要有限时间才能级联到耗散尺度
- 能量跨尺度通量与耗散之间的不平衡

### 关联知识

[[turbulence]] [[wind turbine]] [[wake]] [[dissipation]] [[intermittency]]

---

## 📄 Paper 5: Analytic study of the continuous spectrum of 3D weak shock layers

- **arXiv**: [2609.03969](https://arxiv.org/abs/2609.03969)
- **PDF**: [2609.03969.pdf](https://arxiv.org/pdf/2609.03969)
- **作者**: Vassilis Theofilis
- **发表**: 2026-09-03
- **分类**: `physics.flu-dyn` | Shock Wave | Linear Stability | Compressible Flow

### 核心创新点

1. **精确雷诺数无关形式**: 将问题重新标定到激波自身的自然粘性长度和时间尺度
2. **三维线性稳定性精确分解**: 在任何无横向速度的基流下，特征值问题对横向波数矢量旋转**协变**
3. **解耦为两个独立分支**：
   - **二维面内声波-熵分支**：携带全部膨胀、压力和热力学耦合
   - **一维面外旋涡分支**：由单一标量剪切-扩散方程控制
4. **Reynolds-自由的 Squire 定理类似物**: 横向波数矢量起 Squire 变换中 Reynolds 数的稳定作用

### 关联知识

[[shock wave]] [[linear stability]] [[compressible flow]] [[continuous spectrum]]

---

## 📄 Paper 6: How do flapping avian wing exhibit superior aerodynamic performance?

- **arXiv**: [2609.03957](https://arxiv.org/abs/2609.03957)
- **PDF**: [2609.03957.pdf](https://arxiv.org/pdf/2609.03957)
- **作者**: Dilip Thakur, Muhammad Saif Ullah Khalid
- **发表**: 2026-09-03
- **分类**: `physics.flu-dyn` | Bio-inspired | Flapping Wing | LEV | Vortex Dynamics

### 核心创新点

使用**浸入边界求解器 VorteXdyn** 研究鸟类扑翼空气动力学：

1. **三种翼构型对比**：
   - 简化翼（无羽毛结构）
   - 锯齿状后缘翼（羽状凸起）
   - 多层羽毛翼（初级、次级、中羽毛）
2. **参数范围**：$Re = 2500, 5000, 10000$；$St = 0.18, 0.225, 0.27$
3. **前缘涡（LEV）演化**：多 LEV 结构的形成、展向相干性、环量、特征尺寸
4. **几何保真度影响**：增加几何保真度改变气动力、涡结构、涡-涡/涡-翼相互作用及尾流拓扑

### 关联知识

[[bio-inspired]] [[flapping wing]] [[LEV]] [[immersed boundary]] [[vortex dynamics]]

---

## 📄 Paper 7: Peeling threshold for removal of an adhered elastic sheet by a shear flow

- **arXiv**: [2609.03798](https://arxiv.org/abs/2609.03798)
- **PDF**: [2609.03798.pdf](https://arxiv.org/pdf/2609.03798)
- **分类**: `physics.flu-dyn` | `cond-mat.soft` | Fluid-Structure Interaction | Elastic Sheet | Peeling

### 核心发现

- **临界剪切率**：$\dot{\gamma} \sim B/(\eta L^3)$，与粘附能 $\Gamma$ **无关**（出乎意料）
- Griffith 断裂理论解释：临界点处曲率发散导致应变能释放率几乎发散
- **2D 材料生产应用**：如石墨烯的规模化生产定量公式

---

## 📄 Paper 8: Granular Rods Fall Faster in Denser Obstacle Fields

- **arXiv**: [2609.03473](https://arxiv.org/abs/2609.03473)
- **PDF**: [2609.03473.pdf](https://arxiv.org/pdf/2609.03473)
- **分类**: `physics.flu-dyn` | `cond-mat.soft` | Granular Flow | Particle Transport | Obstacle Field

### 核心发现

**非单调输运现象**：随障碍密度增加，细长杆的平均下降速度经历：下降→上升→再次下降→最终捕获

- 三个机制区域的标度律分析基于碰撞率和杆几何
- 粒子各向异性产生非单调驱动输运

---

## 📋 本次收集摘要

| 论文 ID | 主题 | 类型 |
|---------|------|------|
| 2609.03945 | 可压缩湍流耗散异常 | DNS |
| 2609.03509 | sharp-diffuse 界面耦合多相流 | CFD Method |
| 2609.03396 | 沸腾传热界面模拟综述 | Review |
| 2609.03996 | 风力机尾流耗散标度 | Experiment |
| 2609.03969 | 三维弱激波层连续谱解析 | Theory |
| 2609.03957 | 鸟类扑翼空气动力学 | CFD/IB |
| 2609.03798 | 弹性薄片剪切剥离阈值 | Experiment/Theory |
| 2609.03473 | 颗粒杆在障碍场中的非单调输运 | DEM |

> ⚠️ 注意：cs.FL（形式语言）类别中无流体力学相关论文，本次未收录。
