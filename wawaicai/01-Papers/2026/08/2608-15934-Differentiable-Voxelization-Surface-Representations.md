---
type: paper
created: 2026-08-19
updated: 2026-08-19
tags: [differentiable, voxelization, mesh-deformation, winding-number, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.15934
---

# Differentiable Voxelization of Surface Representations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Differentiable Voxelization of Surface Representations |
| **作者** | Tobias Djuren et al. |
| **发表** | SIGGRAPH Conference Papers 2026 (Article No.: 22) |
| **链接** | [原文](https://arxiv.org/abs/2608.15934) \| [PDF](https://arxiv.org/pdf/2608.15934) \| [HTML](https://arxiv.org/html/2608.15934v1) |
| **DOI** | 10.1145/3799902.3811203 |

---

## 核心贡献

> 推导出基于网格顶点集的**体积（voxel）相对于表面（surface）**的梯度，实现表面-体积双向可微分桥接，可用于网格变形优化等应用。

1. **体积-表面梯度推导**：对 winding numbers 体积采样 + 三角网格顶点参数的梯度闭式解
2. **高效计算**：规则网格采样 + 顶点级梯度
3. **三个应用场景**：网格变形消除交叉、制造切割、空间填充镶嵌

---

## 技术方案

### 核心思想

不同几何表示服务于不同计算：表面表示（mesh）适合建模，体积表示（voxel）适合空间查询。传统上两者难以桥接——本文推导出体积值相对于表面边界的梯度，实现端到端可微分。

### 关键技术

| 技术 | 说明 |
|------|------|
| Winding Number Gradient | 体积值对表面顶点位置的闭式梯度 |
| Voxel Grid Sampling | 规则网格采样加速 |
| Mesh Vertex Parameters | 顶点集作为优化参数 |
| 应用：交叉消除 | 变形网格消除自交叉 |
| 应用：可制造性 | bandsaw 三方向切割可制造性 |
| 应用：空间镶嵌 | 接近 3D 空间填充的形状 |

### 核心公式

$$\frac{\partial V}{\partial \mathbf{v}_i} = \text{winding number gradient w.r.t. vertex } \mathbf{v}_i$$

---

## 实验结论

- **应用 1**: 变形网格解决自交叉问题（intersection resolution）
- **应用 2**: 切割可制造性优化（manufacturability by bandsaw）
- **应用 3**: 空间镶嵌形状创建（tiling 3D space）

---

## 局限性

- 梯度精度依赖于 voxel 分辨率
- 对于复杂拓扑网格，winding number 计算可能不稳定

---

## 实现建议

- **实现难度**: 中高（需推导和实现 winding number 梯度）
- **开源依赖**: libigl（winding number、网格处理）
- **适用场景**: 网格优化、可制造性设计、几何约束优化
- **推荐度**: ⭐⭐⭐⭐⭐ SIGGRAPH 2026，理论与应用兼备，几何处理必读

---

## 相关工作

- [[网格变形]] / [[Mesh Deformation]]
- [[Winding Number]]
- [[Voxelization]]
- [[SIGGRAPH 2026]]
- [[可微分几何]]
