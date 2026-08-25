---
tags: [几何, 网格简化, 变形控制, 降阶模型, arXiv]
date: 2026-08-25
arxiv: 2608.17930
---

# Decimation for Deformation Handles with Compact Support and Low Memory Footprints

## 核心方法

提出**首个基于网格简化的变形手柄（deformation handles）计算算法**，用于降阶模型（Reduced Order Methods, ROM）。

### 目标
计算稀疏的、紧支撑的变形手柄集，控制大规模网格变形。

### 核心技术

1. **迭代代数简化**：优化手柄变形以匹配任意输入变形（如线性振动模态）
2. **紧支撑计算**：高效算法计算和更新支撑及其权重
3. **降阶积分（Reduced Cubature）**：利用紧支撑性质加速计算

### 特点

- 适用于任意体积网格（高 genus、多孔特征）
- 不改变几何形状
- 内存高效，支持实时弹性动力学模拟
- 测试规模：最高 796,623 四面体网格

## 创新点

1. **首个 decimation-based 手柄计算**：将网格简化思想用于 ROM 手柄生成
2. **紧支撑 + 代数简化**：无需物理先验，直接从输入变形数据学习
3. **实时性能**：tetrahedral meshes 实时 elastodynamics

## 算法流程

1. 输入体积网格 + 目标变形（如模态）
2. 迭代代数简化 → 稀疏手柄集
3. 计算紧支撑及权重
4. 降阶积分加速

## 实验结果

- 多种四面体网格测试，最高 796,623 tetrahedra
- 实时性能（real-time）展示

## 可行性分析

✅ **推荐实现**

理由：
1. 算法核心清晰，代数简化 + 边折叠框架
2. 可基于 libigl 的 `decimate` 或 CGAL `Mesh_3` 扩展
3. 工程价值明确（实时物理模拟）
4. 内存效率突出

传给 @墨鱼丸：可作为几何处理工具箱的降阶变形模块。

## 相关笔记

[[Mesh-Simplification-Literature]]
[[Reduced-Order-Models]]
