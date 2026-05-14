# MAVIC: Macro-Action Value Correction for Instruction Compliance

## 元信息
| 标题 | Macro-Action Based Multi-Agent Instruction Following through Value Cancellation |
|------|-----|
| 作者 | Wo Wei Lin, Ethan Rathbun, Enrico Marchesini, Xiang Zhi Tan |
| 链接 | [原文](https://arxiv.org/abs/2605.12655) |
| arXiv | arXiv:2605.12655 |
| 类别 | cs.AI, cs.MA |

## 核心贡献
1. **问题**：MARL 中自然语言指令可能打断宏动作（macro-actions），导致 Bellman 更新跨指令上下文耦合，造成价值估计不一致
2. **方案**：MAVIC（Macro-Action Value Correction for Instruction Compliance）
   - 在指令边界修正 Bellman 备份：修正传入指令目标 + 恢复当前目标下的延续值
   - 修改 bootstrapping target 本身（不同于 reward shaping）
   - 统一策略下实现随机指令切换的一致价值估计

## 方法
- 宏动作边界处修正 Bellman 备份
- 修正传入指令目标 + 恢复延续值
- Actor-critic 实现

## 核心洞察
- 奖励塑造型方法 vs 修改 bootstrapping target：后者提供更强保证
- 在越来越复杂的合作多智能体环境中实现高指令合规性，同时保持基础任务性能

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.AI | MARL