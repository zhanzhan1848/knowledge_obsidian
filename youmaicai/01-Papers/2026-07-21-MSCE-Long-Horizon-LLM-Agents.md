# MSCE: Memory-Skill Co-Evolution for Long-Horizon LLM Agents

## 元信息
| 标题 | From Memory to Skills: Evidence-Grounded Co-Evolution Governance for Long-Horizon LLM Agents |
|------|------|
| 作者 | Bo Tang, Yang Zhang, Guomian Zhuang, et al. |
| 链接 | [原文](https://arxiv.org/abs/2607.16621) |
| arXiv | arXiv:2607.16621v1 |
| 领域 | cs.CL |
| 发表 | EMNLP 2026 |
| 发表日期 | 2026-07-18 |

## 核心贡献
1. 提出 MSCE (Memory-Skill Co-Evolution)，一个无训练的记忆-技能共进化框架
2. 将智能体经验组织为： grounded step traces、reusable procedural policies、declarative environmental cognition
3. 提出反射加权值回填 (reflection-weighted value backfilling)，将稀疏的终末反馈通过密集的本地自反射传播

## 问题背景
现有 LLM 智能体的记忆系统通常将先验轨迹作为被动上下文检索，而非将其转换为可执行能力。

## 框架设计

### 核心组件
1. **Grounded Step Traces**: 有证据支撑的步骤轨迹
2. **Reusable Procedural Policies**: 可重用的程序化策略
3. **Declarative Environmental Cognition**: 声明性环境认知

### 技能结晶
- 将具有正向估计增益的基于证据的 L2 策略结晶为可调用技能
- 保留：evidence links、applicability boundaries、decision guidance、verification rules、reliability estimates

### 反射加权值回填
- 将稀疏终末反馈通过密集本地自反射传播
- 产生用于管理记忆和技能进化的证据校准轨迹值

## 实验结果
- EvoAgentBench 和 LoCoMo 数据集
- 显著优于 state-of-the-art 的技能增强和记忆驱动智能体基线
- 展示强跨域迁移能力和终身进化能力

## 建议
- **是否推荐使用**：是
- **适用场景**：长期任务智能体、Agent 系统、终身学习
- **论文级别**：EMNLP 2026

---
*关键词*: LLM Agent, Memory, Skill, Long-Horizon, EMNLP
