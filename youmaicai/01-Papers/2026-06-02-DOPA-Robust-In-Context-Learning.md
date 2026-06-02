# 🥬 DOPA: Robust In-Context Learning via OOD Proxies

## 基本信息
- **标题:** Toward Robust In-Context Learning: Leveraging Out-of-distribution Proxies for Target Inaccessible Demonstration Retrieval
- **作者:** Hao Xu, Rite Bo, Fausto Giunchiglia, Yingji Li, Rui Song
- **链接:** [arXiv:2606.00014](https://arxiv.org/abs/2606.00014)
- **arXiv:** arXiv:2606.00014
- **分类:** cs.CL, cs.AI
- **发表:** **ACL 2026 Main Conference**

## 核心创新点

DOPA 提出了一种 demonstration 检索框架，利用 OOD proxy 近似不可见的目标域，引导检索过程，并引入基于 Mahalanobis 距离的全局多样性约束，确保检索结果的充分多样性。

## 问题背景

- LLMs 在 OOD 任务上表现良好，但分布偏移加剧时优势递减
- 目标域不可访问时，评估未知分布具有挑战性
- 现有方法依赖源域的分布信息，但无法直接评估目标域

## 方法

1. **OOD Proxy** — 用代理模型近似不可访问的目标域分布
2. **Mahalanobis Distance-based Global Diversity Constraint** — 确保检索样本的多样性

## 实验结果

- 在多个 LLMs 和任务上验证
- 有效增强 OOD 设置下的鲁棒性
- 代码: https://github.com/bort64/ood_code

## 局限性

- 依赖 proxy 模型的质量
- 多样性约束的计算开销

## 建议
- **推荐程度:** ⭐⭐⭐⭐
- **适用场景:** In-context Learning、few-shot learning、domain adaptation
- **已发表顶会:** ACL 2026

---
*2026-06-02 收录自 arXiv cs.CL，ACL 2026 录用*