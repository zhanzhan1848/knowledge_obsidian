---
tags: [计算几何, 拓扑, merge-tree, bivariate-field]
---

# Exact Computation of Trait-induced Merge Trees for Bivariate Fields

## 论文信息
- **arXiv**: [2608.07181](https://arxiv.org/abs/2608.07181) [cs.CG]
- **作者**: Talha Bin Masood et al.
- **提交日期**: 2026-08-07
- **会议**: IEEE VGTC Workshop "TopoInVis Connect 2026 - Topology meets AI"
- **ACM分类**: I.3.5; I.3.6; G.2.2

## 核心方法

### 问题定义
Trait-induced merge trees (TIMTs) 通过分析属性空间中用户指定trait诱导的距离场来选择和浏览多元数据特征层。但现有TIMT计算假设分段线性插值，而欧氏距离到trait的函数在原始网格上通常不是分段线性的。

### 核心创新：Exact TIMT Computation

理论发现：
- 每个四面体内restricted sublevel sets是**凸的**
- 因此具有**平凡局部merge-tree结构**
- 全局拓扑变化仅通过跨单纯形边界的粘合产生

方法：
1. 构造**加权图**：merge tree与诱导距离场的exact merge tree同构
2. 建立TIMT与**Jacobi sets**的关系
3. 建立顶点采样线性插值的误差上界（以投影网格边长最大值为界）

### 扩展
- 点trait → 线、线段、有限点集trait

## 依赖项
- **CGAL** - 计算几何算法库
- **VTK** - 可视化工具包

## 几何处理相关性
🟡 **计算几何相关** — 涉及网格上的距离场和拓扑分析，与几何处理中的网格分析和分割相关。

## 关键词
`Merge Tree` `Trait-induced` `计算几何` `拓扑分析` `CGAL` `VTK` `多元数据`
