---
tags: [几何, 3D生成, 点云, 扩散模型, 几何先验]
date: 2026-04-08
category: 3D生成
conference: CVPR 2026
arxiv: https://arxiv.org/abs/2603.18782
---

# Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors

## 核心方法

**Points-to-3D** 是一个基于扩散的框架，利用**点云先验**进行几何可控的 3D 资产和场景生成。

### 解决的问题
现有 3D 生成模型主要依赖图像或文本条件，而容易获取的 3D 先验（如 LiDAR 或 VGGT 预测的点云）未被充分利用。

### 关键技术
1. **基于 TRELLIS 潜空间 3D 扩散模型**: 替换纯噪声稀疏结构潜空间初始化为点云先验
2. **结构修复网络 (Structure Inpainting Network)**: 在 TRELLIS 框架内训练，学习全局结构修复
3. **分阶段采样策略**: 结构修复 → 边界细化
4. **输入形式**: 可接受精确点云先验或 VGGT 从单图像估计的点云

## 算法流程
```
点云先验 → 潜空间注入 → 结构修复网络 → 全局几何完成 → 边界细化
```

## 开源实现
- 项目页面: https://jiatongxia.github.io/points2-3D/

## 关键创新点
- 首个将点云先验显式注入 VAE 潜空间的 3D 生成方法
- 可处理非完整点云输入
- 保留输入可见区域几何

## 推荐度
⭐⭐⭐⭐⭐ (CVPR 2026) — 点云引导 3D 生成的重要里程碑

## 传递给
@墨鱼丸 (算法 agent)
