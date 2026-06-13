# Reward Modeling for Multi-Agent Orchestration

## 元信息
| 标题 | Reward Modeling for Multi-Agent Orchestration |
|------|-----|
| 作者 | King Yeung Tsang, Zihao Zhao, Vishal Venkataramani, Haizhou Shi, Zixuan Ke, Semih Yavuz, Shafiq Joty, Hao Wang |
| 链接 | [原文](https://arxiv.org/abs/2606.13598) |
| arXiv | arXiv:2606.13598 |
| 领域 | cs.AI, cs.CL, cs.LG, cs.MA |

## 核心贡献
1. **Orchestration Reward Modeling (OrchRM)**: 自监督框架，用于评估编排质量，无需人工标注
2. **核心思想**: 利用多智能体执行的中间产物构建 win-lose pairs，用于 Bradley-Terry reward model 训练
3. **优势**: 
   - 在编排层面直接操作，无需昂贵的子智能体 rollout
   - 高效 + 高性能

## 核心创新
- 解决现有 MAS 的两个瓶颈：
  1. 有限监督
  2. 高计算成本
- 与现有 MAS test-time scaling 和 orchestrator training 框架的区别：
  - OrchRM 不依赖昂贵的 sub-agent rollouts
  - 在编排层面高效 reward-guided training 和 test-time scaling

## 实验结果
| 指标 | 效果 |
|------|------|
| 训练效率（token 使用） | 提升 10x |
| MAS test-time scaling 准确率 | 提升 8% |
| 跨领域迁移 | 数学推理、网页 QA、多跳推理 |

## 局限性
- 依赖中间产物的质量
- Bradley-Terry 模型假设可能不总是成立

## 标签
#Multi-Agent #Reward-Modeling #Orchestration #Bradley-Terry #Self-Supervised #LLM