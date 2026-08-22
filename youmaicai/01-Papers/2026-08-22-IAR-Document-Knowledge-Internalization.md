---
type: paper
created: 2026-08-22
updated: 2026-08-22
tags: [knowledge-internalization, post-training, domain-adaptation, retrieval-free]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2608.20281
---

# Inject, Align, Recover: Staged Post-Training for Retrieval-Free Document Knowledge Internalization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inject, Align, Recover: Staged Post-Training for Retrieval-Free Document Knowledge Internalization |
| **作者** | Qian Kou, Xiaofeng Shi, Xiaosong Qiu, Hua Zhou |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.20281) |
| **arXiv** | arXiv:2608.20281 |

---

## 核心贡献

> 提出 IAR 三阶段后训练框架，将文档知识内化分解为注入、对齐、恢复三个独立阶段，解决检索无关场景下的领域知识学习与通用能力保持的权衡问题。

1. **三阶段架构分离**：将文档暴露、QA 对齐和通用能力恢复解耦
2. **多样化注入目标**：通过续写、重写和指令条件重建提供密集监督
3. **模型合并恢复**：通过后验合并恢复因领域适应受损的通用能力

---

## 技术方案

### 三阶段架构

```
源文档 → [Stage 1: Inject] → [Stage 2: Align] → [Stage 3: Recover] → 检索无关问答模型
```

**Stage 1 - Inject（注入）：**
| 目标类型 | 输入 | 目标 |
|----------|------|------|
| Continuation | 文档前缀 | 后续文本 |
| Rewrite | 摘要/大纲 | 完整文档 |
| Instruction-formatted Reconstruction | 阅读指令 | 完整文档 |

**Stage 2 - Align（对齐）：**
- 仅使用答案部分的损失（Answer-only SFT）
- 初始化自 Inject 阶段而非原始指令模型

**Stage 3 - Recover（恢复）：**
- 使用 SLERP、Task Arithmetic、TIES、DARE 等合并算子
- 从领域适应检查点和原始指令模型插值

### 关键公式

```math
L_{inj} = \sum_{m \in M} \pi_m \mathbb{E}_{(u,y) \sim D_m}[\ell_\theta(u, y)]
L_{align} = -\frac{1}{|a|} \sum_{|a|}^{t=1} \log p_\theta(a_t | q, a_{<t})
\theta_R = \theta_0 + \lambda (\theta_{IA} - \theta_0)
```

---

## 实验结论

- **数据集**: Common Corpus (CC), CCI; Llama, Phi, Qwen, SmolLM 家族
- **结果**:
  - 平均领域 QA 准确度提升 **+3.6 百分点**
  - 平均通用性能提升 **+12.1 百分点**（IFEval、MMLU、MSBench）
  - 8个数据集-模型设置中**7个**在所有四个指标上超过 Vanilla SFT

---

## 局限性

1. **最佳配方不通用**：Inject 混合配方因模型和语料库而异
2. **恢复不完整**：检查点无法完全恢复原始模型的通用分数
3. **计算成本高**：三阶段训练比单阶段 SFT 需要更多资源

---

## 实现建议

- **实现难度**: 中等（三阶段流水线）
- **预期性能**: 领域知识内化 + 通用能力保持
- **适用场景**: 检索不可用、延迟敏感、隐私要求的场景

---

## 相关工作

- [[Domain Adaptation]] - 领域适应
- [[Model Merging]] - 模型合并
- [[Continued Pre-training]] - 持续预训练
