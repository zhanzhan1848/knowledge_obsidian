---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [voxelization, LOD, microgeometry, path-tracing, anisotropic-SSS, PBR]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.13191
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fast Voxelization and Level of Detail for Microgeometry Rendering |
| **作者** | Javier Fabre et al. |
| **发表** | The Visual Computer / arXiv 2026 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2604.13191) |
| **DOI** | 10.48550/arXiv.2604.13191 |

---

## 核心贡献

> 高效并行体素化 + 层次SGGX聚类LOD，实现微观几何的高质量路径追踪渲染。

1. 高效并行体素化方法：支持从三角形网格和含纤维的体积数据快速生成多分辨率体素
2. 层次SGGX集群LOD表示：多距离下聚合视觉效果，降低每像素采样数
3. CUDA实现验证，配合路径追踪器展示高质量结果

---

## 技术方案

### 核心思想

纤维、刷痕金属等微观几何具有各向异性散射，空间稀疏，需高分辨率体素才能正确表达。传统方法逐点体素化代价高，且LOD需要额外数据结构。该工作提出：
- 并行体素化：GPU高效生成多分辨率级
- 层次SGGX聚类：各向异性相位函数的高质量近似

### 关键应用场景

| 场景 | 需求 |
|------|------|
| 织物/纤维 | 高分辨率体素 + 各向异性散射 |
| 刷痕金属 | 多分辨率LOD聚合视觉效果 |
| 体积材质 | MIP-map风格的多级表示 |

---

## 实验结论

- **实现**: CUDA体素化器
- **数据**: 三角形网格 + 显式纤维体积数据
- **渲染器**: 路径追踪
- **结果**: 高效体素生成 + 高质量LOD渲染

---

## 局限性

- SGGX集群的预处理开销
- 对极端各向异性材质可能需要更多集群

---

## 实现建议

- **实现难度**: 中（CUDA并行编程 + 体积渲染基础）
- **预期性能**: 相比传统方法显著加速
- **适用场景**: 织物渲染、材质扫描、微观几何管道

---

## 相关笔记

- [[SGGX-Phase-Function]]
- [[Volume-Rendering-LOD]]
- [[Path-Tracing-Optimization]]
- [[Microgeometry-Scattering]]
