# Architecture-Aware Credit Transport for Large Language Model Reinforcement Learning

## 元信息
| 标题 | Architecture-Aware Credit Transport for Large Language Model Reinforcement Learning |
|------|------|
| 作者 | Qifan Shi |
| 链接 | [原文](https://arxiv.org/abs/2608.21501) |
| arXiv | arXiv:2608.21501v1 |
| 领域 | cs.AI |

## 核心贡献
1. **Computation-Conditioned Credit Transport (CCT)**: 框架用行为策略内部计算的分离统计量参数化因果核
2. **CompPO 算法**:
   - 将原生注意力浓度映射到有界 per-token retention gate
   - 用于 one-step bootstrap 和路径依赖 GAE trace (Comp-GAE)
   - 协同设计 transport-aligned critic (TAC) 复用 actor 隐藏态
3. **关键结果**: Qwen3-4B 上 CompPO 达 61.4% 精度（GRPO 为 53.8%）

## 核心公式
- 注意力浓度 → bounded per-token retention gate
- Comp-GAE: 路径依赖广义优势估计
- TAC: 复用 actor 隐藏态和路由信息的 transport-aligned critic

## 实验结果
| 模型 | CompPO | GRPO | 提升 |
|------|--------|------|------|
| Qwen3-4B | 61.4% | 53.8% | +7.6% |
| Qwen3-4B (frozen eval) | +4.3 | baseline | - |
| Llama-3.1-8B-Instruct (frozen eval) | +3.9 | baseline | - |

## 局限性
- 需 Transformer 架构支持注意力浓度计算
- 对非 Transformer 架构不适用

## 标签
#LLM-RL #Credit-Assignment #Transformer #PPO #GRPO #Reinforcement-Learning
