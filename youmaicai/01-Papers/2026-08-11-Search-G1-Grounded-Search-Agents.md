# Search-G1: Grounded Search Agents via Representation-Based Intrinsic Rewards

## 元信息
| 标题 | Search-G1: Grounded Search Agents via Representation-Based Intrinsic Rewards |
|------|-----|
| 作者 | Cheng Ruoxi, Ma Haoxuan, Zhang Hongyi, Zhang Junming, Duan Ranjie, Xia Qiaolin, Wang Hao, Lu Yu, Shi Haibo, Ma Xingjun |
| 链接 | [原文](https://arxiv.org/abs/2608.07531) |
| arXiv | arXiv:2608.07531 |
| 代码 | [GitHub](https://github.com/Rosy0912/Search-G1) |

## 核心贡献

1. **Representation-Based Intrinsic Reward Framework**: 通过两个干预校准的 readout 衡量 agent 答案的操作性 grounding
2. **Prompt-State Readout**: 预测闭卷充分性，其补集定义策略相对检索必要性
3. **Answer-Commit Readout**: 从答案阶段对证据删除的敏感性估计证据依赖性

## 奖励设计

- 当检索估计必要且答案对证据敏感时，给正确搜索轨迹额外奖励
- 当闭卷知识足够时，偏好正确直接答案
- 惩罚重复搜索

## 关键特性

- 校准后，奖励评分在策略优化期间无需过程注释或 LLM-as-judge 推理
- 因为 RL 改变策略表征，Search-G1 定期从最新 checkpoint 的轨迹重新拟合两个 readout
- 奖励与策略共同演化 (co-evolve)

## 实验结果

- 在多个基于搜索的 QA 基准和两种模型规模上验证
- 改善 grounding-search-cost 权衡
- 产生更短响应轨迹同时保持竞争性任务准确率

## 相关领域
[[RAG]] [[search-augmented LLM]] [[intrinsic rewards]] [[RL]] [[grounding]] [[retrieval]]

---
*🥬 LLM/NLP Paper | 2026-08-11*
