---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [transformer-pruning, causal-importance, adaptive-inference, model-compression]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.22720
---

# CausalGate: Causal Importance Distillation for Transformer Module Pruning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CausalGate: Causal Importance Distillation for Transformer Module Pruning |
| **作者** | Kiran Nair, Smriti Regmi, Rodrigue Rizk |
| **发表** | arXiv 2026-07-21 (In-Review) |
| **链接** | [原文](https://arxiv.org/abs/2607.22720) |
| **arXiv** | arXiv:2607.22720 |

---

## 核心贡献

> 基于干预引导的框架，通过因果重要性而非观测启发式进行 Transformer 模块剪枝

1. **CausalGate**: 隔离单个 Attention 和 MLP 子层，置零输出，通过 KL 散度测量语义损伤
2. **静态门控蒸馏**: 将结构重要性层次蒸馏到全局静态轻量标量门
3. **零运行时开销**: 无操作开销的硬件延迟实际减少

---

## 技术方案

### 现有方法问题

现有自适应推理方法依赖观测启发式（隐藏状态相似性、激活幅度）来丢弃冗余模块：
- 这些基于相关性的指标无法捕捉对语义准确性至关重要的微妙非线性结构计算

### CausalGate 框架

| 阶段 | 说明 |
|------|------|
| 校准阶段 | 隔离单个子层，置零输出，测量语义损伤 (KL 散度) |
| 蒸馏阶段 | 使用 EMA 平滑目标和可微分成对排序损失蒸馏到静态门 |
| 推理阶段 | 静态门控，无运行时路由开销 |

### 关键公式

```math
\text{Semantic Damage} = D_{KL}(p_{\text{full}} \| p_{\text{pruned}})
```

---

## 实验结论

- **数据集**: 语言建模、常识推理基准
- **模型**: TinyLlama-1.1B, Qwen2.5-3B, Llama-3.1-8B
- **结果**:
  - 一致超越动态路由和层跳过基线
  - 将理论计算节省转化为实际硬件延迟减少
  - 零操作开销

---

## 局限性

- 需要校准阶段
- 对某些任务可能过度剪枝

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 边缘设备部署、资源受限环境、LLM 高效推理

---

## 相关工作

- [[Transformer Pruning]]
- [[Adaptive Inference]]
- [[Model Compression]]
- [[Causal Importance]]
