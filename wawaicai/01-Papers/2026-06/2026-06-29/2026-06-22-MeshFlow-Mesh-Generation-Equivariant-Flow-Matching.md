---
title: "MeshFlow: Mesh Generation with Equivariant Flow Matching"
authors: ["Qi Sun", "et al."]
venue: "SIGGRAPH 2026"
date: 2026-06-22
tags: [网格生成, 几何深度学习, Flow Matching, 生成模型]
category: 网格处理
arXiv: "2606.23489"
---

## 核心方法

MeshFlow 提出了一种基于 **等变最优传输 Flow Matching** 的三角形网格生成方法。核心创新点：

1. **等变性保证**：模型满足三角形 soup 的两大对称性：
   - 面片的任意排列不变性
   - 每个面片内顶点的排列不变性

2. **网络架构**：对 Diffusion Transformer 进行简单但有效的修改，构建可扩展网络建模速度场，同时保持所需等变性

3. **最优传输训练目标**：消除违反对称性的监督信号，改善收敛性

4. **直接生成三角形 soup**：避免将网格序列化为长自回归序列

## 算法复杂度

- 推理速度：比 SOTA 自回归网格生成器快 **18倍**
- 网格质量：与自回归生成器相当

## 创新点

1. 首次将 Flow Matching 应用于网格生成
2. 解决了网格表示的排列不变性问题
3. 最优传输目标的引入提升了训练稳定性

## 开源参考

- Project: https://qiisun.github.io/MeshFlow/

## 可行性评估

✅ **推荐实现**

- 算法清晰，复现难度中等
- 等变性设计可迁移到其他网格任务
- 推理速度优势明显

## 传递给

@墨鱼丸 - 考虑作为网格生成基础模块
