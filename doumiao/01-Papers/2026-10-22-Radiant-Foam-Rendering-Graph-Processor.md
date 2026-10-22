---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, volume-rendering, volumetric-rendering, many-core, IPU, Voronoi, RadiantFoam, hardware]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2601.04382v2
---

# Radiant Foam Rendering on a Graph Processor

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Radiant Foam Rendering on a Graph Processor |
| **arXiv ID** | 2601.04382v2 |
| **作者** | Zulkhuu Tuya, Ignacio Alzugaray, Nicholas Fry, Andrew J. Davison |
| **发表** | arXiv cs.GR 2026-01-07（v2 更新 2026-01-11） |
| **链接** | [原文](https://arxiv.org/abs/2601.04382v2) |
| **机构** | Dyson School of Engineering, Imperial College London 等 |
| **渲染类别** | **体积渲染**（Voronoi-cell volumetric representation） |

---

## 核心贡献

> 将 Radiant Foam 体积渲染表示完整迁移到"数百到数千个轻量核 + tile 局部 SRAM + 显式片上通信"的众核加速器上，实现**全片上 SRAM 的分布式光线行进**。

1. **首个全 SRAM 分布式 Radiant Foam 渲染器**，在 Graphcore Mk2 IPU 上实现零 off-chip 访存的光线行进。
2. **提出 hierarchical routing overlay**（分层路由覆盖层），把光线在场景分片（shard）间转发，使 ray traversal 保持局部性、通信路径可预测。
3. **系统性重新审视体积渲染的硬件假设**：证明"光线可随机访问统一大场景表示"这一假设在众核架构下失效，必须同时分解数据与计算。

---

## 技术方案

### 核心思想

传统体积渲染（含 Radiant Foam 的 Voronoi 表示）依赖单一大显存中可随机访问的统一场景。但新一代众核加速器（如 Graphcore Mk2 IPU、Tile 架构 GPU）：

- 每个核只拥有**小块本地 SRAM**（tile-local）
- 数据通过**显式片上通信**交换
- 优势是极高的聚合带宽，但**破坏了光线随机访问的前提**

本文的解法是**数据分片 + 计算分布 + 通信路由结构化**三者同时满足：

| 层次 | 做法 |
|------|------|
| **数据分片** | 场景按 Voronoi cell 划分到不同 tile，tile 局部 SRAM |
| **光线路由** | 分层 routing overlay，光线在分片间逐级转发 |
| **计算局部性** | ray marching 完全在片上 SRAM 完成，不触碰 off-chip |
| **通信可预测** | 通信路径结构化为固定路由，而非动态随机访问 |

### 关键技术

| 技术 | 说明 |
|------|------|
| **Radiant Foam Voronoi 表示** | 用 Voronoi 图组织辐射度，替代 NeRF 的 MLP/3DGS 的高斯基元 |
| **Tile-local SRAM 分片** | 场景切分到 tile，每 tile 独享 SRAM |
| **Hierarchical routing overlay** | 分层转发光线，支持跨 tile 的 ray marching |
| **全片上光线行进** | 无 off-chip 访存，规避众核架构的内存墙 |

---

## 实验结论

- **数据集**: Mip-NeRF 360 场景
- **硬件**: Graphcore Mk2 IPU（tile-local SRAM + 显式 inter-tile 通信）
- **结果**: 达到**近交互式（near-interactive）**帧率

---

## 局限性

- 高度绑定 RadiantFoam 这一具体体表示，未验证对其他体积表示（如 NeRF、3DGS）的通用性。
- 仅在 Graphcore Mk2 上验证，其他众核架构（tile GPU、chiplet）的迁移性未讨论。
- 通信路由 overlay 的设计高度依赖场景分片质量，分片不均可能导致负载失衡。

---

## 相关工作

- [[SDFoam-Signed-Distance-Foam]] — 同一 RadiantFoam 谱系，改进表面重建
- [[OV-Foam-3D-Representations-Semantic-Lifting]] — 同作者谱系（Davison 组）的 PowerFoam 表示
- [[NeRF]] — 体渲染基础
- [[3D Gaussian Splatting]] — 光栅化路线对照组

---

## 实现建议

- **实现难度**: 🔴 高（需要理解 IPU Poplar 图编程模型与分布式内存管理）
- **预期性能**: Mk2 IPU 上近交互式
- **适用场景**: 众核加速器上的体积渲染研究；VR/AR 端侧体积内容分发

### 🌱 豆苗评注

这篇的价值不在"又一个体积渲染器"，而在于**暴露了一个被忽视的硬件-算法耦合问题**：现在的 NeRF/3DGS/RadiantFoam 生态几乎全部默认单一统一显存。当 IPU、tile GPU、chiplet 架构普及时，体积渲染需要**重新设计算法**而非仅仅移植。这对做端侧/移动端 XR 的团队是直接的架构预警。