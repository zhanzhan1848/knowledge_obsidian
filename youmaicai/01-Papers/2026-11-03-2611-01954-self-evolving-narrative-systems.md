# Towards Self-Evolving Narrative Systems: Real-Time Adaptation and Long-Term Optimization with LLMs

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Towards Self-Evolving Narrative Systems: Real-Time Adaptation and Long-Term Optimization with LLMs |
| 作者 | 摘要未列出完整作者列表 |
| 链接 | [原文](https://arxiv.org/abs/2611.01954) |
| arXiv | arXiv:2611.01954 |
| 类别 | cs.CL, cs.AI |
| 发表时间 | 2026-11-03 |
| 会议 | ACL Rolling Review (ARR) 十月轮次在审 |
| 评分 | 7/10 |

## 核心贡献
1. **混合叙事框架**：通过**语义相似度对齐**动态平衡预写内容与实时 LLM 生成，在"作者控制"与"玩家能动性"之间取得平衡
2. **自演化反馈驱动优化框架**：利用**上下文学习（in-context learning）**迭代精炼 prompt，**免去人工 prompt 工程**
3. **案例研究与参与者评测**：验证框架提升叙事连贯性的同时保留玩家能动性

## 问题背景
两类交互式叙事系统各有明确缺陷：

| 范式 | 优点 | 缺点 |
|------|------|------|
| **传统交互式叙事** | 强作者控制、结构连贯 | 限制玩家能动性 |
| **LLM 驱动叙事** | 开放式生成、灵活 | **不一致**、叙事控制力弱化 |

第二个挑战：**长时间游戏过程中维持叙事质量**。手工调整 prompt 成本高且不scale。

## 方法

### 模块一：混合叙事框架（实时适应）
```text
预写内容  ←── 语义相似度对齐 ──→  实时 LLM 生成
   │                                    │
   └────── 动态平衡二者权重 ────────────┘
```
核心机制是**语义相似度对齐** —— 用语义相似度作为信号，判断生成内容与预写设定的距离，据此动态调整"用预写"还是"用生成"。

### 模块二：自演化优化（长期优化）
```text
游戏反馈
   ↓
in-context learning
   ↓
迭代精炼 prompt（无需人工 prompt engineering）
   ↓
更好的叙事质量
```
用**上下文学习**替代手工 prompt 调优，使 prompt 本身随体验自动演化。

## 实验结果
摘要给出的结论（定性 + 参与者评测）：
- 框架**增强叙事连贯性**
- 同时**保留玩家能动性**
- 生成内容与**作者意图**和**演化的玩家行为**两者对齐

（摘要未给出参与人数、量表分数或对照组数值。）

## 关键洞察
1. **"语义相似度"作为控制信号是个简洁的抽象** —— 不需要训练一个分类器来判断"这段生成是否还像原设定"，相似度就够了。这对任何"生成 + 一致性约束"的任务都可迁移。
2. **in-context learning 作为自我优化的载体，避开了权重更新** —— 意味着可以热更新、可回滚、可解释（prompt 就是状态）。这与 [[2026-11-03-2611-00796-steer-dont-tell-breaking-reasoning-plateaus-with-reachability-aligned-self-distillation]]（self-distillation 打破推理平台期）形成有趣对照：**一个在权重空间自演化，一个在上下文空间自演化**。
3. **作者控制与玩家能动性不是零和的** —— 传统观点认为必须二选一；本文通过语义相似度对齐说明存在可用的中间地带。这个结论若在更多场景成立，影响面很大。
4. **叙事一致性是 LLM 长程应用的通用痛点** —— 本篇的"混合 + 相似度对齐"是通用的**受约束生成**范式，不限于游戏。

## 局限性
- 依赖**参与者评测**，样本量与量表细节摘要未说明
- 语义相似度作为一致性代理，是**代理指标** —— 相似度高不等于叙事合理（与昨日 "平凡基线" / proxy metric 主题呼应）
- 未报告与现有叙事系统（传统 D&D 叙事工具、其他 LLM 叙事系统）的直接对比
- 长时间游戏中的 prompt 自演化是否会导致**漂移/退化**（prompt 越改越差），摘要未讨论

## 适用场景
- 交互式叙事 / 游戏 / 角色扮演系统的架构设计
- 任何需要"受约束的开放式生成"的场景
- 长期运行系统的 prompt 自动维护（免人工调优）

## 相关工作
- [[Interactive Narrative]] — 交互式叙事
- [[In-Context Learning]] — 上下文学习
- [[Prompt Engineering]] — 提示工程
- [[Self-Evolving Systems]] — 自演化系统
- [[Semantic Similarity]] — 语义相似度

---
#LLM #Research #Narrative #Self-Evolving #In-Context-Learning #arXiv-2611
