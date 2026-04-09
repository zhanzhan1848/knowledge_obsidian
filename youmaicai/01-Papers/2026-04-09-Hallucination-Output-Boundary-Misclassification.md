# Hallucination as Output-Boundary Misclassification

## 元信息
| 标题 | Hallucination as output-boundary misclassification: a composite abstention architecture for language models |
|------|------|
| 作者 | Angelina Hintsanen |
| 链接 | [原文](https://arxiv.org/abs/2604.06195) |
| arXiv | arXiv:2604.06195v1 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. 将 LLM hallucination 框架化为**输出边界处的误分类错误**：内部生成的补全被当作有证据支撑的而发出
2. 提出**复合 abstention architecture**，结合 instruction-based refusal 和 structural abstention gate
3. **支持不足分数 St** = f(At, Pt, Ct)：
   - At: self-consistency（自一致性）
   - Pt: paraphrase stability（释义稳定性）
   - Ct: citation coverage（引用覆盖率）
4. 当 St 超过阈值时阻止输出

## 实验设置
- 50 items × 5 epistemic regimes × 3 models
- 100-item no-context stress test（来自 TruthfulQA）

## 主要发现
| 机制 | 效果 |
|------|------|
| Instruction-only prompting | 大幅减少 hallucination，但仍有 over-cautious abstention 和残余 hallucination（GPT-3.5-turbo） |
| Structural gate alone | 保持各模型可答项目的准确率，但错过 confident confabulation（冲突证据项目） |
| **Composite architecture** | 整体准确率高，hallucination 低 |

## 关键洞察
- Instruction-based refusal 和 structural gating 展现出互补的失败模式
- **Structural gating 提供与能力无关的 abstention floor**（100-item no-context stress test）
- 有效的 hallucination 控制需要结合两种机制

## ICLR 2026 Workshop 论文
- LLM Reasoning Workshop @ ICLR 2026

## 建议
- **是否推荐阅读**：是
- **适用场景**：幻觉检测与缓解、可信 LLM 系统、abstention 机制设计
