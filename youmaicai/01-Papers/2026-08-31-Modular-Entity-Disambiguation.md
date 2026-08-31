# Select, Don't Train: The Benefits of Modular Entity Disambiguation with LLM-Based Selection

## 元信息
| 标题 | Select, Don't Train: The Benefits of Modular Entity Disambiguation with LLM-Based Selection |
|------|------|
| 作者 | Fina Polat et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.27470) |
| arXiv | arXiv:2608.27461 |
| 会议 | ISWC 2026 |

## 核心贡献
1. 系统性比较不同检索策略在统一 LLM 选择器下的表现
2. 发现当选择委托给 LLM 后，训练检索器仅带来有限增益
3. 完全无训练的 BM25 + LLM 选择器在 ZELDA 上达到新的 SOTA

## 背景: 实体消歧的两个子问题
1. **候选生成 (Retrieval)**: 从知识图谱中检索候选实体
2. **选择 (Selection)**: 给定上下文，从候选中选择正确实体

## 方法: 模块化框架
```
Retrieval阶段:
  - BM25 (稀疏检索)
  - Web KB search
  - 训练好的稠密检索器 (e.g., DPR)
  
Selection阶段:
  - LLM-based selection (各种开源/闭源LLM)
```

## 关键发现
| 配置 | ZELDA inKB micro-F1 |
|------|---------------------|
| 训练稠密检索 + LLM (原 SOTA) | 82.3 |
| BM25 + LLM (无训练) | **86.3 (+4)** |
| 训练稠密检索 + LLM | **88.5** |

- 一旦选择委托给强大 LLM，训练检索器带来的增益有限
- 模块化允许在检索失败时主动弃权（abstention）

## Abstention 机制
当正确实体不在候选集中时，传统系统被迫预测错误实体
模块化框架允许检测检索失败并主动弃权：
- BM25 + LLM (允许弃权): **90.7 F1**

## 建议
- **是否推荐使用**: 是（知识图谱、实体链接）
- **适用场景**: 知识图谱构建、实体链接、信息抽取

---
*关键词*: 实体消歧, 知识图谱, 模块化, LLM选择器, 信息抽取
*研究领域*: cs.CL, cs.AI, cs.DB
