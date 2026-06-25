---
title: "Compact Base Meshes for Displacement Mapping using Triangle Jacobians"
arXiv: "2606.22880"
authors: ["Congyi Zhang", "et al."]
conference: "SIGGRAPH 2026"
date: 2026-06-22
tags: [位移映射, 网格简化, 基网格, 雅可比矩阵, 几何处理]
---

# Compact Base Meshes for Displacement Mapping using Triangle Jacobians

## 核心方法

### 问题定义
将复杂几何体表示为在粗基网格上定义的位移函数，实现紧凑存储和加速渲染。核心挑战：
- 计算尽可能少三角形的基网格
- 同时支持精确近似输入的位移函数

### 关键观察
**失真可以通过评估位移函数的逐点雅可比矩阵来度量**

### 技术创新

1. **DJM (Displacement Jacobian Metric)**：基于位移函数雅可比的基网格构建方法
2. **QEM 变体**：约束位移映射为双射且低失真（满足雅可比下界）
3. **鲁棒逆重心位移求解器**：避免不可靠的射线-网格相交
4. **显式存储映射**：在整个构建过程中存储输入网格到基网格的映射

## 算法特点

### 与 QEM 的区别
| 特性 | QEM | DJM |
|------|-----|-----|
| 目标 | 最小化二次误差 | 约束雅可比下界 |
| 映射 | 无显式约束 | 双射+低失真 |
| 应用 | 通用简化 | 位移映射优化 |

### 性能提升
- 重建精度 vs 尺寸权衡优于先前方法
- 适用于 micromesh 渲染和神经编码

## 开源参考
- Project Page: https://www.cs.ubc.ca/labs/imager/tr/2026/djm

## 关键技术点

### 雅可比约束
$$J_{min} \leq |det(J)| \leq J_{max}$$

### 双射性保证
- 防止面折叠
- 保证一一对应

## 相关笔记
[[网格简化]]
[[几何参数化]]
[[位移映射技术]]
