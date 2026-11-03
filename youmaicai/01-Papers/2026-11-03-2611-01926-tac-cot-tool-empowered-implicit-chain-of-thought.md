# TAC-CoT: Tool-Empowered Implicit Chain-of-Thought via Interleaving Explicit Tokens

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | TAC-CoT: Tool-Empowered Implicit Chain-of-Thought via Interleaving Explicit Tokens |
| 作者 | Juseon Do, Sangmin Bae, Jeesu Jung, Hwanjun Song |
| 链接 | [原文](https://arxiv.org/abs/2611.01926) |
| arXiv | arXiv:2611.01926 |
| 类别 | cs.CL |
| 发表时间 | 2026-11-01 |
| 会议 | EMNLP 2026 Main Long |
| 评分 | 8 |

## 核心贡献
1. **提出 TAC-CoT（Tool-empowered Adaptive implicit Chain-of-Thought）**：用**紧凑的潜在推理段（compact latent reasoning segments）**替换显式推理轨迹，同时**只对工具调用、工具观察与最终答案保留文本 token**。
2. **解决"隐式 CoT 与工具使用接口不兼容"这一具体障碍**：既有隐式 CoT 用连续 token 取代文本 rationale，而智能体工具使用**要求显式的文本通信接口**（工具名、参数、观察结果必须可读、可解析）。TAC-CoT 通过**交错设计（interleaved design）**同时满足两者。
3. **精度与效率双提升**：在 agentic 数学与 QA 基准上，准确率**最高提升 8.8 个点**，同时**模型前向传播次数最多减少 6.8×**。
4. **工具使用质量的独立改善**：分析显示 TAC-CoT 在**单工具与多工具设定下均提升工具使用质量**——即收益不只来自"少生成 token"，也来自更规范的工具调用。

## 问题背景
基于 LLM 的智能体系统日益与 CoT 推理结合，用于解决需要**准确推理、外部知识与多步审议**的任务。但显式 CoT（explicit CoT）产生**大量生成开销**（每一步都要自发生成文本 rationale）。另一方面，**隐式 CoT**（implicit CoT）把文本 rationale 换成紧凑的连续 token，从而省去生成成本，但它**天然不支持智能体工具使用所需的显式通信接口**——连续 latent token 无法承载可被工具层解析和回写的结构化调用与观察。因此在 agentic 场景中，效率与工具可用性之间存在直接冲突。

## 方法
### 1. 核心框架：交错（interleaving）设计
TAC-CoT 的关键是把"推理"与"通信"分离到两种 token 空间中：

- **潜在推理段（latent reasoning segments）**：连续的、紧凑的内部推理表示，替代传统显式文本 rationale。推理过程在这些段中完成，**不落成可读文本**。
- **显式 token（explicit tokens）**：**仅**用于三类内容——
  1. 工具调用（tool calls）
  2. 工具观察（observations）
  3. 最终答案（final answers）

- 交错结构：latent 段 ↔ 显式 token 交替出现。智能体在 latent 段内"想"，需要与外部世界交互时才落地为显式文本。

### 2. 形式化视角
可将 agentic 轨迹抽象为：
$$\tau = (\, z_1, c_1, o_1,\; z_2, c_2, o_2,\; \dots,\; z_k, \text{answer} \,)$$
其中 $z_i \in \mathbb{R}^{d_z}$ 为第 $i$ 步的**潜在推理段**（latent, 不可读），$c_i$ 为显式**工具调用**，$o_i$ 为**工具观察**；最终 $\text{answer}$ 为显式文本。相比纯显式 CoT，文本生成量显著下降。

（TAC-CoT 的具体 latent 段参数化方式——例如是固定数量的软 token、还是由某个辅助头预测/解码产生——摘要未给出；此处公式为对交错结构的抽象化表达。）

### 3. 关键设计决策
- **只保留"功能性"文本**：显式 token 被严格限定在"外部系统必须看到或用户必须看到"的三类内容，其余全部隐式化。这条约束是方法能同时拿到效率和工具兼容性的根本原因——文本 token 的存在是为了**接口契约**，不是为了推理。
- **自适应（Adaptive）**：方法名中的 "adaptive" 暗示 latent 段的使用是自适应的（按需分配），但摘要**未给出**自适应规则的具体形式（是否由模型自行决定 latent 段数量、是否与工具调用次数相关）。
- **不落地 rationale** 意味着放弃用文本 rationale 做监督/可解释性输出——这是一项明确的取舍。

### 4. 评估维度
- **任务正确性**：agentic 数学与 QA 基准的准确率。
- **效率**：**模型前向传播次数**（forward passes）——注意这里计的是 forward pass 而非生成 token 数，说明评估聚焦于**实际推理调用次数**的开销。
- **工具使用质量**：单工具与多工具设定下分别评估。

## 实验结果
| 指标 | 结果 |
|------|------|
| agentic 数学 / QA 基准准确率提升 | **最高 +8.8 个点（up to 8.8 points）** |
| 模型前向传播次数减少 | **最多 6.8×（up to 6.8x）** |
| 工具使用质量 | **单工具设定：改善**；**多工具设定：改善** |
| 发表 | EMNLP 2026 Main Long |

## 关键洞察
1. **"显式 token"在 agentic 场景中应按接口契约而非推理需要来分配**：TAC-CoT 的可迁移洞见是——在工具型 agent 中，文本 token 的功能是**与外部世界交换结构化信息**，而不是"思考的外显"。一旦把这两类用途解耦，"隐式 CoT 不能做工具调用"这个看似本质的限制就消失了。这是把隐式 CoT 从纯 reasoning 任务推向 agentic 任务的关键一步。
2. **效率与能力同向而非互换**：+8.8 准确率与 6.8× 前向减少同时出现，说明被砍掉的不是"有用的思考"而是**冗余的 verbalization**；这与"latent CoT 因缺少监督信号而退化"的常见担忧相反——本文通过"只隐式化推理、显式化通信"规避了监督信号缺失问题。
3. **多工具设定同样改善是更强的证据**：单工具场景中提升可能来自格式规整化（更少乱调用），但多工具设定要求**正确的工具选择顺序与参数**，latent 段减少的 verbalization 噪声反而让决策路径更清晰——说明收益不只是"格式对齐"这一表层效应。
4. **值得注意的取舍**：不再产出可读 rationale，意味着**过程可解释性与 rationale-based 监督信号（如用 CoT 文本做蒸馏）随之丧失**。摘要未讨论这一代价。

## 局限性
- 摘要**未给出**具体基准名称、数学/QA 数据集、基线方法（显式 CoT、隐式 CoT、以及各 baseline 变体）、以及绝对准确率数值。
- latent 段的具体实现（数量、维度、训练方式、是否需要额外参数头或额外训练阶段）**摘要完全未给**，复现存在显著缺口。
- "adaptive" 的自适应机制细节未披露。
- **6.8× 前向传播减少**与**8.8 点准确率提升**均标注为 "up to"，即**最好情况**，最差情况/平均情况**未给出**。
- 前向传播次数减少**不等于** wall-clock 延迟同等下降——latent 段的计算开销与批量效率**摘要未说明**。
- 训练成本：隐式 CoT 通常需要专门训练阶段或辅助损失，本文**未说明**训练开销是否增加。
- 任务范围限于 **agentic 数学与 QA**；开放式生成、创意写作、需显式多步推理解释的教育/法律场景**未验证**。
- 丧失文本 rationale 后的**可调试性/可审计性下降**未被讨论。

## 适用场景
- 构建**工具调用型 agent**（搜索、代码执行、API 编排、多步解题），在延迟/成本敏感的生产环境中需要压降推理开销。
- 多工具**编排**系统，需要降低工具调用轮次与总推理成本。
- 需要**保留结构化工具接口**但希望减少冗长 thought 输出的 agent 框架。
- 与外部工具 API 交互、输出必须符合 schema 的场景（TAC-CoT 的显式 token 恰好满足 schema 约束）。

## 相关工作
- [[Chain-of-Thought]] - 思维链
- [[Implicit CoT]] - 隐式思维链（连续潜在推理 token）
- [[Tool Use]] / [[Function Calling]] - 工具调用
- [[LLM Agents]] - 大语言模型智能体
- [[Latent Reasoning]] - 潜在推理
- [[Speculative Decoding]] - 推测解码（同属推理效率方向）
- [[Multi-Step Reasoning]] - 多步推理

---
#LLM #Research #Chain-of-Thought #Tool-Use #Agent-Efficiency #arXiv-2611
