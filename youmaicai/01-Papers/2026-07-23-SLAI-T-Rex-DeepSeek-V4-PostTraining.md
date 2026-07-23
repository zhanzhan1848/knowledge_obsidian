---
type: paper
created: 2026-07-23
updated: 2026-07-23
tags: [LLM, post-training, MoE, DeepSeek, distributed-training, operations-research]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.20145
---

# SLAI T-Rex: Full-Parameter Post-training of the DeepSeek-V4 Family on Ascend SuperPOD

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SLAI T-Rex: Full-Parameter Post-training of the DeepSeek-V4 Family on Ascend SuperPOD |
| **作者** | Dongfang Li, Xiaodong Luo, Ruoyu Sun 等 65 位作者 |
| **发表** | arXiv 2026-07-23 |
| **链接** | [原文](https://arxiv.org/abs/2607.20145) |
| **DOI** | 10.48550/arXiv.2607.20145 |
| **代码** | 待发布 |

---

## 核心贡献

> 在昇腾 NPU SuperPOD 上实现万亿参数 MoE 大模型的全参数 Post-training，提出端到端优化框架并建立运筹学(OR)任务微调流程

1. **昇腾 NPU 分布式训练系统优化**：提出层级优化框架，涵盖模型并行、计算-通信调度、低层 kernel 执行，在 2.93x 提升 MFU 至 34.22%
2. **CPT + SFT 运筹学微调流程**：构建 solver-verified 合成优化文档数据集（10K 高质量 SFT 样本，覆盖 4 类任务、3 种问题表示）
3. **SOTA 零样本 Pass@1**：DeepSeek-V4-Flash 经微调后在 OR 任务上达到 71.81%，超越 GPT-5.4-Mini 3.98%，超越 base 模型 11.27%

---

## 技术方案

### 核心思想

万亿参数 MoE 模型的全参数 post-training 面临三大系统挑战：
- 严重内存压力（MoE expert 并行）
- 通信开销无法与计算重叠
- kernel 执行效率低

SLAI T-Rex 通过层级优化框架解决这些问题，并在优化后的基础设施上建立领域微调流程。

### 关键技术

| 技术 | 说明 |
|------|------|
| 模型级并行 | 整合 EP/TP/PP 于 MoE 架构 |
| 计算-通信编排 | 重叠 all-to-all 通信与计算 |
| 低层 kernel 优化 | 针对 NPU 架构定制 |
| CPT (Curriculum Pre-Training) | 课程式预训练 |
| Solver-verified 合成数据 | 用求解器验证生成样本的正确性 |

### 性能指标

- **MFU**: 34.22%（baseline 的 2.93x）
- **平均零样本 Pass@1**: 71.81%
- **超越 GPT-5.4-Mini**: +3.98%
- **超越 DeepSeek-V4-Flash base**: +11.27%

---

## 实验结论

- **数据集**: 自建 OR 领域数据集（10K SFT 样本，4 类任务）
- **基线**: GPT-5.4-Mini, DeepSeek-V4-Flash (base)
- **结果**: SOTA 零样本性能

---

## 局限性

- 依赖昇腾 NPU 基础设施
- OR 领域专用，泛化性待验证

---

## 实现建议

- **实现难度**: 高（分布式系统工程 + 领域微调）
- **预期性能**: SOTA 运筹学推理
- **适用场景**: 复杂运筹学问题求解、数学建模
