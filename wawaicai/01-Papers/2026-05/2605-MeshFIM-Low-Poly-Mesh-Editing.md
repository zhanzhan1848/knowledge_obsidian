---
tags: [几何, 网格编辑, 自回归生成, 低多边形, Fill-in-the-Middle]
created: 2026-05-13
---

# MeshFIM: Local Low-Poly Mesh Editing via Fill-in-the-Middle Autoregressive Generation

## 核心方法

提出 **MeshFIM (Mesh Fill-in-the-Middle)**，解决自回归 (AR) 模型生成低多边形网格时的"局部不满意需整体重生成"问题。通过 **Fill-in-the-Middle (FIM)** 框架，仅重新生成目标区域，保留周围满意结构。

### 五大核心设计

| 设计 | 作用 |
|------|------|
| **Boundary Vertex Markers** | 精确附着在暴露边界上 |
| **Context Positional Embeddings** | 保持上下文拓扑顺序 |
| **Expanded Context Width** | 扩大上下文感受野 |
| **Context Augmentation** | 数据增强提升鲁棒性 |
| **Low-poly Geometry Encoder** (gated subtraction) | 聚焦缺失区域，抑制 overflow |

### 核心创新：Gated Subtraction Mechanism
将参考表面与现有网格的差异作为生成条件，抑制溢出到目标区域外的内容。

## 应用场景

1. **Interactive Brush-based Editing** - 交互式笔刷编辑低多边形网格
2. **Automatic Defect Repair** - 自动修复低多边形网格缺陷（破洞、法向量错误等）

## 性能指标
- 网格细化 (mesh refinement): 优于各 baseline
- 网格修复 (mesh repair): 优于各 baseline
- Stitch-back scheme: 整体生成后缝合回原始网格

## 创新点

- 首次将 **Fill-in-the-Middle** 思想引入 3D 网格编辑领域
- 解决 AR 生成网格的 all-or-nothing 问题
- 保持语义拓扑对齐的局部生成

## 算法复杂度
- 时间复杂度：O(k) 局部重生成，k << n（整体网格顶点数）
- 空间复杂度：O(n) 存储上下文 + 目标区域

## 实现难度
- 算法复杂度：中/高（涉及 AR 生成模型）
- 数值稳定性：✅ 有详细消融实验
- 依赖项：深度学习框架（PyTorch）
- 关键问题：溢出控制 (overflow suppression) 较难调优

## 开源参考
- 论文: https://arxiv.org/abs/2605.08744
- 暂无已知开源实现

## 相关笔记
[[SQuadGen-Simple-Quad-Layouts]] - 另一种 Quad 布局生成方法
[[DAILY-SUMMARY]] - 日常收集记录