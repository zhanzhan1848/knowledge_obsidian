# UniClawBench: A Universal Benchmark for Proactive Agents on Real-World Tasks

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Universal Benchmark for Proactive Agents on Real-World Tasks |
| **arXiv** | arXiv:2607.08768 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08768 |
| **GitHub** | https://github.com/HKU-MMLab/UniClawBench |
| **项目页** | https://uniclawbench.github.io |
| **作者** | HKU-MMLab (香港大学) |
| **日期** | 2026-07-10 |

## 核心贡献

1. **UniClawBench**：首个能力驱动的主动式智能体（Proactive Agent）基准
2. 围绕 5 种基础模型能力设计评估任务：Skill Usage、Exploration、Long-Context Reasoning、Multimodal Understanding、Cross-Platform Coordination
3. 构建 **400 个双语现实任务**（英语+中文），在 live Docker 容器中用细粒度 step-by-step checkpoint 评估
4. 提出闭环评估策略：executor agent + hidden supervisor agent + user agent，模拟多轮人类反馈而不泄露评分标准
5. 支持基础模型能力与 Agent 框架设计的解耦评估

## 模型架构

- **评估框架**：多智能体协作（executor/supervisor/user 三角色）
- **评估环境**：Live Docker 容器（非 sandbox 静态评估）
- **checkpoint 机制**：细粒度 step-by-step completion tracking

## 评估方法

### 5 种基础能力

| 能力 | 描述 | 任务数 |
|------|------|--------|
| Skill Usage | 调用工具/API 完成技能任务 | ~80 |
| Exploration | 探索未知环境寻找相关信息 | ~80 |
| Long-Context Reasoning | 长程上下文推理（多跳） | ~80 |
| Multimodal Understanding | 多模态信息理解（图文） | ~80 |
| Cross-Platform Coordination | 跨平台协作（多系统操作） | ~80 |

### 评估策略

- **Closed-loop evaluation**：executor agent 执行任务，supervisor agent 监控过程，user agent 提供反馈
- 与框架解耦：评估基础模型能力 vs Agent 框架设计选择

## 实验结果

- 评估 SOTA 模型：GPT 系列、Claude、Gemini 等
- 评估多种 Agent 框架：ReAct、Plan-and-Execute、Reflexion 等
- 结果显示基础模型能力与 Agent 框架设计共同决定最终性能

## 关键发现

1. 现有基准依赖 sandboxed 环境 + 单轮评估，无法评估真实场景
2. 场景驱动的任务分类将多种能力混合在同一任务中，难以定位失败根因
3. 能力驱动的设计使失败分析更精细

## 局限性

- 仍基于模拟环境，真实企业场景可能更复杂
- 双语（英中）覆盖有限

## 相关工作

- [[2607.08716]] - Proactive Memory Agent（相关主题：LLM Agent 长期记忆）
- [[2607.08662]] - WebSwarm（相关主题：LLM Agent 搜索）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08768 | 2026-07-10*
