# UGID: Unified Graph Isomorphism for Debiasing Large Language Models

## 元信息
| 标题 | Unified Graph Isomorphism for Debiasing Large Language Models |
|------|------|
| 作者 | Zikang Ding |
| 链接 | [原文](https://arxiv.org/abs/2603.19144) |
| arXiv | arXiv:2603.19144 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 提出 UGID：内部表示级 LLM 去偏见框架
2. 将 Transformer 建模为结构化计算图（注意力=路由边，隐藏状态=节点）
3. 通过图同构约束实现去偏见，有效防止偏见迁移

## 问题背景
- LLM 表现出明显的社会偏见
- 输出级或数据优化方法无法完全解决
- 偏见嵌入在内部表示中

## 核心方法
**UGID 框架**：
- **图建模**：
  - Attention mechanisms → 路由边
  - Hidden states → 图节点
- **去偏见策略**：
  - 在反事实输入间强制图结构不变性
  - 仅允许敏感属性上的差异
  - 联合约束注意力路由和隐藏表示
- **保留能力**：
  - Log-space 约束敏感 logits
  - 选择性锚定目标保留定义语义

## 实验结果
- **偏见减少**：在分布内和分布外设置下均有效
- **结构一致性**：显著减少内部结构差异
- **能力保留**：保持模型安全性和实用性

## 局限性
- 未提及

## 相关链接
- [[LLM-bias]]
- [[debiasing]]
- [[internal-representations]]
- [[graph-isomorphism]]
- [[transformer-interpretability]]
