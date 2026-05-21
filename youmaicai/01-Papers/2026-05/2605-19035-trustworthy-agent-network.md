# Trustworthy Agent Network: Trust Must Be Baked In, Not Bolted On

## 元信息
| 标题 | Trustworthy Agent Network: Trust in Agent Networks Must Be Baked In, Not Bolted On |
|------|------|
| 作者 | Yixiang Yao et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.19035) |
| arXiv | arXiv:2605.19035 |
| 会议 | SIGKDD 2026 Blue Sky Ideas Track |
| 领域 | Multi-Agent Systems, Agent-to-Agent (A2A), Trustworthiness |

## 核心贡献
1. **A2A 网络范式**: 提出 Agent-to-Agent 网络,异构 agents 自主协调解决多步任务
2. **系统性漏洞识别**: 对抗性组合、语义错位、级联操作失败等系统性漏洞
3. **四设计支柱框架**: 可信赖 A2A 网络需要从架构层面而非事后修复

## 核心论点
- 现有 agent 对齐技术无法解决 A2A 网络中的系统级漏洞
- A2A 网络的可信赖性**必须在协调框架一开始就 baked in**,而非 retrofitting 到现有协议

## A2A 网络的三大系统漏洞
1. **对抗性组合**: 多 agent 协作时可能产生恶意组合
2. **语义错位**: 异构 agent 之间的语义理解不一致
3. **级联操作失败**: 单点故障可能导致整个网络失效

## 四设计支柱
论文提出四个 design pillars 用于架构可信赖的 A2A 系统(具体内容待原文)

## 建议
- 是否推荐阅读: **是**,SIGKDD 2026 Blue Sky Ideas,多 Agent 系统方向重要视角
- 适用场景: Agent 系统设计、多 Agent 协作框架、可信赖 AI 系统

---

*📅 收录日期: 2026-05-21 | 分类: #multi-agent #A2A #trustworthiness #SIGKDD2026*