# SPSD: Sentiment Preserving Semantic Distillation for Edge-Based Prompt Compression

## 元信息
| 标题 | Closing the Social-Semantic Gap: SPSD for Edge-Based Prompt Compression in Cloud LLM Inference |
|------|------|
| 作者 | Abhinit Sen et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.19364) |
| arXiv | arXiv:2606.19364 |
| 领域 | cs.LG |

## 核心贡献

1. **Social-Semantic Gap 概念**：提出消费支持和对话提示中的"社交脚手架"（礼貌标记、道歉语、重复、关系建设语言）对机器推理贡献低边际信息
2. **SPSD Pipeline**：使用 4-bit 量化的小语言模型在边缘设备上压缩用户提示，再传输至云端 LLM
3. **能量与质量权衡**：在显著节省 token 的同时，通过盲测 LLM-as-judge 评估证明响应质量非劣效性
4. **Rule-based Safety Gates**：安全关键领域保守路由至 passthrough

## 方法论

### Social-Semantic Gap
人类对话中的社交脚手架：
- 礼貌标记（"Please", "Would you kindly"）
- 道歉语（"Sorry to bother you"）
- 重复和解释
- 关系建设语言

### SPSD Architecture
```
User Prompt → 4-bit SLM (Gemma-2-2B-Instruct Q4_K_M) → Compressed → Cloud LLM (Llama-3.1-8B-Instruct)
```

### 评估指标
- Token 节省量
- 盲测 LLM-as-judge（15分制，1分margin）
- Cosine similarity
- 能量节省估算

## 实验结果

### Token 节省
- 平均节省：**99.9 tokens/蒸馏调用**
- 146次蒸馏调用全部产生正收益（100%成功率）

### 响应质量（盲测 LLM-as-judge）
- Ties: 43%
- Distilled wins: 28%
- Raw wins: 29%
- **非劣效性结论成立**

### Cosine Similarity
- Mean: 0.682
- Median: 0.712
- 54.1% pairs above 0.70 threshold

### 能量节省
- 估算每调用节省 **70-270 uWh**

## 关键词
#PromptCompression #EdgeComputing #LLMInference #EnergyEfficiency #Distillation #TokenSaving
