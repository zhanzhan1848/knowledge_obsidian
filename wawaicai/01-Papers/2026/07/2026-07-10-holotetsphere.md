---
title: "HoloTetSphere: Unified TetSphere Mesh Reconstruction for Physical Simulations"
authors: ["Renjiao Yi", "Zhirui Gao", "Wei Chen", "Kai Xu", "Chenyang Zhu"]
date: 2026-07-09
tags: [几何, 网格重建, 四面体网格, 物理模拟, Gaussian Splatting]
categories: [Mesh Reconstruction, Physics Simulation]
arxiv: "2607.08398"
---

# HoloTetSphere: Unified TetSphere Mesh Reconstruction for Physical Simulations

## 核心方法

提出**拓扑自适应框架**，通过端到端拓扑和几何优化实现整体四面体网格重建。

### 关键创新

1. **Gaussian Sphere 耦合机制**
   - 每个四面体元素关联一个 Gaussian sphere
   - 通过顶点插值推导 Gaussian 位置
   - 利用四面体边连接建立空间一致的 opacity field

2. **可微分剪枝机制**
   - 基于 smooth opacity prediction 的可微分剪枝准则
   - 打破对固定初始化的依赖
   - 实现动态拓扑自适应优化

3. **交替几何优化策略**
   - 两阶段平滑策略：元素级 + Gaussian sphere 级
   - Lagrangian 平滑：正则化元素位置同时保持全局结构
   - 加权 bi-harmonic energy 优化

## 问题定义

传统流程：
- Surface extraction → Tetrahedralization（易出错的两阶段流程）

TetSphere 局限：
- Homeomorphic mapping 约束阻止拓扑自适应优化
- 产生 disjoint tetrahedra，无法用于物理模拟

## 算法复杂度

- 时间复杂度：O(n) per iteration（n = 四面体元素数）
- 空间复杂度：O(n) 存储四面体网格结构

## 技术优势

✅ 统一且拓扑相干的四面体网格  
✅ 端到端拓扑和几何联合优化  
✅ 适用于下游物理模拟  

## 开源参考

- GitHub: (待发布)
- 相关工作: TetSphere Splatting (Guo et al. 2024)

## 相关笔记

[[Mesh Reconstruction]], [[Physical Simulation]], [[3D Gaussian Splatting]]

---
*Created: 2026-07-10*
*Source: arXiv cs.GR*
