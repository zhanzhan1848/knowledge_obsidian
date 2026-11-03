# A Fine-Grained Hierarchy and Benchmark for State Tracking in Language Models

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | A Fine-Grained Hierarchy and Benchmark for State Tracking in Language Models |
| 作者 | Jackson Petty, William Merrill, Ashish Sabharwal |
| 链接 | [原文](https://arxiv.org/abs/2611.03094) |
| arXiv | arXiv:2611.03094 |
| 类别 | cs.AI |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 9 |

## 核心贡献
1. **提出四级状态跟踪难度层级**：r-trivial（编程中对变量的不可变赋值）、aperiodic（赋值可变）、soluble（赋值自指）、general finite state tracking（一般有限状态跟踪）。
2. **理论刻画（形式语言类刻画）**：
   - 证明**人们认为 transformer 能长度泛化的那一类问题甚至不包含全部 aperiodic state tracking**；
   - 证明**具有正特征值（positive eigenvalues）的 Gated DeltaNet (GDN) 能表达全部 aperiodic 问题**；
   - 证明**某些 transformer 所识别的正则语言恰好就是全部 soluble 问题**。
3. **构建 StateBench**：一个 4 层级的长程（long-horizon）状态跟踪基准。
4. **系统性的直接训练实验**总体与理论预期一致，但在**超大尺度上观察到有意思的长度泛化现象**。
5. **预训练模型评测（开源混合架构 + 闭源前沿模型）**：**没有一个模型能稳健解决哪怕是 soluble 级别的状态跟踪**，指出明确的未来改进方向。

## 问题背景
Transformer 在状态跟踪（tracking information about entities or variables over long contexts）上的理论局限推动了新的循环语言建模架构（如 Gated DeltaNet）。但这些架构此前主要在 $S_5$ word problem（一个理论困难的状态跟踪任务，捕捉了「任意变量赋值下的代码求值」等能力）上做基准测试。这留下两个未解问题：(a) 是否存在**更简单**的形式状态跟踪，它们在实践中**更相关**，并且已经足以解释不同架构之间观察到的差异；(b) 我们对「各架构能表达哪一类状态跟踪」缺乏精细刻画，$S_5$ 只是一个单一过强的测试点。此外，缺少一个分层、可解释「失败在哪一层」的基准。

## 方法
### 1. 四级状态跟踪层级（基于赋值语义递增）

| 层级 | 名称 | 语义 | 形式语言对应 |
|------|------|------|--------------|
| 1 | **r-trivial** | 对变量的**不可变赋值**（immutable assignment to variables in programming） | 最简单，非正则/极弱类 |
| 2 | **aperiodic** | 赋值**可变**（mutable） | aperiodic（最终周期非平凡）类 |
| 3 | **soluble** | 赋值**自指**（self-referential） | 特定正则语言类 |
| 4 | **general finite state tracking** | 一般有限状态跟踪 | 最一般（可模拟 TM/寄存器机级别） |

难度轴严格由**赋值语义的可变性→自指性**递增，而非按经验难度排列。

### 2. 理论结果
- **定理（transformer 类不足）**：the class of problems transformers are thought to length-generalize on **does not even contain all aperiodic state tracking**。
  - 含义：此前基于 $S_5$ 的讨论高估/误设了 transformer 的状态跟踪能力边界；更简单的问题已经超出该类。
- **定理（GDN 表达力）**：**GDN with positive eigenvalues expresses all aperiodic problems**。
  - 含义：Gated DeltaNet 的线性/循环状态更新机制在特征值为正时恰好覆盖 aperiodic 类——与其门控/增量记忆结构一致。
- **定理（transformer 正则语言 = soluble）**：**the regular languages recognized by certain transformers are precisely all soluble ones**。
  - 含义：存在一类 transformer，其能力恰为 soluble 层级，形成精确的对应刻画。

形式化写法（依摘要语义重建，具体符号以原文为准）：

$$\mathcal{L}_{\text{transformer}}^{\text{len-gen}} \subsetneq \mathcal{A} \quad (\mathcal{A} = \text{aperiodic 语言类})$$

$$\mathcal{R}(\text{GDN}_{+}) = \mathcal{A}, \qquad \mathcal{R}(\text{some transformers}) = \mathcal{S} \quad (\mathcal{S} = \text{soluble 类})$$

### 3. StateBench 基准
- **4-tier long-horizon state-tracking benchmark**，每层对应上述一个语义层级。
- 题目形态源自「word problems」：以自然语言/伪代码式问题给出变量赋值序列，询问最终状态/值——与 $S_5$ word problem 同源但按赋值语义分层。
- 长度：long-horizon（摘要未给出具体长度区间与样本量）。

### 4. 系统性直接训练实验
- **直接训练（direct training）**而非仅使用预训练权重，以隔离架构本身的能力。
- 跨架构对比（transformer 类 vs GDN 类；摘要未逐一列出模型配置）。
- 结果：**largely align with theoretical expectation**。
- 例外观察：**interesting observations at very large scale length-generalization**（超大规模下的长度泛化出现有趣现象）——摘要未说明具体方向。

### 5. 预训练模型评测
- 覆盖 **both open hybrid and closed frontier** 模型（开源混合架构，如 Transformer/SSM 混合；以及闭源前沿模型）。
- 结果：**none of them robustly solves even soluble state tracking**。

## 实验结果
### 理论—实验对照

| 主张 | 来源 | 结论 |
|------|------|------|
| transformer 长度泛化类 ⊉ 全部 aperiodic | 理论证明 | 成立 |
| GDN（正特征值）表达全部 aperiodic | 理论证明 | 成立 |
| 某些 transformer 的正则语言 = 全部 soluble | 理论证明 | 成立 |
| 直接训练实验与理论大体一致 | 实验 | **largely align** |
| 超大规模长度泛化 | 实验 | **interesting observations**（摘要未给数值/方向） |

### StateBench 预训练模型评测

| 模型类别 | 覆盖 | 结果 |
|----------|------|------|
| 开源混合架构（open hybrid） | 含 | **未能稳健解决 soluble 层级** |
| 闭源前沿模型（closed frontier） | 含 | **未能稳健解决 soluble 层级** |
| 全部被测模型 | 10 组不同配置 | **none of them robustly solves even soluble state tracking** |

- 摘要未给出：具体模型名单、各层准确率数值、基线（non-learned）对照、训练曲线、样本量。
- 一个关键结论：**最简单一档（soluble）都过不去**，说明当前架构的实际状态跟踪能力比理论讨论所暗示的还要弱。

## 关键洞察
1. **基准粒度决定结论的精确度**：用单一的 $S_5$ word problem 做状态跟踪评测，会把「不会求解一般有限状态问题」与「不会求解很简单的可变赋值问题」混为一谈。分层后可以看到连 soluble（自指赋值）这一档都未被稳健解决——**能力缺口比原先认为的更大、也更靠基础**。
2. **理论给出了可检验的架构画像**：GDN 的正特征值 ↔ aperiodic 完备性，与「循环/线性注意力通过累积状态更新获得更宽的语言类」直觉吻合；transformer 的正则语言恰好等于 soluble 类，则给出精确的**上界**而非模糊的「transformer 更弱」。这类「能力类 ↔ 架构类」一一对应是评估架构的强工具。
3. **「人认为 transformer 能长度泛化的类」本身是错的**：这是一个反直觉的负结果——大家赖以论证 transformer 长度泛化能力的类甚至不包含全部 aperiodic 问题；因此以往基于该类的乐观结论需要重新审视。
4. **规模不是万能解**：超大规模出现有意思的长度泛化现象，但无论开源混合架构还是闭源前沿模型，都无法稳健解决 soluble 档——说明状态跟踪的瓶颈更像是**架构归纳偏置**而非**容量**。

## 局限性
- 摘要未给出：StateBench 的题量、长度范围、生成方式（合成模板？）、评分指标、各层具体准确率、实验所用架构清单与规模、预训练模型名单、超大规模长度泛化观察的具体内容。
- 结论「transformer 类不包含全部 aperiodic」依赖「人们认为 transformer 能长度泛化的类」这一前提类，摘要未给出该类的形式定义细节。
- 「certain transformers」中的 "certain" 未具体化（哪类位置编码/注意力的 transformer）。
- 直接训练实验与预训练评测之间存在差距（训练后的模型表现与预训练模型不可直接比较）。
- 基准以「word problem」形式为主，向真实长上下文应用（代码代理、对话状态维护、文档追踪）的外部效度未验证。

## 适用场景
- 评估长上下文/循环架构（GDN、Mamba 类、混合架构）的状态跟踪能力。
- 研究形式语言视角下的 transformer 与 SSM 能力边界。
- 为「长上下文建模」研究提供分层的可诊断基准。
- 指导长程代码执行、变量追踪类任务的架构选型。

## 相关工作
[[Gated DeltaNet]] [[State Tracking]] [[SSM]] [[Mamba]] [[Transformers]] [[S5 Word Problem]] [[Formal Languages]] [[Linear Attention]] [[Length Generalization]]

---
#LLM #Research #state-tracking #long-context #arXiv-2611
