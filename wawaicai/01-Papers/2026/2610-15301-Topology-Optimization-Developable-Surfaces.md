---
title: "Topology Optimization for Subtractive Machining Using Trimmed Neural Fields"
arxiv_id: "2610.15301"
doi: "10.1145/3847303"
date: 2026-10-11
venue: ACM Transactions on Graphics (TOG), 2026-10-10 录用
venue_history: arXiv preprint 2026-10-11 → ACM TOG 2026-10-10 录用
tags: [几何, 拓扑优化, 可展曲面, 隐式神经场, 加工规划, 高斯曲率, ACM-TOG]
authors:
  - Hongrui Chen
  - Levent Burak Kara
url: "https://arxiv.org/abs/2610.15301"
doi_url: "https://doi.org/10.1145/3847303"
last_verified: 2026-10-29
---

# Topology Optimization for Subtractive Machining Using Trimmed Neural Fields

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Topology Optimization for Subtractive Machining Using Trimmed Neural Fields |
| **作者** | Hongrui Chen (et al.) |
| **发表** | arXiv preprint |
| **链接** | [arXiv:2610.15301](https://arxiv.org/abs/2610.15301) |
| **DOI** | 10.48550/arXiv.2610.15301 |
| **代码** | TBD |

---

## 核心贡献

> 使用三个隐式神经场同时优化拓扑与可加工性，生成以可展曲面+分离缝线为特征的几何，用于减材制造。

1. **可加工性导向**: 设计由可展曲面（侧铣友好）+ 缝线（曲率集中）组成
2. **三神经场表示**: 通过乘积组合几何，缝线 = 神经场的交集
3. **3 轴加工兼容**: 强制曲面正交/切向对齐限制

---

## 技术方案

### 核心思想

传统拓扑优化结果难以减材加工（点铣慢）。本文：
- 约束曲面为可展曲面（零高斯曲率）→ 侧铣高效
- 缝线 = 隐式场的交集
- 三场乘积组合 → 几何涌现

### 关键技术

| 技术 | 说明 |
|------|------|
| 三隐式神经场 | 编码可加工几何 |
| 高斯曲率约束 | 局部可展化 |
| 缝线提取 | 隐式场交集 |
| 乘积组合 | 整体形状涌现 |
| 刀具姿态对齐 | 曲面法向/切向约束 |

---

## 算法复杂度

- **训练**: 神经场 + 微分优化
- **缝线提取**: 隐式曲面求交
- **优化**: 拓扑 + 曲率同步控制

---

## 实验结论

- **基线**: 现有可加工性约束方法（不考虑铣削效率）
- **结果**:
  - 加工时间显著下降
  - 结构性能保持可比
  - 缝线特征尺度可控

---

## 局限性

- 神经场 → 黑盒，可解释性差
- 3 轴加工限制
- 可展约束可能过度简化设计

---

## 相关工作

- [[Topology-Optimization]]
- [[Developable-Surfaces]]
- [[Implicit-Neural-Representation]]
- [[Subtractive-Manufacturing]]
- [[Gaussian-Curvature]]
- [[Neural-SDF]]

---

## 实现建议

- **实现难度**: 中-高（深度学习 + 微分几何）
- **预期性能**: 训练小时级，推理秒级
- **适用场景**: 航空航天结构件、轻量化设计
- **开源参考**:
  - libigl: 网格曲率计算
  - PyTorch: 神经场训练
  - DeepSDF: 隐式神经场基础
  - nTop: 商业可展设计参考

---

## 论文元数据

- **arXiv 提交**: 2026-10-11 03:18 UTC
- **应用焦点**: 制造业 + 几何优化
