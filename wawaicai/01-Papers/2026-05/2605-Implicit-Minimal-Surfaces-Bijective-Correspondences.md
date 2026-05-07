---
tags: [几何, 参数化, 曲面映射, 双射, Ginzburg-Landau, TOG2026]
date: 2026-05-07
source: arXiv cs.GR
---

# Implicit Minimal Surfaces for Bijective Correspondences

## 核心方法

将两个 genus-zero 曲面之间的连续双射表示为**4D乘积空间中的隐式曲面**。

**关键洞察**：双射 φ: A → B 定义了乘积空间 A×B 中的2D映射曲面 Σφ = {(p, φ(p)) : p ∈ A}。通过最小化这个映射曲面的面积来优化对应，即最小化 **Ginzburg-Landau 泛函**。

## 算法优势

1. **无组合网格修改**：不需要网格重拓扑或插入奇异点
2. **无需双射初始化**：可以解开非双射对应
3. **无需障碍函数**：通过能量优化自然确保双射性
4. **支持地标曲线**：不仅支持点，还支持曲线作为约束

## 隐式表示

- 复函数 z 定义在乘积空间 A×B 上
- 双射编码为零集 {z = 0}
- Ginzburg-Landau 能量 → 映射曲面面积

## 应用场景

- 曲面形状匹配
- 纹理/分割传输
- 医学图像配准（脑褶皱变化）
- 古生物学形态对应

## 几何相关性

- 双射连续映射 → 曲面参数化问题
- Ginzburg-Landau 泛函 → 微分几何中的平均曲率流
- 乘积空间中的映射曲面 → 高维几何处理

## 推荐度

✅ **推荐关注** — TOG 2026，隐式表示避免传统参数化的组合复杂性，能量优化框架优雅

## 开源参考

- libigl: parameterization, functional maps
- 相关: Schmidt et al. 2020/2023 (mesh intersection approaches)