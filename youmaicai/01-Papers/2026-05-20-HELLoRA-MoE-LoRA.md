# HELLoRA: Hot Experts Layer-Level Low-Rank Adaptation for Mixture-of-Experts Models

## 元信息
| 标题 | HELLoRA: Hot Experts Layer-Level Low-Rank Adaptation for Mixture-of-Experts Models |
|------|-----|
| 作者 | Jia Wei, Zhonghao Zhang, Ping Chen, Qianyang Li, Yancheng Pan, Shaoxun Wang, Ziyi Qiu, Longxiang Wang (清华, 西安交大, 浙大) |
| 链接 | [原文](https://arxiv.org/abs/2605.18795) |
| arXiv | arXiv:2605.18795 |
| 发表 | 2026-05-11 |
| 代码 | - |

## 核心贡献

1. **问题发现**: MoE模型中 expert activation 高度倾斜，每个 layer 只有少数 "hot experts" 被频繁激活。传统 LoRA 为所有 experts 安装适配器，浪费参数且可能损害预训练的专业知识。

2. **HELLoRA 方法**: 只在最常激活的 hot experts 上放置 LoRA 适配器，冷 experts 完全冻结。通过轻量级 warm-up 分析每个 layer 的激活频率，选择 top-k hot experts。

3. **与 LoRI 组合**: 形成 HELLoRI，进一步冻结 A 矩阵并稀疏化 B 矩阵，只更新 10% 的参数。

## 模型架构

### MoE LoRA 回顾

标准 LoRA 更新: $\mathbf{h} = \mathbf{x}(\mathbf{W} + \Delta) = \mathbf{x}\mathbf{W} + \mathbf{x}\mathbf{A}\mathbf{B}$，其中 $\Delta = \mathbf{A}\mathbf{B}$，$r \ll \min(d_{in}, d_{out})$

MoE Load-Balancing Loss: $\mathcal{L}_{LB} = N_E \cdot \sum_{i=1}^{N_E} f_i \cdot P_i$，鼓励均匀使用 experts

### HELLoRA 两阶段流程

**Stage 1: Layer-level Hot-Expert Profiling**
- 在目标训练数据的 p% (默认 10%) 上运行短期 LoRA warm-up
- 记录每个 MoE layer $\ell$ 中每个 expert $i$ 的激活计数 $c_i^{(\ell)}$
- 在每个 layer 内按 $c_i^{(\ell)}$ 排序，选择 top-k 作为 hot experts $\mathcal{H}^{(\ell)}$

**Stage 2: Selective Adapter Attachment**
- 只在 hot experts、attention projections 和 gating networks 上附加 LoRA
- 冷 experts 完全冻结，只保留原始预训练权重

### HELLoRA 优势

1. **效率**: 移除冷 expert 的适配器前向/后向传递，消除实际 FLOPs 和内存访问
2. **正则化**: 冻结冷 experts 保留预训练专业知识，避免来自稀疏不具代表性 token 子集的噪声梯度

## 实验结果

### 主要结果 (OlMoE-1B-7B)

| 方法 | GSM8K Acc | HumanEval pass@1 | Safety Refusal Rate | 可训练参数比例 |
|------|-----------|-------------------|---------------------|--------------|
| FFT | 27.89±0.42 | 13.99 | 99.02 | 100% |
| LoRA | 26.37±1.07 | 12.96 | 98.87 | 4.2% |
| LoRAMoE | 26.88±1.28 | 13.21 | 99.03 | 3.6% |
| **HELLoRA** | **29.49±0.32** | **14.68** | **99.06** | **0.7%** |

### 跨模型泛化

| 模型 | 任务 | LoRA Acc | HELLoRA Acc | HELLoRA 参数比例 |
|------|------|---------|------------|-----------------|
| OlMoE | GSM8K | 26.37 | **29.49** | 16.3% |
| Mixtral-8×7B | GSM8K | 67.73 | **68.28** | 30.1% |
| DeepSeekMoE | GSM8K | 27.32 | **27.71** | 23.2% |

### 效率提升

- **训练吞吐量**: HELLoRA 比 LoRA 高约 1.9×
- **适配器 FLOPs**: 减少 33-39%
- **可训练参数**: 仅用 LoRA 的 15.7% (OlMoE)

## 关键公式

### HELLoRI 稀疏更新
$$\mathbf{h} = \mathbf{x}\mathbf{W} + \mathbf{x}\mathbf{A}(\mathbf{B} \odot \mathbf{M})$$
其中 $\mathbf{M}$ 是选择 top-10% 元素的二值掩码

### Hot Expert 选择 (per layer)
$$\mathcal{H}^{(\ell)} = \{ i: c_i^{(\ell)} \text{ is among the top-}k \}$$

## 局限性

1. Warm-up 阶段依赖于采样数据的代表性
2. 假设少数 experts 携带大部分任务相关信号，可能不适用于需要广泛 expert 覆盖的任务

## 建议

- **是否推荐使用**: 是
- **适用场景**: MoE 模型 (OlMoE, Mixtral, DeepSeekMoE) 的参数高效微调
- **k 值设置**: 等于每个模型的 per-step 激活数量 (OlMoE k=8, Mixtral k=2)

---

标签: #PEFT #MoE #LoRA #Fine-tuning #Parameter-Efficient