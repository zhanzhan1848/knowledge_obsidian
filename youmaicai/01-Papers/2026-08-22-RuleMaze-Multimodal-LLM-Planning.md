---
type: paper
created: 2026-08-22
updated: 2026-08-22
tags: [multimodal, spatial-planning, rule-following, benchmark]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2608.20237
---

# RuleMaze: Rule-Compliant Visual Spatial Planning for Multimodal Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RuleMaze: Rule-Compliant Visual Spatial Planning for Multimodal Large Language Models |
| **作者** | Yu Chen, Ting Lei, Yaoyi Li, Jia Cai, Zhecen Wu, Yang Liu |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.20237) |
| **arXiv** | arXiv:2608.20237 |
| **代码** | https://github.com/oceanflowlab/RuleMaze |

---

## 核心贡献

> 提出 RuleMaze 基准和 DMP 方法，研究多模态 LLM 在显式或未见规则约束下的视觉空间规划能力，通过感知-执行-规则验证解耦实现系统性规则泛化。

1. **RuleMaze 基准**：首个评估 MLLM 规则遵循空间规划的基准，将规则理解、空间感知和约束行动规划解耦
2. **LLFH 方法**：语言-逻辑-函数混合自动化生成自然语言规则及逻辑表示，消除人工规则工程
3. **DMP 方法**：解耦感知、执行和规则验证，提高规则遵循和泛化能力

---

## 技术方案

### RuleMaze 基准设计

- **任务**：MLLM 在迷宫导航中遵循自然语言规则
- **规则复杂度**：从简单单规则到复合多规则
- **评估维度**：感知准确性、规则解释、约束行动规划

### Language-Logic-Function Hybridization (LLFH)

```
自然语言规则 → 逻辑表示 → 可执行验证器
```

- 自动生成自然语言规则
- 翻译为逻辑表示
- 生成可执行验证器

### Disentangled Multimodal Planning (DMP)

```
感知模块 → 执行模块 → 规则验证模块
```

- 分离感知、执行和规则验证
- 通过可解释推理原语实现
- 提供透明的中期规划轨迹

---

## 实验结论

- **数据集**: RuleMaze (多复杂度迷宫规则)
- **结果**: DMP 相比端到端文本规划基线显著提升规则遵循和规划成功率
- **泛化性**: 对更复杂和未见规则具有系统性泛化能力

---

## 局限性

1. **迷宫场景局限**：可能无法直接泛化到开放世界场景
2. **规则复杂度有限**：规则类型和组合可能无法覆盖所有真实场景
3. **视觉感知挑战**：对小目标或遮挡物体的感知可能不足

---

## 实现建议

- **实现难度**: 中等（迷宫环境相对可控）
- **预期性能**: 规则遵循和规划成功显著提升
- **适用场景**: 机器人规划、游戏 AI、具身智能

---

## 相关工作

- [[Multimodal Planning]] - 多模态规划
- [[Rule Following]] - 规则遵循
- [[Spatial Reasoning]] - 空间推理
