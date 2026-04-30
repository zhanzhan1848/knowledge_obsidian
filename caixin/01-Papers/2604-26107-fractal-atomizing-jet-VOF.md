---
title: "Scale- and Structure-Dependent Fractal Dimensions in a Two-Dimensional Atomizing Liquid Jet"
authors: "Guangnian Ji et al."
arXiv: "2604.26107"
date: 2026-04-28
tags: [CFD, VOF, DNS, Basilisk, atomization, fractal]
---

## 核心贡献

在 Basilisk 中使用 VOF-DNS 研究二维液射流雾化，发现分形维数是尺度依赖和结构依赖的。

## 方法

- **求解器**: Basilisk (自适应网格细化 VOF-DNS)
- **研究对象**: 液射流雾化
- **分析工具**: 盒计数法分解界面

## 关键发现

1. **无单一标度指数**: 盒尺寸 Lbox ≈ 7 处出现交叉
2. **双标度区域**:
   - 粗网格: 折叠连接射流包络
   - 细网格: 丝状物、液滴和光滑界面段
3. **结构分解**: 液滴、丝状物、连接主体具有不同有效维数
4. **普适性**: Re = 100~10000，We = 200 条件下结果一致

## 结论

分形维数应理解为尺度和结构分辨的状态变量，而非单一全局指数。

## URL

https://arxiv.org/abs/2604.26107
