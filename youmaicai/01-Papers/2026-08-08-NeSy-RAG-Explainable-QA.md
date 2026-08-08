# NeSy-RAG: Neuro-Symbolic RAG for Explainable QA

## 元信息
| 标题 | Neuro-Symbolic RAG for Explainable Question Answering |
|------|-------|
| 作者 | Jonas Gann et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06292) |
| arXiv | arXiv:2608.06292 |
| 领域 | cs.CL, cs.SC |

## 核心贡献
1. 提出 **NeSy-RAG**：模块化神经符号 RAG 框架，从检索文本 chunks 生成可归因的 Prolog 模块
2. 每个 chunk 生成语义有意义的谓词（编码布尔 claims），可依赖用户事实
3. **符号知识缺口检测机制**：自动识别缺失的用户事实（影响查询结果的truth值），触发追问交互

## 方法
- 联合自然语言-code embeddings 检索并组合谓词为 Prolog 查询
- 执行 Prolog 查询产生确定性答案 + 透明执行 trace（每步归因到源）
- 在 ShARC 基准上无需领域微调达到 61.1% 准确率（vs 同模型 RAG 基线 42.8%）

## 实验结果
- ShARC: 61.1% vs 42.8% (RAG baseline)
- 归因透明性：每步推理链接到原始文本源

## 关键洞察
神经符号方法可同时提升 RAG 的可解释性和准确率，关键在于将文本转化为可组合的符号表示
