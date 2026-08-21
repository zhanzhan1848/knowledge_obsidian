---
title: "Decimation for Deformation Handles with Compact Support and Low Memory Footprints"
authors: [David I W Levin]
date: 2026-08-18
tags: [几何, 网格处理, 变形, 网格简化, 降阶模型]
arxiv: "2608.17975"
doi: "10.48550/arXiv.2608.17975"
subjects: [cs.GR]
---

# Decimation for Deformation Handles with Compact Support and Low Memory Footprints

## 核心方法

提出首个**基于网格简化的变形控制柄（deformation handles）计算算法**，适用于任意体网格（含高 genus 和多孔特征）。

### 关键技术

1. **迭代代数简化**（Iterative Algebraic Simplification）
   - 优化变形控制柄以匹配任意输入变形（如线性振动模态）
   - 不改变几何形状，适用于任意体积网格

2. **紧支撑计算**（Compact Support Computation）
   - 高效算法计算和更新紧支撑及其关联权重
   - 利用紧支撑开发高效的reduced-cubature计算方案

3. **稀疏、紧支撑变形控制柄**
   - 首个 decimation-based 方法计算稀疏、紧支撑变形控制柄

### 核心创新点
- 可应用于任意体积网格，不改变几何
- 支持 real-time elastodynamics simulation
- 内存高效，可在 796,623 tetrahedra 的复杂几何上实时运行

## 算法复杂度
- 时间复杂度：待分析
- 空间复杂度：低内存占用

## 开源实现
- 论文代码：待确认（作者主页）

## 相关技术
- Reduced Order Methods (ROM)
- Deformation Handles
- Volumetric Meshes
- Elastodynamics Simulation

## 可行性评估

**推荐度：✅ 推荐实现**

- 算法创新性强，解决实际问题
- 变形控制柄在动画、工程、机器人领域有广泛应用
- libigl 可用于 tetrahedral mesh 处理
- CGAL 的 PMP 模块可参考网格简化

## 会议信息
arXiv Submission, 2026-08-18
