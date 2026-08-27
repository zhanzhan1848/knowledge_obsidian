---
title: "A Three-Parameter Binary Subdivision Scheme for Shape-Controlled Curve Design"
authors: ["Rabia Hameed"]
date: 2026-08-23
arXiv: "2608.23637"
tags: [细分曲面, 曲线设计, CAGD, 细分格式]
---

# 三参数二元细分格式用于形状控制曲线设计

## 核心方法

提出一种新型 **三参数 9 点二元逼近细分格式**。

### 构造方法

- 通过 7 点 Lagrange 细分格式与 7 点 B-spline 细分格式的加权组合构造
- 利用父格式对应细化点之间的位移向量
- 通过三个独立设计控制参数组合相邻位移向量
- 导出统一的双参数曲线族

### 理论分析

- **支撑**：推导支撑范围
- **连续性**：分析极限曲线连续性
- **端点规则**：开放多边形的端点处理
- **Gibbs 振荡行为**：分析边界振荡

## 关键参数

三个独立设计控制参数：
- 控制曲线的形状特征
- 调整几何特性同时保持逼近性

## 数学基础

- Lagrange 细分格式
- B-spline 细分格式
- 位移向量组合

## 可行性评估

⚠️ **理论论文，实现难度中等**

- 纯 CAGD 理论工作
- 适合作为曲线/曲面设计工具的基础算法
- 可参考 libigl 的 subdivision 相关实现

## 开源参考
- libigl: `subdivision.h` / `subdivision_wachspress_coord`
- 论文 PDF: 29KB（部分文章，非完整版）

## 相关技术
- Loop 细分
- Catmull-Clark 细分
- 各类逼近/插值细分格式
