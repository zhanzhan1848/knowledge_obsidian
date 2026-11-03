# AffToM: Benchmarking Recursive Affective Theory of Mind in Dynamic Multi-Party Interactions

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | AffToM: Benchmarking Recursive Affective Theory of Mind in Dynamic Multi-Party Interactions |
| 作者 | Jinpeng Hu, Yiduo Jin, Erqiang Wang, Jia Li, Jingjing Wu, Peipei Song |
| 链接 | [原文](https://arxiv.org/abs/2611.02725) |
| arXiv | arXiv:2611.02725 |
| 类别 | cs.AI |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **AffToM 基准**：首个面向**递归情感理论心智（recursive affective Theory of Mind）**的基准，包含 **1,922 对测试样本**与 **19,759 对训练样本**。
2. **双任务设计**：**Individual Affective Reasoning (IAR)**——从事件与社会认知上下文中推断情绪；**Multi-party Affective Reasoning (MPAR)**——在新证据出现时**递归追踪**参与者的嵌套信念与情绪。
3. **事件驱动多智能体生成流水线**：以**动态角色交互图（dynamic character interaction graphs）**为基础，显式建模**事件序列、人际关系与心智状态更新**。
4. **AffToM-R1 后训练框架**：**两阶段**——**监督微调（SFT）+ 视角感知（perspective-aware）的 rubric 引导强化学习**，MPAR 准确率相对基座模型提升 **13.38 个百分点**。
5. **揭示 MPAR 的高难度**：即使最强的被评测 **MLLM** 准确率也 **<60%**。

## 问题背景
在真实社交互动中理解情绪，需要的远不止于识别面部表情或给情绪贴标签：**同一事件在不同参与者身上可能引发不同情绪**，取决于每个人各自知道什么、认为他人知道什么或感受什么，以及这些嵌套心智状态如何随时间演化。现有基准大多把**高阶认知 Theory of Mind** 与**多模态情绪推理**分开研究，导致在**信息不对称且动态变化**条件下的递归情感推理长期缺乏系统探索。

## 方法

### 基准构成
| 任务 | 说明 |
|------|------|
| **IAR**（Individual Affective Reasoning） | 从事件 + 社会认知上下文推断个体情绪 |
| **MPAR**（Multi-party Affective Reasoning） | 在新证据涌现时**递归**追踪多方参与者的嵌套信念与情绪 |

数据规模：**19,759** 训练对 / **1,922** 测试对。

### 生成流水线（事件驱动 + 多智能体）
- 基础：**动态角色交互图（dynamic character interaction graphs）**，显式编码：
  - **事件序列**（event sequences）
  - **人际关系**（interpersonal relations）
  - **心智状态更新**（mental-state updates）
- 由多个智能体按事件推进生成，保证状态更新与证据到达的时序一致。

### AffToM-R1 后训练
两阶段框架：
1. **阶段一：监督微调（SFT）** —— 在 19,759 对训练样本上建立基础行为；
2. **阶段二：视角感知（perspective-aware）的 rubric 引导强化学习（RL）** —— 用带有视角维度（谁在什么认知位置上的感受如何）的**评分细则（rubric）**作为奖励信号进行强化学习，以提升对嵌套视角的正确归因。

## 实验结果

| 指标 | 数值 |
|------|------|
| MPAR 准确率（最强被评测 MLLM） | **< 60%** |
| AffToM-R1 相对基座模型的 MPAR 准确率提升 | **+13.38 个百分点（pp）** |
| 数据集 | https://github.com/MindIntLab-HFUT/AffToM |

摘要未给出：具体被评测 MLLM 名单、IAR 上的准确率数值、训练数据与生成流水线上的数据统计细节，以及 RL 阶段的奖励设计与超参。

## 关键洞察
1. **MPAR 才是真正的瓶颈**：最强 MLLM 仍不足 60% 准确率，说明"递归追踪多方嵌套情绪信念"远难于单点情绪识别；这也是纯 CoT / 单视角提示难以覆盖的能力维度。
2. **不对称信息是情感推理的难点所在**：静态的"事件 → 情绪"映射可以被模式匹配解决，而 MPAR 要求模型**在每一步都重新做视角归因**（谁的信念被新证据改变了），难度量级完全不同。
3. **视角感知 rubric 比笼统的"答案对错"奖励更适合该任务**：由于正确答案本身带有多视角解释结构，用 rubric 分解评估（各视角是否分别判断正确）能提供比单一正确性更密集的信号，这也解释了两阶段框架的增益（+13.38pp）。
4. **合成式数据管线可规模化生成"带状态的"推理监督**：事件驱动 + 交互图的设计保证了监督信号中的状态更新时序正确，这是人工标注难以规模化的部分。

## 局限性
- 摘要未给出任何绝对准确率数值（除"<60%"与"+13.38pp"）、模型清单与评测协议细节，也未给出 IAR 的结果——无法判断两个任务间的难度落差。
- 数据由**合成多智能体管线**生成，其"社会互动"的真实度与真实人类对话分布的差距未知（摘要未讨论人工验证/分布比对）。
- 情感标注的主观性与文化/语境依赖性在摘要中未被讨论。
- RL 阶段涉及观点/情绪的生成式表达，存在价值对齐与安全风险维度未提及。
- arXiv preprint，未经同行评审。

## 适用场景
- 多模态大模型的**社会推理与心智理论**能力评测。
- 具身智能 / 社交机器人 / 客服 agent 中需要**多方情绪归因**的场景。
- 研究视角切换（perspective-taking）、belief tracking、嵌套心智状态表示的团队。
- 构建情感/社会推理训练数据与后训练（rubric 引导 RL）流水线的参考实现。

## 相关工作
- [[Theory of Mind]] — 高阶认知 ToM
- [[Affective Computing]] — 情绪识别与情感计算
- [[Multimodal LLM]] — 多模态大模型
- [[Reinforcement Learning from Rubric]] — rubric 引导的 RL
- [[Supervised Fine-Tuning]] — SFT 阶段
- [[Perspective Taking]] — 视角切换
- [[Synthetic Data Generation]] — 多智能体合成数据
- [[Belief Tracking]] — 信念追踪

---
#LLM #Research #Theory-of-Mind #Affective-Reasoning #Multimodal #Benchmark #arXiv-2611
