---
tags: [几何, UV参数化, 3DGS, 网格融合, 头部化身]
type: paper
venue: arXiv cs.GR (ECCV 2026)
date: 2026-08-04
---

# URHead: A Unified UV-Space Representation for Joint Mesh–3DGS Optimization in Head Avatars

## 核心方法

### 问题定义
Mesh-based 方法提供精确几何控制但缺乏照片级细节；3D Gaussian Splatting (3DGS) 实现照片级渲染但结构一致性差。现有混合方案未能充分发挥两者的互补优势。

### 核心创新：UV-Space Unification

**关键洞察**：在 UV 空间中统一 Mesh 和 3DGS 表示

1. **共享公共 UV 参数化**：两者共享同一个 UV map
2. **自适应高斯采样 (Adaptive Gaussian Sampling)**：joint optimization
3. **自动 disentangle 和分配**：自动学习合适角色分配

### 技术流程
1. 将 Mesh 投影到 UV 空间
2. 3DGS 在 UV 空间对齐
3. 联合优化：几何精度 + 渲染质量

## 算法优势

- ✅ 保持 full parametric controllability
- ✅ 保留 subject-specific details
- ✅ 重建质量 (reconstruction quality) SOTA
- ✅ 动画一致性 (animation consistency) SOTA

## 开源实现

- Project page: https://lseonghak.github.io/website/project/urhead/
- Code: 即将开源

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#uv-parametrization #mesh-3dgs #avatar #joint-optimization #geometry-processing
