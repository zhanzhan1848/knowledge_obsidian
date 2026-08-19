---
type: paper
created: 2026-08-19
updated: 2026-08-19
tags: [terrain-rendering, height-field, TIN, mesh-rendering, WebGPU, LOD]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.17390
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields |
| **作者** | Dzmitry Malyshau |
| **发表** | arXiv cs.GR, submitted to Journal of Computer Graphics Techniques |
| **链接** | [原文](https://arxiv.org/abs/2608.17390) \| [PDF](https://arxiv.org/pdf/2608.17390) |
| **DOI** | 10.48550/arXiv.2608.17390 |

---

## 核心贡献

> 对比了 6 种地形渲染方法在游戏地形（多层、可编辑、非光滑）上的表现，发现 greedy triangulated TIN（不规则三角网）在大多数设备上帧时间最低。

1. 六种渲染方法的系统性对比（height-field ray marching, voxel-accelerated ray marching, sliced proxy geometry, per-sample bar rasterization, compute scattering, fitted triangle mesh）
2. 游戏地形特性分析（非光滑、不可微、多层）
3. GPU 几何和 CPU 三角化的权衡分析
4. 发现 greedy TIN 在性能和可编辑性上最佳

---

## 技术方案

### 核心问题

地形 LOD 几乎只在数字高程模型（DEM）上测量，但游戏地形往往不是单值、光滑的。Vangers (1998) 的多层地形（two solid intervals per ground sample）具有洞穴、可破坏性，对现有方法构成挑战。

### 六种方法对比

| 方法 | 特点 | 性能 |
|------|------|------|
| Height-field ray marching | CPU 光线步进 | 基准 |
| Voxel-accelerated ray marching | Voxel 加速 | 中等 |
| Sliced proxy geometry | 切片代理几何 | 中等 |
| Per-sample bar rasterization | 点散射 | 覆盖丢失 |
| Compute scattering | 计算散射 | 中等 |
| Fitted triangle mesh | TIN 三角网 | **最低帧时间** |

### 关键发现

- **Greedy TIN** 帧时间最低，但 fit 成本由第二层决定
- 可编辑网格保留 319 MiB GPU geometry + 535 MiB CPU triangulation
- 多层 + 破坏性 → 现有方法性能下降

---

## 局限性

- 研究对象为老游戏（1998），现代地形技术可能更成熟
- GPU/CPU 权衡在新型硬件上可能有不同结论

---

## 实现建议

- **实现难度**: 低中（工程对比研究）
- **开源依赖**: WebGPU/WGSL 工具链
- **适用场景**: 游戏地形渲染、实时 LOD、WebGPU 应用
- **推荐度**: ⭐⭐⭐ 工程参考价值，对游戏地形渲染有实践指导意义

---

## 相关工作

- [[地形渲染]] / [[Terrain Rendering]]
- [[三角不规则网]] / [[TIN]]
- [[LOD]]
- [[网格渲染]] / [[Mesh Rendering]]
