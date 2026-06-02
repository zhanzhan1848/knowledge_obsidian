# 🥬 BitsMoE: Spectral-Energy-Guided MoE LLM Quantization

## 基本信息
- **标题:** BitsMoE: Efficient Spectral Energy-Guided Bit Allocation for MoE LLM Quantization
- **作者:** Jiayu Zhao, Zihan Teng, Minhao Fan, Tianrui Ma, Wentao Ren, Song Chen, Weichen Liu
- **链接:** [arXiv:2606.00079](https://arxiv.org/abs/2606.00079)
- **arXiv:** arXiv:2606.00079
- **分类:** cs.LG, cs.AI
- **代码:** https://github.com/zjiayu064/BitsMoE

## 核心创新点

BitsMoE 提出一种**谱能引导的位分配框架**用于 MoE LLM 量化：

1. **SVD 分解 MoE 层** — 分解为共享 basis 和 expert-specific spectral factors
2. **保留共享 basis** — 不量化，保持跨 expert 的公共结构
3. **Expert-specific factors 作为细粒度量化单元**
4. **Integer Linear Program** — 最小化重建损失，同时满足位预算约束

## 问题背景

- MoE LLMs 通过稀疏 expert 激活减少计算，但所有 expert 权重必须驻留内存，部署仍内存密集
- 现有方法在超低位 regime 表现挣扎：pruning 不可逆移除模型容量，coarse-grained 量化无法根据 expert 和 weight-direction 重要性分配位

## 方法

```
BitsMoE 框架:
1. SVD(MoE layer) → shared basis + expert-specific spectral factors
2. shared basis: 不量化，保留跨 expert 结构
3. expert-specific factors: 细粒度量化单元
4. spectrum-wise mixed-precision quantization → ILP → 最小化重建损失
```

## 实验结果

**Qwen3-30B-A3B-Base, 2-bit 量化:**

| 指标 | BitsMoE | GPTQ |
|------|---------|------|
| 量化加速 | 12.3× | baseline |
| 平均精度提升 | +27.83 pp | baseline |
| 解码加速 | 1.76× | baseline |

## 局限性

- ILP 求解在大规模模型上可能计算密集
- 主要针对 MoE 架构设计

## 建议
- **推荐程度:** ⭐⭐⭐⭐⭐
- **适用场景:** MoE 量化压缩、LLM 部署优化、边缘设备推理

---
*2026-06-02 收录自 arXiv cs.LG*