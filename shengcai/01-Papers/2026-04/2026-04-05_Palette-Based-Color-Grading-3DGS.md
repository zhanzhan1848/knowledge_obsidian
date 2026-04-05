---
type: paper
created: 2026-04-05
updated: 2026-04-05
tags: [rendering, 3DGS, color-grading, view-space, palette]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.01551
---

# Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition |
| **作者** | Cheng-Kang Ted Chao 等 |
| **发表** | arXiv cs.GR 2026-04-02 |
| **链接** | [原文](https://arxiv.org/abs/2604.01551) |
| **DOI** | 10.48550/arXiv.2604.01551 |
| **代码** | - |

---

## 核心贡献

> 实现 3D Gaussian Splatting 的实时交互式调色板颜色编辑，支持专业的颜色分级工作流

1. 提出视图空间调色板分解方法，通过在可观察像素空间而非图元级别优化 splatting 权重来实现颜色编辑
2. 引入几何损失函数（基于逆重心坐标）来确保稀疏性模式的一致性，使相似颜色共享相似的分解
3. 支持调色板重着色、每调色板色调曲线进行颜色感知亮度调整、以及精确像素级约束

---

## 技术方案

### 核心思想

现有方法在图元级别分解颜色，优化每个高斯的调色板权重后再进行 splatting。然而，稀疏的图元级权重无法保证 alpha-blending 后的像素级分解也是稀疏的，导致调色板编辑影响非目标区域。

本文方法通过在视图空间进行调色板分解，在 splatting 时优化权重而非颜色，从而直接控制场景的可观察外观。

### 关键技术

| 技术 | 说明 |
|------|------|
| 视图空间调色板分解 | 将权重而不是颜色进行 splatting，优化场景的可观察外观 |
| 逆重心坐标几何损失 | 强制相似的颜色共享相似的分解，确保编辑一致性 |
| 调色板重着色 | 支持基于调色板的颜色重新着色 |
| 色调曲线调整 | 提供颜色感知的亮度调整能力 |

---

## 实验结论

- **方法**: 与原始 3DGS 及现有调色板方法对比
- **结果**: 在编辑质量上显著优于图元空间方法，实现了专业颜色分级工作流的实时交互

---

## 局限性

- 需要额外的几何损失约束来保证稀疏性
- 对复杂场景的计算开销可能增加

---

## 实现建议

- **实现难度**: 中等
- **预期性能**: 实时交互能力
- **适用场景**: 3DGS 场景的专业颜色分级、数字内容创作

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[神经渲染]]
- [[颜色分级]]
