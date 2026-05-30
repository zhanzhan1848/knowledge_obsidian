---
tags: [几何, 形状检索, 测地线, 无训练, 扩散]
created: 2026-05-30
---

# Diffused Geodesic Moments (DGM): Training-Free 3D Shape Retrieval

## 论文信息
- **arXiv**: [2605.29004](https://arxiv.org/abs/2605.29004)
- **日期**: 2026-05-27
- **主题**: 无训练 3D 形状检索

## 核心方法

### 问题定义
现有无训练形状描述符的检索分数混淆了：局部信号设计、正则化、聚合、码本拟合、度量选择，难以孤立评估各组件。

### 核心创新
- **协议审计视角**：重新定义描述符评估
- **Diffused Geodesic Moments (DGM)**：
  - Seed-conditioned 描述符
  - 计算稀疏隐式热响应
  - 转换为类距离场
  - 在 seed 和 scale 间对每个顶点求低阶矩

### 技术公式
```
DGM 流程：
1. 稀疏隐式热响应：H(p, seed) = heat_kernel(p, seed)
2. 类距离场转换
3. 低阶矩汇总：M_k(v) = Σ_s Σ_λ λ^k · exp(-λ·t) · f_v(seed)
```

## 算法特点
- 无需训练
- 可作为基准和 instrument
- 隔离协议效应（设计用于消融实验）

## 实现难度
- **算法复杂度**：中（热核计算 O(n²)）
- **依赖项**：可能基于 libigl heatmethod
- **数值稳定性**：良好

## 推荐结论
✅ **推荐实现** - 形状检索评估的重要方法论贡献

## 开源参考
- libigl: `heat_method`, `geodesic`

## 备注
对几何处理研究中的基准测试设计有重要参考价值