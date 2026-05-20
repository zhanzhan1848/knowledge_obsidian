---
title: "UVTran: Accurate Hole-Filling Parameterization with Transformers"
date: 2026-04-27
authors: Junfeng Zhang et al.
arXiv: "2605.16306"
tags: [parameterization, hole-filling, transformer, B-spline, N-sided]
conference: arXiv 2026
---

# UVTran: Accurate Hole-Filling Parameterization with Transformers

## 核心问题

工业设计中 N 边孔填充：
- 需构造单张被修剪 B-spline 曲面
- 关键：准确的参数空间修剪曲线表示
- 现有方法：投影孔边界到平面 → 忽略边界异质性 → 映射偏差

## 解决方案

### UVTran: Transformer 预测辅助投影曲面

1. **交叉注意力机制**: B样条控制点偏附近孔边界，保持局部几何细节
2. **体素化坐标**: 将拟合问题转化为分类任务，降低对数值扰动敏感性
3. **渐进分辨率训练**: 注入受控离散误差，模仿分布偏移

## 算法细节

### 交叉注意力
$$A = \text{Softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$$

每个控制点 Query 关注附近边界 Key。

### 渐进分辨率
- 粗分辨率：注入离散误差
- 细分辨率：泛化到高分辨率

## 实验结果

| 指标 | UVTran | 工业基线 | 学术基线 |
|------|--------|----------|----------|
| 容差满足率 | +12% | 基线 | 低于UVTran |
| 曲面公平性 | 更优 | 较低 | 中等 |

## 可行性评估

- **算法复杂度**: O(n²) Transformer 注意力
- **数值稳定性**: 高 — 分类任务降低敏感性
- **依赖项**: PyTorch, libigl
- **推荐度**: ⭐⭐⭐⭐ — 参数化 transformers 重要进展

## 技术亮点

1. **Transformer应用**: 参数空间的序列到序列
2. **边界异质性**: 首次明确处理
3. **工业级**: 容差满足率提升12%

## 相关技术

- [[Parameterization]] — UV展开
- [[B-Spline]] — 曲面表示
- [[Transformer]] — 注意力机制