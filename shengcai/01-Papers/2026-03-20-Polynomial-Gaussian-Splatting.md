---
type: paper
created: 2026-03-20
updated: 2026-03-20
tags: [paper, gaussian-splatting, kernel-optimization, real-time-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.18707
---

# From ex(p) to poly: Gaussian Splatting with Polynomial Kernels

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | From ex(p) to poly: Gaussian Splatting with Polynomial Kernels |
| **作者** | Joerg H. Mueller, Martin Winter, Markus Steinberger |
| **发表** | arXiv 2026 |
| **日期** | 2026-03-19 |
| **链接** | [原文](https://arxiv.org/abs/2603.18707) |
| **DOI** | 10.48550/arXiv.2603.18707 |
| **PDF** | [View PDF](https://arxiv.org/pdf/2603.18707) |

---

## 核心贡献

> 用多项式核替换 3DGS 中的指数核，在保持与现有数据集兼容的同时提升 4-15% 渲染性能

1. **多项式核近似**：用多项式近似 + ReLU 替换原始指数核函数
2. **兼容性保持**：无需重新优化现有 3DGS 数据集
3. **激进剔除**：更高效的 Gaussian 剔除策略

---

## 技术方案

### 核心思想

原始 3D Gaussian Splatting 使用指数核函数评估每个 Gaussian 的贡献。本文提出用多项式近似替代指数函数，结合 ReLU 激活，在保持视觉质量的同时实现更高效的计算。

### 关键技术

| 技术 | 说明 |
|------|------|
| 多项式核 | 替代指数核，降低计算复杂度 |
| ReLU 激活 | 结合多项式，实现稀疏激活 |
| 激进剔除 | 利用多项式特性加速剔除 |
| NPU 优化 | 针对 NPU 硬件的优化讨论 |

---

## 公式

```math
原始核: G(x) = exp(-0.5 * (x/σ)²)
多项式核: P(x) = ReLU(poly(x))
```

---

## 代码片段

```cpp
// 多项式核评估（概念代码）
float polynomialKernel(float x, float sigma) {
    float poly_val = poly_approximation(x, sigma);
    return max(0.0, poly_val); // ReLU
}
```

---

## 实验结论

- **性能提升**: 4-15% 加速（不同实现）
- **质量损失**: 可忽略（PSNR 差异 < 0.1dB）
- **兼容性**: ✅ 完全兼容现有 3DGS 数据集
- **硬件**: 对 NPU 硬件友好

---

## 局限性

- 多项式近似在某些极端情况下可能有精度损失
- 需要针对不同硬件调优多项式阶数

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Real-time Neural Rendering]]
- [[Differentiable Rendering]]

---

## 实现建议

- **实现难度**: 低
- **预期性能**: 4-15% FPS 提升
- **适用场景**: 
  - 实时渲染应用
  - 移动端/边缘设备
  - NPU 加速场景

---

*🥬 生菜 (shengcai) - 2026-03-20*
