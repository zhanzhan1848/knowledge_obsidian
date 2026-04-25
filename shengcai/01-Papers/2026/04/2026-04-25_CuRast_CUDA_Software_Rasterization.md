---
type: paper
created: 2026-04-25
updated: 2026-04-25
tags: [paper, rasterization, CUDA, real-time-rendering, massive-triangles]
status: processed
domain: rasterization
agent: shengcai
source: https://arxiv.org/abs/2604.21749
---

# CuRast: Cuda-Based Software Rasterization for Billions of Triangles

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CuRast: Cuda-Based Software Rasterization for Billions of Triangles |
| **作者** | Markus Schütz |
| **发表** | arXiv cs.GR, 2026-04-23 |
| **链接** | [原文](https://arxiv.org/abs/2604.21749) |
| **DOI** | 10.48550/arXiv.2604.21749 |
| **代码** | [GitHub: m-schuetz/CuRast](https://github.com/m-schuetz/CuRast) |

---

## 核心贡献

> 基于 CUDA 的纯软件光栅化管线，可在海量三角形场景下（数亿级）实现比 Vulkan 快 2-12 倍的渲染速度

1. **3 阶段光栅化管线**：小三角形在第 1 阶段直接光栅化（使用 atomicMin 存储最近片段），大三角形转发到第 2、3 阶段处理
2. **无需预建加速结构**：避免了传统 rasterization pipeline 的 BVH/加速结构构建开销
3. **针对海量三角形优化**：数百亿级三角形模型相比 Vulkan 实现 2-5x（唯一）/ 12x（实例化）加速

---

## 技术方案

### 核心思想

利用 compute shader 实现高效软件光栅化，突破传统 GPU 光栅化对三角形数量的限制。核心思路是：
- **小三角形直接光栅化**：通过 atomicMin 比较 z-depth，直接写入最近 fragment
- **大三角形分级处理**：大三角形分发给后续阶段，避免小三角形的 depth complexity 问题
- **避免加速结构**：无需预构建 BVH 等结构，直接面向原始三角形数据

### 3-Stage Pipeline 架构

```
Stage 1: 小三角形直接 rasterize → atomicMin z-buffer
Stage 2: 中等三角形处理
Stage 3: 大三角形处理
```

---

## 实验结论

- **适用场景**: 密集不透明网格（通常来自摄影测量/3D 重建）
- **性能**: 数百亿三角形模型比 Vulkan 快 2-5x（唯一）/ 12x（实例化）
- **Vulkan 优势**: 低多边形网格场景 Vulkan 仍快一个数量级
- **不支持**: blending/transparency、低多边形大量 mesh 场景（成千上万节点）

---

## 局限性

- 当前仅支持密集不透明网格（photogrammetry/3D 重建数据）
- 不支持半透明/混合效果
- 成千上万低多边形 mesh 场景未高效实现

---

## 实现建议

- **实现难度**: 中（需要 CUDA compute shader 经验）
- **预期性能**: 海量密集三角形场景显著优于 Vulkan；低 poly 场景不如 Vulkan
- **适用场景**: 摄影测量重建、体渲染数据预处理、LiDAR 点云三角化

---

## 相关工作

- [[Vulkan Rasterization Pipeline]]
- [[CUDA Ray Tracing]]
