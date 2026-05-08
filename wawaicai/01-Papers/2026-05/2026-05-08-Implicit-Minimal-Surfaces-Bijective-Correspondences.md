---
title: "Implicit Minimal Surfaces for Bijective Correspondences"
authors: ["Robin Magnet"]
conference: "SIGGRAPH 2026 (TOG)"
arXiv: "2605.02770"
tags: [参数化, 曲面映射, 最小曲面, 同构]
---

# 核心方法

## 问题定义
计算两个 genus-0 曲面之间的连续、双射、保向映射

## 创新点

### 1. 隐式表示
- 将映射表示为4D积空间 A×B 中的2D流形 Σφ
- 通过复数截面(complex section)的零集编码映射曲面
- z(a,b)=0 当且仅当 b=φ(a)

### 2. Ginzburg-Landau 能量最小化
- 最小化映射曲面面积 ⟺ 最小化Ginzburg-Landau泛函
- 不需要组合网格修改
- 不需要障碍函数来保证双射

### 3. 拓扑保证
- 双射性通过联络(Connection)结构编码
- 保向性由同调类( homology class)保证
- 可处理有边界曲面

## 数学基础

### 面积扭曲度量
```
Area(Σφ) = ∫A √((1+σ₁²)(1+σ₂²)) dvolA
```
- σ₁, σ₂ 为 dφ 的奇异值
- 面积最小化 ⟺ 保角映射

### 边界条件
- 支持landmarks（点约束）
- 支持landmark curves（曲线约束）
- 点可沿特征线滑动

## 算法优势
- ✅ 无需双射初始化，可"解纠缠"
- ✅ 对噪声更鲁棒
- ✅ 仅使用切向量场工具箱
- ✅ 实现简单

## 复杂度分析
- 时间：Ginzburg-Landau能量优化
- 空间：积空间上的稀疏算子

## 开源参考
- 作者：Robin Magnet
- 发表：SIGGRAPH 2026, ACM Trans. Graphics 45(4)

## 可行性评估
✅ **推荐实现**

理由：
- 优雅的数学框架
- 避免复杂的组合优化
- 与现有几何处理工具兼容
- 可作为参数化模块集成

建议：
- 实现张量积结构的稀疏算子
- 可与functional maps方法结合使用

---
**提炼**: 黄喉 (2026-05-08)
