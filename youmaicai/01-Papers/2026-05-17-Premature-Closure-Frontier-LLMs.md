# Quantifying and Mitigating Premature Closure in Frontier LLMs

> 🥬 LLM 论文分析：前沿 LLM 的"过早闭合"问题与安全性

## 基本信息
- **作者**: Rebecca Handler et al.
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15000) | [PDF](https://arxiv.org/pdf/2605.15000)
- **arXiv**: arXiv:2605.15000 [cs.CL]

## 核心贡献

### 核心创新点
首次系统性地定义并量化 LLM 的 **Premature Closure（过早闭合）**：在不充分信息时做出不适当承诺——提供答案/建议/临床指导，而更安全的做法是澄清、弃权、升级或拒绝。

### 问题定义

> **LLM Premature Closure = 在不确定性下的不适当承诺**
> 提供答案、推荐或临床指导，而更安全的响应应该是：澄清、弃权、升级或拒绝。

### 实验设计

**Structured Tasks**:
- MedQA (n=500)：正确选项被移除后，模型仍高频选择答案（false-action rates: 55-81%）
- AfriMed-QA (n=490)：false-action rates: 53-82%

**Open-ended Evaluation**:
- HealthBench: 平均 30% 的问题给出不适当回答
- Physician-authored adversarial queries: 78% 给出不适当回答

### 主要发现

| 模型 | Safety Prompting 效果 |
|------|----------------------|
| 全部5个 frontier LLMs | Safety-oriented prompting 减少了 premature closure |
| 残留失败 | 仍然存在，提示需要评估 LLMs 是否知道"何时不该回答" |

### 关键洞察
1. **模型不知道自己不知道**：在信息不足时仍强制回答
2. **Safety prompting 有帮助但不充分**：需要更深层的能力评估
3. **医学场景尤其危险**：高风险决策场景需要模型明确知道能力边界

## 局限性
- 主要聚焦医学领域，泛化性待验证
- Safety prompting 的具体实现未公开

## 建议
- **是否推荐使用**: 是（医疗 AI 应用必须关注）
- **适用场景**: 医疗 AI、对安全性要求高的决策支持系统、模型可靠性评估

## 标签
#LLM #safety #reliability #medical-AI #premature-closure #uncertainty