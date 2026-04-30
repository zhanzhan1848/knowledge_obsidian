---
type: paper
created: 2026-04-30
updated: 2026-04-30
tags: [paper, collision-detection, BVH, GPU-ray-tracing, physics-simulation]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.23520
---

# Rethinking Collision Detection on GPU Ray Tracing Architecture

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Rethinking Collision Detection on GPU Ray Tracing Architecture |
| **作者** | arXiv submission |
| **发表** | arXiv cs.GR (2026-04-28) |
| **链接** | [原文](https://arxiv.org/abs/2604.23520) |
| **DOI** | 10.48550/arXiv.2604.23520 |
| **代码** | TBD |

---

## 核心贡献

> 研究如何利用现代 GPU 射线追踪架构加速不规则 BVH 遍历的碰撞检测

1. 现代 GPU 提供射线追踪 (RT) 架构，硬件加速 BVH 遍历
2. 现有方法将离散碰撞检测 (DCD) 简化为固定半径邻域搜索，在复杂几何下失效
3. 重新审视 GPU RT 架构上的 DCD 优化

---

## 技术方案

### 核心思想

高效 DCD 使用索引结构如 BVH，但加速不规则 BVH 遍历需要精心设计以实现性能。

现代 GPU RT 架构提供 BVH 遍历的硬件加速和优化的驱动程序，但先前尝试将其用于 DCD 的方法将碰撞检测简化为固定半径邻域搜索，对非球形粒子失效。

### 关键技术

| 技术 | 说明 |
|------|------|
| BVH Traversal | 利用 GPU RT 架构的硬件加速 |
| 离散碰撞检测 (DCD) | 粒子基础物理模拟的基础 |
| 不规则 BVH | 针对非均匀几何的 BVH 结构 |

---

## 实验结论

- GPU RT 架构可用于加速复杂几何的 DCD
- 不规则 BVH 遍历性能可通过架构感知优化

---

## 局限性

- 需要支持 RT 架构的 GPU
- 对极端不规则几何可能需要特殊处理

---

## 实现建议

- **实现难度**: 中（需要理解 GPU RT 架构）
- **预期性能**: 高效的粒子碰撞检测
- **适用场景**: 物理模拟、粒子系统、布料模拟
- **优先级**: 中高 - 对实时物理模拟有价值

---

## 相关工作

- [[BVH]]
- [[Ray Tracing]]
- [[Collision Detection]]
- [[GPU Architecture]]