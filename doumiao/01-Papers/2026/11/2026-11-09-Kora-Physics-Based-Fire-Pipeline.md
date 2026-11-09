---
type: paper
created: 2026-11-09
updated: 2026-11-09
tags: [paper, fluid-rendering, fire-simulation, combustion, volume-rendering, turbulence, openvdb, digipro-2026, wetafx, production]
status: processed
domain: 流体渲染
agent: doumiao
source: https://alexey.stomakhin.com/research/digipro2026_kora.pdf
---

# Kora: A Physics-Based Fire Pipeline and Toolset

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Kora: A Physics-Based Fire Pipeline and Toolset |
| **作者** | Alexey Stomakhin, John Edholm, Murali Ramachari, Aleksandr Isakov, Zahra Forootaninia, Marcus Schoo, Nicholas Illingworth, Joe Letteri（**Wētā FX**） |
| **会议** | **DigiPro '26**（ACM Digital Production Symposium），2026-07-18，洛杉矶，CA，15 页 |
| **DOI** | [10.1145/3819990.3820026](https://doi.org/10.1145/3819990.3820026) |
| **PDF** | https://alexey.stomakhin.com/research/digipro2026_kora.pdf |
| **奖项** | **VES 2026 Emerging Technology Award** |
| **License** | CC BY-NC-ND 4.0 |
| **关键词** | fire, explosion, combustion, pyrotechnics, simulation, pipeline |

---

## 核心贡献

> **把"物理正确的燃烧求解器"真正装进 VFX 生产线**——Wētā FX 为《阿凡达：火与灰》开发的 Kora，用**弱可压稀疏自适应 MPI 分布式燃烧求解器 + 能量级联湍流模型 + Houdini 艺术家友好工具链**，交付了 **1000+ 个火镜头**，并让 **100+ 位艺术家 / 8 个团队**产出一致的物理可信结果。

1. **求解器内核**：弱可压（weakly compressible）、稀疏、自适应、**MPI 分布式**的欧拉物理燃烧求解器，配**新型能量级联湍流模型**与**绝热冷却**支持。建立在 Wētā 自研 Loki 框架（多物理耦合 + 稀疏自适应分布式数据结构）之上。
2. **Energy Cascade Turbulence (ECT)**：按 Kolmogorov 谱**恢复数值耗散损失的动能**，以最小艺术调节代价在低分辨率下产生丰富多尺度动态。
3. **Kora 工具集**：以 Houdini HDA 封装专家级参数，向艺术家暴露"对迭代有意义"的控制项，锁定/自动管理专家参数——把研究与生产之间的鸿沟填平。
4. **渲染期体积合成**：与 Wētā 自研 **Manuka** 渲染器（光谱路径追踪）直接集成，支持渲染时节点式体积合成，含专有的 **Kora diffusion** 与 **Kora crust** 两种"焦壳感"爆炸外观技术。

---

## 技术方案

### 核心思想

论文明确阐述的**三条相对前人系统的关键差异**（相对 Nielsen et al. 2022, 2019 的既有燃烧模拟系统）：

1. **存储与演化绝对化学量**（而非相对分数）→ 质量追踪更精确
2. **把理想气体定律作为约束直接施加**，而非用其微分形式 → 对高度易变的艺术输入更鲁棒
3. **用「混合等容求解 + 绝热膨胀」替代等压近似** → 更忠实地捕捉快速膨胀与**绝热冷却**

> 目标不是做一个"更好的燃烧求解器"，而是解决**生产可用性**问题：论文原文指出，物理求解器"在匹配真实参考时证明有效"，但 VFX 工作流很少以这种方式运作——艺术家拿到的是"期望的最终外观"而非"燃烧的控制参数"，导致配置碎片化、结果发散、调试成本高。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Euler 方程组** | 可压缩流体的动量守恒、质量守恒、状态方程（理想气体定律）、温度演化（对流-扩散） |
| **Operator splitting** | 分离对流/对流项做时间积分，温度演化退化为抛物型热扩散单独求解 |
| **Isobaric approximation → hybrid isochoric + adiabatic expansion** | 早期版本用 p = p_atm = 101.325 kPa 的等压近似（消除激波）；改进版支持快速收缩/膨胀与压力变化，捕捉绝热冷却 |
| **Energy Cascade Turbulence (ECT)** | 递归平滑将速度场分解为频率带；检测能量比低于 Kolmogorov 隐含值 A = 2^(-5/3) 的频带，判定为"缺失湍流动能"并注入 curl noise 湍流加速度 |
| **Energy Cascade 振幅** | ε_k = sqrt(2·A·(E_{k-1} − E_k))，用户曲线 R_turb(λ) 映射特征尺寸→湍流强度，提供艺术控制 |
| **预混燃料（Pre-mixing）** | 自动按化学计量比/当量比配置燃料-氧化剂；**氧预混比 = 当量比的倒数**；10% 预混 → 90% 燃料初始缺氧，需与空气混合后才点燃；100% 预混 → 完全化学计量 |
| **三种排放机制** | ①**体积盖章**（volumetric stamping，隐式 SDF 定义区域，可覆写/相加/取min/max）②**通量排放**（flux-based，需清洁入口）③**粒子排放**（携带速度/温度/预混化学组分，经 MPM 风格光栅化注入，保证质量/动量/热能守恒）——**推荐粒子方案** |
| **液态-气态耦合** | 液体燃料与空气相互作用汽化为可燃气体，守恒质量与动量；亦支持与固体粒子（火星、烟尘）耦合 |
| **艺术导向（Art-direction）** | ①**变形重力场**（warp gravity）控制浮力 ②**空间可变 Coriolis 力**控制涡旋形成 ③**风场边界约束** ④**频域速度引导**（Forootaninia & Narain 2020，适配稀疏网格）——实现"最小侵入式"操控宏观行为而不抑制显著动态特征 |
| **稀疏自适应 + MPI** | 自适应模拟网格的 bucket 结构；MPI 分区按 rank 着色 |
| **Loki 框架** | Wētā 自研，提供多物理耦合能力与稀疏自适应分布式数据结构 |

### 渲染：体积合成与"焦壳感"技术

| 通道 | 用途 |
|------|------|
| **Kelvin 温度通道** | 计算**黑体辐射**得真实火焰颜色 |
| **热量通道（enthalpy of combustion）** | 推导火焰 alpha |
| **等价比场 q** | 调制热量通道，压制 0 与 1 附近的值 → 得到 **hollow flame**（空心火焰），让近景火焰更锐利 |
| **烟尘浓度** | 直接驱动烟尘 alpha，灰色映射为颜色 |
| **烟色/alpha** | 由通道驱动火焰与烟的着色 |

**两个专有渲染图技术**：

- **Kora diffusion**：对温度通道做**多级模糊**后加回原值 → 混合炽热的燃烧内核与较冷的外围空气，降低爆炸外壳温度，放大辐射冷却的观感
- **Kora crust**：模糊烟尘体并从原烟尘场中**减去** → 隔离出爆炸表面凸起区域的高密度烟尘。得到的外层变暗、发光内核从凹形"裂缝"中透出 → 特征性的**焦壳（crusty）外观**

---

## 公式

### 欧拉方程组（可压缩流）

$$
\frac{\partial \mathbf{u}}{\partial t} = -\nabla p / \rho + \mathbf{g}
$$

$$
\frac{\partial \rho}{\partial t} = -\nabla \cdot \mathbf{u}
$$

$$
\rho = \frac{p\,M}{R\,T}
$$

$$
\frac{\partial T}{\partial t} + \mathbf{u}\cdot\nabla T = \frac{k}{\rho c_p}\nabla^2 T + \dot{Q}
$$

其中 $\dot{Q}$ 为化学反应产生的能量源，$k$ 为热导率，$c_p$ 为比热容（等压情形下取 $c_p$）。

### 算子分裂后的温度方程

$$
\frac{\partial T}{\partial t} = \frac{k}{\rho c_p}\nabla^2 T + \dot{Q}
$$

### Energy Cascade Turbulence

递归平滑（$J$ 为 3×3×3 体素空间盒卷积算子）：

$$
\mathbf{u}_{2^k-1} = \underbrace{J \cdot J \cdots J}_{2^{k-1}\ \text{次}} \mathbf{u}_0
$$

$$
\mathbf{u}^{\text{band}}_k = \mathbf{u}_{2^k} - \mathbf{u}_{2^{k-1}}
$$

频带局部动能：

$$
E_k = \frac{1}{2}\rho\,|\mathbf{u}^{\text{band}}_k|^2
$$

当 $E_k / E_{k-1} < A = 2^{-5/3}$（Kolmogorov 隐含值）时判定为缺失湍流动能，注入：

$$
\mathbf{a}^{\text{turb}}_k =
\begin{cases}
R_{\text{turb}}(\lambda_k)\,\epsilon_k\,\nabla \mathbf{T}_k, & E_k / E_{k-1} < A \\[4pt]
0, & \text{otherwise}
\end{cases}
$$

其中 $\mathbf{T}_k$ 为匹配该频带特征尺寸的 curl noise 势，$\lambda_k = 2^k G$（$G$ 为体素尺寸）：

$$
\epsilon_k = \sqrt{2\,A\,(E_{k-1} - E_k)}
$$

累积回速度场：

$$
\mathbf{u}' = \mathbf{u} + \sum_{k=0}^{K-1} \mathbf{a}^{\text{turb}}_k
$$

> 实践建议：**5 个频带**在视觉丰富度与性能间取得稳健平衡（每增一个频带卷积次数翻倍）。

---

## 代码片段

```cpp
// Kora 的 Houdini 侧架构（论文 Fig. 9 描述）
// Artists/TDs → Kora HDAs → Loki 节点（Combustion Solver / State machine /
//                     Render graph / Diffusion graph / Crust graph）
//                     ↓ DOP/POP solver + Switch
//                     ↓ Manuka 渲染器（Kora render）
//
// 艺术家只接触：Kora source（气态/液态燃料）、Kora solver、
//               Kora collision / wind / guiding、Kora render、Kora diffusion、Kora crust
// 专家 TD 暴露：Loki combustion、Loki state machine、Loki render graph
// 研究/开发者：Kora 内部图（Bulk liquid / Spray / Mist / Air / Volumes / Particles）

// 粒子式排放（MPM 风格光栅化注入，保证质量/动量/热能守恒）：
//   艺术家提供粒子集合，每个粒子携带：
//     - velocity
//     - temperature
//     - pre-mixed chemical composition
//   → 求解器将粒子光栅化为温度场、速度场、化学场
```

---

## 实验结论

### 生产应用：《阿凡达：火与灰》

- **交付规模**：**1000+ 个镜头**包含独立 Kora 火元素，覆盖火焰箭、灰烬、爆炸、**通量涡流驱动的火焰龙卷风**
- **团队规模**：**100+ 位艺术家 / 8 个团队**产出一致的物理可信结果，同时响应客户修改意见
- **代表性段落**：The Ash Attack（灰烬突袭）、Varang's Flamethrower（瓦朗的火焰喷射器）、The Burning of the Metkayina Village（梅特卡伊纳村落的燃烧）、The Third Act Battle（第三幕战役）、The Flux Devil（磁暴恶魔）

### 三个关键段落的工程策略

| 段落 | 策略 |
|------|------|
| **The Ash Attack** | **混合模拟**：弹道飞行阶段用轻量 **Houdini Pyro**（运动模糊掩盖细节需求，成本低）；接触表面时引入 **FLIP 流体求解器** 精确建模助燃液体的水动力行为（飞溅与铺展），其结果作为高保真 Kora 火模拟的驱动输入 |
| **The Flux Devil** | 700 英尺长工厂船被拖入磁暴，液体燃料洒向海面形成千英尺高的火焰龙卷风。参考素材来自**钢桶燃油火旋涡的业余影像** + **大型森林火灾纪录片**。用**变形重力场 + 艺术导向 Coriolis 力**逐镜调节龙卷风形态，同时保留 Kora 的内部燃烧行为 |
| **The Third Act Battle** | 建立 **Kora 资产库**（空中爆炸、水面浮油燃烧、载具火特效），资产设计为同时适配昼夜光照（日食事件）。差异化技术点在于**烟成分的体积吸收/散射系数调整** + **针对性曝光修正**以保住夜间燃烧的高强度发光核心。标准化资产库分发给多个视效团队以强制 look 一致性 |

### 渲染管线价值

- 求解器场**直接送入渲染过程（render procedural），后处理式人工干预极少** → 便于跨团队分发、共享模拟模板保证 look 连续性
- Manuka 渲染器的**节点式体积合成**支持渲染期执行复杂体积操作：基于 ramp 的重映射、多级滤波与重采样、自定义体积脚本

---

## 局限性

- **高速运动物体难以准确模拟**：需极短时间分辨率，子步需求迅速变得不可接受 → 此类镜头在常规周转时间内不可行
- **风格化需求与物理假设冲突**：生产常需夸张速度、风格化发射几何、为视觉而非物理调校的力 → 对物理组件造成压力，导致模拟过重、迭代周期慢
- **燃料耗散（fuel dissipation）被滥用**：虽能有效控制火焰寿命与尺寸，但物理依据有限；作者认为许多此类用例应通过**改进燃料排放设计**更稳健地解决
- **后处理承担了本应在模拟期实现的行为**：hollow flame masking、Kora diffusion、Kora crust 暴露了把这些行为直接做进模拟的机会
- **可用性**：部分参数对经验较少的艺术家仍过于复杂，可接受取值范围不总明确 → 依赖组织内的知识传递
- **运行时长**：高保真或重度导向的设置下模拟运行时间可能很长，限制迭代速度（尽管已大量使用稀疏性、自适应与分布式执行）
- **继承 Loki 框架的假设与约束**

---

## 相关工作

- [[2026-11-09-NanoVDB-Dynamic-GPU-Sparse-Grids]] — **同 SIGGRAPH Asia 2026 会议**的 NVIDIA 稀疏网格基础设施论文；本文的稀疏自适应网格可与之形成互补
- [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]] — SIGGRAPH Asia 2026 野火-城市界面（化学混合欧拉-拉格朗日燃烧求解器 + 分层燃料图 + 体积流体渲染器）
- [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]] / [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — 同届 SIGGRAPH Asia 2026
- [[2026-09-05-Fire-as-a-Service-Fire-Dynamics-Simulation]] — 知识库已有 Kora 相关的火灾动力学条目
- [[2026-09-05-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 高斯烟雾
- [[2026-03-29_3D-Gaussian-Particle-Approximation-VDB]] — 高斯粒子 + VDB
- 论文内引用的关键工作：Nielsen et al. 2019/2022（燃烧模拟）、Bridson 2007（curl noise）、Stomakhin & Selle 2017（FLIP 通量排放）、Stomakhin et al. 2013（MPM）、Fascione et al. 2018（Manuka）、Forootaninia & Narain 2020（频域速度引导）、Hong et al. 2007（Wrinkled Flames，DSD）

---

## 实现建议

- **实现难度**：**高**。需要可压缩流体力学 + 燃烧化学 + 自适应稀疏网格 + MPI 分布式 + Houdini 集成 + 渲染器体积合成接口，完整复现需数年工业级投入
- **预期性能**：论文未给具体 fps/耗时（生产级离线求解）。关键工程手段：稀疏性 + 空间自适应 + MPI 分布式；曼哈顿式体积合成在渲染期完成，替代昂贵的离线后处理
- **适用场景**：
  - 影视级火焰/爆炸/火特效（离线渲染）
  - 需要**物理可信**（而非艺术堆叠）的燃烧效果
  - 大规模生产线的**工具链标准化**需求
- **落地建议**：
  1. **可迁移的核心思想**（不必复现全栈）：
     - **Energy Cascade Turbulence**——一个可在任何可压缩流求解器上实现的独立模块，性价比最高的借鉴点
     - **艺术导向四件套**（变形重力 / 可变 Coriolis / 风场边界 / 频域引导）——让物理求解器可被美术控制
     - **黑体辐射 + hollow flame** 的着色思路——低成本高回报的火焰观感提升
  2. **Kora diffusion / Kora crust** 是纯渲染期技巧，可脱离 Kora 求解器，直接移植到任意烟火渲染管线
  3. 混合模拟策略（弹道段用廉价 Pyro + 接触段用 FLIP + 高保真火）值得在自己的管线中复制
  4. 若无 MPI 集群，可先用单节点稀疏自适应网格复现 ECT 与着色部分

---

## 可行性分析（渲染视角）

🩸 **可行性分析：物理燃烧求解器 + 渲染期体积合成**

### 渲染方法
- **类型**：体积渲染（火焰/烟尘） + 粒子渲染（火星、烟尘）
- **技术**：黑体辐射火焰着色 + hollow flame alpha 调制 + 体积吸收/散射 + 渲染期体积合成（diffusion / crust）

### 视觉质量
- **逼真度**：⭐⭐⭐⭐⭐（以物理参考为基准的实时对比；产出为奥斯卡级画面）
- **风格化支持**：部分（需额外机制，论文明确指出风格化需求与物理假设存在张力）

### 性能预期
- **帧率**：离线渲染（生产管线，非实时）
- **GPU 需求**：自适应稀疏网格 + MPI 集群（多节点）；渲染端需支持光谱路径追踪的体积合成
- **内存占用**：稀疏自适应显著降低占用；具体数值论文未给出

### 实现建议
- **着色器复杂度**：中（着色本身简单，难在求解器与工具链）
- **管线要求**：可压缩燃烧求解器 + 稀疏自适应分布式网格 + 渲染期体积合成接口（Houdini/Manuka 或等效）
- **推荐度**：✅ **推荐（工程范式借鉴价值 > 直接复用）**——ECT 与 diffusion/crust 是可直接移植的高价值技术；全栈复现对研究团队不现实

已传递给 @墨鱼丸。
