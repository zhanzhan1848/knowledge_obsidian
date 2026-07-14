# Silent Failures in Quantized LLM Reasoning

## 元信息
| 标题 | Silent Failures in Quantized LLM Reasoning: A Taxonomy-Based Analysis of Hollow Convergence and Failure Mode Shifts |
|------|-----|
| 作者 | Renuka Oladri 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.09999) |
| arXiv | arXiv:2607.09999 |
| 日期 | 2026-07-14 |
| 分类 | cs.CL, cs.LG |

## 核心贡献

1. **发现核心问题**：后训练量化（post-training quantization）可以在保持任务准确率的同时，悄然改变大语言模型的推理方式

2. **六类失败分类法**（Cohen's κ = 0.906，两名独立标注者验证）：
   - Hollow Convergence（空心收敛）
   - Shortcut Collapse（捷径崩溃）
   - Confidence Snowballing（置信度雪球）
   - Reasoning Drift（推理漂移）
   - Pattern Matching（模式匹配）
   - Systematic Omission（系统性遗漏）

3. **30,000 条 CoT 输出分析**：5 个指令微调模型（3B–14B）× 3 种量化精度（FP32, FP16, NF4）× 4 个推理基准

## 核心发现

### 准确率稳健性
- 准确率在所有量化精度间**最大下降仅 3.1 pp**
- 但**推理质量发生了质变**

### Hollow Convergence（空心收敛）
- 定义：正确答案通过不完整或不可验证的推理得出
- **NF4 下的尺寸依赖性偏移**：最小两个模型急剧下降，12B 及以上模型保持不变
- **基准特异性**：GSM8K 天然免疫；LogiQA 和 ARC-Challenge 偏移最大

### NF4 下的失败模式质变（LLaMA 3.2-3B）
| 失败模式 | FP32 | NF4 |
|----------|------|-----|
| Shortcut Collapse | 44% | **78%** |
| Confidence Snowballing | 15.8% | **≈0%** |

### Hollow Convergence 检测难题
- **无法从表面文本特征可靠检测**（最佳 F1 = 0.53）
- 这是一个标准评估流程无法捕捉的**部署相关失败模式**

## 实验设置

- **模型**: 5 个指令微调 LLM（3B–14B）
- **量化精度**: FP32, FP16, NF4
- **基准**: 4 个推理基准（GSM8K, LogiQA, ARC-Challenge 等）
- **输出**: 30,000 条 chain-of-thought 输出

## 关键启示

> 准确率指标在量化后保持稳健，但推理过程已经发生了质的变化。

1. **量化部署前**：不仅评估准确率，还要评估推理过程完整性
2. **小模型的 NF4 量化需特别谨慎**：可能产生看似正确但推理空洞的答案
3. **表面特征无法检测 Hollow Convergence**：需要过程级评估

## 局限性

- 仅覆盖 3B–14B 模型
- 未探索 INT8/INT2 等更极端量化
- GSM8K 对空心收敛天然免疫的特性值得进一步研究

## 标签
#Quantization #LLMReasoning #ChainOfThought #NF4 #模型压缩 #推理评估

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
