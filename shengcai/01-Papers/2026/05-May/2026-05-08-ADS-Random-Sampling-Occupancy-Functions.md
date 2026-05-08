---
tags: [几何, 采样, 隐式曲面, 2026, SIGGRAPH]
date: [[2026-05-08]]
status: 待读
---

# Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding

## 元信息

| 标题 | Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding |
|------|-----------------------------------------------------------------------------|
| 作者 | Suzuran Takikawa et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2605.03235) |
| 发表 | SIGGRAPH 2026 |
| 日期 | 2026-05-05 |

## 核心贡献

1. **Adaptive Delaunay Sampling (ADS)**：一种在隐式 occupancy functions (OF) 表面上生成伪随机采样和等值面的方法
2. **逐步计算的 Delaunay 四面体化**：用作采样和表面重建的脚手架
3. **只需十分之一函数评估**：比先前方法减少一个数量级的函数评估次数

## 技术方案

### 问题
- 密集随机采样和 surfacing 通过隐式 occupancy functions 编码的形状是关键应用
- 现有方法只能提供其一：ray shooting 提供随机采样但无连通性，grid-based 方法提供网格表面但采样有偏差

### 方法
1. 从初始粗 Delaunay 脚手架开始
2. 重复细化交叉边（端点位于曲面两侧的边），用更接近曲面的点增强脚手架
3. 每步使用 Delaunay 准则将新顶点纳入脚手架
4. 使用 marching tetrahedra 方法对采样进行 surfacing
5. 法线估计用于在精细特征和高曲率区域加密采样

### 验证
- 在不同分辨率下采样 150 个输入
- 与现有替代方案进行广泛比较

## 实验结论

- 显著改进 accuracy/function evaluation count 权衡
- 展示下游应用

## 推荐度

⭐⭐⭐⭐☆ 

隐式曲面采样和 surfacing 的重要进展，对渲染中的几何处理有参考价值。

---
**原始链接**：[arXiv 2605.03235](https://arxiv.org/abs/2605.03235)