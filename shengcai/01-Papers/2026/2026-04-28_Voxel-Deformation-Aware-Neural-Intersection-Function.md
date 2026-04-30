---
type: paper
created: 2026-04-30
updated: 2026-04-30
tags: [paper, neural-intersection, ray-tracing, deformation, animated-geometry]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.24666
---

# Voxel Deformation-Aware Neural Intersection Function

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Voxel Deformation-Aware Neural Intersection Function |
| **作者** | Takahiro Harada et al. |
| **发表** | arXiv cs.GR (2026-04-28) |
| **链接** | [原文](https://arxiv.org/abs/2604.24666) |
| **DOI** | 10.48550/arXiv.2604.24666 |
| **代码** | TBD |

---

## 核心贡献

> 将 LSNIF (Locally-Subdivided Neural Intersection Function) 扩展到支持参数化可变形和动画几何

1. 提出 **Rest-Space / Deformed-Space Formulation**，灵感来自无网格渲染，允许射线样本映射回规范空间
2. 在规范空间中单个神经网络跨姿态一致地表示几何，无需重新训练
3. 引入 **Scale-Invariant Distance Regression**、**Uncertainty-Weighted Multi-Task Learning** 和 **Hybrid Positional-Grid Encoding**

---

## 技术方案

### 核心思想

LSNIF 在静态几何上表现优异，但对变形几何需要针对每个姿态重新训练。

通过 rest-space 和 deformed-space 公式，将变形几何映射回静止空间进行交集计算，保持 LSNIF 的紧凑性和效率。

### 关键技术

| 技术 | 说明 |
|------|------|
| Rest/Deformed Space Formulation | 无网格渲染启发的双空间映射 |
| Scale-Invariant Distance Regression | 尺度不变距离回归 |
| Uncertainty-Weighted Multi-Task Learning | 不确定性加权多任务学习 |
| Hybrid Positional-Grid Encoding | 混合位置-网格编码 |

---

## 实验结论

- 保持 LSNIF 的紧凑性和效率
- 支持动态几何的鲁棒神经交集预测
- 无需针对每个姿势重新训练

---

## 局限性

- 依赖 LSNIF 基础架构
- 对极端变形可能需要额外处理

---

## 实现建议

- **实现难度**: 中（需要 LSNIF 基础 + 变形处理）
- **预期性能**: 高效的动态几何射线交集
- **适用场景**: 角色动画、刚体变形、软体模拟的射线追踪
- **优先级**: 中高 - 与现有射线追踪管线集成

---

## 相关工作

- [[LSNIF]]
- [[Neural Ray Tracing]]
- [[Ray Tracing Acceleration]]