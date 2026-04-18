---
type: paper
created: 2026-04-18
updated: 2026-04-18
tags: [paper, voxelization, LOD, path-tracing, rasterization, microgeometry, anisotropic-SGGX]
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
| **发表** | The Visual Computer (2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.13191) |
| **DOI** | 10.48550/arXiv.2604.13191 |
| **代码** | TBD (project page) |

---

## 核心贡献

> 并行体素化 + 层级 SGGX 聚类实现各向异性微几何的高效 LOD 渲染

1. 高效并行体素化方法，支持多分辨率快速数据聚合
2. 基于层级 SGGX 聚类的新型表示，比基线方法更高精度
3. CUDA 实现 + Path Tracer 验证完整渲染管线

---

## 技术方案

### 核心思想

许多材质（纤维织物、拉丝金属等）呈现各向异性光散射，其微结构需要高空间分辨率体素化才能正确表示。传统体素化耗时且内存密集，且现有 LOD 方法无法有效聚合多距离观察到的外观。

### 关键技术

| 技术 | 说明 |
|------|------|
| 并行体素化 | CUDA 并行实现，快速生成多分辨率体素数据 |
| 层级 SGGX 聚类 | 用 SGGX（椭圆形高斯）代替标量密度表示各向异性散射 |
| LoD 数据结构 | MIP-map 风格多级聚合，减少每像素采样数 |
| Path Tracer 验证 | 基于提出 LoD 模型实现路径追踪渲染 |

### 方法流程

```
输入: 三角形网格 or 体积织物(含显式纤维)
     ↓
并行体素化 → 多分辨率体素栅格
     ↓
层级 SGGX 聚类 → LoD 层次结构
     ↓
Path Tracer (CUDA) → 最终渲染结果
```

---

## 实验结论

- **数据集**: 三角形网格 + 体积织物（显式纤维）
- **基线**: 传统体素化 + 标量密度 LOD
- **结果**: 层级 SGGX 方法精度优于基线；CUDA 体素化器验证了效率

---

## 局限性

- 依赖于 SGGX 近似模型
- 织物纤维的各向异性参数需要手动调优

---

## 实现建议

- **实现难度**: 中（需要 CUDA 并行编程 + 路径追踪器基础）
- **预期性能**: 体素化速度显著提升，LoD 渲染减少采样数
- **适用场景**: 织物渲染、拉丝金属、纤维级微几何渲染

