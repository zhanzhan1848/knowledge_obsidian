---
title: "BrepForge: Factorized B-rep Synthesis via Wireframe Composition and Boundary-Conditioned Surface Instantiation"
authors: []
date: 2026-05-19
venue: arXiv cs.GR
tags: [几何, CAD, B-rep, 边界表示, 生成模型]
---

# BrepForge: Factorized B-rep Synthesis via Wireframe Composition and Boundary-Conditioned Surface Instantiation

## 核心方法

提出 **BrepForge**，将 B-rep 合成分解为两阶段：线框组合和边界条件曲面实例化。

### 技术要点

1. **问题**: 边界表示 (B-rep) 是现代 CAD 事实标准，但学习式 B-rep 合成因离散拓扑与连续几何紧耦合而具挑战性
2. **观察**: 线框组合涉及高熵结构决策，内部曲面几何很大程度上由边界环约束
3. **两阶段方案**:
   - **阶段 1**: 面感知自回归模型将线框序列化为结构化序列，显式编码层级 V-E-F 连接，生成拓扑完整骨架
   - **阶段 2**: 通过融入从边界派生的无学习几何先验实例化精确曲面几何

## 创新点

- 分解方法确保拓扑完整性和几何精度
- 解决 B-rep 建模的固有复杂性

## 推荐结论

✅ **推荐实现** - CAD 几何处理和 B-rep 建模对几何处理有重要价值

## 相关技术

- [[Boundary Representation]], [[CAD]], [[Mesh Synthesis]], [[Topological Validity]]