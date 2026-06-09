---
tags: [渲染, 全局光照, 3D-Gaussian, 实时渲染, 2026-04]
date: 2026-06-09
status: 已读
---

# Real-time Global Illumination for Dynamic 3D Gaussian Scenes

## 基本信息
| 标题 | Real-time Global Illumination for Dynamic 3D Gaussian Scenes |
|------|------|
| 作者 | Sheng Li 等 |
| 发表 | IEEE Transactions on Visualization and Computer Graphics (TVCG) |
| 年份 | 2026 (v2: April 29, 2026) |
| 链接 | [arXiv:2503.17897](https://arxiv.org/abs/2503.17897) |

## 核心贡献

1. **表面光传输方程公式化**：提出基于表面 LTE (Light Transport Equation) 的 3D Gaussians 光传输公式，作为实时 GI 应用的基础

2. **复合随机光线追踪**：提出快速复合随机光线追踪算法，解决 3D Gaussians 实时 GI 中的关键性能挑战

3. **实时动态 GI 管线**：提出适用于 3D Gaussians + Mesh 复合场景的实用实时动态 GI 管线，支持动态场景、光泽材质和复杂光照

## 技术方案

### 核心方法
- **表面光传输模型**：将 3D Gaussians 建模为表面元素，推导适合实时 GI 的 LTE 变体
- **复合随机光线追踪**：结合光线追踪和光栅化的混合方法
- **快速 3D Gaussian 光栅化器**：优化 3D Gaussians 的光栅化性能

### 集成技术
- Light Grid（光照网格）
- Two-level Radiance Cache（两级辐射缓存）
- Reflection Lobe Tracing（反射波瓣追踪）
- Denoising（去噪）

## 公式

### 表面光传输方程
```math
L_o(\mathbf{x}, \omega_o) = L_e(\mathbf{x}, \omega_o) + \int_{\Omega} f_r(\mathbf{x}, \omega_i, \omega_o) L_i(\mathbf{x}, \omega_i) (\omega_i \cdot \mathbf{n}) d\omega_i
```

## 性能指标

- **帧率**: 1920×1088 分辨率下超过 **40 FPS**
- **场景规模**: 150 万+ 3D Gaussian 基元 + Mesh
- **多跳间接光照**: 支持 3D Gaussians 之间及与 Mesh 的多次弹跳

## 创新性
⭐⭐⭐⭐⭐

## 实用性
⭐⭐⭐⭐⭐

## 实现难度
**中**

- 已有 3DGS 基础
- 需要 BVH 加速结构
- 光栅化和光线追踪混合

## 推荐度
**✅ 推荐实现**

首个支持动态 3D Gaussian 场景实时全局光照的方法，结合多种实时渲染技术，具有很高的实用价值。

## 相关工作
- 3D Gaussian Splatting (Kerbl et al., 2023)
- Point Cloud Ray Tracing (Gao et al., 2025)
- Radiance Caching (Wright et al., 2022)

## 标签
#全局光照 #实时渲染 #3DGS #光追 #渲染管线