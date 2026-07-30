# OptimismBench: Forecasting Bias and the Alignment Effect in Language Model Judgment

## 元信息
| 标题 | OptimismBench: Forecasting Bias and the Alignment Effect in Language Model Judgment |
| 作者 | Seonglae Cho et al. |
| 链接 | [原文](https://arxiv.org/abs/2607.26981) |
| arXiv | arXiv:2607.26981 |
| 领域 | cs.CL |

## 核心贡献

1. **引入 OptimismBench**：检测语言模型概率判断中的**方向性偏差**（directional bias）。核心思想是**反向问题对**（inverted pairs）——每个场景同时引发 P(success) 和 P(failure)，两个框架的不对称性揭示无 ground truth 情况下的有符号偏差。

2. **14/16 模型表现出乐观偏差**：在 8 个提供商、16 个模型的测试中，只有 Anthropic 的前沿层模型表现出悲观偏差，其他全部偏乐观。

3. **后训练决定偏差方向**：11 个 base-vs-chat 配对显示，后训练（post-training）设定偏差的符号，且不同家族表现出相反的偏移。

4. **多语言审计**：17 个模型 × 6 种语言的比较显示**模型身份 > 语言**，模型间方差是语言间方差的 4.7 倍。

5. **发布数据集**：发布 3,870 个项目，覆盖 10 种语言，用于逐模型方向偏差审计。

## 方法论

### 问题
当 LLM 评估创业公司成功率为 70%、失败率为 15% 时，缺失的 15 个百分点暴露了一种失真，但校准指标无法检测这种有符号偏差。

### 解决方案：反向问题对
```
场景：评估某创业公司
问题A：这家公司的成功概率是多少？ → P(success)
问题B：这家公司失败的概率是多少？ → P(failure)

理想情况：P(success) + P(failure) ≈ 100%
实际观测：14/16 模型中，P(success) + P(failure) > 100%（乐观偏差）
```

### 评估指标
- **有符号偏差分数**：基于反向问题对的不对称性计算
- 不需要 ground truth 概率

## 实验结果

### 偏差方向分布
| 偏差方向 | 模型数量 | 代表模型 |
|---------|---------|---------|
| 乐观（Optimistic） | 14/16 | GPT, Gemini, Llama 等 |
| 悲观（Pessimistic） | 2/16 | Anthropic 前沿模型 |

### 后训练效应
| 模型家族 | Base → Chat 偏移方向 |
|---------|-------------------|
| 不同家族 | 相反方向 |

例如：某家族 base 偏乐观，chat 后更乐观；另一家族 base 偏悲观，chat 后变得更悲观。

### 多语言分析
- 模型间方差 = 4.7 × 语言间方差
- **结论**：模型身份是偏差的主要决定因素，语言影响较小

### 消融实验
偏差模式在以下条件下均成立：
- Prompt 变化
- Temperature 变化
- Perspective（视角）变化
- Self-debiasing 后仍然存在

## 深层含义

### Alignment Effect
当 alignment 使模型更有帮助（helpful）时，它也同时使模型的概率判断向乐观方向倾斜。

### 下游风险
下游流程**默认继承**这种倾斜——如果 LLM 给出 70% 成功概率，实际预期可能远低于此（因为 P(success) + P(failure) > 100%，说明概率质量被重复计算）。

## 建议
- **推荐使用**：是
- **适用场景**：LLM 概率校准；决策系统审计；alignment 效果评估
- **核心建议**：在使用 LLM 概率输出做决策时，应考虑方向性偏差校正

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-30*
