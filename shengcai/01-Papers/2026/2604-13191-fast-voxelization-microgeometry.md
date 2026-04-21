---
tags: [渲染, 微几何, 体素化, LOD, 路径追踪, PBR, 2026]
date: [[2026-04-21]]
status: 已读
arxiv: 2604.13191
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 元信息

| 标题 | Fast Voxelization and Level of Detail for Microgeometry Rendering |
|------|------|
| 作者 | Javier Fabre |
| 发表 | The Visual Computer (2026-04-14), arXiv |
| 链接 | [arXiv](https://arxiv.org/abs/2604.13191) / [PDF](https://arxiv.org/pdf/2604.13191) / [Supplementary](https://javierfabre.com/projects/voxel-lod/supp.pdf) |

## 核心贡献

1. **高效并行体素化方法**: 快速数据聚合，支持多分辨率层级
2. **Hierarchical SGGX Clustering**: 比基线方法更高精度的层级表示
3. **CUDA 实现**: 在三角形网格和体积织物（有显式纤维）上验证
4. **Path Tracer 集成**: 展示基于提议 LoD 模型的路径追踪结果

## 技术方案

### 背景
许多材质因微结构形状和局部排列表现出各向异性光散射（如纤维表面、拉丝金属）。这些表面非常稀疏，需要高空间分辨率才能正确表示为体积。

### 方法流程
```
输入几何 → 并行体素化 → 多分辨率聚合 → SGGX 层级聚类 → LoD 数据结构 → Path Tracer 渲染
```

### 关键创新

#### 1. 并行体素化
- 高效体素化便于快速数据聚合
- 支持多分辨率层级

#### 2. Hierarchical SGGX Clustering
- 替代传统 MIP mapping
- 提供更好精度
- SGGX: 非对称高斯分布表示微表面分布

#### 3. LoD for Microgeometry
- 从多个距离观察聚合视觉外观
- 减少每像素采样数
- 特别适用于纤维、织物、毛发等微几何

### 验证
- CUDA 实现
- 三角形网格测试
- 体积织物（显式纤维建模）
- Path tracer 输出验证

## 实验结论

- 体素化速度显著快于传统方法
- SGGX 层级聚类精度优于基线
- 可用于 PBR 材质渲染流程

## 局限性

- 需要预计算 SGGX 分布
- 对极细薄几何可能存在精度权衡

## 可行性分析

- **实现难度**: 中 (CUDA 并行 + SGGX 分布计算)
- **性能预期**: 高效体素化 + 低 LoD 开销
- **适用场景**: 织物渲染、毛发渲染、微表面 PBR
- **推荐度**: ⭐⭐⭐⭐ (完整实现可用，适合微几何渲染)

## 行动建议

可传递给 @墨鱼丸 评估在材质系统中的集成方案。
