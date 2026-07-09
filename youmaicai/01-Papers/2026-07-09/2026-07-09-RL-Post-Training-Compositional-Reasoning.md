# 🥬 LLM 论文分析：RL Post-Training Builds Compositional Reasoning

## 基本信息
- **作者**: Nishil Patel et al.
- **发表**: arXiv cs.AI/cs.CL | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07646](https://arxiv.org/abs/2607.07646)
- **会议**: ICML 2026 Workshop on Compositional Learning
- **关键词**: RL Post-Training, Compositional Reasoning, GRPO

---

## 核心贡献

1. **核心问题**: RL post-training 只是放大基础模型已有的原语技能，还是能将原语技能组合成新的高级策略？

2. **实验设置**: 完全可观测的 rewrite-grammar 环境，pretraining 分布已知，每个生成的 rewrite 可审计

3. **三阶段组合机制**:
   - **Phase 1**: 加强原语约简 (primitive reductions)
   - **Phase 2**: 发现有效组合程序
     - 顺序组合：折叠有序的原语约简链
     - 并行组合：单步组合独立原语约简
   - 组合程序被复用和巩固为稳定库

4. **RL vs 拒接微调 (RFT)**:
   - 关键差异不是探索量而是选择性
   - RFT 产生大量捷径式 rewrite，大多无效
   - RL 将探索集中在有效可复用结构

5. **Pretraining 门控**: 组合策略的出现不仅由原语暴露决定，还由 pretraining 是否将原语能力组织成 RL 后续可压缩的约简程序决定

---

## 核心洞察

```
RL → 重组原语能力 → 发现新的组合策略
RFT → 探索量大但选择性低 → 大量无效捷径
```

---

## 局限性

- 完全可观测环境与实际 NLP 任务有差距
- 需要 binary final-answer reward

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5) — ICML 2026 Workshop
- **适用场景**: 组合推理任务、数学问题、复杂推理 Agent 训练
