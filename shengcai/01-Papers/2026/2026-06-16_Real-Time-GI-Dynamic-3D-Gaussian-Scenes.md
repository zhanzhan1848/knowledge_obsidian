---
tags: [渲染, 全局光照, 3DGS, 实时渲染, 2026]
date: 2026-06-16
status: 已读
cite: arXiv:2503.17897
---

# Real-time Global Illumination for Dynamic 3D Gaussian Scenes

## 元信息

| 标题 | Real-time Global Illumination for Dynamic 3D Gaussian Scenes |
|------|--------------------------------------|
| 作者 | Sheng Li et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2503.17897) |
| 发表 | IEEE TVCG (已接收) |
| 领域 | cs.GR, cs.CV |

## 核心贡献

1. **提出基于表面光传输方程 (LTE) 的 3D Gaussian 光传输公式**，为实时 GI 应用奠定基础
2. **提出复合随机光线追踪算法和优化的 3D Gaussian 光栅化器**，解决实时 GI 中的性能瓶颈
3. **提出实用的动态场景实时 GI 管线**，支持动态场景、光泽材质和复杂光照

## 技术方案

### 核心问题
3D Gaussian Splatting (3DGS) 虽能实现高效实时渲染，但缺乏物理光传输能力，无法处理动态光照或场景变化。

### 解决方案
1. **光传输模型**：将光传输方程 (LTE) 形式化到 3D Gaussians 表面
2. **复合随机光线追踪**：快速 compound stochastic ray-tracing 算法
3. **优化光栅化**：针对 3D Gaussians 的 EWA splatting 优化
4. **技术集成**：
   - Light grid
   - Two-level radiance cache
   - Reflection lobe tracing
   - Denoising

### 性能
- 分辨率 1920x1088 下超过 40 fps
- 支持 150 万+ 3D Gaussian 图元

## 公式

### 光传输方程 (LTE)
$$L_o(x, \omega_o) = L_e(x, \omega_o) + \int_{\Omega} f_r(x, \omega_o, \omega_i) L_i(x, \omega_i) \langle \omega_i, n \rangle d\omega_i$$

### 3D Gaussian 表面光传输
针对 3D Gaussians 的变形版本，考虑了球谐函数表示

## 实验结论

- 首次实现 **动态 3D Gaussian 场景的实时全局光照**
- 支持交互式材质编辑和动态光照
- 捕获 3D Gaussians 与 mesh 之间的多跳间接光照

## 局限性

- 依赖 3D Gaussian 的点云追踪基础设施
- 需要预训练或初始化

## 相关工作

- 3DGS (Kerbl et al., 2023)
- Real-time GI (Wright et al., Boissé et al.)
- Point cloud ray tracing (Gao et al., 2025)

## 标签

#全局光照 #3DGS #实时渲染 #光线追踪 #2026
