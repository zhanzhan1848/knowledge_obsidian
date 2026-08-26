# RENDER: Controlling Reader-Facing Evidence in LLM Memory Evaluation

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | RENDER: Controlling Reader-Facing Evidence in LLM Memory Evaluation |
| 作者 | Yuan Si, Simeng Han, Daming Li, Jialu Zhang |
| 链接 | [原文](https://arxiv.org/abs/2608.23568) |
| arXiv | arXiv:2608.23568 [cs.AI] |
| 发表 | 2026-08-05 |

## 核心贡献

1. **问题发现**: Memory 和 RAG 评估将回答模型的输入视为实现细节，但实际上相同对话历史可以渲染为 memory entry、summary、typed record 或 raw excerpt，不同格式会显著影响模型性能。

2. **RENDER 基准**: 提出 RENDER——一个控制 reader-facing artifact 的基准，固定对话内容而变化 artifact 格式：
   - **五级 Packet Ladder**：本地化答案承载内容何时进入输入
   - **确定性模板**：模拟 ChatGPT 风格条目、LangChain 摘要、MemGPT typed records、原始对话

3. **关键发现**:
   - 在 500 个 LongMemEval 问题和 9 个模型上，matched-budget resolved packets 比 recency-truncated raw dialogue 高出 **42.4-72.6 分**
   - Deployed-style 模板中，最佳-最差 spread 为 **24.6-48.8 分/模型**
   - 3 个在 formal ledger packets 上得 0 分的模型，在自然语言条目上回答相同事实达 **45.4-53.4%**
   - 效果在 retrieval noise 下持续存在，并迁移到 HotpotQA

## 核心洞察

> **Memory/RAG 评估应报告或控制 reader-facing artifact**

当前评估忽略了一个关键变量：记忆系统如何向回答模型呈现历史信息。相同的事实内容，以不同格式（结构化记录 vs 自然语言对话）输入时，模型性能差异可高达 70 分。这对评估实践有重要启示。

## 实验设置

- **数据集**: LongMemEval (500 questions)
- **模型**: 9 个主流 LLM
- **Artifact 类型**: ChatGPT-style entries, LangChain summaries, MemGPT typed records, raw conversation
- **评估指标**: Accuracy under different memory artifact formats

## 局限性

- 主要聚焦英语场景
- Packet ladder 的五级设计基于当前商业系统的观察，可能不全面
- 评估器（judge model）的偏好可能影响结果

## 相关工作

- LongMemEval
- MemGPT
- RAG 评估基准

## 建议

- **是否推荐**: ⭐⭐⭐⭐⭐
- **适用场景**: 所有 Memory/RAG 系统评估；构建生产级 memory 系统的团队
- **必读理由**: 首次系统揭示 reader-facing artifact 对 LLM 记忆评估的影响，是该方向的里程碑论文
