---
tags: [几何, 参数化, NURBS, 曲线求逆]
created: 2026-05-13
---

# Explicit Inversion of Planar NURBS Curves

## 核心方法

证明一般平面 NURBS 曲线参数化 $\phi: [u_0, u_m] \rightarrow C \subset \mathbb{R}^2$ 存在由**有理样条函数**定义的逆映射 $\phi^{-1}: C \rightarrow [u_0, u_m]$。

### 关键成果
1. 在曲线 $C$ 上构造了一族**有理样条函数**
2. 给出**显式计算公式**
3. 证明逆参数化可表示为这些函数的线性组合

## 数学框架

### 有理样条函数族
$$\rho_i(u) = \frac{w_i N_i(u)}{\sum_j w_j N_j(u)}$$

其中 $N_i(u)$ 为 NURBS 基函数，$w_i$ 为权因子。

### 逆映射表示
$$u = \sum_i \alpha_i \rho_i(\phi(u))$$

## 创新点

- **首个显式平面 NURBS 求逆方法**
- 基于 Newton 法几何变换（受稳态焦散渲染中 specular manifold exploration 启发）
- 从"逐点迭代求逆"变为"解析函数求逆"

## 应用场景

1. **曲线参数化求交** - 加速曲线-曲线/曲线-表面求交
2. **UV 参数化** - NURBS 曲面参数化逆向映射
3. **等距线计算** - CAD/CAGD 中的等距操作

## 算法复杂度
- 空间复杂度：O(n) - 存储基函数

## 实现难度
- 算法复杂度：中（数学推导复杂，实现相对直接）
- 数值稳定性：⚠️ 有理函数在奇异点附近需注意
- 依赖项：无特殊库依赖

## 开源参考
- 论文: https://arxiv.org/abs/2605.08087
- 暂无已知开源实现

## 相关笔记
[[OT-UVGS-UV-Mapping-Gaussian-Splatting]] - 另一种 UV 映射方法