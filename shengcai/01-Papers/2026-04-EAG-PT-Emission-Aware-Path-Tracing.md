---
type: paper
created: 2026-08-30
updated: 2026-08-30
tags: [paper, rendering, path-tracing, global-illumination, gaussian-splatting, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2601.23065
---

# EAG-PT: Emission-Aware Gaussians and Path Tracing for Diffuse Indoor Scene Reconstruction and Editing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | EAG-PT: Emission-Aware Gaussians and Path Tracing for Diffuse Indoor Scene Reconstruction and Editing |
| **作者** | Xijie Yang 等 |
| **发表** | SIGGRAPH 2026 Conference Paper, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2601.23065) |
| **项目页** | https://eag-pt.github.io |
| **DOI** | https://doi.org/10.1145/3799902.3811054 |

---

## 核心贡献

> 面向可编辑漫反射全局光照的 2D 高斯联合表示与路径追踪

1. **传输友好几何代理**：使用 2D 高斯作为传输友好的几何代理，避免显式网格重建
2. **发射分离**：在重建过程中显式分离发射和非发射组件以支持编辑
3. **重建与渲染解耦**：使用高效单跳优化进行重建，高质量多跳路径追踪进行最终渲染
4. **物理一致编辑**：室内场景编辑后产生自然、物理一致的渲染结果

---

## 技术方案

### 核心思想

现有辐射场重建方法（NeRF、3DGS）在场景编辑时因光照烘焙和缺乏显式光传输而失效。逆路径追踪方法需要精确几何。EAG-PT 创新地使用统一 2D 高斯表示：

1. **2D 高斯表示**：2D Gaussians 支持光线求交，作为传输友好的几何代理
2. **发射感知分离**：区分发光和非发光组件
3. **重建-渲染分离**：
   - 重建阶段：高效单跳优化
   - 渲染阶段：高质量多跳路径追踪

### 关键技术

| 技术 | 说明 |
|------|------|
| 2D Gaussian Representation | 统一几何表示，支持光线求交 |
| Emission Separation | 发射/非发射组件显式分离 |
| Single-bounce Optimization | 高效单跳重建 |
| Multi-bounce Path Tracing | 高质量多跳全局光照 |
| Diffuse Global Illumination | 漫反射全局光照 |

---

## 实验结论

- 比辐射场重建产生更自然、物理一致的编辑渲染
- 比网格逆路径追踪保留更精细几何细节
- 避免网格引起的伪影
- 适用于室内设计、XR 内容创建、具身 AI

---

## 局限性

- 仅针对漫反射全局光照
- 高光/镜面反射未包含

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 离线重建和渲染
- **适用场景**: 室内场景编辑、XR 内容创建、数字孪生、具身 AI

---

## 与渲染领域的关联

本文使用 **路径追踪（Path Tracing）** 实现 **漫反射全局光照（Diffuse Global Illumination）**，与以下技术相关：
- 路径追踪
- 全局光照
- 辐射场（NeRF/3DGS）
- 光传输模拟

---

## 相关工作

- [[HoloPathTracer]] - Wave Path Tracing for Holography
- [[TRON]] - Tracing Rays to Orchestrate a Neural Renderer
