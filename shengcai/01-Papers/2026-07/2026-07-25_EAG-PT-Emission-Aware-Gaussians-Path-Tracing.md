---
type: paper
created: 2026-07-25
updated: 2026-07-25
tags: [paper, 3DGS, path-tracing, inverse-rendering, indoor, SIGGRAPH2026]
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
| **作者** | Xijie Yang et al. |
| **发表** | SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2601.23065) |
| **DOI** | 10.1145/3799902.3811054 |

---

## 核心贡献

> 使用 2D Gaussian 作为传输友好的几何代理，实现可编辑室内场景的物理全局光照重建与渲染

1. 用 2D Gaussians 作为传输友好几何代理，避免显式网格重建
2. 在重建阶段显式分离自发光与非自发光成分，支持场景编辑
3. 解耦重建与最终渲染：单次反弹优化用于高效重建，多次反弹路径追踪用于高质量渲染

---

## 技术方案

### 核心思想

现有辐射场方法（NeRF、3DGS）对场景编辑支持差（光照 baked、无显式光传输）；网格逆路径追踪需要精确几何。EAG-PT 通过 2D Gaussian 表示 + 路径追踪解决以上问题。

### 三阶段方法

1. **Stage 0**: 2D Gaussian 表示（传输友好几何代理）
2. **Stage 1**: 单次反弹优化（高效重建）
3. **Stage 2**: 多次反弹路径追踪（高质量渲染）

### 关键技术

| 技术 | 说明 |
|------|------|
| 2D Gaussian 几何代理 | 避免网格重建的局限性 |
| 自发光分离 | 支持编辑操作的物理一致性 |
| 单/多反弹解耦 | 平衡重建效率与渲染质量 |

---

## 实验结论

- 在合成和真实室内场景上优于辐射场重建方法
- 比基于网格的逆路径追踪保留更细的几何细节
- 适用于室内设计、XR 内容创建、Embodied AI

---

## 局限性

目前针对漫反射场景，全局光照编辑能力受限

---

## 实现建议

- **实现难度**: 高（需实现 2D Gaussian 路径追踪 + OptiX）
- **预期性能**: 可编辑室内场景的实时预览
- **适用场景**: 室内设计、XR、场景编辑
