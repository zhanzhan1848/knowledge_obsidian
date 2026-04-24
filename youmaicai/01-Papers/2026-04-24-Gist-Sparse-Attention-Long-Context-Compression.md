---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, long-context, attention, compression, sparse-attention, gist-token]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.20920
---

# Forget, Then Recall: Learnable Compression and Selective Unfolding via Gist Sparse Attention

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Forget, Then Recall: Learnable Compression and Selective Unfolding via Gist Sparse Attention |
| **作者** | Yuzhen Mao |
| **发表** | arXiv cs.LG 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.20920) |
| **arXiv** | arXiv:2604.20920 |
| **代码** | [GitHub](https://github.com/yuzhenmao/gist-sparse-attention/) |
| **领域** | cs.LG |

---

## 核心贡献

> 提出 Gist Sparse Attention (GSA)，通过 gist 压缩 token 作为路由信号，实现 8x-32x 压缩比下的高效稀疏注意力

1. **Gist 压缩 token**：可学习的摘要 token，压缩原始 token 集
2. **选择性展开**：先压缩到 gist，再选择相关 gist，最后恢复对应 chunk 细节
3. **递归 gist-of-gist**：多分辨率上下文访问，对数级解码复杂度

---

## 技术方案

### 粗到细机制

```
原始上下文
    ↓ 压缩 (gist tokens)
全局表示
    ↓ 选择性访问 (sparse attention)
相关 gist
    ↓ 展开 (unfolding)
细节 chunk
    ↓ 细粒度注意力
```

### 核心特点

- **端到端可学习**：无需外部检索模块
- **无需架构修改**：可插入现有 LLM
- **8x-32x 压缩比**：LongBench 和 RAG 基准持续优于基线

### GSA 框架

1. **压缩**：上下文压缩为 gist token
2. **选择**：稀疏注意力选择最相关 gist
3. **展开**：恢复对应 raw chunk 进行细节注意力

### 递归构建

```
gist → gist-of-gist → ...
实现对数级 per-step 解码复杂度
```

---

## 实验结论

- LongBench 8x-32x 压缩持续优于其他压缩基线
- RAG 基准同样有效
- 无需外部检索模块

---

## 局限性

- gist token 数量的超参数
- 对极短上下文可能不必要
- 递归层数的限制

---

## 相关工作

- [[Long Context LLM]]
- [[KV Cache Compression]]
- [[Sparse Attention]]

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 长文档 RAG、上下文压缩
- **核心洞察**: 压缩 + 选择性展开是高效长上下文的关键
