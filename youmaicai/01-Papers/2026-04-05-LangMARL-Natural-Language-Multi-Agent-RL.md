# LangMARL: Natural Language Multi-Agent Reinforcement Learning

## 元信息
| 标题 | LangMARL: Natural Language Multi-Agent Reinforcement Learning |
|------|------|
| 作者 | Huaiyuan Yao*, Longchao Da*, Xiaoou Liu, Charles Fleming, Tianlong Chen, Hua Wei |
| 机构 | Arizona State University, Cisco Research, UNC Chapel Hill |
| 链接 | [原文](https://arxiv.org/abs/2604.00722) |
| arXiv | arXiv:2604.00722 [cs.CL] |
| 代码 | [langmarl-tutorial.readthedocs.io](https://langmarl-tutorial.readthedocs.io/) |
| 发表 | 2026-04-01 |

## 核心贡献

1. **首次将多智能体信用分配（Credit Assignment）引入 LLM 多智能体系统**：识别出当前 LLM 多智能体系统的核心瓶颈在于无法将团队绩效归因到个体，提出借鉴经典 MARL 的信用分配机制来解决
2. **LangMARL 框架**：将 MARL 的信用分配和策略梯度优化迁移到自然语言空间，包括：
   - Language Policy Actors：每个智能体维护自然语言策略
   - Centralized Language Critic：在自然语言空间进行因果信用分配
   - Language Policy Gradient Estimator：将语言信用转换为语言形式的策略更新方向
   - Language Policy Optimizer：通过 LLM 优化算子进行语义策略更新
3. **首创语言空间梯度进化**：在语言空间进行策略改进，而非依赖数值梯度

## 模型架构

LangMARL 采用集中式训练-分布式执行（CTDE）范式：

```
团队绩效 rt → {ct1, ct2, ..., ctN}  (信用分配)
∇θi J(π) = Eπ[∑t ∇θi log πi(ati|oti) cti]  (策略梯度)
```

**核心流程**：
1. Language Policy Actors 分布式执行动作
2. Centralized Language Critic 对完整轨迹进行因果归因
3. Language Policy Optimizer 通过 LLM 执行语义策略更新

## 关键方法

### 语言信用分配
- 传统 MARL 中 rt → {ct1, ..., ctN} 的映射在语言空间重新定义
- Critic 观察完整轨迹，以自然语言形式为每个智能体分配信用
- 支持反事实基线（counterfactual baselines）和值分解

### 与现有方法对比

| 范式 | 方法 | 自进化 | 集中 Critic | 语言梯度 | 信用分配 |
|------|------|--------|-----------|---------|---------|
| 静态 Prompt | CoT | ✘ | ✘ | ✘ | ✘ |
| 单智能体自进化 | TextGrad | ✔ | ✔ | ✔ | ✘ |
| 多智能体自进化 | Agent Neural Network | ✔ | ✔ | ✔ | ✘ |
| **多智能体自进化** | **LangMARL** | **✔** | **✔** | **✔** | **✔** |

## 实验结果

- 在推理、QA、编码、游戏等多种合作多智能体任务上验证
- 相比预训练 LLM，样本效率、可解释性显著提升
- 跨不同数量智能体均保持强性能

## 局限性

- 依赖 LLM 作为策略和 Critic 的基础模型
- 语言空间策略梯度的收敛性需要进一步理论分析

## 标签
#LLM #多智能体 #强化学习 #MARL #信用分配 #自进化 #多智能体系统

## 相关论文
- TextGrad (yuksekgonul2024textgrad)
- COMA (foerster2018coma)
- Agent Neural Network (ma2025agentic)
