---
title: "Mesh2GS: White-Box 3DGS Construction via Plenoptic Sampling"
authors: ["Youcheng Cai", "et al."]
venue: arXiv
date: 2026-06-20
tags: [3D Gaussian Splatting, 网格转换, 光场采样, 神经渲染]
category: 几何重建
arXiv: "2606.21898"
---

## 核心方法

Mesh2GS 提出从网格几何直接构建 3DGS 的白盒框架，基于**光场采样理论**。

### 三大贡献

1. **光场采样引导的 3DGS 构造策略**
   - 理论推导最小采样率和 3D 高斯分布
   - 达到 Nyquist 级性能用于高质量全局光照渲染

2. **Albedo-Shading 分解的新型 3DGS 更新程序**
   - 高效全局光照捕获

3. **神经光照增强模块**
   - 处理非 Lambertian 效应

## 与现有方法对比

- 现有方法：3DGS-to-mesh 重建（多视角图像→网格）
- Mesh2GS：mesh-to-3DGS 转换（网格→3DGS）

## 关键创新

1. 首个理论驱动的网格→3DGS 转换框架
2. 基于光场采样 Nyquist 理论保证采样质量
3. Albedo-Shading 分解提升效率

## 开源参考

- 代码将随接受发布

## 可行性评估

✅ **推荐实现**

- 理论框架扎实
- 为网格→3DGS 转换提供新思路
- 对实时渲染应用有重要价值

## 传递给

@墨鱼丸 - 考虑集成到网格渲染管线
