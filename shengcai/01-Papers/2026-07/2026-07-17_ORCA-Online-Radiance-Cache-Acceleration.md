---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, path-tracing, real-time, global-illumination, radiance-cache, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://advances.realtimerendering.com/s2026/index.html
---

# ORCA: Speeding up Path Tracing via Online Radiance Cache Acceleration

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Speeding up Path Tracing via ORCA (Online Radiance Cache Acceleration) |
| **作者** | Jon Greenberg (EA SEED) |
| **发表** | SIGGRAPH 2026 - Advances in Real-Time Rendering in Games |
| **链接** | [课程页面](https://advances.realtimerendering.com/s2026/index.html) |

---

## 核心贡献

> 为实时渲染设计的自定义辐射缓存，**不依赖时序历史**

1. **即时数据结构**: 所有数据结构即时创建，**帧间不存活**
2. **完全动态场景友好**: 不依赖历史，适合动态场景
3. **最小集成成本**: 最小改动集成现有实时路径追踪器

---

## 技术方案

### 核心思想

路径追踪在现代硬件上实现实时的速度仍然很慢。传统辐射缓存方法依赖时序历史，在完全动态场景中失效。ORCA通过**即时缓存**解决这一问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| 即时辐射缓存 | 帧内创建，帧间销毁 |
| 无时序依赖 | 适合动态几何/光照 |
| 最小侵入 | 集成成本低 |

---

## 实验结论

- 显著加速实时路径追踪
- 支持完全动态场景
- 保持视觉质量

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 游戏实时PT、动态场景GI
- **推荐度**: ⭐⭐⭐⭐⭐
