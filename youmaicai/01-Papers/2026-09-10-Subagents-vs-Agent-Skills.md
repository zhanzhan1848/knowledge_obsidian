# 🥬 LLM 论文分析：Subagents vs Agent Skills

## 基本信息
- **标题**: Subagents vs Agent Skills: Executing Reusable Knowledge for Long-Horizon Agentic Tasks
- **作者**: Wasu Top Piriyakulkij et al.
- **链接**: [arXiv:2609.09233](https://arxiv.org/abs/2609.09233)
- **arXiv**: arXiv:2609.09233v1
- **类别**: cs.AI, cs.CL, cs.LG

## 核心贡献

1. **Agent Skills 方式**: 将技能包指令加载到主 Agent 上下文
2. **Subagents 方式**: 将技能包作为子 Agent 调用，生成新的上下文窗口
3. **对比分析**: 子 Agent 执行在技能包有清晰输入-输出契约时优于 Agent Skills 方式

## 核心问题

随着任务视野增长，Agent Skills 方式变得脆弱：
- 上下文窗口积累更多信息
- 推理质量下降

## 方法对比

| 方式 | 优点 | 缺点 |
|------|------|------|
| **Agent Skills** | 无额外通信开销 | 上下文积累导致推理质量下降 |
| **Subagents** | 新鲜上下文专门解决子任务 | 额外通信开销（主-子 Agent 协调） |

**结论**: 当技能包有清晰输入-输出契约且指令编码了满足契约所需的程序知识时，子 Agent 执行更优

## 局限性

- 额外通信开销
- 不适用于没有清晰契约的技能包

## 建议
- **是否推荐使用**: 是（对有清晰接口定义的任务）
- **适用场景**: 长周期 Agent 任务、技能库复用
- **亮点**: 首次系统比较两种可重用知识执行方式的优劣

---

标签: #LLM-Agent #Agent-Skills #子Agent #长周期任务 #知识复用
