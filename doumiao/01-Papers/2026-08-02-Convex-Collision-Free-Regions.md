---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [collision-handling, particle-system, cloth-simulation, XPBD]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2607.26901
---

# Convex Collision-Free Regions (CCFR)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Convex Collision-Free Regions for Collision Handling in Deformable Body Simulation |
| **作者** | Tomoyo Kikuchi 等 |
| **发表** | arXiv cs.GR (2026-07-29) |
| **链接** | [原文](https://arxiv.org/abs/2607.26901) |

---

## 核心贡献

> 显式表示局部凸可行区域的碰撞处理方法

1. **凸可行区域构造**：从周围网格基元配置构造
2. **顶点级可行区域**：独立定义每个顶点的可行区域
3. **原生支持次级碰撞和余维接触**
4. **兼容 XPBD 等模拟框架**

---

## 技术方案

### 核心思想

现有碰撞处理方法依赖隐式可行性表示，导致鲁棒性compromised或与特定非线性优化方案紧耦合。CCFR 在穿透发生前独立构造每个顶点的可行区域。

### 关键技术

| 技术 | 说明 |
|------|------|
| 凸区域构造 | 从 edge-edge 和 vertex-face 交互构造 |
| 几何非穿透约束 | 独立于物理接触响应模型 |
| 并行化 | 高度可扩展的碰撞处理 |

---

## 实验结论

- **应用场景**: cloth, hair, wire, 粒子系统, 余维接触
- **效果**: 通用且高效的碰撞处理
- **兼容性**: Extended Position-Based Dynamics (XPBD)

---

## 局限性

- 专注于碰撞处理，不处理流体动力学
- 适用于离散碰撞场景，对连续介质流体模拟需要其他方法

---

## 相关工作

- [[粒子系统]]
- [[布料模拟]]
- [[XPBD]]

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 粒子系统碰撞、衣物模拟、毛发模拟、流体边界交互
