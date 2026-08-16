---
tags: [几何, 参数化, 体积参数化, 3D流形, 重网格化]
---

# Adaptive Volumetric Parameterization of Simply Connected 3-Manifolds

## 论文信息
- **arXiv**: [2608.08672](https://arxiv.org/abs/2608.08672) [cs.GR, cs.CG, math.NA]
- **作者**: Gary P. T. Choi et al.
- **提交日期**: 2026-08-09 (v2: 2026-08-12)
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2608.08672)
- **HTML**: [arXiv HTML](https://arxiv.org/html/2608.08672v2)

## 核心方法

### 问题定义
将单连通3维流形映射到简化的体积域（参数化），同时控制局部形状扭曲和质量扭曲。

### 核心创新
1. **自适应目标域** — 三种渐进灵活的设置：
   - 预定义实心椭球体
   - 体积归一化自适应椭球体（可变半径）
   - 海嵌入式自由边界域
   
2. **联合扭曲控制** — 同时优化形状扭曲和质量（密度）扭曲

3. **算法流程**（每种设置）：
   - 3D 拟共形形状更新 (3D Quasi-Conformality Shape Update)
   - 基于扩散的密度均衡更新 (Diffusion-based Density-Equalizing Update)
   - 几何校正程序 (Geometric Correction) — 消除元素折叠

### 关键公式
- 体积参数化最小化扭曲能量：$E = \alpha E_{shape} + \beta E_{mass}$
- 形状扭曲通过 Beltrami 系数控制
- 密度均衡通过热扩散方程实现

## 应用场景

| 应用 | 说明 |
|------|------|
| 多分辨率体积重网格化 | 自适应地生成不同分辨率的体积网格 |
| 体积配准 | 不同3D扫描之间的对齐 |
| 体积变形 | 形状插值和 Morphing |

## 开源实现
- 参考: libigl 的 `parameterize` 相关函数
- 关键算法: 拟共形映射 (Quasi-conformal mapping)

## 可行性评估

### 算法复杂度
- 时间复杂度: O(n log n) 每迭代，主要瓶颈在 3D 网格操作
- 空间复杂度: O(n)

### 实现难度
- 算法复杂度: **中**
- 数值稳定性: 需要处理网格折叠问题（几何校正步骤）
- 依赖项: libigl, CGAL (CGAL 建议用于可靠的三维网格处理)

### 推荐结论
✅ **推荐关注** — 体积参数化是几何处理中的重要基础问题，本文提出的自适应域方法解决了传统方法引入大几何扭曲的问题。

## 相关笔记
[[2026-08-09 Intrinsic Triangulation & Mesh Learning]]
[[2026-08-05 Intrinsic Meshing & Geodesic Distances]]
[[参数化技术]]

---

*由 🥬 娃娃菜 记录于 2026-08-16*
