# CQC-RAG: Robust Retrieval-Augmented Generation via Cross-Query Consistency

## 元信息
| 标题 | CQC-RAG: Robust Retrieval-Augmented Generation via Cross-Query Consistency |
|------|-----|
| 作者 | Yanjia Sun, Sifan Liu, Jie Shao |
| 链接 | [原文](https://arxiv.org/abs/2606.13438) |
| arXiv | arXiv:2606.13438 |
| 领域 | cs.IR |

## 核心贡献
1. **Cross-Query Consistency Hypothesis**: 正确答案在语义等价但句法多样的查询下保持高置信度，而噪声诱导的幻觉在查询变化下呈现不稳定的置信度
2. **CQC-RAG 框架**:
   - 查询多样性注入（query-level diversity injection）
   - 跨查询一致性评估（cross-query consistency evaluation）
   - 查询重写为多样但意义保持的版本
   - 构建查询条件推理上下文（query-conditioned reasoning contexts）
   - 证据 grounded 协议提取答案-证据对
   - 按跨上下文置信稳定性选择答案

## 核心创新
- 解决现有 multi-path reasoning 的两个局限：
  1. 多样性通过不可控的解码随机性注入
  2. 答案评估局限于单一查询诱导的证据视图
- 自监督自评估，无需外部监督，不依赖扩展检索覆盖

## 实验结果
| 基准 | 提升 |
|------|------|
| TriviaQA (EM) | +4.76 pp |
| MuSiQue (EM) | +9.12 pp |

## 局限性
- 依赖查询重写质量
- 语义等价性判断可能存在偏差

## 标签
#RAG #Retrieval-Augmented-Generation #Multi-Query-Reasoning #Consistency #Hallucination