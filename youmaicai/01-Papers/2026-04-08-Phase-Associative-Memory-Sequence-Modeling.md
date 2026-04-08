# Phase-Associative Memory: Sequence Modeling in Complex Hilbert Space

## 元信息

| 标题 | Phase-Associative Memory: Sequence Modeling in Complex Hilbert Space |
|------|------|
| 作者 | Gowrav Vishwakarma, Christopher J. Agostino |
| 链接 | [原文](https://arxiv.org/abs/2604.05030) \| [代码](https://github.com/gowrav-vishwakarma/qllm2) |
| arXiv | arXiv:2604.05030 |
| 领域 | cs.CL, cs.AI, cs.LG |
| 发表 | 2026-04-08 |

## 核心贡献

1. **Phase-Associative Memory (PAM)**：复值循环序列模型，所有表示均为复值，关联通过外积累积到矩阵状态 $S_t \in \mathbb{C}^{d \times d}$，检索通过共轭内积 $K_t^* \cdot Q_t / \sqrt{d}$
2. **竞争性性能**：~100M 参数，WikiText-103 上验证困惑度 30.0（transformer 为 27.1，差距 ~10%），尽管有 4× 算术开销
3. **理论路径**：从向量态模型出发（证明全息绑定因 $O(1/\sqrt{n})$ 叠加关联容量衰减而失败）到矩阵态的解决路径

## 核心公式

### 关联累积
$$S_t \in \mathbb{C}^{d \times d} \quad \text{via outer products}$$

### 检索
$$\text{retrieval} = K_t^* \cdot Q_t / \sqrt{d} \quad \text{(conjugate inner product)}$$

## 架构探索路径

1. **向量态模型**：失败——全息绑定 $O(1/\sqrt{n})$ 叠加关联容量衰减
2. **矩阵态模型**：解决——增加容量，支持复杂值叠加和共轭检索

## 关键洞察

> 复值原生操作（complex-valued superposition）和共轭检索的架构具有竞争力，与人类和 LLM 语义解释表现出非经典 contextuality 的证据一致。

## 性能数据

| 模型 | 参数量 | WikiText-103 验证困惑度 |
|------|--------|------------------------|
| Transformer | ~100M | 27.1 |
| **PAM** | ~100M | 30.0 |

差距 ~10%，但无自定义内核支持。

## 理论意义

- 语义理解中的**非经典 contextuality** 证据支持
- 对语言建模计算形式的选择有影响
- 与量子认知的潜在联系

## 局限性

- ~10% 困惑度差距（虽然算术开销 4× 无优化）
- 无自定义 CUDA 内核优化（可能显著缩小差距）
- 复数运算的硬件效率问题

## 关键词

#sequence-modeling #complex-valued #associative-memory #recurrent #transformer #contextuality #Hilbert-space

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
