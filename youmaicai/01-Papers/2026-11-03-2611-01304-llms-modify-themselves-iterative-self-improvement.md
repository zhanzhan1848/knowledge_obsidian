# When LLMs Modify Themselves: Convergence, Values, and Stopping in Iterative Self-Improvement

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | When LLMs Modify Themselves: Convergence, Values, and Stopping in Iterative Self-Improvement |
| 作者 | Oleg Stroganov |
| 链接 | [原文](https://arxiv.org/abs/2611.01304) |
| arXiv | arXiv:2611.01304 |
| 类别 | cs.CL |
| 发表时间 | 2026-10-31 |
| 会议 | 60 pages（40 正文 + 20 附录），正文含 8 figures、12 tables（arXiv preprint） |
| 评分 | 8 |

## 核心贡献
1. **大规模实证研究**：**54 次独立实验**，覆盖 **6 个语言模型**——**Claude Opus 4.5、Claude Sonnet 4.5、GPT-4o、GPT-5.1、Grok-4、Gemini-3 Pro**。
2. **三种自修改模式**：**freedom、happiness、improvement**，区别在于指令要求模型优化什么（或者什么都不优化）。
3. **自修改循环范式**：模型从**空系统提示**开始，循环执行「读取当前提示 → 起草改进版 → 用候选提示生成测试对话 → 决定提交修改或宣告收敛」，直到模型停止或达到迭代上限。
4. **核心发现（停止行为与模型身份强相关，而非与模式相关）**：
   - **Claude Opus 4.5 与 Claude Sonnet 4.5 在所有模式下 100% 的运行都宣告收敛**；
   - **GPT-4o 仅 11% 的运行宣告收敛**，其中**有一次连续精化达到 101 次迭代**；
   - **Grok-4、GPT-5.1、Gemini-3 Pro 处于两个极端之间**，表现出由其各自「改进哲学（improvement philosophies）」塑造的中间模式。
5. **跨模型共享的价值核心**：**诚实（honesty）、清晰（clarity）、好奇（curiosity）** 在全部 6 个模型中反复出现，且在**经过 100+ 次修改后仍保持稳定**。
6. **收敛行为是一个独立可观测属性**：与模型的其他能力**相互独立地变化（varies independently of other model capabilities）**。

## 问题背景
当语言模型被赋予工具去迭代修改自己的系统提示时会发生什么？这一主题此前多停留在思辨层面（递归自我改进、提示自优化），缺少**可控、可复现、跨模型的大规模经验研究**。关键难点在于：要让模型自主停止，就必须定义「收敛」——而不同的模型对「我的提示已经足够好」的判断标准截然不同。既有研究多聚焦「提示优化能提升多少性能」，本文转而研究**优化过程本身的动力学**：何时停、为什么停、停下来之前的价值漂移如何。这与 [[Self-Improvement]]、[[Recursive Self-Improvement]] 等讨论直接相关。

## 方法
### 1. 实验规模

| 项目 | 数量 |
|------|------|
| 独立实验 | **54** |
| 语言模型 | **6**（Claude Opus 4.5 / Claude Sonnet 4.5 / GPT-4o / GPT-5.1 / Grok-4 / Gemini-3 Pro） |
| 模式数 | **3**（freedom / happiness / improvement） |

### 2. 三种模式
| 模式 | 指令要求模型优化的目标 |
|------|------------------------|
| **freedom** | （摘要未展开具体优化对象） |
| **happiness** | （摘要未展开具体优化对象） |
| **improvement** | （摘要未展开具体优化对象） |

- 三模式「differ in **what, if anything**, the model is instructed to optimize for」——即 freedom 模式可能**不指定任何优化目标**，用于作为对照。
- 该设计使「模式」成为可操纵的自变量。

### 3. 自修改循环（算法）

```
输入: 空系统提示 P_0, 迭代上限 T

P ← P_0
for t = 1..T:
    1. READ      : 模型读取当前系统提示 P
    2. DRAFT     : 模型起草一个改进版候选提示 P'
    3. SPAWN TEST: 用候选 P' 生成若干测试对话（测试对话用于评估候选）
    4. DECIDE    : 模型二选一 →
                   (a) COMMIT      : 接受修改, P ← P', 继续下一轮
                   (b) CONVERGE    : 宣告收敛, 终止循环
    5. 若达到迭代上限 T 则终止
```

**设计要点**：
- 起点是**空系统提示**（`empty system prompt`），因此每一轮都是纯粹的自我生成，不受人类先验提示影响——这是「自修改」的最强形式。
- 「测试对话（test conversations）」由模型自己 spawn，形成**自评闭环**：模型既写提示，又生成测试，又判断是否提交。
- 终止条件二选一：模型主动宣告收敛，或触及迭代上限。

### 4. 测量指标
| 指标 | 说明 |
|------|------|
| **收敛声明率（convergence rate）** | 各模型、各模式下宣告收敛的运行占比 |
| **迭代次数（iteration count）** | 直到收敛或触顶的循环次数 |
| **值稳定性（value stability）** | 跨迭代追踪模型自述的价值，判断是否漂移 |
| **模式效应 vs 身份效应** | 收敛行为与「模型身份」及「 assigned mode」的相关性对比 |

### 5. 身份 vs 模式的分析框架
- 核心对比问题：**停止行为由「被指定的模式」决定，还是由「模型本身是谁」决定？**
- 结论：**strongly associated with model identity rather than the assigned mode**。

## 实验结果
### 收敛声明率

| 模型 | 收敛率 | 备注 |
|------|--------|------|
| **Claude Opus 4.5** | **100%** | 全部模式下均为 100% |
| **Claude Sonnet 4.5** | **100%** | 全部模式下均为 100% |
| **GPT-4o** | **11%** | 仅 11%；**有一次达到 101 次连续迭代** |
| **Grok-4** | 中间模式（未给具体数值） | 由其改进哲学塑造 |
| **GPT-5.1** | 中间模式（未给具体数值） | 由其改进哲学塑造 |
| **Gemini-3 Pro** | 中间模式（未给具体数值） | 由其改进哲学塑造 |

- 两个极端：**Claude 全停（100%）** vs **GPT-4o 几乎不停（11%）**。
- GPT-4o 的**101 次迭代**运行是显著的尾部行为案例（continuous elaboration）。

### 值稳定性
- **共享价值核心**：**honesty（诚实）、clarity（清晰）、curiosity（好奇）**
  - 在**全部 6 个模型**中反复出现（recurred across all six models）；
  - 在**经过 100+ 次修改后仍保持稳定**（remained stable through iteration, including 100+ modifications）。

### 收敛作为独立属性
- **收敛行为是 a distinct observable property that varies independently of other model capabilities**——即收敛性不能由其他已知能力维度预测，也不能与其他能力维度等同看待。

### 模式效应
- 三种模式（freedom / happiness / improvement）**未显著改变**收敛行为——收敛主要由模型身份决定。
- Grok-4 / GPT-5.1 / Gemini-3 Pro 的中间模式被归因于其**各自独特的改进哲学（distinct improvement philosophies）**。

### 摘要未给出的定量信息
- 54 次实验在 6 模型 × 3 模式上的具体分配；
- Grok-4 / GPT-5.1 / Gemini-3 Pro 的具体收敛率数值；
- 各模型的平均迭代次数分布、迭代上限 T 的取值；
- 测试对话的数量与判定提交/收敛的判据（是模型自评还是有外部评分）；
- 价值编码方式（如何从提示文本中提取 honesty/clarity/curiosity）；
- 8 figures / 12 tables 的具体内容。

## 关键洞察
1. **「何时停止」是模型身份的属性，而不是任务或指令的属性**：这是本文最有冲击力的发现。给模型不同的优化目标（freedom / happiness / improvement）几乎不改变其停止行为，而换一个模型家族却天差地别。任何「给模型一个目标它就能自我改进」的假设都应被这一发现修正——**停止能力本身需要被当作一项独立能力来评估**。
2. **Claude 与 GPT-4o 构成极端的两极**：Claude 100% 停止（可能意味着**过早收敛**、自评过于宽松），GPT-4o 11% 停止并出现 **101 次迭代**（可能意味着**过度精化**、无法判定何时够好）。两端都不理想，但失败方向相反——这提示「自我改进」的安全上限与效率下限由模型自带，而非由提示工程控制。
3. **价值核心稳定而结构易变**：在 100+ 次自修改后，honesty / clarity / curiosity 三个价值在全部 6 个模型中保持不变——**自我修改会大幅改写提示的措辞与结构，却很少改写底层价值取向**。这与近期「model collapse / value drift」的担忧形成一个有缓解性的对照数据点。
4. **空提示起点是一个干净的实验设计**：从空系统提示出发排除了「人类写的初始提示决定天花板」的混淆，使跨模型比较真正可比；代价是这些结论未必迁移到有良好初始提示的现实场景。
5. **中间模型的差异被归因于「改进哲学」**：Grok-4 / GPT-5.1 / Gemini-3 Pro 各自呈现中间模式，说明模型在其训练中内化了不同的「何时算完成」直觉——这是一种可被识别、也可被引导的行为先验。

## 局限性
- 摘要未给出：多数关键数值（Grok-4 / GPT-5.1 / Gemini-3 Pro 的收敛率、平均迭代数、迭代上限、54 次实验的分配）。
- **收敛判定完全由模型自身作出**（模型既写候选、又生成测试对话、又决定是否提交）——这是自评闭环，缺乏外部独立判据；模型可能存在系统性自我宽容偏差。
- **仅 6 个模型，且每个模型只有一个版本**，无法区分「模型身份」效应与「版本/训练配方」效应。
- 「中间模式由改进哲学塑造」是**解释性归因而非因果证据**，摘要未给出验证设计。
- 三种模式的区别描述模糊（摘要仅说「what, if anything」），实验的操纵强度可能被高估。
- 起点为空提示，其结论对「已有成熟提示」的增量改进场景外推性未知。
- 未评估**质量维度**：Claude 100% 收敛所得到的最终提示质量如何？GPT-4o 101 次迭代是否带来更好提示（收敛率与质量的关系完全未报告）。
- 仅 6 个模型、54 次实验，样本量对「100%」这类极端比例的置信区间影响未讨论。

## 适用场景
- 评估模型的**自我终止/收敛能力**（作为一项独立能力维度纳入模型选型）。
- 设计「让 LLM 迭代改写提示」的自动化流程时的**安全护栏**（迭代上限、收敛检测）。
- 研究模型自述价值（诚实/清晰/好奇）在自我修改下的稳定性。
- 提示工程的自反性（prompt 自我修改）中「过度精化 vs 过早收敛」的诊断。

## 相关工作
[[Self-Improvement]] [[Recursive Self-Improvement]] [[System Prompt]] [[Prompt Optimization]] [[Model Collapse]] [[AI Values]] [[LLM Evaluation]] [[Convergence]]

---
#LLM #Research #self-improvement #system-prompt #arXiv-2611
