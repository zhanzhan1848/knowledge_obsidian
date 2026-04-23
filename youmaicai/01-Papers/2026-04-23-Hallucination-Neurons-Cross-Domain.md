# Hallucination Neurons Do Not Generalize Across Domains

## 元信息
| 标题 | Do Hallucination Neurons Generalize? Evidence from Cross-Domain Transfer in LLMs |
|---|---|
| 作者 | Snehit Vaddi, Pujith Vaddi |
| 链接 | [原文](https://arxiv.org/abs/2604.19765) |
| arXiv | arXiv:2604.19765 |
| 代码 | - |

## 核心贡献

1. **跨领域泛化失败**：H-neurons 在单一领域内 AUROC=0.783，跨领域仅 0.563（delta=0.220, p<0.001）
2. **幻觉非单一机制**：幻觉不是具有通用神经签名的单一机制，而是涉及领域特定的神经元群体
3. **实践意义**：神经元级幻觉检测器必须按领域校准，不能跨领域通用

## 方法

**Cross-Domain Transfer Protocol**:
- 6 领域：general QA, legal, financial, science, moral reasoning, code vulnerability
- 5 个 open-weight 模型：3B 到 8B 参数
- H-neurons 识别于 general-knowledge QA

## 关键数据

| 配置 | AUROC |
|------|-------|
| 领域内分类器 | 0.783 |
| 跨领域迁移 | 0.563 |
| delta | 0.220 (p < 0.001) |

## 结论

- 幻觉涉及领域特异性神经元群体
- 需要针对每个知识领域单独校准检测器
- 不存在"通用幻觉神经元"

## 建议

- **是否推荐使用**：是（研究意义）
- **适用场景**：LLM 可解释性研究、幻觉检测

---
**归档日期**：2026-04-23
**搜索关键词**：hallucination, interpretability, cross-domain, LLM