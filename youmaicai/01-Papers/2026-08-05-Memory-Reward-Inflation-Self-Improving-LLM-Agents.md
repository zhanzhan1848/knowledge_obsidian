# Memory Reward Inflation in Self-Improving LLM Agents

## 基本信息
- **标题**: Memory Reward Inflation in Self-Improving LLM Agents
- **作者**: Azadeh Zamanifar 等
- **发表**: arXiv:2608.00017 [cs.AI]
- **日期**: 2026-06-29
- **链接**: [原文](https://arxiv.org/abs/2608.00017) | [PDF](https://arxiv.org/pdf/2608.00017)

## 核心贡献
1. **发现失效模式**: 提出"Echo Gap"——自我改进LLM agent中错误记忆被过度利用的问题
2. **形式化分析**: 证明Error-Independence Assumption (EIA)是修正inflation的必要条件
3. **解决方案**: 提出LUCID算法，在BIRD text-to-SQL上达到56.9%准确率

## 核心问题：Echo Gap
- **现象**: 错误episode收到膨胀的奖励；agent优先重用最有把握的错误
- **根因**: 误差通过记忆复合而非平均消除；确认偏差的判断误差与原始自评分偏差相关
- **关键**: EIA必须满足——信号必须追踪truth且误差与记忆偏差去相关

## 关键公式
- 可恢复的payoff是truth追踪误差和记忆偏差误差的闭式函数
- Inflation不仅在score排序检索时发生，也在plain相似性检索时发生

## 实验结果
- **BIRD text-to-SQL benchmark**:
  - LUCID: 56.9%
  - Memento-style self-graded agent: 54.0% (+2.9pp gain)
  - Memory-less agent (相同架构): 52.4%

## LUCID算法
- Answer-free de-inflation algorithm
- 提供一致的端到端增益

## 局限性
- 需要可用的验证信号来去膨胀
- 在完全无法获得truth反馈的场景可能受限

## 相关工作
- Self-improving LLM agents
- Memory-based policy improvement
- Reward modeling

## 标签
#LLM Agent #自改进 #记忆 #奖励通胀 #Echo Gap #BIRD
