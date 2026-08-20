# Persona-Guided LLM Agents for Task-Oriented Dialogue

## 元信息
| 标题 | Persona-Guided LLM Agents for Task-Oriented Dialogue |
|---|---|
| 作者 | Maryam Shoaeinaeini, Brent Harrison, A. B. Siddique |
| 机构 | University of Kentucky |
| 链接 | [原文](https://arxiv.org/abs/2608.18085) |
| arXiv | arXiv:2608.18085 |

## 核心贡献
1. 构建**无需训练的框架**，研究 LLM 智能体在任务导向对话（TOD）中的**人格表达与人格适应**
2. 对比三种人格访问条件：**Neutral**（无信息）、**Try**（从对话线索推断）、**Oracle**（显式给出人格）
3. 发现**个性化与任务接地之间存在权衡**：适应用户人格提升约束满足率和满意度，但降低真实性
4. 验证 GPT-4o、Qwen3-Next-80B、Gemini 2.0 Flash 三大模型

## 研究问题
- **RQ1**：LLM 能否在目标导向对话中表达人格同时满足 schema 约束？
- **RQ2**：人格适应如何影响系统质量和用户满意度？
- **RQ3**：用户特质表达强度如何影响个性化收益？Oracle vs Try 差异？

## 关键发现

### RQ1
- LLM 用户智能体可在 schema 引导对话中表达人格，同时系统保持强任务性能
- 但部分特质的表达可靠性远低于其他

### RQ2
- 人格适应提升**约束满足率、通知率、用户满意度**
- 但降低**真实性**（truthfulness）
- → 个性化与任务接地的权衡

### RQ3
- Oracle 收益随特质表达强度增强而增长
- Try 的收益对表达强度基本不敏感
- **Try（基于线索推断）是更可靠的无需微调路线**

## 方法
- 数据集：Schema-Guided Dialogue (SGD) — Hotel & Restaurant 对话
- 评估维度：任务结果、人格实现、系统质量、配对用户满意度
- Big Five 人格特质及其对立极

---
*关键词：任务导向对话，人格适应，LLM Agent，个性化，GPT，BERT，Prompt Engineering*
*领域：cs.CL*
