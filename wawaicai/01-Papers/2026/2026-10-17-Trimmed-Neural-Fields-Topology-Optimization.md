---
type: paper
created: 2026-10-17
updated: 2026-10-17
tags: [paper, topology-optimization, neural-fields, developable-surfaces, Gaussian-curvature, manufacturing, geometry-processing]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2610.15301
---

# Topology Optimization for Subtractive Machining Using Trimmed Neural Fields

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Topology Optimization for Subtractive Machining Using Trimmed Neural Fields |
| **作者** | (arXiv 2610.15301) — submitted 2026-10 |
| **发表** | arXiv cs.GR, 2026-10 |
| **链接** | [原文](https://arxiv.org/abs/2610.15301) |
| **DOI** | 10.48550/arXiv.2610.15301 |
| **代码** | (未在摘要中给出) |

---

## 核心贡献

> 用**三个隐式神经场**做拓扑优化，目标是生成**可切削（machinable）**的几何：曲面包络在可展开（developable）面上，缝线（seamline）处集中曲率。

1. 三个神经场 → 通过 field 乘积组合生成几何
2. Seamline 通过**场交**（intersection of implicit fields）高效计算
3. 约束 surface 与 cutter normal / tangential 方向对齐，适配 3 轴加工约束
4. 同步优化**拓扑 + 高斯曲率**，可控制 seamline 特征尺度

---

## 技术方案

### 核心思想

可加工（subtractive machinable）的几何主要由**可展开面（developable surfaces）** + 集中曲率的**缝线**构成。本方法用三个神经场分别表示这些成分，相乘后得到整体几何。

### 关键技术

| 技术 | 说明 |
|------|------|
| 三隐式场表示 | 各承担不同几何成分 |
| 场交 = seamline | 高效缝线提取 |
| 加工方向约束 | surface 与 cutter normal / tangential 对齐 |
| 拓扑 + 高斯曲率联合优化 | 控制 seamline 尺度 |

### 算法复杂度

- 与神经网络 SDF 训练一致；额外开销在 seamline extraction
- 训练：每次迭代需 sphere tracing + 场交计算

---

## 公式

```math
S = S_1 \cup S_2 \cup S_3; \quad \text{seamline} = \partial S_1 \cap S_2
```

---

## 实验结论

- **基线**: 仅保证可加工性而不考虑铣削效率的方法
- **结果**: 大幅减少加工时间；保持结构性能竞争力

---

## 局限性

- 依赖神经网络训练（数据驱动）——非解析解
- 缝线集中意味着仍有非可展开区域
- 主要面向机械加工，未涉及通用几何处理

---

## 相关工作

- 相关概念：[[topology-optimization]]、[[developable-surfaces]]、[[seamline-extraction]]、[[implicit-neural-representation]]
- 相关开源：libigl 的 developable surface 拟合、CGAL Surface_mesh

---

## 实现建议

- **实现难度**: 中-高（神经场训练 + 场交 + 加工约束）
- **预期性能**: 训练时间数小时；推理实时
- **适用场景**:
  - **机械加工 / 减材制造的几何设计**
  - 缝线 / 折痕集中的参数化建模（服装、家具、皮革）
  - 可展开曲面的复杂拼接
- **可借鉴**:
  - "场乘积 = 组合几何"的思路对传统 CSG / Boolean 操作的神经版本有意义
  - Seamline 的场交提取算法可移植到传统 mesh 上的 crease / sharp edge 检测
- **推荐度**: ✅ 推荐关注（特别对 CAD + 制造方向；神经几何表示的工业应用）
