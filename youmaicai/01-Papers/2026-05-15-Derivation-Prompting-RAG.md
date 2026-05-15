# Derivation Prompting: 改进 RAG 的逻辑方法

## 元信息
| 标题 | Derivation Prompting: A Logic-Based Method for Improving Retrieval-Augmented Generation |
|------|------|
| 作者 | Ignacio Sastre, Guillermo Moncecchi, Aiala Rosá |
| 链接 | [原文](https://arxiv.org/abs/2605.14053) |
| arXiv | arXiv:2605.14053 |
| 会议 | IBERAMIA 2024, LNCS 15277, pp. 412-423, Springer (2025) |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. 提出 **Derivation Prompting**，一种用于 RAG 生成步骤的新提示技术
2. 受逻辑推导启发：从初始假设通过预定义规则系统应用推导结论
3. 构建可解释的推导树，增加生成过程控制
4. 显著减少与传统 RAG 和长上下文方法相比不可接受的答案

## 背景问题
- LLM 在问答任务中表现优异，但面临**幻觉**和**错误推理**挑战
- 特别是知识密集型、领域特定任务
- RAG 提供外部知识检索，但仍存在生成质量控制问题

## 方法

### 核心思想
将逻辑推导引入 RAG 生成过程：
1. **初始假设**：从检索结果中提取
2. **规则应用**：通过预定义规则系统推导结论
3. **推导树构建**：可解释的推理路径

### 与传统方法对比
| 方法 | 可解释性 | 生成控制 | 幻觉率 |
|------|----------|----------|--------|
| 传统 RAG | 低 | 弱 | 高 |
| 长上下文 | 中 | 中 | 中 |
| Derivation Prompting | 高 | 强 | 低 |

## 推导树结构
```
        假设 H
       /    \
     R1      R2
    /  \      \
   C1  C2     C3
```
- H: 初始假设
- R: 应用的规则
- C: 推导结论

## 局限性
- 需要预定义领域规则
- 规则构建成本
- 适用领域受限

## 建议
- 适用场景：知识密集型问答、领域特定 RAG
- 优势：可解释性强、生成可控、减少幻觉