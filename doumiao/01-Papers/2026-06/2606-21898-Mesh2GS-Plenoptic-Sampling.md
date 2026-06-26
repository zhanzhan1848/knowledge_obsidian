# White-Box 3DGS Construction via Plenoptic Sampling

## 论文信息
- **arXiv**: [2606.21898](https://arxiv.org/abs/2606.21898)
- **标题**: White-Box 3DGS Construction via Plenoptic Sampling
- **作者**: Youcheng Cai
- **日期**: 2026-06-20
- **标签**: #3DGS #plenoptic-sampling #global-illumination

## 核心创新点

### 问题
- 3D Gaussian Splatting (3DGS) 是高质量实时 3D 重建的有前景方法
- 现有 3DGS-to-mesh 方法主要关注从多视角图像重建 mesh
- 反向问题（mesh → 3DGS）受到较少关注
- 现有方法依赖 heuristic strategies 绑定 3D Gaussians 到 mesh

### 解决方案：Mesh2GS
- 基于 plenoptic sampling theory 的 novel white-box 3DGS construction framework
- 实现 Nyquist-level performance 的高质量全局光照渲染

### 核心技术
1. **Plenoptic sampling guided 3DGS construction**: 理论推导最小采样率和 3D Gaussians 分布
2. **Albedo-shading decomposition**: 新型 3DGS update procedure，高效全局光照捕获
3. **Neural illumination enhancement**: 处理非兰伯特定律效应 (non-Lambertian effects)

### 性能
- 超越 SOTA baselines
- 适用于实时共享渲染
- 捕获非兰伯特效应的镜面高光

## 相关工作
- 属于 [[3DGS]], [[plentopic sampling]], [[global illumination]] 领域
- 相关技术：[[albedo-shading decomposition]], [[neural rendering]]

## URL
- Paper: https://arxiv.org/abs/2606.21898
- PDF: https://arxiv.org/pdf/2606.21898

## 评估日期
- 2026-06-26