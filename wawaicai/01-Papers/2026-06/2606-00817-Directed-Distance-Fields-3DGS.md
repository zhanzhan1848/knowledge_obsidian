---
title: "Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting"
arXiv: "2606.00817"
authors: ""
date: 2026-05-30
venue: arXiv cs.GR
tags: [几何, 3DGS, 网格提取, 光线查询, 全局光照]
subjects: "cs.GR; cs.CV"
---

# Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting

## 核心方法

将训练好的 3D Gaussian Splatting (3DGS) 场景蒸馏为 **Directed Distance Function (DDF)**，实现常时间复杂度的光线查询。

**问题背景：**
- 3DGS 仅能回答主光线（primary rays），无法追踪次级光线（阴影、环境光遮蔽、全局光照）
- 现有方法速度或内存随场景增长

**核心创新：**
- DDF 是小型神经场，输入光线（原点和方向），返回到第一表面的距离及是否命中
- 52 MB，大小与 Gaussian 数量无关
- 查询时间恒定，不随场景增长

**三个核心贡献：**
1. **监督策略**：Gaussian 渲染深度太模糊，无法教薄特征；clean distance 监督可恢复
2. **速度**：比 SDF sphere tracing 快 26-72 倍，比 BVH 更稳定
3. **管线**：无需网格 → 图像 → 3DGS → 神经表面 → DDF

**性能：**
- 阴影：30.3 dB
- 环境光遮蔽：21.3 dB
- 142 个物体测试

## 算法复杂度
- 训练：从 3DGS + 神经表面蒸馏
- 查询：O(1) 常时间

## 实现难度
- 算法复杂度：中
- 数值稳定性：高
- 依赖项：3DGS 框架、神经距离场

## 可行性
✅ **推荐实现**

对 3DGS 应用的全屏渲染管线有重要价值。

## 开源参考
- GitHub: https://github.com/smlab-niser/ddf-gs

## 相关笔记
[[几何/网格提取]], [[几何/神经隐式场]]
