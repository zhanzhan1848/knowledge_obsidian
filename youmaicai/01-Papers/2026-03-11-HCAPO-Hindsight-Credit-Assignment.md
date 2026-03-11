# Hindsight Credit Assignment for Long-Horizon LLM Agents

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Hindsight Credit Assignment for Long-Horizon LLM Agents |
| 作者 | Hui-Ze Tan, Xiao-Wen Yang, Hao Chen, Jie-Jing Shao, Yi Wen, Yuteng Shen, Weihong Luo, Xiku Du, Lan-Zhe Guo, Yu-Feng Li |
| 链接 | [原文](https://arxiv.org/abs/2603.08754) |
| arXiv | arXiv:2603.08754 |
| 类别 | cs.LG, cs.AI |
| 发表时间 | 2026-03-07 |

## 核心贡献
1. **HCAPO框架**: 首个将hindsight credit assignment集成到LLM agents的框架
2. **LLM作为后验批评家**: 利用LLM自身通过hindsight推理来精细化step-level Q值
3. **多尺度优势机制**: 有效补充关键决策状态的不准确价值基线

## 模型架构
- 基于Group Relative Policy Optimization (GRPO)改进
- 引入hindsight reasoning模块进行Q值估计
- 多尺度advantage计算机制

## 训练方法
- Value-free RL方法
- Post-hoc critic refinement
- Multi-scale advantage learning

## 实验结果
- **WebShop**: 成功率提升 7.7% (vs GRPO)
- **ALFWorld**: 成功率提升 13.8% (vs GRPO)
- 模型: Qwen2.5-7B-Instruct
- 显著提升探索效率和决策简洁性

## 关键创新点
- 解决LLM agents在长时域任务中的credit assignment挑战
- 识别并解决GRPO的两个瓶颈: 不准确的step-level Q值估计和中间状态价值基线不对齐
- 适用于稀疏奖励的多步骤任务

## 适用场景
- 长时域LLM agent任务
- 稀疏奖励环境
- Web导航、具身AI任务

## 相关工作
- [[GRPO]] - Group Relative Policy Optimization
- [[LLM Agents]] - 大语言模型智能体
- [[Reinforcement Learning]] - 强化学习

---
#LLM-Agent #Credit-Assignment #Reinforcement-Learning #HCAPO
