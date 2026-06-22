# How Transparent is DiffusionGemma?

## 元信息

| 属性 | 内容 |
|------|------|
| 标题 | How Transparent is DiffusionGemma? |
| 作者 | Joshua Engels, Callum McDougall, Bilal Chughtai, Janos Kramar, et al. (14人) |
| 链接 | [arXiv](https://arxiv.org/abs/2606.20560) |
| arXiv | arXiv:2606.20560 |
| 领域 | cs.LG, cs.AI |
| 发表 | 2026-06-18 |

## 核心贡献

1. **首个扩散 LLM 可解释性系统性研究**：对 DiffusionGemma 的推理透明度进行了全面分解，与自回归模型 Gemma 4 对比
2. **双组件透明度框架**：将透明度分解为 variable transparency（变量透明性）和 algorithmic transparency（算法透明性）
3. **Interpretable Token Bottleneck**：提出通过可解释 token 瓶颈映射去噪步骤间的信息流，将 opaque serial depth 从 28.6X 降至 1.1X
4. **扩散特异现象发现**：识别出非时序推理、token/序列涂抹、中间上下文推理等新现象
5. **Monitorability 评估**：证明 DiffusionGemma 与 Gemma 4 在 monitorability 上表现相当

## 模型架构

### Variable vs Algorithmic Transparency
- **Variable transparency**：是否理解模型计算状态的中间快照
- **Algorithmic transparency**：是否可以用这些快照重建模型输出过程

### 关键发现
- DiffusionGemma 初始 opaque serial depth 比 Gemma 4 高 28.6X
- 通过 token 瓶颈映射可将深度比压缩至 1.1X
- 扩散模型所有 token 预测在每步去噪中都可改变 → 可实现复杂的分布式算法

## 实验结果

| 指标 | DiffusionGemma | Gemma 4 (AR baseline) |
|------|---------------|----------------------|
| Opaque serial depth (原始) | 28.6X | 1X |
| Opaque serial depth (bottleneck后) | 1.1X | 1X |
| Monitorability | 相当 | 相当 |

## 扩散特异现象

1. **Non-chronological reasoning**：非时序推理
2. **Token and sequence smearing**：token/序列涂抹
3. **Intermediate-context reasoning**：中间上下文推理

## 局限性

- Algorithmic transparency 在扩散模型中比自回归模型更难实现
- 需要更多case studies来充分理解扩散推理过程

## 关键词

#LLM #interpretability #diffusion-model #reasoning #Gemma #transparency
