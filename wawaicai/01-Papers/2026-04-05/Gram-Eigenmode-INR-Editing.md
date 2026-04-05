---
type: paper
created: 2026-04-05
updated: 2026-04-05
tags: [paper, geometry, neural-implicit, INR, SDF, editing]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2603.29860
---

# Gram-Eigenmode INR Editing with Closed-Form Geometry Updates

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gram-Eigenmode INR Editing with Closed-Form Geometry Updates |
| **作者** | Samundra Karki 等 |
| **发表** | arXiv cs.GR (2026-03-12) |
| **链接** | [原文](https://arxiv.org/abs/2603.29860) |
| **DOI** | 10.48550/arXiv.2603.29860 |
| **代码** | 未提供 |

---

## 核心贡献

> 利用 Gram 算子导出 INR 变形本征模式，实现无需优化的闭式几何编辑

1. **Gram-Eigenmode 框架**: 发现 INR 倒数第二层特征的 Gram 算子具有变形本征模式，可参数化 SDF 零等值面的可实现编辑族
2. **闭式更新**: 通过单一闭式更新执行几何编辑，无需梯度下降优化
3. **理论基础**: 刻画了单次更新可实现的精确变形集合——恰好是变形模式张成的空间

---

## 技术方案

### 核心思想

隐式神经表示（INR）已被广泛用于紧凑表示几何（特别是 SDF）。编辑 INR 学习的形状传统上需要重训练或微调。本文发现 INR 的 Gram 算子本征模式可以直接参数化零等值面的可行编辑。

### 关键技术

| 技术 | 说明 |
|------|------|
| Gram 算子 | 由 INR 倒数第二层特征估计 |
| 变形本征模式 | 参数化 SDF 零等值面的可行变形 |
| 闭式更新 | 无需优化迭代的几何编辑 |

### 关键发现

- 这些变形本征模式**不能仅从几何恢复**：只有当 Gram 算子从足够丰富的采样分布估计时，才能可靠地恢复这些模式
- 编辑在数学上**良态**（well-posed）——当且仅当变形在本征模式张成的空间内时，单次更新编辑是可行的

---

## 实验结论

- **方法**: 在多种 INR（SDF 表示）上验证闭式编辑
- **结果**: 证明无需优化的编辑是可行的，编辑范围由本征模式张成的空间界定
- **适用范围**: INR 表示的几何（主要为 SDF 隐式场）

---

## 局限性

- 理论性强，需要深度学习框架支持
- 编辑范围受本征模式空间限制
- 目前仅验证于 SDF 类 INR

---

## 相关工作

- [[Topology-First B-Rep Meshing]] - CAD 几何处理
- [[Dual-Contouring-Signed-Distance-Data]] - 表面重建
- INR (Implicit Neural Representation) 神经隐式表示

---

## 实现建议

- **实现难度**: 高（需深度学习 + 微分几何）
- **预期性能**: 编辑速度快（闭式，无需迭代）
- **适用场景**: 3D 几何编辑、形状变形、CAD 模型修改

---

## 开源参考

- 依赖: PyTorch, INR 相关库
- 论文代码: 未提供
- 相关: libigl (网格编辑), PyTorch3D
