# Evidence-Grounded Large Language Models Guide Perovskite Solar Cell Design and Optimization

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Evidence-grounded large language models guide perovskite solar cell design and optimization |
| 作者 | 摘要未列出完整作者列表 |
| 链接 | [原文](https://arxiv.org/abs/2611.00633) |
| arXiv | arXiv:2611.00633 |
| 类别 | cs.CL, cs.AI, cs.LG |
| 发表时间 | 2026-11-03 |
| 会议 | arXiv preprint（67 页，正文 18 页） |
| 评分 | 8/10 |

## 核心贡献
1. **PSM-Bench**：由钙钛矿研究者构建的 **800 题基准**，评测钙钛矿光伏中的科学推理能力
2. **OpenPerov**：专家知情（expert-informed）的语言模型框架，从 **4,532 篇**文章重建的专家校准证据记录中学习
3. **真实实验闭环验证**：模型选择的 K 类似物**胜过专家偏好的 Na 类似物**，制成的器件达到 **27.05% 光电转换效率**，并在 **1,000 小时**后保持 **96.74%** 稳态参考效率

## 问题背景
用 LLM 解读实验证据、设计有区分度的实验、构造有充分支撑的机制解释，是材料研究中的一项核心难题。现有通用 LLM 的问题是：
- **不懂领域证据的语境**（什么控制变量、什么观测到什么层级）
- 生成的解释听起来合理但**没有证据链**

## 方法

### 证据记录（Evidence Records）的重建
```text
4,532 篇文章
   ↓ 专家校准
证据记录：实验策略 ←→ 控制条件 ←→ 观测结果 ←→ 机制解释
   ↓
OpenPerov（专家知情语言模型框架）
```

关键在于**证据记录的结构化形式**：把实验策略（experimental strategies）、控制（controls）、观测（observations）与机制解释（mechanistic interpretations）**显式链接**。

### 两阶段模型
| 模型 | 说明 |
|------|------|
| **OpenPerov Flash** | 闭卷系统中排名第一（13 个闭卷系统） |
| **OpenPerov Pro** | 在检索到的证据基础上**修订选定的段落**，进一步提升 Scientific Mastery |

### 训练方法
- **结构化证据适应（structured-evidence adaptation）** —— 优于常规的问答训练（question-answer training）

## 实验结果

### 基准与闭卷排名
| 指标 | 结果 |
|------|------|
| PSM-Bench 规模 | **800 题**，由钙钛矿研究者构建 |
| OpenPerov Flash | **13 个闭卷系统中排名第一** |
| 训练语料 | **4,532 篇**文章重建的证据记录 |
| 结构化证据适应 | **优于**常规问答训练 |

### 专家对比
- 在**源自后续研究**的问题上，OpenPerov Flash 与 Pro **都超过了专家撰写的答案**

### Scientific Mastery 提升
- OpenPerov Pro：Scientific Mastery 从 **87.6 → 89.1**（通过修订检索证据支持的段落）

### 实验闭环（硬验证）
| 指标 | 数值 |
|------|------|
| 自组装单层设计选择 | OpenPerov 选 **K 类似物**，胜过专家偏好的 **Na 类似物** |
| 器件光电转换效率（PCE） | **27.05%** |
| 1,000 小时后稳态参考效率保持率 | **96.74%** |

## 关键洞察
1. **"证据接地"的可验证性来自闭环，而非来自指标** —— 大量 LLM 科学应用停在"基准分数更高"。本篇的关键差异是：**模型的选择被物理实验证实了**，且方向与专家直觉相反（K vs Na）。这是比任何基准分数都强的证据。
2. **结构化证据记录 > 扁平文档** —— 从 4,532 篇文章中重建"策略-控制-观测-解释"的链接，比直接把文章喂进去更有效。这与 [[2026-11-03-2611-03157-toward-knowledge-centric-ai]] 的"内化"主张呼应：**知识需要被处理成结构，而非被堆叠**。
3. **"修订选定的段落"是一种廉价的接地增强** —— Pro 模型并不重新生成全部内容，只**修订有检索证据支撑的部分**。这是一种可迁移的接地策略：局部接地 > 全局重写。
4. **Pro 模型反超专家答案的意义** —— 在"源自后续研究的问题"上超过专家撰写答案，说明**当证据被系统化组织后，LLM 可以超过领域专家的书面结论**。但要谨慎解读：这可能更多反映专家答案的**简写性质**，而非模型真的理解更深。

## 局限性
- 单一领域（钙钛矿光伏），跨领域外推性未验证
- 摘要未说明 Flash 与 Pro 的模型底座、参数量、训练成本
- "超过专家撰写答案"的比较未说明专家人数、是否盲评
- PSM-Bench 由本领域研究者构建，可能有领域特异性
- 实验闭环仅验证了一个设计决策（K vs Na 类似物）

## 适用场景
- 材料科学 / 化学 / 生物等**证据密集型科学领域**的 LLM 应用
- 需要"检索 + 结构化证据 + 局部修订"接地策略的场景
- 科学 LLM 的基准构建方法论

## 相关工作
- [[LLM for Science]] — 科学 LLM
- [[Retrieval-Augmented Generation]] — RAG
- [[Perovskite Solar Cell]] — 钙钛矿光伏
- [[Evidence Grounding]] — 证据接地
- [[Structured Evidence Records]] — 结构化证据记录

---
#LLM #Research #Science #Evidence-Grounding #Domain-Expertise #arXiv-2611
