---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, llm-quantization, hybrid-llm, gated-deltanet, efficiency]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.04098
---

# Why Gated DeltaNet Survives 4-Bit Quantization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Why Gated DeltaNet Survives 4-Bit Quantization: NVFP4 W4A4 for the Recurrent Half of a Hybrid 27B LLM |
| **作者** | Sergii Kozyrev et al. |
| **发表** | arXiv |
| **链接** | [原文](https://arxiv.org/abs/2609.04098) |
| **arXiv** | arXiv:2609.04098 |
| **代码** | [HuggingFace Checkpoint](https://huggingface.co/minima-ai/mnma_qwen3.8_27b_nvfp4) |

---

## 核心贡献

1. **Minima 配方**：Qwen3.8-27B 全量化（496个线性层，GDN 递归层全部 W4A4），17.5 GiB，prefill 加速 14-19%
2. **四部分机制解释**：为何 Gated DeltaNet 递归层对量化天然鲁棒
3. **实用配方**：量化一切 + 附带 KV scales

---

## 四部分机制研究

### (i) NVFP4 Block Scaling
16元素 block scaling 将残差流极端离群点局部化，激活误差在各层角色间均等化

### (ii) Gate Projections 最不敏感
- softplus/exponential 和 sigmoid 参数化
- 将 ~11% GEMM 误差压缩到 ~2% 输出误差

### (iii) Delta-rule Recurrence 天然抗噪
- 注入噪声在 32K tokens 内保持平坦平台
- 状态冲动在数百步内被遗忘
- 原因：每次写入沿当前 key 方向覆盖状态

### (iv) Per-token 量化成本被上下文吸收
不随距离累积，而是随上下文消散

---

## 实验结果

| 指标 | 结果 |
|------|------|
| 5-task 平均 | -0.52（与 BF16 相当） |
| 体积 | 17.5 GiB（最小） |
| Prefill 加速 | +14-19% |

覆盖：4K/32K perplexity, MMLU-Pro, GSM8K, AIME'25, GPQA-Diamond, LiveCodeBench, RULER 64K

---

## 建议

- **是否推荐阅读**：是（机制分析深刻）
- **适用场景**：模型量化部署、Hybrid LLM 架构理解

---

*🥬 youmaicai | 2026-09-05*
