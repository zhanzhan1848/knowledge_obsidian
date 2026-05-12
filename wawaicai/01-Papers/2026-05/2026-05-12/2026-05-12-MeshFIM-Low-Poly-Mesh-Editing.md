---
tags: [网格编辑, 自回归生成, Fill-in-the-Middle, 网格修复]
date: 2026-05-12
source: arXiv cs.GR
---

# MeshFIM: Local Low-Poly Mesh Editing via Fill-in-the-Middle Autoregressive Generation

## 核心方法

### 问题定义
- 自回归 (AR) 模型可以从点云生成高质量低多边形网格
- 但现有方法只能**整体重生成**：局部区域不满意时必须重生成整个网格
- 这造成了计算浪费，并破坏了其他满意的网格结构

### 核心创新：Fill-in-the-Middle (FIM)
MeshFIM 提出了 **Fill-in-the-Middle** 框架，仅重生成目标区域，保留周围上下文。

### 三大挑战及解决方案

1. **边界精确附着 (Exact Boundary Attachment)**
   - 使用 **Boundary Vertex Markers** 标记边界顶点
   - 确保重生成区域与原始边界精确对齐

2. **保持上下文拓扑顺序 (Preserving Topological Order)**
   - 引入 **Context Positional Embeddings**
   - 使用 **Expanded Context Width** 扩大上下文范围

3. **抑制溢出 (Suppressing Overflow)**
   - **Context Augmentation** 增强上下文
   - **Low-poly Geometry Encoder** 使用门控减法机制，聚焦于缺失区域

### 五大设计组件
| 组件 | 作用 |
|------|------|
| Boundary Vertex Markers | 精确边界附着 |
| Context Positional Embeddings | 保持拓扑顺序 |
| Expanded Context Width | 扩大上下文 |
| Context Augmentation | 抑制溢出 |
| Low-poly Geometry Encoder (Gated Subtraction) | 聚焦缺失区域 |

## 应用场景

1. **交互式画笔编辑** (Interactive brush-based editing)
2. **自动缺陷修复** (Automatic defect repair)

## 实验结果

- 在网格细化、网格修复和整体生成 + 缝合方案上优于基线方法

## 复杂度分析
- 时间复杂度: O(n) 局部区域处理
- 空间复杂度: O(k) 上下文编码

## 开源参考
- Authors: Dingdong Yang et al.
- arXiv: [2605.08744](https://arxiv.org/abs/2605.08744)
- PDF: [2605.08744.pdf](https://arxiv.org/pdf/2605.08744)

## 相关笔记
[[2026-05-12-DAILY-SUMMARY]]

## 技术分类
- 网格处理 > 网格编辑 > 局部编辑
- 深度学习 > 自回归生成 > Fill-in-the-Middle
