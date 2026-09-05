---
tags: [几何, 点云重建, MLS, Lipschitz扩展, 稀疏采样]
---

# Lipschitz Extension Initialization for Moving Least Squares Reconstruction from Sparse Irregular Samples

## 论文信息
- **arXiv**: [2609.02918](https://arxiv.org/abs/2609.02918)
- **交叉列表**: cs.GR
- **作者**: Li Chen
- **日期**: 2026-08-18

## 核心方法
研究 Lipschitz 扩展（Gradually Varied Functions, GVF）作为 Moving Least Squares (MLS) 重建的初始化步骤。

## 技术要点
- **背景**: Lipschitz 扩展用于无网格散点数据重建的想法于 2012 年提出，但与现代无网格重建方法的实际应用尚未充分探索
- **GVF 初始化**: 使用 Lipschitz 扩展作为 MLS 重建的初始化步骤
- **效果**: 显著提高稀疏不规则采样下 MLS 的稳定性和重建精度
- **计算工具**: 利用 AI 辅助数学编程和软件开发的新进展

## 几何算法
- Lipschitz Extensions / Gradually Varied Functions (GVF)
- Moving Least Squares (MLS) 重建
- 无网格散点数据重建

## 实现难度
- 中等，概念验证阶段
- 有限评估，完整基准测试留待未来工作

## 相关笔记
[[2026-03-12-Clough-Tocher-vs-Multiquadric-RBF-Surfaces]]
