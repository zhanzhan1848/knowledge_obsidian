---
tags: [渲染, 3DGS, 神经渲染, 光线追踪, PBR, 可编辑, 2026]
date: 2026-06-16
status: 已读
cite: arXiv:2606.11314
---

# TRON: Tracing Rays to Orchestrate a Neural Renderer for 3D Gaussian Reconstructions

## 元信息

| 标题 | TRON: Tracing Rays to Orchestrate a Neural Renderer for 3D Gaussian Reconstructions |
|------|--------------------------------------|
| 作者 | Or Perel et al. |
| 机构 | NVIDIA Research |
| 链接 | [arXiv](https://arxiv.org/abs/2606.11314) |
| 发表 | arXiv (cs.CV) |
| 领域 | cs.CV, cs.GR |

## 核心贡献

1. **首个实现实际交互式应用的方法**：在捕获的 3D 环境中支持动态几何、光照和材质条件下的真实外观
2. **结合 3D Gaussian 光线追踪与神经渲染**：支持新颖光照、动态物体运动、物体插入和材质编辑
3. **多阶段训练策略**：大规模预训练 + 目标微调（210 万帧合成/真实数据）

## 技术方案

### 核心问题
- 纯 PBR 的 Gaussian 表示无法实现真实感重光照（重建几何/材质/光传输估计不完美）
- 神经渲染方法缺乏显式场景表示，限制了交互式编辑的细粒度控制

### 解决方案：TRON
1. **固有分解先验**：从学习的逆渲染模型中提取 material priors 正则化 Gaussian 场
2. **光线追踪器作为结构化 3D 脚手架**：提供辐射度量指导而非最终像素
3. **轻量级神经渲染器**：弥合着色模型约束估计与真实感输出之间的领域差距

### 训练策略
- **Stage 1**: 大规模预训练
- **Stage 2**: 在 2.1M 渲染合成帧和真实世界帧上微调

### 支持能力
- Novel lighting
- Dynamic object motion
- Object insertion
- Material editing

## 实验结论

- 在真实感方面 **优于基于 Gaussian 的重光照方法**
- 在可编辑性和速度方面 **优于先前神经渲染器**
- 首次实现交互式应用

## 相关工作

- 3D Gaussian Splatting (3DGS)
- Physically Based Rendering (PBR)
- Neural Rendering
- Inverse Rendering

## 标签

#3DGS #神经渲染 #光线追踪 #PBR #NVIDIA #2026
