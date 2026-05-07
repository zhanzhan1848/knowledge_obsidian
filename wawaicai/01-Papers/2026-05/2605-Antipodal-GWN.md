---
tags: [几何, 卷绕数, 点包含测试, 鲁棒性, TOG2026, GPU]
date: 2026-05-07
source: arXiv cs.GR
---

# The Antipodal Method: Fast, Accurate, and Robust 3D Generalized Winding Numbers

## 核心方法

广义卷绕数（GWN）的**新公式和算法**：将卷绕数表达为两个直观几何量之和：
1. **有符号射线-表面交点数**
2. **表面边界在单位球上投影的线积分**

## 性能指标

### CPU
- 比最快精确方法 (Jacobson 2013): **22× speedup** (平均)
- 比最快近似方法 (Barill 2018): **3× speedup**
- 保持全精度

### GPU
- 吞吐量: **10^9 queries/sec**
- 4K slices @ 120 FPS
- 比朴素 GPU 方法快 **13×**

### 参数曲面
- 比 state-of-the-art 快 **5.6×**，精度相同

## 核心创新

- 避免昂贵的表面积分和球面排列
- 易于 CPU/GPU 并行化
- 处理复杂拓扑和非流形输入

## 应用场景

- 四面体网格生成
- 形状生成
- 网格布尔运算
- 表面重建和法线估计
- 神经场设计

## 几何相关性

- 点包含测试 → 网格布尔运算的前置
- 鲁棒几何处理 → 支持有缺陷的真实数据
- 非流形/自交表面 → 几何处理中的鲁棒性

## 开源参考

- GitHub: MartensCedric/antipodal
- 相关库: libigl (point in mesh), CGAL ( Nef polyhedron)

## 推荐度

✅ **推荐实现** — TOG 2026，22× CPU 加速 + GPU 并行 + 全精度，对实时几何处理很有价值