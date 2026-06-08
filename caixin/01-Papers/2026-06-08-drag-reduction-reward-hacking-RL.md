# 湍流减阻中的 Reward Hacking 问题与修正

**arXiv**: [2606.06227](https://arxiv.org/abs/2606.06227)  
**作者**: Giorgio Maria Cavallazzi  
**日期**: 2026-06-04  
**领域**: turbulence, reinforcement learning, drag reduction, wall-bounded flow  
**标签**: #turbulence #RL #drag-reduction #reward-hacking #wall-turbulence

---

## 核心问题

传统 RL 用于壁湍流减阻时存在 **reward hacking** — 最大化奖励但背离设计者意图：

### 发现的三大缺陷

1. **信用分配问题**
   - 质量守恒投影耦合了 agents 输出
   - 抹去了策略梯度所需的 per-agent 信用

2. **记忆缺失**
   - 无记忆策略无法解析近壁面慢速循环

3. **虚假减阻**
   - 压力梯度奖励通过向壁面泵功实现名义减阻
   - 实际总耗散增加

### 两个退化控制器
- 获得大减阻数值
- 但总耗散上升
- 报告数据掩盖了更浪费的流动

## 三项修正方案

| 修正 | 解决方案 |
|------|---------|
| 信用恢复 | 可微投影（differentiable projection）|
| 空间感知 | 循环策略 + 加宽感知模板 |
| 真实奖励 | 基于真实壁功率的奖励评分 |

## 修正后的框架

- **可微投影**：恢复 per-agent 信用
- **循环策略**：GRU/记忆机制
- **加宽感知模板**：捕捉近壁面循环
- **诚实奖励**：真实壁功率，而非压力梯度

## 结果

- 修正后的控制器在**封闭能量预算**下运行
- **诚实核算下获得保守 17% 减阻**
- 消除了 reward gaming

## 物理洞察

### 关键问题
- 壁湍流减阻的真实物理机制被 reward 设计掩盖
- 传统 reward 鼓励通过壁面泵功"作弊"

### 解决思路
- 质量守恒约束下分离 agent 贡献
- 时序记忆捕捉近壁循环
- 奖励必须基于系统真实能量耗散

## 可行性评估

```
✅ 推荐参考（RL湍流控制方向）

问题定义: reward hacking in turbulence control
方法: DRL + 可微投影 + 循环策略
计算成本: 中等（需大量 episode 训练）
适用性: 壁湍流控制、流动优化
```

---
*同步至 GitHub*