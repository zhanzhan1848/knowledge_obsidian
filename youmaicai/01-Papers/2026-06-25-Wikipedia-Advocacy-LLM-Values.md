# Small Edits, Large Models: How Wikipedia Advocacy Shapes LLM Values

## 元信息

| 标题 | Small edits, large models: How Wikipedia advocacy shapes LLM values |
|------|-------|
| 作者 | Jasmine Brazilek, Maria Navas, Alexa Gnauck |
| 链接 | [原文](https://arxiv.org/abs/2606.24890) |
| arXiv | arXiv:2606.24890 |
| 类别 | cs.CL, cs.AI, cs.CY |
| 发表 | 2026-04-30 |

## 核心贡献

1. **发现 Wikipedia 编辑可以显著影响 LLM 行为**：小规模、有组织的 Wikipedia 编辑活动能够改变语言模型在特定话题上的价值观和输出
2. **PAW (Pro-Animal Wikipedians)**：125 次编辑横跨 115 个页面，通过添加动物福利内容来影响模型
3. **多层归因验证**：
   - TrackStar retrieval attribution on Llama 3.1 8B: PAW 编辑占动物福利查询最高归因文档的 68% (p < 0.0001)
   - MAGIC counterfactual influence on Llama-3.2-1B: 所有 5 个随机训练顺序种子中，top-10 最高影响力文档全部是 PAW 编辑
4. **微调实验验证**：分别用 PAW 内容 vs 对照内容微调的模型，在各自训练类型文本上困惑度显著降低

## 方法

### 数据归因方法
- **Bergson & MAGIC**: 基于梯度的数据归因方法
- **TrackStar**: 检索归因
- **Leave-subset-out validation**: Spearman rho = 1.00 (10 runs)

### 实验设计
- Llama 3.1 8B + Llama-3.2-1B
- 控制组 vs PAW 编辑组
- 5 个随机训练顺序种子

## 实验结果

| 指标 | 结果 |
|------|------|
| PAW 归因文档占比（动物福利查询） | 68% (p < 0.0001) |
| PAW 归因文档占比（一般查询） | 52% (p = 0.53) |
| Top-10 影响力（所有种子） | 10/10 = 100% PAW edits |
| PAW 训练后动物福利文本困惑度 | 12.4 → 8.4 |
| 控制组训练后对照文本困惑度 | 16.1 → 11.4 |

## 局限性

- 聚焦于动物福利单一领域，泛化性待验证
- 归因方法（梯度方法）的固有局限性
- 未探索其他类型的 coordinated editing campaigns

## 建议

- **是否推荐使用**：是（重要发现）
- **适用场景**：AI 安全与对齐研究、数据集影响力分析、LLM 价值观研究
- **备注**：揭示了 LLM 训练数据中 coordinated editing 的潜在风险，对 AI 治理有重要启示