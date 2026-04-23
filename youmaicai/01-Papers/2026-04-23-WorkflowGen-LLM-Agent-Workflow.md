# WorkflowGen: Adaptive Workflow Generation Driven by Trajectory Experience

## 元信息
| 标题 | WorkflowGen: an adaptive workflow generation mechanism driven by trajectory experience |
|---|---|
| 作者 | Ruocan Wei, Shufeng Wang, Ziwei Shi |
| 链接 | [原文](https://arxiv.org/abs/2604.19756) |
| arXiv | arXiv:2604.19756 |
| 代码 | - |

## 核心贡献

1. **问题**：LLM Agent 在复杂任务中高推理开销、token 消耗大、执行不稳定、无法复用历史经验
2. **WorkflowGen**：自适应轨迹经验驱动的自动工作流生成框架

## 方法

### 知识提取
- Node level：错误指纹、最优工具映射、参数模式
- Workflow level：执行路径、异常回避策略

### 闭环机制
- 仅对可变节点进行轻量级生成
- 轨迹重写、经验更新、模板归纳

### 三层自适应路由
1. Direct reuse（直接复用）
2. Rewriting-based generation（基于重写的生成）
3. Full initialization（完全初始化）

根据与历史查询的语义相似度动态选择

## 结果

| 指标 | 提升 |
|------|------|
| Token consumption | 减少 40%+ (vs real-time planning) |
| Success rate | 提升 20% (中等相似度查询) |
| 效率 | 通过主动错误回避和自适应回退实现 |

## 建议

- **是否推荐使用**：是
- **适用场景**：LLM Agent 优化、工作流自动化、工具编排

---
**归档日期**：2026-04-23
**搜索关键词**：LLM agent, workflow generation, trajectory, experience reuse