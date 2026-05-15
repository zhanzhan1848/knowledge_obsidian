---
title: Hierarchical Transformer Preconditioning for Interactive Physics Simulation
authors: Carl Osborne et al.
date: 2026-05-13
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.13343
pdf: https://arxiv.org/pdf/2605.13343
tags: [rendering, physics simulation, neural preconditioner, transformer, 2026]
status: unread
---

# Hierarchical Transformer Preconditioning for Interactive Physics Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Hierarchical Transformer Preconditioning for Interactive Physics Simulation |
| 作者 | Carl Osborne et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.13343) |
| PDF | [下载](https://arxiv.org/pdf/2605.13343) |

## 核心贡献
1. **HTP**：基于弱可接受 H-matrix 分区的神经预条件器
2. 多尺度结构先验（密集对角叶 + 粗化非对角块）
3. cosine-Hutchinson probe 目标优化 MAz 与 z 的角度对齐
4. O(N) 缩放的近似逆计算，单 CUDA Graph 完整求解循环

## 技术方案
现有神经预条件器问题：无法有效捕获长程耦合（继承局部消息传递或稀疏算子访问模式）。

**HTP 关键设计**：
- H-matrix 分区提供多尺度结构先验
- 低秩远场因子 + highway connections（轴向缓冲 + 全局摘要 token）
- 预条件器应用简化为批量密集 GEMM，正则内存访问

### 训练创新
cosine-Hutchinson probe 目标：
- 学习 MA 对收敛关键谱子空间的作用
- 优化 MAz 与 z 的角度对齐而非强制特征值聚类到指定位置
- 移除 SAI 风格目标中不必要的谱放置约束

## 实验结论
- N=8,192 时达 17.9 ms/frame
- 2.2x 加速 over GPU Jacobi
- ~28x 加速 over GPU IC/DILU
- 2.7x 加速 over 神经 SPAI

## 可行性分析
- 实现难度：高（需要 H-matrix 知识和 transformer 设计）
- 性能预期：交互式物理模拟
- 适用场景：实时物理模拟、多物理场耦合

## 相关工作
- Neural preconditioners
- Physics simulation
- H-matrix

## 笔记
神经预条件器用于物理模拟，transformer + H-matrix 结合是创新点