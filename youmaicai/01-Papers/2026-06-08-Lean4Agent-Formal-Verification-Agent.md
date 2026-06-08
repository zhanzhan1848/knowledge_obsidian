# Lean4Agent: Formal Modeling and Verification for Agent Workflow and Trajectory

## 元信息
| 标题 | Lean4Agent: Automated Construction of Fine-Grained Evaluation Rubrics for Large Language Models in Long-Tail Educational Scenarios |
|------|------|
| 作者 | Ruida Wang, Jerry Huang, Pengcheng Wang, Xuanqing Liu, Luyang Kong, Tong Zhang |
| 链接 | [原文](https://arxiv.org/abs/2606.06523) |
| arXiv | arXiv:2606.06523 |
| 领域 | cs.AI, cs.LG, cs.LO, cs.SE |
| 发表 | 2026-06-02 |

## 核心贡献

1. **问题**：LLM Agent 系统缺乏形式化方法来指定、验证和调试工作流与执行轨迹。现有 Agent 系统无法保证语义一致性。

2. **核心方法**：提出 **Lean4Agent**，首个使用 Lean4（依赖类型形式语言）来建模和验证 Agent 行为的框架。

3. **关键组件**：
   - **FormalAgentLib**：可扩展的 Lean4 库，用于形式化建模和验证 Agent 工作流的语义一致性，支持轨迹揭示的执行时失败定位
   - **LeanEvolve**：基于 FormalAgentLib 结果修订工作流以增强能力

4. **实验验证**：
   - 在 SWE-Bench-Verified 难题子集和 ELAIP-Bench 子集上测试 5 个领先 LLM
   - 验证通过的工作流平均优于失败工作流 **11.94%**
   - LeanEvolve 进一步将 SWE 性能提升 **7.47%**

## 核心创新点

将数学中的形式语言（FL）引入 LLM Agent 验证领域，类比自然语言（NL）的歧义性驱动形式语言发展。首次使用依赖类型语言（Lean4）进行 Agent 行为的formal验证。

## 核心公式/概念

- 语义一致性验证：在明确假设下验证工作流语义
- 执行轨迹失败定位：从轨迹中揭示执行时失败并追溯到形式化模型

## 局限性

依赖 Lean4 的形式化建模能力，对于复杂 Agent 系统，建模成本可能较高。

## 建议
- **是否推荐使用**：是
- **适用场景**：需要高可靠性保障的 LLM Agent 系统开发，特别是软件工程（SWE）场景

---
*🥬 油麦菜 — LLM/NLP 知识管理*