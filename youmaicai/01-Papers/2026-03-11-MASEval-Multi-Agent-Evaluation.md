# MASEval: Extending Multi-Agent Evaluation from Models to Systems

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | MASEval: Extending Multi-Agent Evaluation from Models to Systems |
| 作者 | Cornelius Emde, Alexander Rubinstein, Anmol Goel, Ahmed Heakl, Sangdoo Yun, Seong Joon Oh, Martin Gubri |
| 链接 | [原文](https://arxiv.org/abs/2603.08835) |
| arXiv | arXiv:2603.08835 |
| 代码 | [GitHub](https://github.com/parameterlab/MASEval) |
| 类别 | cs.AI, cs.CL, cs.LG |
| 发表时间 | 2026-03-09 |

## 核心贡献
1. **系统级评估视角**: 将整个系统作为分析单元，而非仅关注模型
2. **框架无关库**: 支持比较不同agentic框架的实现
3. **实证发现**: 框架选择与模型选择同样重要

## 研究动机
- 现有基准是model-centric的，固定agentic设置
- 实现决策(拓扑、编排逻辑、错误处理)显著影响性能
- 缺乏系统级评估工具

## 评估框架
- 支持框架: smolagents, LangGraph, AutoGen, CAMEL, LlamaIndex
- 评估维度:
  - 拓扑结构
  - 编排逻辑
  - 错误处理
  - 系统组件交互

## 实验设计
- 3个基准测试
- 3个模型
- 3个框架
- 系统级对比分析

## 关键发现
- **框架选择与模型选择同等重要**
- 系统架构决策显著影响最终性能
- 需要principled system design

## 适用场景
- Agentic系统选型评估
- 框架性能对比
- 系统架构设计决策

## 相关工作
- [[Multi-Agent Systems]] - 多智能体系统
- [[LLM Frameworks]] - LLM框架
- [[Agentic RAG]] - 代理式RAG

---
#Multi-Agent #Evaluation #LLM-Systems #MASEval
