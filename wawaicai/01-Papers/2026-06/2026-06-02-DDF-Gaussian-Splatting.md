---
title: "Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting"
authors: ["Subhankar Mishra et al."]
date: 2026-05-30
tags: [几何, 3DGS, 光线查询, 神经隐式场]
venue: arXiv cs.GR
---

# Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting

## 核心方法

将训练好的 3D Gaussian Splatting (3DGS) 场景转换为**光线预言机(ray oracle)**，通过蒸馏一个**有向距离场(Directed Distance Function, DDF)**。

DDF 是一个小型神经场，以光线（原点和方向）为输入，返回到第一个表面的距离以及光线是否击中任何东西。每次查询只需一次前向传播，大小为 52MB，**不随高斯数量增长**。

## 三个主要贡献

1. **监督信号研究** - 高斯渲染的深度太模糊无法教导薄部件，而干净的 distance supervision 可以恢复
2. **速度测量** - DDF 比球追踪等效 SDF 快 26-72 倍，查询时间和内存不随场景增长
3. **完整流程** - 无需网格：图像 → 3DGS → 神经表面 → DDF

## 应用

用于全局照明的次级光线预言机，重建参考光线追踪阴影（30.3 dB）和环境光遮蔽（21.3 dB）

## 开源实现

- GitHub: https://github.com/smlab-niser/ddf-gs

## 可行性评估

✅ **推荐关注** - 对 3DGS 场景的快速光线查询有实用价值
