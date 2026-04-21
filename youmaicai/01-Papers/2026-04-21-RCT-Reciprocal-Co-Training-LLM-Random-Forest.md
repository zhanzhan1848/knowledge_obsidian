# RCT: Reciprocal Co-Training — Coupling Gradient-Based LLM and Non-Differentiable Models via RL

## 元信息
| 标题 | Reciprocal Co-Training (RCT): Coupling Gradient-Based and Non-Differentiable Models via Reinforcement Learning |
|------|------|
| 作者 | Yunshuo Tian, Akayou Kitessa, Tanuja Chitnis, Yijun Zhao |
| 链接 | [原文](https://arxiv.org/abs/2604.16378) |
| arXiv | arXiv:2604.16378v1 |
| 发表 | 2026-03-24 |

## 核心贡献
1. 提出 **Reciprocal Co-Training (RCT)** 框架：LLM + Random Forest (RF) 通过强化学习耦合
2. 创建迭代反馈循环：每个模型利用来自对方的信号改进
3. 在三个医学数据集上验证了双方模型的持续性能提升（对 LLM 效果尤其显著）

## 核心创新点
- **问题**：LLM（梯度优化 + 文本数据）与 Random Forest（非可微特征划分）表示和训练范式根本不同，难以有效集成
- **方法**：
  - Tabular data → 标准化文本表示 → LLM
  - LLM embeddings → 增强 RF 特征空间
  - 校准的 RF 概率估计 → 反馈信号 → 引导 LLM 的强化学习更新
- **迭代循环**：双向 adaptation，双方各取所长

## 消融实验
- Iterative refinement（迭代优化）
- Hybrid reward design（混合奖励设计）
- Dimensionality control（维度控制）

## 关键词
`LLM` `Random Forest` `reinforcement learning` `co-training` `tabular data` `medical`

## 相关工作
- LLM + Classical ML integration
- Reinforcement Learning from Human Feedback (RLHF)
- Bidirectional model adaptation

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*