---
title: Real-time Global Illumination for Dynamic 3D Gaussian Scenes
authors: Sheng Li et al.
date: 2026-04-29 (v2)
source: arXiv cs.GR / IEEE TVCG
url: https://arxiv.org/abs/2503.17897
pdf: https://arxiv.org/pdf/2503.17897
tags: [rendering, global-illumination, 3DGS, real-time-rendering, ray-tracing, paper, 2026]
status: unread
---

# Real-time Global Illumination for Dynamic 3D Gaussian Scenes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-time Global Illumination for Dynamic 3D Gaussian Scenes |
| 作者 | Sheng Li et al. |
| 来源 | arXiv cs.GR / IEEE TVCG (accepted) |
| 年份 | 2026 (v2) |
| 链接 | [原文](https://arxiv.org/abs/2503.17897) |
| PDF | [下载](https://arxiv.org/pdf/2503.17897) |

## 核心贡献
1. **表面光传输方程 LTE**：为 3D Gaussians 提出基于表面的 LTE 公式，作为实时 GI 的基础
2. **复合随机光线追踪 + 优化光栅化**：解决 3D Gaussians 实时 GI 中的关键性能瓶颈
3. **完整实时动态 GI 管线**：支持动态场景、 glossy 材质、多光源复杂光照，40+ fps

## 技术方案

### 3.1 3D Gaussians 上的光传输模型
排除透射材质，经典表面 LTE：
```math
L_o(p, w_o) = L_e(p, w_o) + \int_S f(p, w_i, w_o) L_o(q, -w_i) V(p,q) G(p,q) \cos\theta \, dq
```
其中 $G(p,q) = \frac{-\mathbf{n_q} \cdot w_i}{|p-q|^2}$

在 3D Gaussian 光栅化中，透射率随 splatting 配置变化。将二元 visibility 替换为：
```math
T(p,q) \cdot A_{\mathbf{v}}(r)
```
推导得到球面积分形式：
```math
L_o(p, w_o) = L_e(p, w_o) + \int_{H^2} f(p, w_i, w_o) L_i(p, w_i) \cos\theta \, dw_i
```

### 3.2 管线架构
```
G-buffer 生成（光栅化 3DGS + meshes）
    ↓
直接漫反射光照（light grid sampling + shadow ray tracing）
    ↓
间接漫反射光照（two-level radiance cache: hash grid + screen probes）
    ↓
光泽反射（shading ray tracing）
```

### 关键优化技术
- **Light Grid**：动态构建光源网格进行采样
- **Two-level Radiance Cache**：screen light probes + hash grid
- **Reflection Lobe Tracing**：追踪 glossy 反射
- **降噪滤波**：时空滤波

### 简化假设
- 初级顶点：GGX + Lambertian 混合模型
- 其余顶点：纯 Lambertian
- 光路裁剪：超过 2 次弹跳且无法递归累积的光路被丢弃

## 实验结论
- 1920×1088 分辨率下 40+ fps
- 支持 1.5M+ 3D Gaussian  primitives
- 多弹跳间接光照（3D Gaussians 之间、Gaussians 与 mesh 之间）
- 动态材质编辑和动态多光源

## 局限性
- 光路限制为 2 次弹跳以内
- 需要 point cloud ray tracing 基础设施

## 可行性分析
- **实现难度**：高
  - 需要 point cloud ray tracing 支持
  - 需要实现 two-level radiance cache
  - 光源采样和降噪需精细调优
- **性能预期**：40+ fps 复杂场景，在高端 GPU 上可达
- **适用场景**：游戏、VR、实时渲染应用

## 相关工作
- [[3D Gaussian Splatting 2023]]
- [[Point Cloud Ray Tracing for 3DGS]]
- [[Radiance Caching techniques]]
- [[ReSTIR real-time path tracing]]

## 笔记
首个探索动态 3D Gaussian 场景实时全局光照的工作。被 IEEE TVCG 接收。
代码/项目主页可能即将发布。
