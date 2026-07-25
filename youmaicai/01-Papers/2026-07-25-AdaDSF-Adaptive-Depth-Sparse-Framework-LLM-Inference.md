# 🥬 AdaDSF: Adaptive Depth Sparse Framework for LLM Inference

## 元信息

| 标题 | Adaptive Depth Sparse Framework: Similarity-Driven Resource Allocation for Pre-Trained LLMs |
|------|------|
| **arXiv** | [2607.21291](https://arxiv.org/abs/2607.21291) |
| **类别** | cs.CL |
| **关键词** | depth-sparse, LLM inference acceleration, token pruning, layer-wise compute allocation, pre-trained model |

## 核心贡献

1. **相似度驱动的层-wise Token 保留比例**：
   - 基于层输入/输出 hidden states 的余弦相似度 $s_i = \text{CosSim}(x_{\text{in}}^{(i)}, x_{\text{out}}^{(i)})$
   - 转换量大（低相似度）的层分配更多 compute

2. **轻量级 MLP Router**：动态选择每层 Top-K 信息量最大的 tokens，绕过 Transformer 计算

3. **特征保持对齐目标**：对齐稀疏和密集模型在中间层和输出层的表示

4. **零架构修改**：无需重新预训练，直接转换预训练模型

## 核心公式

### 相似度驱动权重

```math
\tilde{w}_i = \exp\left(\frac{s_i - \max(s)}{\tau}\right), \quad w_i = \frac{\tilde{w}_i}{\sum_{j=1}^{L}\tilde{w}_j}
```

### 偏差缩放

```math
z_i = \beta\left(\frac{1}{L}\sum_{j=1}^{L}w_j - w_i\right), \quad \beta = 10
```

### Sigmoid 映射到保留比例

```math
r'_i = 0.05 + 0.9 \cdot \frac{1}{1+\exp(-z_i)}
```

### 全局预算修正

```math
r_i = \frac{tL}{\sum_{j=1}^{L}r'_j} r'_i, \quad \text{s.t. } \sum_{i=1}^{L} r_i = tL
```

## 实验结果

### Qwen2.5-0.5B, 80% 保留率

| 方法 | Avg Accuracy | FLOPs (×) |
|------|-------------|-----------|
| Dense | 51.7% | 1.0× |
| MoD | 44.4% | 0.784× |
| DLO | 48.3% | 0.973× |
| **AdaDSF** | **49.1%** | **0.785×** |

### GPT-NeoX-130M, Wikitext103

| 保留率 | 方法 | PPL | FLOPs |
|--------|------|-----|-------|
| 100% | GPT-NeoX | 17.9 | 1.000 |
| 80% | MoD | 21.6 | 0.778 |
| 80% | DLO | 19.6 | 0.964 |
| 80% | **AdaDSF** | **18.9** | **0.787** |
| 70% | **AdaDSF** | **19.9** | **0.680** |

### Ablation

- **无相似度驱动**：PPL 19.69
- **有相似度驱动（τ=0.05）**：PPL 18.91
- **中间层对齐**：PPL 18.91 vs. 20.14（无对齐）

## 局限性

1. **仅测试到 1.5B 参数**：7B+ 模型待验证
2. **无架构修改**：相比专门训练的稀疏模型可能存在上限

## 建议

- **是否推荐使用**：**是**（小模型验证充分，大模型待验证）
- **适用场景**：预训练 LLM 的推理加速部署
- **相关方向**：MoD、D-LLM、DLO、token pruning、Mixture-of-Depths

## 链接

- **arXiv**: https://arxiv.org/abs/2607.21291

---

*🥬 油麦菜知识库 | 生成时间: 2026-07-25*
