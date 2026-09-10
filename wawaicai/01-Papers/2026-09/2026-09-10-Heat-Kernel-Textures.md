---
tags: [几何, 纹理映射, heat-kernel, 3DGS, parametrization, ECCV]
date: 2026-09-10
domain: geometry
conference: ECCV 2026 (Long Oral)
authors: [Simone Foti, Caner Korkmaz, Stefanos Zafeiriou, Tolga Birdal]
---

# Heat Kernel Textures: the Geodesic Gaussians That Do Not Splat

## 核心方法

**HKTex** — 消除 UV 展开的全新纹理表示，在三角网格上固有定义，使用各向异性热核（anisotropic heat kernels）作为测地线高斯替代。

**解决的问题:**
- UV mapping 固有问题：浪费 UV 空间、接缝、畸变、顶点复制、分辨率不均
- 3D Gaussian Splatting 的 splat 操作在表面无法自然定义

**方法要点:**
1. 三角网格上的离散黎曼几何
2. 各向异性热核 = 测地线高斯等效
3. 核位置优化 + 自适应加密策略均重新定义在表面上
4. 支持 PBR 渲染器，可从已有纹理或多视角图像优化

## 关键创新点

- 完全消除 UV 展开
- 内存占用显著低于传统 UV 纹理
- 表面固有定义，无需参数化

## 开源参考

- ECCV 2026 Long Oral
- Project: circle-group.github.io/research/HeatKernelTextures
- Code 即将公开

## 推荐度

✅ **推荐** — 纹理映射范式转变型工作，学术价值高，工程可行性待验证。

## 链接

- arXiv: https://arxiv.org/abs/2609.07557
- 2026-09-07 提交
