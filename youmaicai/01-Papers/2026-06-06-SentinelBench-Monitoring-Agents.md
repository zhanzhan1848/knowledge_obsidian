# SentinelBench: Benchmark for Long-Running Monitoring Agents

## 元信息
| 标题 | SentinelBench: A Benchmark for Long-Running Monitoring Agents |
|------|------|
| 作者 | Matheus Kunzler Maldaner, Adam Fourney, Amanda Swearngin, et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.05342) |
| arXiv | arXiv:2606.05342 |
| 领域 | cs.AI |
| 发表 | 2026-06-03 |

## 核心贡献

1. **提出 SentinelBench**：首个用于时间演变监控任务的开源基准测试
2. **100 个任务，10 个合成 Web 环境**：包括 email、calendars、finance、professional networking、entertainment
3. **测量任务完成率、反应时间和资源使用**：揭示响应性和成本之间的权衡

## 核心问题

现有 Agent 行为模型是连续 action：发出 tool calls、刷新页面、搜索替代方案等。但对于许多长时间运行的任务，这是错误的方法。

更好的策略是 **sustained attention**：
- 监控环境
- 注意到外部事件使进展成为可能
- 然后及时响应，不在等待时浪费资源

## 核心设计

### 任务类型
长时间运行的监控任务：跨越分钟、小时或更长时间的任务。

### 环境
每个环境暴露实时 Web 界面并重放事件脚本序列，要求 Agent 导航和推理状态不断变化的 Web 页面。

### 评估指标
- **Task Completion**: 任务完成率
- **Reaction Time**: 反应时间
- **Resource Use**: 资源使用

## 实验结果

- 测试了 3 个模型和 2 个浏览器 Agent 框架
-建立了性能基线
- 证明 Agent 设计选择如何显著影响关键指标

## 关键洞察

SentinelBench 能够区分 Agent行为中的有意义差异。

## 相关工作

- AI agents
- Browser agents
- Task automation
- Web navigation

## URL
- 原文: https://arxiv.org/abs/2606.05342