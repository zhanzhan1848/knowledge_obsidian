---
type: paper
created: 2026-04-23
updated: 2026-04-23
tags: [geometry, multi-physics, collision-handling, mesh-simulation]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.15513
---

# Divide and Truncate (DAT) - A Penetration and Inversion Free Framework for Coupled Multi-physics Systems

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Penetration and Inversion Free Framework for Coupled Multi-physics Systems |
| **作者** | Anka He Chen et al. |
| **发表** | arXiv cs.GR (Apr 2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.15513) |
| **DOI** | 10.48550/arXiv.2604.15513 |

---

## 核心贡献

> 统一的穿透自由碰撞处理框架，支持刚性体、软体、薄壳、杆、动画对象

1. 将环境空间划分为互斥区域
2. 截断位移以保持在区域内的运动，保证穿透自由接触
3. **Planar-DAT** 变体只限制朝向附近表面的运动，允许切向移动

---

## 技术方案

### 核心思想

通过将环境空间分区并截断位移到区域边界，保证穿透自由。Planar-DAT 只限制法向运动，解决之前工作的 artificial damping 和 deadlock 问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| Space Partitioning | 环境空间划分为互斥区域 |
| Displacement Truncation | 截断位移到区域边界 |
| Planar-DAT | 只限制法向，保留切向自由度 |
| Material-agnostic | 材质无关，每物体独立响应 |
| Solver-agnostic | 可与任何迭代优化器集成 |

---

## 支持的物体类型

- Rigid Bodies（刚性体）
- Volumetric Soft Bodies（体积软体）
- Thin Shells（薄壳）
- Rods（杆）
- Animated Objects（动画对象）

---

## 相关工作

- [[Collision Detection]]
- [[Physics Simulation]]
- [[Mesh Contact]]

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 稳健的多物理模拟
- **适用场景**: 游戏引擎、物理仿真、机器人仿真

---

## 开源参考

- 论文 PDF: https://arxiv.org/pdf/2604.15513