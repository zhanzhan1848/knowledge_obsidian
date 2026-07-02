---
title: "Iskra: A System for Inverse Geometry Processing"
authors: ["Ana Dodik", "et al."]
date: 2026-02-12
tags: [几何, 反向几何处理, 可微几何, 参数化, 网格变形]
cite: "arXiv:2602.12105"
DOI: "10.1145/3811371"
---

# Iskra: A System for Inverse Geometry Processing

## 核心方法

提出一个**可微反向几何处理系统**，支持对几何算法进行自动微分：

- **核心创新**：利用 adjoint method 对用户编写的命令式代码自动生成高效反向传播
- **方法兼容**：scatter-gather 网格处理 + tensor 工作流
- **支持的算法**：
  - Mean Curvature Flow（平均曲率流）
  - Spectral Conformal Parameterization（谱共形参数化）
  - Geodesic Distance Computation（测地线距离计算）
  - As-Rigid-As-Possible Deformation（尽可能刚性变形）

## 技术细节

- 兼容机器学习框架（PyTorch 等）
- 支持 local-global 和 ADMM 求解器
- 低实现成本 + 高运行效率 + 低内存占用
- 优于通用可微优化工具

## 算法复杂度

- 时间复杂度：取决于具体算法
- 空间复杂度：O(n) where n is mesh size

## 开源实现

- 论文代码：待查

## 相关笔记

[[几何处理]] [[可微渲染]] [[参数化]]

## 可行性评估

✅ **推荐实现**

- 算法成熟，理论基础扎实
- 开源可能性高
- libigl 可作为底层支持

---
*Created: 2026-07-02*
