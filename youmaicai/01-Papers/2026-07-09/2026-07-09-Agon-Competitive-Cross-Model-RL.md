# 🥬 LLM 论文分析：Agon — Competitive Cross-Model RL

## 基本信息
- **作者**: Vladislav Beliaev et al.
- **发表**: arXiv cs.LG/cs.CL/cs.AI | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07690](https://arxiv.org/abs/2607.07690)
- **关键词**: RL, Reasoning Models, GRPO, Competitive RL

---

## 核心贡献

1. **问题**: GRPO 等方法只对最终答案评分，在难题上训练模型写更多而非更好，推理轨迹本身从未被评分

2. **Agon 框架**: 两个竞争模型互为评判者
   - 同题竞技，交替扮演草稿者与评判者
   - 一方草稿解决方案，另一方在阅读草稿同时独立求解
   - 每方都因胜过对方而获得奖励
   - 无需过程标签，无 reward model

3. **两阶段推理部署**: 草稿模型先输出，评判模型阅读后给出最终答案

4. **关键优势**:
   - 无需标注数据，无需 reward model
   - 两模型互相提升，形成渐进式难度递增
   - 模型只需可比强度 + 行为差异

---

## 实验结果

| 设置 | DeepMath Pass@1 |
|------|----------------|
| GRPO | 基线 |
| Agon (Qwen3) | **2× GRPO** |

- 在代码 (竞争编程) 和 Gemma 4 等多模型家族上可复现

---

## 局限性

- 目前仅文本推理
- 未来：latent space 内联合推理

## 建议
- **是否推荐**: ⭐⭐⭐⭐⭐ (5/5)
- **适用场景**: 复杂推理任务、数学/代码生成、Agent 训练
