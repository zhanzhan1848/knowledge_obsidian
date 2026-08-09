# TRAJDEBUG: Tracing Error Lifecycle to Identify Critical Failures in Long-Horizon Agent Trajectories

## 元信息
| 标题 | Tracing Error Lifecycle to Identify Critical Failures in Long-Horizon Agent Trajectories |
|------|------|
| 作者 | Yunjia Qi, Zehua Yin, Xintong Shi, Hao Peng, Songyuanyi Lu, Yixian Liu, Richeng Xuan, Yuhong Liu, Zhichao Hu, Xiaozhi Wang, Lei Hou, Bin Xu, Juanzi Li |
| 链接 | [原文](https://arxiv.org/abs/2608.06346) |
| arXiv | arXiv:2608.06346 |
| 领域 | cs.AI |

## 核心贡献

1. **TrajDebug**：错误生命周期追踪框架，解决长轨迹错误发现的两个挑战：
   - 多粒度历史压缩（multi-granularity history compression）
   - 基于证据的错误识别（evidence-based error identification）
2. **关键归因**：追踪每个错误的解决状态和最终影响，实现关键错误归属
3. **TrajErrBench**：486 条手动标注的失败轨迹（来自 Tau2Bench 和 SWE-Bench Pro），覆盖真实工具使用和编码场景

## 核心挑战

| 挑战 | 描述 |
|------|------|
| 轨迹过长 | 评判证据分散在远距离指令、观察和上下文中 |
| 多重错误 | 多个局部错误有不同下游影响，仅部分导致最终失败 |

## 实验结果

- 跨多种 Agent 基准最佳整体表现
- 诊断提供可操作反馈，提升下游 Agent 成功率

## 局限性

- 仅覆盖工具使用和编码场景
- 依赖高质量失败轨迹标注（构建成本高）

## 建议
- **是否推荐使用**：是
- **适用场景**：LLM Agent 调试、复杂任务 Agent 错误诊断

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-08-09*
