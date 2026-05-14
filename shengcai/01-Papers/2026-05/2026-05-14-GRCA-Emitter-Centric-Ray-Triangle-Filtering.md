---
type: paper
created: 2026-05-14
updated: 2026-05-14
tags: [paper, ray-tracing, LiDAR, acceleration-structure, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.10457
---

# Geometrically Approximated Modeling for Emitter-Centric Ray-Triangle Filtering in Arbitrarily Dynamic LiDAR Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometrically Approximated Modeling for Emitter-Centric Ray-Triangle Filtering in Arbitrarily Dynamic LiDAR Simulation |
| **作者** | (待获取) |
| **发表** | arXiv cs.GR, 2026-05-12 |
| **链接** | [原文](https://arxiv.org/abs/2605.10457) |
| **代码** | 待发布 |

---

## 核心贡献

> 一句话总结：提出GRCA算法，从发射器视角反问"哪些光线能击中三角形"，无需加速结构

1. **Gajmer Ray-Casting Algorithm (GRCA)**: 从发射器视角而非光线视角进行光线-三角形过滤
2. **发射器中心视角反转**: 将问题从"这条光线击中什么"变为"哪些光线能击中这个三角形"
3. **几何锥/平面建模**: 将旋转LiDAR发射器建模为旋转追踪的锥体或平面
4. **无加速结构设计**: 对动态几何特别有效，无需每帧重建

---

## 技术方案

### 核心思想

传统加速结构（如BVH）需要每帧重建，无法适应高动态场景。GRCA提出从发射器视角出发，问"哪些光线能击中每个三角形"而非"每条光线击中什么"。

### 关键技术

| 技术 | 说明 |
|------|------|
| 发射器中心视角 | 三角形可见面积决定哪些通道的光线能到达 |
| 几何过滤 | 不用加速结构，每三角形进行通道级culling |
| 距离culling | 扩展性能，在10-100m范围内可达7.02x GPU加速 |
| 混合管线 | GRCA处理动态几何，OptiX/Embree处理静态几何 |

### 性能数据

- 2-8个128x4096-ray LiDAR同时运行
- GRCA vs OptiX: 最高7.97x加速
- GRCA vs Embree: 最高14.55x加速
- 混合管线: GPU 10.5x, CPU 19.2x

---

## 局限性

- 特定于已知发射器位置的场景
- 距离culling依赖实际部署范围

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 大幅超越传统加速结构方案
- **适用场景**: LiDAR仿真、动态场景光线追踪、ROS仿真

---