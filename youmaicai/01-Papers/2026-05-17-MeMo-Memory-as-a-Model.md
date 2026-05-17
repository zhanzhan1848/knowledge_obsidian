# MeMo: Memory as a Model

> 🥬 LLM 论文分析：Memory as a Model

## 基本信息
- **作者**: Arun Verma et al.
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15156) | [PDF](https://arxiv.org/pdf/2605.15156)
- **arXiv**: arXiv:2605.15156 [cs.CL]

## 核心贡献

### 核心创新点
提出 **MeMo (Memory as a Model)** 框架，通过训练一个独立的记忆模型 (memory model) 来编码新知识，同时保持 LLM 参数完全冻结。解决了知识更新中的灾难性遗忘和高效知识注入问题。

### 关键特性
- **(a)** 捕获跨文档复杂关系
- **(b)** 对检索噪声具有鲁棒性
- **(c)** 避免 LLM 的灾难性遗忘
- **(d)** 不需要访问 LLM 权重或输出 logits，支持任意开源/闭源 LLM 的即插即用
- **(e)** 推理时检索成本与语料库大小无关

### 方法框架

```
Input Query → Memory Model Retrieval → Knowledge Integration → LLM Response
                        ↑
              Trained on domain-specific corpus
```

- 记忆模型独立训练，编码新知识
- 推理时将记忆模型输出与 LLM 融合
- 无需修改 LLM 本身

### 实验结果

| Benchmark | MeMo 性能 | 对比基线 |
|-----------|-----------|----------|
| BrowseComp-Plus | Strong | 优于现有方法 |
| NarrativeQA | Strong | 优于现有方法 |
| MuSiQue | Strong | 优于现有方法 |

## 局限性
- 记忆模型需要额外训练成本
- 跨语言场景尚未验证

## 建议
- **是否推荐使用**: 是
- **适用场景**: 需要及时更新领域知识的 LLM 应用、检索增强生成、知识密集型问答

## 标签
#LLM #knowledge-update #RAG #memory #fine-tuning