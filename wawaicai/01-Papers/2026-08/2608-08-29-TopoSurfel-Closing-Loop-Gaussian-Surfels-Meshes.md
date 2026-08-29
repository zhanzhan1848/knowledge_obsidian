---
type: paper
created: 2026-08-29
updated: 2026-08-29
tags: [surface-reconstruction, 3DGS, Gaussian-splatting, mesh-extraction, point-cloud]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.20687
---

# TopoSurfel: Closing the Loop between Gaussian Surfels and Meshes for Surface Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | TopoSurfel: Closing the Loop between Gaussian Surfels and Meshes for Surface Reconstruction |
| **作者** | (待补充 - arXiv:2608.20687) |
| **发表** | arXiv cs.CV (2026-08-24, cross-list from cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2608.20687) |

---

## 核心贡献

> 解决 3D Gaussian Splatting 离散无结构性质导致的表面提取难题，通过可微分等值面提取连接 Gaussian surfels 与连续网格

1. **可微分等值面提取**: 无需辅助神经网络或额外每-Gaussian 参数，将网格提取引入可微分流水线
2. **网格引导的 surfel 演化**: 利用可微分连接引入网格引导的 surfel 演化过程
3. **解决结构歧义**: 在无纹理或遮挡区域利用显式结构几何先验解决 3DGS 固有的结构歧义

---

## 技术方案

### 核心问题

3DGS 在新视角合成方面效果卓越，但从中提取高保真表面仍具挑战：
- 3DGS 的离散无结构性质
- 现有方法依赖多视角几何一致性或局部约束
- 缺乏显式结构几何先验导致纹理缺失/遮挡区域出现伪影和漂浮物

### 解决方案

1. **非可训练的等值面提取**: 动态提取连续代理网格 (continuous proxy mesh)，通过非可训练的可微分等值面过程
2. **网格引导 Surfels 演化**: 利用可微分连接，引入网格先验引导 Gaussian surfel 优化
3. **结构先验注入**: 解决无纹理/遮挡区域的几何歧义

### 关键技术

| 技术 | 说明 |
|------|------|
| 可微分等值面 | Differentiable iso-surfacing，无需额外网络 |
| 网格引导优化 | Mesh-guided surfel evolution |
| 结构几何先验 | 解决纹理缺失区域的歧义 |

---

## 相关工作

- [[Gaussian-Sculpting-Surface-Reconstruction]] - 3DGS 表面重建
- [[ExMesh++]] - 多视图网格/PBR 重建
- [[CASA-SDF-Neural-Implicit-Surface-Reconstruction]] - 神经隐式表面重建

---

## 实现建议

- **实现难度**: 高 — 需理解 3DGS 流水线 + 可微分几何
- **预期性能**: 在纹理缺失和遮挡区域优于纯 3DGS 方法
- **适用场景**: 扫描数据重建、实时表面重建、3DGS 后处理
- **开源参考**: 3DGS 原始实现 (navigator-gaussians)、libigl 等值面提取
