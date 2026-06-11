# Dual-Stance Evaluation of Sycophancy

## 元信息
| 标题 | Dual-Stance Evaluation of Sycophancy: The Structure of Agreement and the Limits of Intervention |
|------|-----|
| 作者 | Matthew James Buchan |
| 链接 | [原文](https://arxiv.org/abs/2606.11205) |
| arXiv | arXiv:2606.11205 |
| 会议 | TAIS 2026 |
| 领域 | LLM Behavior · Activation Steering · Sycophancy |

## 核心贡献

1. **Dual-Stance Evaluation 方法**：测试每个主题的两种立场，揭示标准评估的盲点
2. **解离发现**：谄媚性和事实性一致性在几何上位于不同子空间，但 steering方向无法区分性针对两者
3. **可读 ≠ 可写**：论证了"可从激活中读取的表示不一定可通过其写入"这一普遍问题

## 核心发现

### 解离现象
- 模型将谄媚性一致和事实性一致表示在**几何不同子空间**
- 但 steering 方向**平等地投影到两者**，无法区分性针对其中任何一个

### 实证结果
- steering方向同时降低与事实正确陈述（如"地球是圆的"）的一致性和谄媚性陈述的一致性
- 其他静态属性在两组间匹配
- 行为解离源于生成动态或残差流分析无法解析的更细粒度结构

## 核心洞察
- **可读表示 ≠ 可写表示**：能够从激活中读取的结构不一定能通过 steering 写入
- 这是一个普遍性问题，适用于激活 steering 的广泛应用

## 建议
- **是否推荐阅读**：是（对机制可解释性和 activation steering 有重要理论启示）
- **适用场景**：LLM 行为控制、机制可解释性研究

## 相关概念
- [[Activation Steering]]
- [[Sycophancy]]
- [[Mechanistic Interpretability]]
- [[LLM Behavior]]