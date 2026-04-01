# Mimosa: 科学研究的进化式多智能体框架

## 元信息
| 标题 | Mimosa Framework: Toward Evolving Multi-Agent Systems for Scientific Research |
|------|------|
| 作者 | Louis-Felix Nothias et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.28986) |
| arXiv | arXiv:2603.28986 [cs.AI] |
| 领域 | 多智能体系统 · AI4Science · 工作流进化 |

## 核心贡献
**Mimosa** 是一个**进化式多智能体框架**，自动综合任务特定的 multi-agent 工作流，并通过实验反馈迭代优化。

### 与现有 ASR 系统对比
现有 Autonomous Scientific Research (ASR) 系统受限于**固定工作流和工具集**，无法适应演化任务。Mimosa 的核心创新是**工作流自动进化**。

## 框架四组件

### 1. MCP (Model Context Protocol) 动态工具发现
- 支持动态工具发现，不限于预定义工具集

### 2. Meta-Orchestrator 生成工作流拓扑
- 元编排器根据任务需求生成工作流结构

### 3. Code-Generating Agents
- 通过生成代码调用可用工具和科学软件库执行子任务

### 4. LLM-Based Judge 驱动工作流优化
- 评估执行质量，反馈驱动工作流 refinement

## 实验结果
**ScienceAgentBench** 上，使用 DeepSeek-V3.2 达到 **43.1% 成功率**，超越单智能体基线和静态多智能体配置。

### 关键发现
> 不同模型对多智能体分解和迭代学习的响应是异质的——工作流进化的收益取决于底层执行模型的能力。

## 特性
- **模块化架构**：工具无关设计，易扩展
- **完全可审计**：保留完整执行 trace 和存档工作流
- **领域专家引导结合**：支持与领域专家协作
- **全开源**：作为社区驱动 ASR 的开放基础

## 与 Drop the Hierarchy 论文对比
| 维度 | Mimosa | Drop Hierarchy |
|------|--------|---------------|
| 焦点 | 科学任务工作流进化 | 一般协调协议比较 |
| 自组织 | 通过反馈迭代进化 | 固定协议下的角色自选 |
| 工具 | 动态发现 MCP | 固定工具集 |
| 评估 | ScienceAgentBench | 内部 4 级复杂度任务 |

## 标签
#AI4Science #多智能体 #工作流优化 #Agent #科学自动化
