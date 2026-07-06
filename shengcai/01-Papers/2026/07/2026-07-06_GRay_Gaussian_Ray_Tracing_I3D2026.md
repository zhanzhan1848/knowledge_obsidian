---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, ray-tracing, 3d-gaussian, rendering, acceleration-structure, i3d2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.30869
---

# GRay: Ray Tracing 3D Gaussians Near the Speed of Splats

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Ray Tracing 3D Gaussians Near the Speed of Splats |
| **作者** | George Drettakis et al. (INRIA) |
| **发表** | I3D 2026 — Proc. ACM Comput. Graph. Interact. Tech. 9, 1, Article 14 |
| **链接** | [原文](https://arxiv.org/abs/2606.30869) |
| **DOI** | 10.1145/3804496 |
| **代码** | https://repo-sam.inria.fr/nerphys/gray |

---

## 核心贡献

> 将 3D Gaussian Splatting 的光线追踪速度提升至接近光栅化水平，优化速度比 3DGRT 快近 10 倍

1. **对数复杂度加速**：利用光线追踪只计算射线实际击中 Gaussian 的特性，相比光栅化的线性扫描实现对数级加速
2. **密集初始化策略**：密集初始化产生大量小 Gaussian，反而加速光线追踪但减慢光栅化——这一反直觉发现是核心算法基础
3. **GRay 快速光线追踪器**：专为 3D Gaussian 设计，在保持质量的同时接近 3DGS 光栅化的渲染速度

---

## 技术方案

### 核心思想

传统光栅化对所有 Gaussian 做 splatting（线性复杂度），而光线追踪利用空间数据结构只需计算射线实际穿过的 Gaussian。密集场景（大量小 Gaussian）放大这一差异。

### 关键技术

| 技术 | 说明 |
|------|------|
| 密集初始化 | 产生大量小 Gaussian，光线追踪反而更快 |
| 对数空间缩放 | 射线—Gaussian 相交数量随场景密度对数增长 |
| 快速交集计算 | 针对 Gaussian 几何特性的专用求交算法 |

---

## 实验结论

- **渲染速度**：比 3DGRT 快约 4 倍
- **优化速度**：比 3DGRT 快约 10 倍（近 1 个数量级）
- **质量**：与 3DGRT 相当，略低于 3DGS 光栅化
- **场景适应性**：密集场景优势更明显，稀疏场景接近光栅化速度

---

## 局限性

- 渲染质量略低于光栅化 3DGS
- 仅适合密集 Gaussian 初始化场景

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 接近实时（1080p 单 GPU）
- **适用场景**: 需要光线追踪反射/阴影的 3DGS 应用、神经辐射场、场景编辑
