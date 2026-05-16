---
title: "FA-QEM: Feature-Aware Quadric Error Metric for Mesh Simplification"
authors: ["Kunal Bhosikar"]
date: 2026-05-13
arXiv: "2605.14029"
categories: ["几何处理", "网格简化", "QEM"]
tags: [mesh-simplification, quadric-error-metric, feature-preservation, 3D-assets]
source: arXiv cs.GR
---

## 核心方法

### 多项式 Quadric 误差公式
提出 **Feature-Aware Quadric Error Metric (FA-QEM)**，联合编码：
- **几何偏差** (geometric deviation)
- **边界曲率** (boundary curvature)  
- **表面法线一致性** (surface normal consistency)

### 关键创新点
1. **多目标误差函数**：联合优化几何误差、边界特征和法线方向
2. **尖特征保留**：即使在激进简化下也能保留锐利几何特征
3. **高质量外观保持**：几何简化改善下游 appearance transfer

### 应用场景
- AI 生成的网格（神经渲染、3D 生成管线）
- 真实世界扫描数据（非流形、噪声）
- 纹理映射前端（通过连续映射技术）

## 实验评估

### 数据集
- **Thingi10K** - 真实世界网格
- **Real-World Textured Things** - 真实纹理物体
- AI 生成网格

### 性能对比
| 指标 | FA-QEM 表现 |
|------|------------|
| 几何误差 | 更低 |
| 视觉保真度 | 更高 |
| 运行速度 | 大幅提升 |
| 鲁棒性 | 跨 diverse inputs 一致 |

**奖项**：CVPR 2026 3D Geometry Generation for Scientific Computing Workshop **Best Paper Award Runner-up**

## 复杂度分析

- **时间复杂度**：待评估（论文提供运行时对比）
- **空间复杂度**：O(n) 顶点存储

## 开源实现

- 论文未提供具体代码链接
- 参考：libigl 的 `quadric_error_metric` 实现

## 技术要点

```python
# FA-QEM 核心概念
error = w_geo * quadric_deviation + w_curv * boundary_curvature + w_norm * normal_consistency
```

**优势**：处理现代 3D 资产（dense, noisy, non-manifold meshes）

## 相关笔记

[[mesh-simplification-algorithms]]
[[quadric-error-metric]]
[[feature-preservation]]