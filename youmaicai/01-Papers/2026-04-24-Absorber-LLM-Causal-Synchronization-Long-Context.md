---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, long-context, test-time-training, causal-synchronization, memory]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.20915
---

# Absorber LLM: Harnessing Causal Synchronization for Test-Time Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Absorber LLM: Harnessing Causal Synchronization for Test-Time Training |
| **作者** | Zhixin Zhang, Shabo Zhang, Chengcan Wu, Zeming Wei, Meng Sun |
| **发表** | arXiv cs.LG 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.20915) |
| **arXiv** | arXiv:2604.20915 |
| **代码** | - |
| **领域** | cs.LG, cs.AI, cs.CL |

---

## 核心贡献

> 将长上下文保留重新定义为自监督因果同步问题，吸收历史上下文到参数后，无上下文模型应与全上下文模型一致

1. **因果同步目标**：吸收历史上下文后，上下文无关模型应匹配全上下文模型
2. **内化行为同步**：优化更新模型与原始模型的内部行为一致性
3. **降低推理内存 + 提升准确率**：超越之前参数即记忆的基线

---

## 技术方案

### 问题背景

- Transformer 自注意力的计算成本随序列长度增长（二次方）
- RNN/SSM 压缩历史到固定大小状态，丢失长尾依赖
- Test-Time Training (TTT) 方法容易过拟合 token 级投影

### Absorber LLM 核心思想

**因果同步目标**：
```
吸收历史上下文后：
contextless_model(future) ≈ original_model(full_context, future)
```

**同步什么**：更新模型与原始模型的内部行为（不只是输出）

### 优势

- 不依赖外部检索模块
- 保持预训练 LLM 的因果效应
- 减少推理内存

---

## 局限性

- 实现复杂度较高
- 对不同任务类型的泛化性
- 同步频率与性能的权衡

---

## 相关工作

- [[Long Context LLM]]
- [[Test-Time Training]]
- [[Memory Mechanisms]]

---

## 实现建议

- **实现难度**: 高
- **适用场景**: 长文档处理、流式推理
- **核心洞察**: 因果一致性是长上下文学习的有效约束
