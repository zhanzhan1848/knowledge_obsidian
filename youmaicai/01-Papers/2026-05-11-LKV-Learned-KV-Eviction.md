---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [KV-cache, learned-eviction, differentiable-optimization, long-context]
status: processed
domain: LLM Inference
agent: youmaicai
source: https://arxiv.org/abs/2605.06676
---

# LKV: End-to-End Learning of Head-wise Budgets and Token Selection for LLM KV Cache Eviction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LKV: End-to-End Learning of Head-wise Budgets and Token Selection for LLM KV Cache Eviction |
| **作者** | Enshuai Zhou, Yifan Hao, Chao Wang, Rui Zhang, Di Huang, Jiaming Guo, Xing Hu, Zidong Du, Qi Guo, Yunji Chen |
| **发表** | arXiv 2026 (cs.LG) |
| **链接** | [原文](https://arxiv.org/abs/2605.06676) |
| **DOI** | 10.48550/arXiv.2605.06676 |
| **代码** | - |

---

## 核心贡献

> 提出 LKV (Learned KV Eviction)，将 KV cache 压缩重新表述为端到端可微分优化问题。通过 LKV-H 学习任务优化全局预算，LKV-T 推导内在 KV 重要性（无需实例化注意力矩阵）。在 15% KV cache 保留率下实现 near-lossless 性能。_

1. **端到端可微分优化**: 将 KV 压缩重新表述为端到端可微分优化问题，绕过启发式代理
2. **LKV-H**: 学习任务优化全局预算
3. **LKV-T**: 推导内在 KV 重要性，无需实例化注意力矩阵
4. **数据驱动分配**: 克服手工启发式的局限性

---

## 技术方案

### 问题背景

现有 KV cache 压缩范式的根本局限:
- **启发式预算**: 依赖统计先验而非任务目标，导致资源分配错误
- **启发式选择**: 依赖耦合的 query-key 交互或静态归纳偏置（如 attention sinks）

### LKV 架构

- **LKV-H**: 学习任务优化全局预算（head-wise budgets）
- **LKV-T**: 推导内在 KV 重要性（不实例化注意力矩阵）
- **端到端优化**: 与任务目标严格对齐

---

## 实验结论

| 基准 | 压缩率 | 性能 |
|------|--------|------|
| LongBench | 高压缩率 | SOTA，near-lossless |
| RULER | 高压缩率 | SOTA |

**关键发现**: 
- 仅 15% KV cache 保留率即可实现 near-lossless 性能
- 学习预算（learned budgeting）是保真度的主要驱动因素

---

## 局限性

- 需要训练阶段，可能增加训练复杂度
- 在不同模型架构上的泛化性待验证

---

## 实现建议

- **实现难度**: 高（涉及端到端可微分优化设计）
- **预期性能**: 在长上下文任务上显著优于启发式方法
- **适用场景**: 长序列 LLM 推理、KV cache 压缩、内存优化

---

## Tags

#KV-cache #learned-eviction #differentiable-optimization #long-context #LLM-inference