# OThink-SRR1: Search, Refine and Reasoning with Reinforced Learning

## 元信息
| 标题 | Search, Refine and Reasoning with Reinforced Learning for Large Language Models |
|---|---|
| 作者 | Haijian Liang, Zenghao Niu, Junjie Wu, Changwang Zhang, Wangchunshu Zhou, Jun Wang |
| 链接 | [原文](https://arxiv.org/abs/2604.19766) |
| arXiv | arXiv:2604.19766 |
| 代码 | - |

## 核心贡献

1. **问题**：静态检索方法在复杂多跳问题上表现不佳，且无关检索噪声误导推理，处理完整文档计算成本高
2. **OThink-SRR1**：迭代式 Search-Refine-Reason 框架，通过强化学习训练
3. **Refine Stage**：将检索文档蒸馏为简洁相关的事实再推理
4. **GRPO-IR**：端到端强化学习算法，奖励精确证据识别并惩罚过度检索

## 方法

```
Query → Search → Retrieve Docs
           ↓
        Refine → 蒸馏为简洁事实
           ↓
        Reason → 推理答案
           ↓
        GRPO-IR 强化学习优化
```

## 关键优势

- 更少检索步骤
- 更少 token 消耗
- 更高准确率

## 实验

- 4 个多跳 QA 基准
- 优于强基线
- 更少检索步骤和 token

## 建议

- **是否推荐使用**：是
- **适用场景**：RAG 优化、多跳问答、信息搜索 Agent

---
**归档日期**：2026-04-23
**搜索关键词**：RAG, retrieval-augmented generation, reinforcement learning, multi-hop QA