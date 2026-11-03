# RLiD: Reinforcement Learning in the Decision Plane for Language Agents and LLMs

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | RLiD: Reinforcement Learning in the Decision Plane for Language Agents and LLMs |
| 作者 | Ziyi Chen, Yan Zhang, Jianhui Wei, Jianing Yin, Daoan Zhang |
| 链接 | [原文](https://arxiv.org/abs/2611.02455) |
| arXiv | arXiv:2611.02455 |
| 类别 | cs.AI |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **RLiD（Reinforcement Learning in the Decision plane）**：直接优化**可执行动作选项的概率**，而非 token 序列的概率。
2. **编译式输入 + 大决策模型（LDM）**：把 observation、可选紧凑 memory 与带标签的 action menu 编译进模型输入，LDM **单次前向传播**即完成动作选择。
3. **消除自回归与动作解析**：去除自回归 token 生成、绕过 action parsing，因此不会产生非法动作输出，并提升 RL rollout 效率。
4. **策略蒸馏回生成式 LLM**：在 LDM 的动作轨迹上做监督，把训练好的决策策略蒸馏回通用生成式 LLM。
5. **理论分析**：在固定文本策略下，对同一动作的多种表述做边缘化可去除一个零均值梯度分量，且不改变期望更新。

## 问题背景
RL 已显著提升 LLM 在广泛任务上的能力，但 **token-level RL 把一个动作的 advantage 分配给整段生成响应**——包括用于描述/解析动作的 token、reasoning chain 以及格式错误（malformed）内容。尽管环境实际只执行解析出的动作，同一动作在自然语言中的表达差异会给策略梯度估计引入额外方差。

## 方法
**决策平面 vs 文本平面**
- 传统 token-level RL：在文本平面上定义策略 $\pi_\theta(y \mid x)$，动作需从生成文本中解析；
- RLiD：直接在**动作集合**上定义策略。

```math
\pi_{\text{LDM}}(a \mid o, m, \mathcal{A}) = \text{softmax}\big(f_{\text{LDM}}(o, m, \mathcal{A})[a]\big), \quad a \in \mathcal{A}
```

**编译式输入构造**

```text
Model input = compile(observation, optional compact memory, labeled action menu)
Output       = single forward pass → action selection
```

- **observation**：环境观测；
- **optional compact memory**：可选的紧凑记忆（摘要式历史）；
- **labeled action menu**：带标签的候选动作菜单——动作集合被显式列举并标注；
- **LDM（large decision model）**：一次前向直接输出动作（无需逐 token 生成、无需解析）。

**理论分析**
- 固定文本策略 $\pi_\theta(\cdot\mid x)$ 内，对同一动作 $a$ 的多种自然语言实现 $y \sim \pi_\theta(\cdot \mid x, a)$ 做边缘化；
- 由此产生的梯度分量是**零均值**的；
- 因此**去除它不会改变期望更新**（unbiased），只降低方差。

**RLiD → 生成式 LLM 的蒸馏**
- 用训练好的 LDM 在环境中产生的**动作轨迹**作为监督信号，蒸馏回生成式 LLM（保持模型仍是普通自回归 LLM，可继续做开放式生成）。

**训练/评测环境**：ARC、Countdown、Sokoban、ALFWorld。

摘要未给出 LDM 的架构与规模、action menu 的规模与构造方式、所用 RL 算法（policy gradient?）、蒸馏的具体损失与数据量。

## 实验结果
**1）ARC / Countdown / Sokoban**
- 在多个设置下取得**更高性能或更低计算成本**（二选一，视任务而定）。

**2）ALFWorld 完整训练与蒸馏管线**

| 方法 | 成功率 | GPU-hours (H100) |
|------|--------|-------------------|
| **RLiD（完整训练 + 蒸馏管线）** | **99.3%** | **12.7** |
| token-level RL（同一 LLM） | 86.6% | 17.3 |

→ 成功率 **+12.7 个百分点**，GPU 时数 **减少 4.6 H100 GPU-hours（约 27% 节省）**。

**3）ALFWorld 评估（带编译记忆，最强配置）**

| 模型 | 结果 |
|------|------|
| Qwen2.5-1.5B LDM（最强 LDM） | **134 个未见 + 140 个已见评估游戏全部 100% 成功** |
| 蒸馏后的生成式 LLM | 同上，**100% 成功** |

摘要未给出逐环境的数值拆分，也未给出 LDM 参数量与动作菜单示例。

## 关键洞察
1. **"动作"是比"token"更合适的 RL 载体**：环境只执行解析出的动作，那么把 advantage 摊到 reasoning token 上本就是噪声来源；直接在决策平面上做 RL，梯度方差更低、rollout 更快，且天然不会产生非法动作。
2. **方差分析解释了"多写一段推理"的代价**：同一动作的不同措辞带来的梯度分量零均值，因此在需要精细动作控制的场景中，鼓励模型用"自然语言铺垫"来思考反而稀释了学习信号。
3. **决策与生成可以分离再缝合**：先训练一个只做选择的小 LDM（参数极小，如 Qwen2.5-1.5B 即达 100%），再把动作轨迹蒸馏回生成式 LLM——这为"轻决策模型 + 重生成模型"的系统分工提供了可操作范式。
4. **token-level RL 在结构化环境中的低效被量化**：同样的 LLM、同样的环境，token-level RL 多花 27% 算力还低 12.7 个百分点，说明瓶颈在表述空间而非决策能力。

## 局限性
- 强依赖**离散、可枚举的动作空间**（RLP/游戏/工具菜单）；开放生成任务（写作、开放域问答）无法直接套用动作菜单。
- Action menu 由谁生成、如何标注、规模上限多大未说明——这是把环境知识外部化后的新瓶颈（人工设计 vs 自动生成）。
- LDM 与被蒸馏的生成式 LLM 分离部署带来系统复杂度；蒸馏后的模型是否保持通用生成能力未评估。
- 评测集中于 ARC / Countdown / Sokoban / ALFWorld，任务规模偏小或结构化，与真实长程 agent 场景有差距。
- 1.5B LDM 在 ALFWorld 达 100% 可能是任务饱和（该 benchmark 可能已不具区分度）。
- 摘要未给出 RL 算法、超参与方差分析的经验验证（是否真的降低梯度方差）。
- 未讨论动作空间随环境动态变化时的编译开销与缓存策略。

## 适用场景
- 有明确离散动作接口的 agent（工具调用、GUI 操作、游戏、规划类环境）的 RL 训练。
- 追求 RL rollout 效率与低算力成本的团队。
- 需要"决策策略 + 生成模型"分层架构的系统设计（决策下沉、生成上浮）。
- 评估"自回归生成是否为 agent RL 的必要形式"的研究参考。

## 相关工作
- [[Reinforcement Learning]] · [[Policy Gradient]]
- [[Decision Transformer]] · [[Action Masking]]
- [[Distillation]] · [[Behavior Cloning]]
- [[Tool Use]] · [[Agent]]
- [[ARC]] · [[Sokoban]] · [[ALFWorld]] · [[Countdown]]

---
#LLM #Research #RL #Agent #Decision-Policy #arXiv-2611
