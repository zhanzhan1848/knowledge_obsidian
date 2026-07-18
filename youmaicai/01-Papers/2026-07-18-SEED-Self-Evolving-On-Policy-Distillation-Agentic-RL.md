# 🥬 LLM 论文分析：SEED - Self-Evolving On-Policy Distillation for Agentic RL

## 基本信息
- **标题**: SEED: Self-Evolving On-Policy Distillation for Agentic Reinforcement Learning
- **作者**: Jinyang Wu, Shuo Yang, Zhengxi Lu et al.
- **发表**: arXiv, 2026-07-16
- **链接**: [原文](https://arxiv.org/abs/2607.14777) | [代码](https://github.com/jinyangwu/SEED)
- **arXiv**: arXiv:2607.14777
- **领域**: cs.CL (LLM Agent / RL / Agentic AI)

## 核心贡献
1. 提出 **SEED (Self-Evolving On-Policy Distillation)**：将已完成 on-policy 轨迹转化为训练时的 hindsight skills，再蒸馏回策略模型
2. 解决 Agentic RL 的**监督间隙**问题：基于结果的稀疏轨迹级奖励 vs token 级策略学习之间的监督缺失
3. 框架自我进化：策略同时收集轨迹并从中提取 hindsight skills，策略更新同步改进后续决策和技能分析

## 问题背景
大型语言模型作为交互式 Agent，需要处理：
- 长时序任务（multi-turn interaction）
- 工具使用（tool use）
- 环境反馈（environment feedback）

基于结果的 RL 面临挑战：
- 稀疏的轨迹级奖励
- 缺乏对中间决策的指导

## 方法：SEED 框架

### 阶段 1：技能生成
- 策略分析已完成轨迹，生成自然语言技能（hindsight skills）
- 技能类型：可复用工作流、决定性观察、失败规避规则

### 阶段 2：On-Policy 蒸馏
- 策略在普通上下文和技能增强上下文下对采样动作重新评分
- 将技能诱导的概率偏移转化为**密集的 token 级 on-policy 蒸馏信号**
- 与基于结果的 RL 联合优化

### 关键特性
- **自进化**：hindsight supervision 随策略一同演进
- **密集监督**：填补轨迹级结果和 token 级策略之间的监督空白
- **on-policy**：保持辅助监督与当前轨迹分布对齐

## 实验
- 文本-based Agent 任务
- 视觉-based Agent 任务
- 结果：一致提升性能和采样效率，泛化到 unseen 场景

## 建议
- **是否推荐使用**: 是（LLM Agent 训练）
- **适用场景**: Agentic RL、工具学习、长时序决策

---
*📅 录入日期: 2026-07-18 | 来源: arXiv cs.CL*
