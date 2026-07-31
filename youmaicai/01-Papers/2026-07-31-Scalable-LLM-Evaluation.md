# Scalable Reliable LLM Evaluation via Pairwise Comparison & Elo Rating

## 元信息
| 标题 | (Towards) Scalable Reliable Automated Evaluation with Large Language Models |
|------|------|
| 作者 | Bertil Braun 等 (GEM2 Workshop @ ACL 2025) |
| 链接 | [原文](https://arxiv.org/abs/2607.28282) |
| arXiv | arXiv:2607.28282 [cs.CL] |
| 发表 | 2026-07-30 |
| 会议 | GEM2 @ ACL 2025 |

## 核心贡献
1. **Pairwise comparison + Elo rating**：多 LLM 两两比较输出，减少单个模型偏见
2. **可调一致性阈值**：从全票通过到多数投票，灵活控制评估置信度和覆盖率
3. **领域无关评估层**：适用于缺乏客观基准的领域

## 方法

### 评估流程
```
多个 LLM 生成候选输出 → 两两比较 → Elo 评分系统 → 稳定可解释排名
```

### 关键设计
- **Pairwise 比较**：减少单一模型偏差
- **Elo 评分**：生成稳定、可解释的排名
- **一致性阈值**：
  - 全票一致 → 高置信度
  - 多数投票 → 高覆盖率

### 应用场景
科学摘要能力画像评估，初步结果显示自动排名与专家判断高度相关

## 局限性
- 依赖多 LLM 调用，计算成本较高
- 在特定领域需要验证泛化性

## 标签
#LLM-evaluation #Elo-rating #pairwise-comparison #ACL #generation-evaluation
