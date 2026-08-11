---
tags: [几何, 不确定性, Gaussian-Process, 隐式曲面, SIGGRAPH2026]
date: 2026-07
venue: SIGGRAPH 2026 (TOG)
---

# Uncertainty-aware geometry processing on Gaussian Process Implicit Surfaces

## 论文信息

- **DOI**: https://doi.org/10.1145/3811280
- **作者**: Baptiste Genest, David Coeurjolly (CNRS, Univ Lyon 1, INSA Lyon)
- **venue**: SIGGRAPH 2026 (SIG/TOG)
- **代码**: https://github.com/baptiste-genest/GPGP
- **项目页**: https://perso.liris.cnrs.fr/david.coeurjolly/publication/gpgp-26/

## 核心问题

现实世界的数据往往带有噪声和不确定性，但大多数几何处理算法假设输入数据是精确的。如何在几何处理中建模和处理不确定性是一个重要问题。

## 核心方法

### Gaussian Process Implicit Surfaces (GPIS)

使用高斯过程作为隐式曲面的概率表示：

$$f(x) \sim GP(m(x), k(x, x'))$$

其中 $m(x)$ 是均值函数，$k(x, x')$ 是协方差函数（核函数）。

### 不确定性传播

1. **输入不确定性**: 测量噪声、扫描误差等
2. **核函数选择**: RBF、Matern 等
3. **不确定性传播**: 通过 GP 的数学性质传播不确定性
4. **几何属性不确定性**: 曲率、法向量、距离等

## 应用场景

- 扫描数据处理
- 逆向工程
- 形状分析
- 容差分析

## 开源实现

- https://github.com/baptiste-genest/GPGP

## 推荐度

✅ **推荐** - 不确定性几何处理的系统性工作，对工程应用有重要意义

## 相关笔记

[[2026-08-11-DAILY-SUMMARY]]
