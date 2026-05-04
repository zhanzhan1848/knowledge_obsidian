# CA-ThinkFlow: Retrieval-Augmented Reasoning for Chartered Accountancy

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Jatin Gupta, Akhil Sharma, et al. |
| 发表 | arXiv (2026-05-04) |
| 链接 | [原文](https://arxiv.org/abs/2605.00257) |
| arXiv | arXiv:2605.00257 |

## 核心贡献
1. **CA-ThinkFlow**: 参数高效的 RAG 框架用于印度特许会计师 (CA) 考试
2. 14B 4-bit 量化推理模型 DeepSeek-R1
3. Layout-aware Docling 提取系统保持文档结构
4. 基础 RAG + 模型内置 CoT 函数

## 系统设计
- 14B-DeepSeek-R1 (4-bit 量化)
- Layout-aware Docling extraction（保持文档结构）
- 基础 RAG（自动添加检索信息到 prompt）
- 模型内置 Chain-of-Thought 函数

## 实验结果
- CA-Ben benchmark 多级测试
- SRC (Scholastic Reliability Coefficient) 达 GPT-4o 和 Claude 3.5 Sonnet 的 **68.75%**

## 局限性
- 复杂监管文本（如税务）处理能力不足

## 建议
- **是否推荐使用**：是（金融/会计领域 RAG）
- **适用场景**：金融文档理解、CA 考试、RAG domain adaptation

---

## 摘要

The inception of Large Language Models (LLMs) has catalyzed AI adoption in the finance sector, yet their reliability in complex, jurisdiction-specific tasks like Indian Chartered Accountancy (CA) remains limited. We present CA-ThinkFlow as a parameter-efficient Retrieval-Augmented Generation (RAG) framework which operates with a 14B, 4-bit-quantized reasoning model, 14B-DeepSeek-R1, and a layout-aware Docling extraction system which maintains document structure during extraction.

## 关键词
- `#RAG` `#finance` `#Chartered Accountancy` `#reasoning` `#domain-specific`