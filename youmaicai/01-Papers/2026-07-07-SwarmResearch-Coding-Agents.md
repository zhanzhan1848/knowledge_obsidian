# SwarmResearch: Orchestrating Coding Agents for Open-Ended Discovery

## 元信息
| 标题 | SwarmResearch: Orchestrating Coding Agents for Open-Ended Discovery |
|------|---------------------------------------------------------------------|
| 作者 | Yuvraj Virk, Zack Edds, Chunqiu Steven Xia, Lingming Zhang |
| 链接 | [原文](https://arxiv.org/abs/2607.02807) |
| arXiv | arXiv:2607.02807 |
| 类别 | cs.AI |
| 发表 | 2026-07-02 |

## 核心贡献
1. **问题诊断**：长期运行的 coding agents（如 autoreview）存在收敛问题：
   - 收敛到单一高层方法，然后只做低层编辑
   - 错过其他更优的高层 approach
   - 两个原因：单长程 agent 累积上下文 + 只暴露单一程序状态

2. **SwarmResearch 框架**：
   - **Shepherd Agent**：使用全局上下文协调多个 Search Agents
   - **Search Agents**：各自在独立 git branch 上运行，拥有本地上下文
   - **Orchestrator-guided scaling**：根据不同搜索深度自适应调整并行度

3. **性能**：在 15 个开放性优化任务中的 **13 个**上，发现优于或持平于 SOTA LLM 引导进化和多智能体方法

## 架构对比
| 传统方式 | SwarmResearch |
|---------|---------------|
| 单长程 agent | Shepherd + 多 Search Agent |
| 全局累积上下文 | 本地上下文 + 全局协调 |
| 单一程序状态 | 多 git branch 探索 |
| 固定并行度 | 自适应并行扩展 |

## 关键洞察
- **高层探索 > 低层优化**：Shepherd 的全局视角避免陷入局部最优
- **Orchestrator-guided scaling** 优于固定缩放（串行或并行）

## 相关方向
- [[LLM Agent]]
- [[Coding Agent]]
- [[Multi-Agent]]
- [[Open-Ended Discovery]]
- [[Shepherd Agent]]

---
*🥬 Coding Agent - 协调多 Agent 进行开放式发现的 Shepherd 框架*
