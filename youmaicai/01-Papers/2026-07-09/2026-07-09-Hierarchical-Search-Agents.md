# 🥬 LLM 论文分析：Think Big, Search Small — Hierarchical Search Agents

## 基本信息
- **作者**: YiBo Zhao et al.
- **发表**: arXiv cs.CL | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07548](https://arxiv.org/abs/2607.07548)
- **代码**: https://github.com/QinnanCai0115/role-factorized-search
- **关键词**: Multi-Agent, Retrieval, RAG, Capacity Allocation

---

## 核心贡献

1. **问题**: 多跳问答中，多智能体系统如何分配模型容量？

2. **三角色分解**:
   - **Delegation Role**: 任务分解
   - **Execution Role**: 检索和证据提取
   - **Answer Generation Role**: 固定作为混淆控制

3. **容量敏感性不对称**:
   | 扩展方向 | EM 提升 |
   |---------|--------|
   | Delegation backbone | ~11 points |
   | Execution sub-agent | ~2.6 points |

   **结论**: 分解 (decomposition) 是能力瓶颈

4. **训练小模型匹配大模型**: 1.7B executor 通过质量过滤轨迹蒸馏训练，以 37% 更少 sub-agent token 匹配 frontier 准确率

---

## 核心结论

```
角色分解 > 单智能体基线 (EM: 4.5 → 8.6, +4.1 points)
容量应集中在 delegation，小型 executor 足够
```

---

## 局限性

- 多跳 QA 任务，未验证其他任务类型
- 1.7B executor 蒸馏依赖高质量轨迹数据

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: RAG 系统设计、复杂问答、多智能体架构设计
