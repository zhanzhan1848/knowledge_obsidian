# Mesh Generation with Equivariant Flow Matching

## 论文信息
- **arXiv**: [2606.23489](https://arxiv.org/abs/2606.23489)
- **标题**: Mesh Generation with Equivariant Flow Matching
- **作者**: Qi Sun
- **会议**: SIGGRAPH 2026
- **日期**: 2026-06-22
- **标签**: #mesh-generation #flow-matching #SIGGRAPH2026

## 核心创新点

### 问题
- Mesh 是最常见的 3D 场景表示之一
- 直接生成 mesh 面临挑战：representation 包含重要对称性
  - Face 和 vertex 的 permutation invariance
  - 每个 face 内 vertex 的 permutation invariance

### 解决方案：MeshFlow
- 学习直接生成 triangle meshes 作为 triangle soups
- 避免将 mesh 序列化为长的自回归序列
- 采用 equivariant optimal-transport flow matching models
- 保持 triangle soups 的关键对称性

### 核心技术
1. **Diffusion Transformer modification**: 提出简单但有效的修改
2. **Equivariant velocity field**: 保持所需等变性
3. **Optimal-transport-based training objective**: 消除违反对称性的监督信号
4. **18× speedup**: 推理速度比 SOTA 自回归 mesh generator 快约 18 倍

### 项目
- Project page: https://qiisun.github.io/MeshFlow/

## 相关工作
- 属于 [[mesh generation]], [[3D generation]], [[flow matching]] 领域
- 相关技术：[[Diffusion Transformer]], [[optimal transport]], [[equivariant neural networks]]

## URL
- Paper: https://arxiv.org/abs/2606.23489
- PDF: https://arxiv.org/pdf/2606.23489
- Project: https://qiisun.github.io/MeshFlow/

## 评估日期
- 2026-06-26