---
tags: [几何, 网格生成, 生成模型, SIGGRAPH2026]
date: 2026-09-04
source: arXiv cs.GR
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 核心方法

提出**MeshFlow**，一种基于等变最优传输流匹配（Equivariant Optimal-Transport Flow Matching）的三角网格生成方法。

**核心创新点：**
1. 直接将三角网格视为三角汤（triangle soups）生成，避免序列化问题
2. 等变架构：尊重面片排列不变性（permutation invariance of faces）和每个面内顶点排列不变性
3. 修改 Diffusers 的 Diffusion Transformer 架构以满足所需等变性
4. 最优传输训练目标，消除了违反对称性的监督信号

## 算法复杂度
- 推理速度：比 SOTA 自回归网格生成器快 **~18×**
- 生成质量：与 SOTA 自回归方法相当

## 创新点

1. **问题建模**：网格生成中的对称性（面片排列、顶点排列）
2. **等变最优传输流匹配**：保证生成过程满足对称性约束
3. **Diffusion Transformer 适配**：简单位置修改实现等变

## 开源实现
- Project: https://qiisun.github.io/MeshFlow/
- GitHub: 待确认

## 会议信息
- **SIGGRAPH 2026**

## 相关技术
[[网格生成]], [[流匹配]], [[等变神经网络]], [[Diffusion Transformer]], [[最优传输]]

## 可行性评估

✅ **推荐实现**

- 等变设计具有良好的几何意义
- 流匹配框架相对成熟，易于实现
- 18× 加速具有实际应用价值

**技术风险：**
- 需处理复杂排列不变性，框架设计要求高
- 面片排列不变性实现需特殊网络设计
