---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, fluid-rendering, differentiable-simulation, adjoint, survey, report, physics-based-animation, fluid-simulation, SPH, MPM, Eulerian, contact, optimization, review]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2611.12162
---

# Same Physics, Different Gradients: A State-of-the-Art Report on Differentiable Physics Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Same Physics, Different Gradients: A State-of-the-Art Report on Differentiable Physics Simulation |
| **作者** | Lei Shu, Zizhou Huang, Yunuo Chen, Yifei Li, Tao Du, Minchen Li, Tuur Stuyck, Miles Macklin, Kui Wu, Bo Zhu, Yin Yang, Ming C. Lin, Alberta Longhini, Rika Antonova, Leonidas Guibas, Gordon Wetzstein, Jeannette Bohg, Chenfanfu Jiang |
| **单位** | Stanford · NYU Courant · UCLA · MIT · Tsinghua · CMU · NVIDIA · Tencent LightSpeed Studios · Georgia Tech · Utah · U. Maryland · Cambridge |
| **arXiv ID** | [2611.12162](https://arxiv.org/abs/2611.12162) (v1, 2026-11-09) |
| **分类** | cs.GR（主）、cs.CV、cs.LG、cs.RO、math.NA |
| **篇幅** | 35 页，8 图，9 表 |
| **DOI** | [10.48550/arXiv.2611.12162](https://doi.org/10.48550/arXiv.2611.12162)（DataCite 注册中） |
| **关键词** | differentiable simulation, adjoint methods, automatic differentiation, physics-based animation, contact, inverse problems, survey |

---

## 核心贡献

> **把"可微物理仿真"这个被文献混为一谈的概念拆成两个正交的轴**——**导数针对什么（referent）** 与 **反向传播怎么实现（realization）**——并证明文献中反复宣称"精确性 vs 内存"的权衡**并非物理约束，而是实现选择的副产品**。

1. **双轴分类法（概念核心）**：
   - **轴 A — Referent（导数属于哪个数学对象）**：
     - **A1**：执行的有限计算（the finite computation that executed）
     - **A2**：它所逼近的收敛方程（the converged equation it approximates）
     - **A3**：连续动力学（the continuous dynamics）
   - **轴 B — Realization（反向传播的组织方式）**：
     - **B1** recorded（记录/存储中间状态后反传）
     - **B2** resolved（解方程层面的伴随）
     - **B3** rederived（自定义伴随/重新推导）
   - **交叉两轴得到 3×3 网格**，每个已分类方法与引擎占据一格。**referent 决定"精确性"的评判目标，realization 决定逼近该目标的程度**。
2. **第二个正交分类法：接触（contact）的不光滑性处理**——按"在真实映射非光滑处采用了什么数学虚构"来分类，以及该虚构引入的偏差与方差。
3. **梯度质量批判性审视（最具实践价值的部分）**：**"梯度正确"不等于"优化有效"**。作者在统一测试床上**实测并量化了四种导致有用梯度丢失的机制**。
4. **跨切面对比**：物理模型族（表 4/5）、系统技术（§8）、引擎（表 7）、应用（§9）在同一套坐标轴上比较。
5. **报告清单（Reporting Checklist，7 条）+ 已发布的诊断工具 + 研究议程**。

---

## 技术方案

### 核心思想

#### 问题 1：文献把两个问题混为一谈

> "Two papers may both claim to present 'a differentiable simulator' for deformable bodies with contact, agree on the physical model, agree on the discretization, and still compute meaningfully different derivatives, because they differentiate different mathematical objects. **Neither is thereby incorrect.**"

作者把可微仿真的全部困难归到**两个鸿沟**：

| 鸿沟 | 内容 | 性质 |
|------|------|------|
| **鸿沟 1** | 引擎计算的导数 vs 用户期待的导数：微分**有限求解器** vs 微分**它所逼近的方程**，针对的是不同的数学对象 | **事实问题**——引擎要么返回它所运行之物的导数，要么不是 |
| **鸿沟 2** | 拿到导数 vs 拿到有用的优化进展：即使梯度精确，有限步长优化中仍可能无效；pathwise 导数对含不连续性的随机目标是有偏估计 | **程度问题**——取决于时域长度、接触处理、条件数 |

> 作者原话："The referent decides **what you may claim** and whether a gradient check can pass, while the horizon, the contact treatment and the conditioning usually decide **whether the optimization works**."

#### 轴 A：Referent 的三个层次

| 标签 | 含义 | 精确性主张 | 关键限定 |
|------|------|------------|---------|
| **A1** | 把该步视为 $K$ 次求解器迭代的**字面序列**并微分它 | 对**执行了的程序**精确，与是否收敛无关 | 这是有限差分检验的**直接**对象（受截断误差、舍入、稳定性影响） |
| **A1\*** | A1 的限定版：把线性求解/压力投影/Newton 内层求解的导数当作**精确线性算子**的导数 | 对"线性求解精确的理想程序"精确，**但那不是实际运行的程序** | 理想化与有限容差程序的导数差距**不由求解容差单独决定**，还取决于系统条件数与残差对参数的敏感性 |
| **A2** | 把该步视为它所逼近的**收敛方程**，用隐函数定理解导数 | 对**收敛方程**精确 | 在**截断迭代点**上求值会引入**收敛间隙** |
| **A3** | 把该步视为**连续动力学**的一部分 | 对**连续系统**精确 | 数值积分器的步长引入离散化误差 |

**重要警示**（A1 的推论）：

> "The guarantee is narrower than often stated: it is **exact for the executed program, not for the physics**."

含分支、离散碰撞检测或不可微原语的程序，返回的是**所走分支**的导数，或框架在拐点处选定的约定。**AD 在拐点返回什么取决于局部导数约定，未必是复合函数的导数**——不加限定地称之为"真实敏感度"是夸大。

#### 轴 B：Realization 的三种组织方式

| 标签 | 机制 | 成本来源 |
|------|------|---------|
| **B1** recorded | 反向传播时**记录并存储**前向所需的状态 | 存储随求解器深度/时域线性增长 |
| **B2** resolved | **解方程层面的伴随方程**（线性/非线性伴随系统） | 伴随求解成本；不需存中间量 |
| **B3** rederived | **自定义伴随**——手推或利用结构重新推导反向传播 | 人工推导成本；常与特定结构耦合最强 |

**标注规则**（作者明示，可用于给未见过的新引擎分类）：
1. 标签描述的是**一个时间步整体**的反向传播组织方式，不是每个内部算子。手推伴随里调用 AD 做局部 JVP、或 tape 里包着手写 kernel，**都保留其组织结构的标签**。
2. B2 与 B3 不是互斥的技术细节：手推轨迹伴随仍需要前向信息。

#### 交叉两轴的核心结论

> "Crossing these choices explains why **exactness and low memory are not fundamentally incompatible**, and identifies the assumptions and costs of the methods that combine them."

即：文献普遍宣称的"精确 ↔ 内存"权衡**并非本质约束**，而是方法构建方式的历史产物。代价同时取决于 realization 与**状态恢复策略**（存储 / checkpoint 重算 / **反转映射恢复**）。

---

### 流体相关技术（与本领域最直接相关的部分）

论文 §6.4 **Fluids** 一节把流体按两条轴拆开（文献惯例将其混为一谈）：

- **连续统视角**：Eulerian（固定位置）vs Lagrangian（随物质移动）
- **空间离散**：网格 / 网格面 / 粒子 / 粒子-网格混合

> "The pairings that dominate graphics are Eulerian solvers on grids and Lagrangian solvers on particles, but **neither is forced**; Eulerian solvers have been built on unstructured Voronoi cells with Delaunay tetrahedral duals."

| 技术 | 可微实现方式与难点 | 论文评价 |
|------|--------------------|---------|
| **Eulerian 网格求解器** | 通常由**平流、投影、扩散**三个算子组合 → **天然的导数实现单元**。投影与扩散在固定系数/边界下是**线性的**；而**平流、限制器、自由面处理会引入非线性或非光滑依赖** | 经典结构 |
| **早期可微流体控制** | TMPS03 传播离散流体算子的**前向导数**并**把线性求解当作精确**；一年后 MTPS04 改用**伴随** | 奠基工作 |
| **自由面拓扑变化** | WTGT10 指出的**薄特征的拓扑变化引入离散决策**，微分流体求解器时**需要单独处理** | 易被忽略的陷阱 |
| **ΦFlow (HKT20)** | 现代可微 **Eulerian** 求解器 | 代表作 |
| **solver-in-the-loop (UBF\*20)** | 用可微性训练与求解器**跨多步交互**的修正项（而非孤立使用） | 系统级范式 |
| **流图伴随 (LHB\*25)** | **B3 类**的典范：观察到**双向流图求解器与其伴随共享同一个映射**——前向沿它传递冲量变量，反向沿**同一映射**传回伴随变量。**直接在该映射上解伴随方程，同时避免微分中间数值步骤和存储它们** | ⭐ **对流体渲染最有价值的一条** |
| **SPNets (SF18)** | 粒子法可用显式更新或**迭代式约束/压力求解**。**邻域表是离散数据结构，但表变化不必使物理映射非光滑**——只要贡献在支撑边界**平滑地消失**。截断规则、截断方式、邻居容量上限决定导数行为 | 澄清了一个常见误解 |
| **DiffFR (LXY\*23)** | 用**前向模式**手工微分 DFSPH 压力迭代做 SPH-刚体双向耦合。**报告完整导数在接触后不稳定**，只保留紧邻刚体的流体粒子梯度——作者明言该局部化**偏离物理真值**，故表 5 中列为**代理方向 (surrogate direction)** | ⚠️ 重要的诚实报告范例 |
| **MPM (JST16/SSC13)** | 粒子-网格传递 + 本构更新，在**规则分支上可微**。传递光滑性取决于**插值核与支撑处理**。屈服转换、接触、谱退化需**自定义或正则化导数**（DiffTaichi 的自定义 SVD 梯度） | 主流方案 |
| **ChainQueen (HLS\*19) / DiffTaichi (HAL20) / PlasticineLab (HHD21)** | 可微 MPM 生态（后者为软体基准） | 生态概览 |
| **FluidLab (XZX\*23)** | 把粒子-网格机制带到**液体**；是流体的**可微基准环境** | ⭐ 直接可用的工具 |
| **内存** | **记录的 MPM 微分可以每步存储每粒子与每网格数据**，长 rollout 内存密集，除非做 checkpoint 或其他状态恢复策略 | 工程约束 |
| **流固耦合 (TLQL21)** | 固体-流体耦合**引入界面约束，其微分不是两种介质导数的简单复合**：即使单向耦合配子网格边界条件，也**需要自己的伴随项**，且该理由**推广到每个耦合系统** | ⭐ 关键警告 |

---

### 梯度质量：四种梯度丢失机制（实测）

作者在统一测试床上**直接测量**（24 个质点的链，$m=1$，静息长度 1，重力 $-9.8$，隐式 Euler，$h=1/60$，逐顶点 Newton 更新的 Gauss–Seidel 扫描，参数为 23 个弹簧刚度）：

#### 机制 1：非收敛偏差（Non-convergence bias）

- 若前向求解被截断而反向在最终迭代点上评估**方程级伴随 (A2)**，返回向量一般**不同于执行计算的导数**。对固定问题这个失配是**确定性的**——重复求解不消除它，优化外层目标也不保证内层收敛。
- **小前向残差不构成梯度精度证明**：界还取决于残差 Jacobian 的条件数、残差对参数的敏感性、求解器收敛的正则性。**紧容差验证可能漏掉在生产迭代预算下出现的失配。**
- **实测**：在实时求解器实际运行的迭代预算内，**材料越硬，失配超过梯度本身的量级**。失配还有**方向性**（对优化更重要）：1~10 次扫描时，刚性链的方程级伴随与真实导数**几乎正交**，$\cos\angle$ 降到 **0.1~0.3**。余弦为正保证"负梯度是下降方向"，但**完全低效**。

#### 机制 2：时域诱导的病态（Horizon-induced ill-conditioning）

- 状态敏感度随 $T$ 增长；**梯度范数不足以说明问题**——论文 Fig.6 中状态敏感度变化 **15 倍**，损失梯度范数上升**不到 3 个数量级**，而损失上升 **8.5 个数量级**。

#### 机制 3：混沌与方差放大（Chaos and variance amplification）

#### 机制 4：接触导致的梯度坍缩（Contact-induced gradient collapse）

#### 测量结果（表 6）：方程级 referent 的代价

拟合问题：16 顶点链、12 步时域、120 步归一化梯度下降（步长 $\|\theta\|$ 的 3%）、40 个随机实例，取损失剩余比例的中位数。

| 目标构造 | 结果 |
|----------|------|
| **同 $K$ 目标**（真刚度场在同一 $K$ 下同一求解器产生的端点，拟合可精确命中） | **单次扫描时精确梯度压倒性更好**：方程级伴随留下约 **8 倍**的损失，40 个实例中只赢 4 个。**从 2 次扫描起无法区分**，胜率约五五开 |
| **方向一致性** | 两次扫描时中位余弦 **0.51**（四分位距 0.38~0.66），四次 **0.61**（0.55~0.78）；**从 8 次起中位余弦 0.95**，方向与结果均一致 |
| **收敛目标**（目标来自 2000 次扫描的收敛解，拟合只跑 $K$ 次） | **精确导数在 4 次扫描内每个实例都赢**，2 次与 4 次时**领先两个数量级**；约 **16 次扫描后**两者才不可区分 |
| **外部目标**（重力下无任何有限刚度场可达的端点） | A1 在 8 次扫描内每个实例都赢；**32 次扫描时 A2 每个实例都更低**，约 2% |

> **结论**：当拟合模型能在其前往的参数处**匹配目标**时，方程级方向是**足够的**；当匹配目标意味着**必须超出模型本身的能力**时，它就是**误导性的**。

**关键洞见**："**A gradient can be substantially wrong in direction and still drive the optimization about as well.**"（梯度在方向上可以大幅错误，却仍能大致有效地推动优化。）

**该测量的两个内建限制**（作者自述）：归一化步长移除了梯度幅值，比较测的是"同一更新规则下两个方向的可用性"；改变 $K$ 同时改变生成目标的求解器，故跨目标列的比较**不单独隔离预算效应**。

---

### 接触（不光滑性）分类法（表 3）

| 处理方式 | 数学虚构 | 引入的偏差/方差 |
|---------|---------|---------------|
| **互补性分支导数**（§5.2） | 把接触当作互补问题的分支 | 分支切换处的非光滑 |
| **柔性/惩罚松弛**（§5.3） | 用惩罚项替换硬约束 | 罚参数引入的偏差 |
| **障碍与内点法**（§5.4） | 障碍函数 / 内点 | 内点迭代次数依赖 |
| **随机平滑与随机估计器**（§5.5） | 对映射做随机平滑 | 估计器方差 |
| **事件感知与碰撞时刻梯度**（§5.6） | 显式处理离散事件 | 事件检测的离散性 |
| **前后向接触模型解耦**（§5.7） | 前向与反向用**不同**的接触模型 | 系统性偏差 |

---

### 报告清单（Reporting Checklist，7 条）

作者提议所有提出可微仿真器的论文**必须报告**：

1. **Referent 与 Realization**：返回的导数对**哪个对象**精确，反向传播**如何**获得？**两个独立答案都要给**。
2. **每次实验的求解器容差与迭代数**——报告**实际运行的**容差，不是方法支持的容差。
3. **实现、referent 间隙与有用性**（分三部分，**不得合并**）：
   - (i) 与**方法自己声明的 referent** 的一致性（返回向量 vs 对同一对象在同一状态下的独立评估；返回向量 vs 声明的目标。**A2 的目标是收敛根敏感度**，在截断迭代点评估会引入收敛间隙）
   - (ii) 与**执行中的仿真器的有限差分**的一致性（含数值检验误差与非 A1 方法的 referent 间隙）
   - (iii) **它是否有用**——在**同等预算**下对比基线，**同时给出两种查询下的预算与墙钟时间**（反向传播很少只有一次前向查询那么多）
4. **接触处理**（按表 3 的轴），含平滑参数与**前后向是否用同一模型**；**包括流固或多物理界面**。流体与耦合问题还有其他梯度不稳定来源（§6.4）。
5. **梯度评估的内存与时间**（相对前向，**实测值**），说明 AD 模式、计时是否含前向评估，以及**状态恢复策略的具名**（stored / checkpointed-and-recomputed / recovered-by-reversing-the-map）及其**如何随求解器深度缩放**。
6. **时域长度下的行为**：任务随机时报告估计器方差随 $T$ 的变化。**梯度范数不够**：还要报告与更高精度评估的**方向一致性**，并给出**失效的时域**。
7. **同任务同预算下的零阶基线**。

> "Given the evidence in Section 7, a differentiable simulator paper that **does not compare against not using the gradients** has not established that the gradients help."

**作者还发布了一个可计算该清单的诊断工具（diagnostic）**。

---

## 实验结论

- **类型**：综述 / 状态报告（35 页，8 图，9 表），非实验论文
- **文献筛选方法**：在 **DBLP、Crossref、arXiv、ACM Digital Library、Google Scholar** 检索 differentiable / gradient-based / adjoint + simulation / physics / solver / contact / cloth / fluid 等词，再做引用与被引追踪；**当一整轮扩展不再带来新的微分策略、接触处理或应用类别时停止**。收录标准：贡献了可微仿真器/组件、提供了相关证据、或提供论证所依赖的背景。**仅因是神经网络而"可微"的**工作，**以及使用引擎却不报告其导数**的应用，**被排除**。
- **综述覆盖**：模型类别（刚体/铰接、可变形固体、织物与余维对象、流体、耦合多物理）、系统技术、引擎（表 7）、应用（§9）
- **与已有综述的差异**：Newbury et al. (NCH\*24) 是最直接的先例，但作者指出自己**细化的是"机制导向"的视角**，分离出 **referent / realization / state recovery** 三者，从而解释被引擎级对比掩盖的**计算成本与失败模式**；且这些区分**在软件包更迭后仍然有用**

---

## 局限性（作者自述 + 观察）

1. **不是流体专项综述**：流体只占 §6.4 一节，流体渲染**几乎未被单独讨论**；可微**渲染**被明确列为**相邻但不在范围内**（其不连续性是可见性而非接触）
2. **区分了可微仿真 vs 学习式仿真**：图网络代理、结构保持网络、物理信息网络作为参考提及，**不作为独立类别综述**
3. **测量只在一个小型测试床上完成**（24 顶点链 / 16 顶点拟合），作者自己列出了该测量的两个内建限制
4. **接触的分类学是"虚构"的分类**（按数学虚构分类），不是按实际算法分类
5. **部分结论有明确的条件边界**：如"方程级方向在目标可达时足够"，换到流体场景（自由面拓扑变化、湍流的长时依赖）**未必成立**
6. **引擎对比表的信息取决于各家文档与版本**，且"没有内层迭代 tape 不意味着 rollout 内存恒定"

---

## 实现建议

### 对流体渲染专家的实操价值

**这份报告的价值不在于"新的流体算法"，而在于它给出了一套判断"我手里的可微流体求解器，它的梯度到底对不对、有用吗"的语言和检查清单。**

1. **⭐ 最重要的一条：流图伴随 (LHB\*25) 是流体领域最值得移植的 B3 类实现**。它的洞见——**双向流图求解器与伴随共享同一个映射**——意味着可以在流图上**直接解伴随方程**，从而：
   - **无需微分中间数值步骤**（不需要对每个网格算子的 AD 规则）
   - **无需存储前向中间量**（内存恒定，与时域长度无关）
   - 对**长时域**（流体模拟动辄上千步）意义重大，因为 A1/B1 类方法的内存会随时域线性膨胀
   - 论文图 8 右正是**用这个方法把烟雾从一个剪影经固定障碍优化到另一个剪影**——即**流体渲染的直接应用**
2. **流体渲染中"用梯度做什么"的典型任务**几乎全部落在论文的分类里：
   - 从视频反推**风场/材质参数**（§9.1 系统辨识与 real-to-sim）——对应本库已有的 `PhySimCode`、`Make It Flow`、`FluidGen` 一类工作
   - **关键帧控制烟雾**（TMPS03/MTPS04，本领域最早的"可微"应用之一，论文明确点出"**Keyframe control of fluids is an early application of differentiable simulation**"）
   - 用可微性**训练与求解器跨多步交互的修正项**（solver-in-the-loop）——这是"物理 + 学习"混合管线的正统做法
3. **必须警惕的四类陷阱，直接对应流体的具体困难**：
   - **自由面拓扑变化**（薄特征的离散决策）→ 梯度不可靠，需要单独处理
   - **流体-刚体接触** → DiffFR 报告的"接触后完整导数不稳定"是已知问题，其"只保留邻近粒子梯度"的**局部化明确偏离物理真值**——若你的火焰/水花与刚体碰撞用了可微路径，要意识到得到的是**代理方向**
   - **耦合界面的伴随项不能省略**——固体-流体耦合即使单向也需要自己的伴随项，**且该理由推广到每个耦合系统**
   - **接触映射非光滑** → 接触分类学（表 3）决定你选了什么"数学虚构"，以及它引入的偏差与方差
4. **⭐ "精确性 ↔ 内存不是本质权衡"这个结论直接改变了求解器的选型逻辑**。过去常见的选择逻辑是"要精确梯度 → 必须全量记录 → 内存爆 → 只好放弃流体"；本报告指出**存在同时精确且低内存的格子**（B2/B3 + 状态恢复策略）。对流体这种"时域长、状态大"的场景，这把被放弃的选项重新变成了可行选项。
5. **可以直接拿来用的工具**：
   - **FluidLab** (XZX\*23) —— 可微流体基准环境，是做流体可微实验的现成平台
   - **ΦFlow** (HKT20) —— 现代可微 Eulerian 求解器
   - **DiffTaichi** —— 流体 MPM 可微示例（固体 + 液体）
   - **作者发布的诊断工具** —— 用于计算其报告清单
6. **报告清单（7 条）可以直接改造成自己团队/项目的技术评审模板**，尤其第 3 条的"**三个部分不得合并**"与第 7 条的"**必须对比零阶基线**"——后者是很多可微流体论文完全缺失的。
7. **时域长度与梯度质量的定量关系**（机制 2：敏感度变 15 倍时损失变 8.5 个数量级）是**流体长时域优化的直接警告**——对流体这种强耗散系统，长时域优化的梯度有用性需要单独验证，不能只看梯度范数。

### 限制与注意

- **这不是流体渲染的文献**，其中关于流体渲染的内容极少（主要是图 8 的烟雾剪影优化一例）。不要期待从中得到流体渲染的渲染侧技术。
- **测量结论来自刚性链**，流体是**强非线性 + 长时域 + 拓扑变化 + 接触**的组合，四种机制在流体中**会叠加**，论文的定量结论**不能直接外推**。
- **报告清单是"建议"而非"标准"**，且作者自己指出部分检查项（如 A2 的收敛间隙）本身难以独立评估。

---

## 相关工作

- [[2026-11-10-Volumetric-Light-Transport-Inference-without-Path]] — 同批次论文，体积渲染侧的实时化路径
- [[2026-11-10-SoftPAT3D-Physics-Augmented-Text-to-3D-Deformables]] — 同批次，柔性体的可微接触优化（由 wawaicai 建档）
- [[2026-11-03-KSF-Chol-Kernelized-Stable-Fluids]] — 核化稳定流体求解器
- [[2026-11-03-Bilotta-Weakly-Compressible-SPH-Acoustic-Terms]] — 弱可压 SPH 声学项
- [[2026-11-03-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] / [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — 两相流
- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — 紧凑 ALE 非结构网格
- [[2026-11-09-NanoVDB-Dynamic-GPU-Sparse-Grids]] — GPU 原生动态稀疏网格
- 概念：[[Adjoint Method]] · [[Automatic Differentiation]] · [[Eulerian vs Lagrangian]] · [[SPH]] · [[Material Point Method]] · [[Fluid-Solid Coupling]] · [[Complementarity Problem]] · [[Penalty Method]] · [[Barrier Method]]

---

## 参考文献

- [arXiv:2611.12162](https://arxiv.org/abs/2611.12162) · [HTML 全文](https://arxiv.org/html/2611.12162v1)
- Newbury et al. (NCH\*24) — *Differentiable Simulation: A Review*，最直接的先例综述
- Thuerey et al. (THH\*21) — *Physics-based Deep Learning Book*
- HKT20 — ΦFlow，可微 Eulerian 求解器
- LHB\*25 — 连续伴随流图方法（**流体渲染：烟雾剪影优化**）
- LXY\*23 — DiffFR，可微 SPH-刚体耦合
- XZX\*23 — FluidLab，可微流体基准环境
- HAL\*20 — DiffTaichi（自定义 SVD 梯度，MPM 固体与液体）
- MTPS04 / TMPS03 — 流体关键帧控制的先驱工作
- TLQL21 — 单向流固耦合的伴随项
