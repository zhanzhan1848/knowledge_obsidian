# 🥬 LLM 论文分析：State-Path Tool Menu

## 基本信息
- **标题**: The Menu Is an Execution Prior: State-Path Tool Menus for Online Agents
- **作者**: Song Wang et al.
- **发表**: EMNLP 2026 Main
- **链接**: [arXiv:2609.09395](https://arxiv.org/abs/2609.09395)
- **arXiv**: arXiv:2609.09395v1
- **代码**: [github.com/Met2348/State-Path](https://github.com/Met2348/State-Path)
- **类别**: cs.AI

## 核心贡献

1. **工具菜单 (Tool Menu)**: 定义为执行前展示给 Agent 的有序工具子集
2. **状态路径 (State Path)**: 从可观察请求状态到目标结果的执行前路线图
3. **State-Path Tool Menu 框架**: 将菜单作为状态路径上的执行先验

## 核心方法

**问题**: 现有方法按请求相关性排序工具，可能暴露最终动作但遗漏或延迟不明显的前置生产者

**State-Path Menu 三组件**:
1. **Encoder**: 表示当前状态下哪些工具可运行、输出如何满足后续输入、训练路径中重复的顺序
2. **Retriever**: 覆盖可执行入口 + 缺失输入的生产者 + 最终动作
3. **Reranker**: 将生产者放在消费者之前

```
状态路径 = 可执行入口 → 缺失输入的生产者 → 最终动作
菜单 = 沿状态路径的执行先验
```

## 实验结果

| 数据集 | 基线 | State-Path |
|--------|------|------------|
| ToolBench | 0.737 (在线成功率) | **0.898** |
| 32 工具覆盖 | 基线 128 工具覆盖率 | **32 工具即超越** |

- 成功率提升在不同 Executor 模型容量下均保持

## 局限性

- 需要训练数据（状态路径）
- 对未见过的工具泛化能力待验证

## 建议
- **是否推荐使用**: 是
- **适用场景**: 多步工具调用 Agent、ToolBench 类基准
- **亮点**: 将工具选择问题形式化为路径规划，概念清晰，效果显著

---

标签: #LLM-Agent #工具调用 #EMNLP2026 #Agent推理 #多步任务
