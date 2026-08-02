---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [paper, mesh-collision, geometry-processing, physics-simulation]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.26901
---

# Convex Collision-Free Regions (CCFR): Mesh Collision Handling via Explicit Convex Feasible Regions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Convex Collision-Free Regions |
| **作者** | Tomoyo Kikuchi et al. |
| **发表** | arXiv cs.GR (2026-07-29) |
| **链接** | [原文](https://arxiv.org/abs/2607.26901) |
| **DOI** | 10.48550/arXiv.2607.26901 |
| **代码** | 待查 |

---

## 核心贡献

> 通过显式表示局部凸可行区域来处理网格碰撞，避免隐式方法的二次碰撞和codimensional接触问题

1. **显式凸可行区域**：为每个顶点预先构建collision-free位移空间
2. **几何非穿透约束**：独立于物理接触响应模型
3. **兼容XPBD等框架**：不依赖非线性优化

---

## 技术方案

### 核心思想

现有碰撞处理方法依赖隐式可行性表示，导致：
- 鲁棒性受限（二次碰撞、codimensional接触）
- 与特定非线性优化方案紧耦合

本文提出 **CCFR** 方法：
- 从周围网格图元配置构建可行区域（edge-edge, vertex-face交互）
- 可行区域表示当前配置下允许的非穿透顶点位移
- 顶点级独立约束，可高度并行化

### 关键技术

| 技术 | 说明 |
|------|------|
| Convex Feasible Region | 顶点位移的凸可行空间 |
| Edge-Edge/Vertex-Face Contacts | 基本碰撞图元类型 |
| XPBD Compatible | 与 Extended Position-Based Dynamics 兼容 |

---

## 应用场景

- Cloth simulation (布料)
- Hair simulation (头发)
- Wire simulation (线)
- Particle systems (粒子系统)
- Codimensional contacts (codimensional接触)

---

## 算法复杂度

- 时间复杂度：O(n) per vertex，可并行
- 空间复杂度：O(n) per vertex 存储可行区域

---

## 实现建议

- **实现难度**: 中等
- **参考库**: libigl (collision detection), XPBD
- **相关算法**: Position-Based Dynamics, mesh collision

---

## 相关笔记

- [[Mesh Collision]]
- [[Physics Simulation]]
- [[Cloth Simulation]]
