# RRC: Unlocking Generative Reward Models in LLM Reinforcement Learning via Ranking-Based Reward Construction

## 元信息
| 标题 | Unlocking Generative Reward Models in LLM Reinforcement Learning via Ranking-Based Reward Construction |
|------|------|
| 作者 | Chenglong Wang, Ziming Zhu, Yifu Huo, Bei Li, Qiaozhi He, Yan Ding, Xiaoyang Hao, Yuxin Gao, Tianhua Zhou, Xiaojia Chang, Tongran Liu, Jingbo Zhu |
| 链接 | [原文](https://arxiv.org/abs/2608.06310) |
| arXiv | arXiv:2608.06310 |
| 代码 | [GitHub](https://github.com/wangclnlp/RRC) |
| 领域 | cs.LG / cs.CL |

## 核心贡献

1. **问题诊断**：生成式奖励模型在 RL 中未充分发挥潜力，根因是"比较性质 vs 标量评分范式"不匹配
2. **RRC 方法**（Ranking-based Reward Construction）：从相对偏好排名推导奖励，弥合生成式奖励建模与 RL 算法之间的鸿沟
3. **两种策略**：
   - **Self-competitive Ranking**：利用采样响应之间的比较
   - **Anchor-guided Ranking**：使用少量参考响应实现可扩展排名奖励构建

## 核心机制

```
生成式奖励模型 → 响应排名 → 排名差异 → RL 奖励信号
```

传统方法：生成式奖励模型 → 标量分数 → 直接 RL
RRC 方法：生成式奖励模型 → 排名对 → 排名差异奖励 → RL

## 实验结果

- 在开放式聊天和推理基准上验证
- RRC 在生成式奖励模型 RL 训练上持续优于现有奖励构建方法
- 一致性提升（跨多个基准）

## 局限性

- 需要预训练的生成式奖励模型
- 排名构建仍需一定量偏好数据

## 建议
- **是否推荐使用**：是
- **适用场景**：基于 RLHF/DPO 的 LLM 对齐训练、生成式奖励模型落地

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-08-09*
