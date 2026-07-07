# MedCalc-Pro: Solving Complex Medical Calculations with LLM Agents

## 元信息
| 标题 | MedCalc-Pro: Solving Complex Medical Calculations with LLM Agents |
|------|-------------------------------------------------------------------|
| 作者 | Ruihui Hou et al. |
| 链接 | [原文](https://arxiv.org/abs/2607.02879) |
| arXiv | arXiv:2607.02879 |
| 类别 | cs.AI |
| 发表 | 2026-07-03 |

## 核心贡献
1. **MedCalc-Pro Benchmark**：
   - 2,268 个真实临床病例
   - 覆盖 77 个医学计算器
   - 跨越 14 个临床科室
   - 三层难度：单计算器 → 多计算器 → 嵌套计算器

2. **问题诊断**：现有基准测试过于简化：
   - 每个病例对应单一计算器
   - 工具被显式指定
   - 实际临床场景需要多计算器联合评估、嵌套尺度计算、模糊查询

3. **Agent Framework**：
   - 支持多工具选择和嵌套工具调用
   - 通过结构化验证和证据审查抑制参数误差传播
   - 提升复杂临床场景的泛化能力

## Benchmark 难度分级
```
Level 1: Single-calculator（单计算器，显式指定）
Level 2: Multi-calculator（多计算器联合评估）
Level 3: Nested-calculator（嵌套计算，模糊查询）
```

## 实验结果
- 在三个难度级别上均取得最佳性能
- 系统对比了开源、闭源和医学专用 LLM

## 意义
- 为 LLM 医学计算提供真实复杂度的评估基准
- 多工具调用和嵌套调用的 agent 框架

## 相关方向
- [[LLM Agent]]
- [[Medical LLM]]
- [[Multi-Tool Calling]]
- [[Benchmark]]
- [[RLHF]]

---
*🥬 LLM Agent + Medical - 复杂医学计算的多工具 Agent 基准和方法*
