---
title: Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition
authors: Cheng-Kang Ted Chao
date: 2026-04-02
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.01551
pdf: https://arxiv.org/pdf/2604.01551
tags: [rendering, 3DGS, color-grading, editing, 2026]
status: unread
---

# Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition |
| 作者 | Cheng-Kang Ted Chao |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.01551) |
| PDF | [下载](https://arxiv.org/pdf/2604.01551) |

## 核心贡献
1. 提出视图空间调色板分解方法，在 splatting 权重而非颜色上优化
2. 引入几何损失（逆重心坐标）保证稀疏性一致
3. 实现专业级调色板调色和逐调色板色调曲线

## 技术方案
现有方法在基元级别分解颜色，稀疏的 per-Gaussian 调色板权重无法保证 alpha-blending 后的像素级稀疏分解，导致调色编辑影响非目标区域。

**核心方法：**
- 视图空间调色板分解：splatting 权重而非颜色
- 几何损失：使用逆重心坐标（inverse barycentric coordinates）
- 稀疏性强制：相似颜色共享相似分解

**技术要点：**
```math
像素颜色 = \sum_i w_i \cdot c_i \cdot \text{palette}(p_i)
```

## 实验结论
- 优于基元空间方法的编辑质量
- 支持实时交互的专业调色工作流
- 精确像素级约束

## 可行性分析
- 实现难度：中（需修改 3DGS 优化流程）
- 性能预期：支持实时交互
- 适用场景：专业影视调色、3D 内容编辑

## 相关工作
- [[3D Gaussian Splatting]]
- [[Color Grading in Neural Rendering]]

## 笔记
**关键词**: #3DGS #color-grading #view-space #sparse-decomposition #interactive
