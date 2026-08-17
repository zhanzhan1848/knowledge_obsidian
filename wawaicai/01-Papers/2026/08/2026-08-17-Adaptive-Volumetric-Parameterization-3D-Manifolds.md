---
title: "Adaptive Volumetric Parameterization of Simply Connected 3-Manifolds with Applications"
authors: [Qiguang Chen, Lok Ming Lui, Gary P. T. Choi]
date: 2026-08-12
arXiv: "2608.08672"
tags: [几何, 参数化, 体参数化, 3D流形, 拟共形映射]
conference: arXiv cs.GR
---

# Adaptive Volumetric Parameterization of Simply Connected 3-Manifolds with Applications

## 核心方法

本文提出一种**自适应体积参数化**框架，将单连通 3-流形映射到灵活的目标域，而非传统的固定标准域（如实心球）。

### 核心创新

1. **目标域自适应变分模型**：联合优化映射 $f: \mathcal{M} \to \Omega$ 和目标域 $\Omega$
2. **能量函数**：
   $$E(f,\Omega) = \alpha \int_{\mathcal{M}} |\log K_f|^2 + \beta \int_{\Omega} |\nabla \rho_{f,\Omega}|^2$$
   - 第一项：局部形状畸变（3D 拟共形扩张 $K_f = \lambda_1 / \lambda_3$）
   - 第二项：质量畸变（密度均衡）

3. **三种目标域设置**：
   - Prescribed solid ellipsoid（预定椭球域）
   - Volume-normalized adaptive ellipsoid（体积归一化自适应椭球）
   - Sea-embedded free-boundary domain（海洋嵌入自由边界）

### 算法流程（每种设置）

1. **3D 准共形形状更新** - 控制局部形状畸变
2. **基于扩散的密度均衡更新** - 控制质量分布
3. **几何校正程序** - 消除元素折叠，保证双射

## 复杂度分析

- 时间复杂度：待量化（迭代优化）
- 空间复杂度：O(n) 其中 n 为网格顶点数

## 算法要点

### 3D 拟共形扩张
- 使用修改的极分解 $\mathbf{J}_f = RD$
- $K(\lambda_1,\lambda_2,\lambda_3) = \lambda_1 / \lambda_3$ 当 $\det(J_f) \neq 0$
- $K = \infty$ 当 $\det(J_f) = 0$（防止翻转）

### 密度项
- 推送前向测度 $f_* \omega$ 描述目标域上的质量分布
- 使用密度均衡映射最小化质量畸变

## 应用场景

- ✅ 多分辨率/局部自适应体积重网格化
- ✅ 体积配准
- ✅ 体积形变（Morphing）

## 开源实现

- GitHub: 论文未提供（待确认）
- 依赖：libigl 可用于类似计算

## 相关文献

- Lyu et al. "3DDEQCmap" - 先前单连通3-流形体参数化到实心球的方法
- Wang et al. "Volumetric harmonic maps"
- Yueh et al. "Stretch energy minimization" 体积参数化

## 可行性评估

| 维度 | 评分 |
|------|------|
| 算法创新 | ⭐⭐⭐⭐⭐ |
| 实现难度 | ⭐⭐⭐⭐ (数学背景要求高) |
| 实用价值 | ⭐⭐⭐⭐⭐ |
| 代码开源 | 待确认 |

## 传递给 @墨鱼丸

**建议**：重点关注此文的自适应域思想，可应用于复杂工业零件的体积网格生成。

**关键参考**：
- 3D 拟共形扩张的离散化实现
- 密度均衡的扩散方程离散化
- 体网格折叠检测与校正
