# TRUSTMEM: Learning Trustworthy Memory Consolidation for LLM Agents with Long-Term Memory

## 元信息

| 标题 | TRUSTMEM: Learning Trustworthy Memory Consolidation for LLM Agents with Long-Term Memory |
|------|-------|
| 作者 | Tianyu Yang, Sudipta Paul, Vijay Srinivasan, Vivek Kulkarni, Srinivas Chappidi |
| 链接 | [原文](https://arxiv.org/abs/2606.25161) |
| arXiv | arXiv:2606.25161 |
| 类别 | cs.AI |
| 发表 | 2026-06-23 |

## 核心贡献

1. **TrustMem 框架**：提高 LLM Agent 记忆整合的可信度，解决现有记忆系统的三大错误类型
2. **Memory Transition Verifier**：从 coverage（覆盖率）、preservation（保留性）、faithfulness（忠实性）三个维度评估记忆更新过程
3. **Preference-guided RL**：在相同记忆状态下构建候选更新的偏好对，用强化学习直接优化记忆更新行为
4. **SOTA 结果**：在 MemoryAgentBench、HaluMem、Mem-alpha 上达到最优

## 问题背景

现有 LLM Agent 记忆系统的问题：
- **Omission（遗漏）**：遗漏重要信息
- **Corruption（腐化）**：破坏已有记忆
- **Hallucination（幻觉）**：引入不支持的幻觉内容

这些错误一旦存储会成为持久性系统状态故障，影响后续推理。

## 方法

### Memory Transition Verifier
评估每次记忆更新的三个维度：
- **Coverage**: 新记忆是否覆盖了需要保留的重要信息
- **Preservation**: 已有重要记忆是否被保留
- **Faithfulness**: 更新是否忠实于原始信息，无幻觉

### Preference-guided RL
- 同一记忆状态下生成多个候选更新
- 构建偏好对（preferred vs dispreferred）
- 用 RL 直接优化记忆更新行为

## 实验结果

| 指标 | 提升 |
|------|------|
| HaluMem memory extraction F1 | +12.14 points |
| Transition-level omission reduction | 40.1% |
| Transition-level corruption reduction | 79.1% |
| Transition-level hallucination reduction | 50.0% |

## 局限性

- 评估器本身可能引入错误
- RL 训练的计算开销
- 在开放域长程对话中的泛化性待验证

## 建议

- **是否推荐使用**：是
- **适用场景**：需要长期记忆的 LLM Agent 系统；对话系统；个性化助手
- **备注**：Memory Transition Verifier + Preference RL 的组合设计值得借鉴