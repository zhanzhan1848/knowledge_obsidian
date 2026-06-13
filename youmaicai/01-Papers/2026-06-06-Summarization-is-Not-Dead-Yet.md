# Summarization is Not Dead Yet

## 元信息
| 标题 | Summarization is Not Dead Yet |
|------|-----|
| 作者 | Dongqi Liu et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.08000) |
| arXiv | arXiv:2606.08000 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. **多轨道评估**: 结合受控人工评估、偏差缓解 LLM-as-Judge、事实性外部知识验证、语料级语言分析
2. **关键发现**: 
   - 人类参考摘要仍在信息量和忠实度上保持优势
   - LLM 输出的优势主要在表面连贯性和流畅性
   - 事实性验证表明人类参考更可靠（尤其是涉及推理或综合的声明）
   - 不同模型的 LLM 输出呈现风格同质化模式
3. **结论**: LLM 提高了摘要质量下限，但上限仍低于人类能力

## 评估维度
- **Informativeness**: 人类 > LLM
- **Faithfulness**: 人类 > LLM
- **Coherence/Fluency**: LLM ≥ 人类
- **Factuality**: 人类参考更可靠

## 局限性
- 仅评估 5 个数据集 + 5 个 SOTA LLMs
- LLM-as-Judge 的偏差问题虽已缓解但仍存在

## 标签
#Summarization #LLM-Evaluation #Human-LLM-Comparison #Factuality