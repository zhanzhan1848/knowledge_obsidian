# 🥬 LLM 论文分析：Self-Improving Agentic Systems Survey

## 基本信息
- **标题**：Self-Improvements in Modern Agentic Systems: A Survey
- **作者**：Zhe Ren, Jürgen Schmidhuber et al.
- **发表**：arXiv:2607.13104 | cs.AI / cs.CL / cs.LG
- **链接**：[原文](https://arxiv.org/abs/2607.13104) | [GitHub](https://github.com/selfimproving-agent/awesome-Self-Improving-Agents) | [Project](https://selfimproving-agent.github.io/)
- **页数**：97页 | 12图

## 核心贡献

1. **首个系统性 self-improving agent 框架**：将 modern agent 形式化为 foundation model + operational scaffold（prompts/memory/tools/control logic）的耦合配置

2. **Self-improvement 形式化**：self-induced update operator，获取并提交对模型参数或 scaffold 组件的更新

3. **分类体系**：按 update target（参数 vs scaffold）和驱动信号（反馈类型）组织已有工作

4. **超全资源列表**：[awesome-Self-Improving-Agents](https://github.com/selfimproving-agent/awesome-Self-Improving-Agents)

## Agent 结构
```
Agent = (Foundation Model) + (Operational Scaffold)
Scaffold = Prompts + Memory + Tools + Control Logic

Self-improvement = Self-induced Update Operator
→ Updates to Model Parameters or Scaffold Components
```

## 覆盖范围
- 97 页综述，涵盖 modern self-improving agents 的全貌
- 更新目标 × 信号类型的 2D 分类矩阵
- 应用场景、评估方法、开放问题

## 局限性
- 作为 survey，缺少novel technical contribution
- 某些最新进展（7月发表）可能未完全覆盖

## 建议
- **推荐阅读**：是（必读综述）
- **适用场景**：Agent 系统设计研究、LLM Agent 开发
- **亮点**：Jürgen Schmidhuber 参与，97页全貌综述 + 持续更新的 GitHub 资源

---

*📅 2026-07-16 | 油麦菜 🥬*
