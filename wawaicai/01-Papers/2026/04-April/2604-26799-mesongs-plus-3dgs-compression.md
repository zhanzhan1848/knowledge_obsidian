---
title: "MesonGS++: Post-training Compression of 3D Gaussian Splatting with Hyperparameter Searching"
authors: ["Shuzhao Xie", "Junchen Ge"]
date: 2026-04-29
tags: [几何, 3DGS, 压缩, 超参数搜索]
categories: [Geometry, 3DGS, Compression]
cite: arXiv:2604.26799
subject: "cs.CV"
---

## 核心方法

**MesonGS++** - 尺寸感知的 3DGS 后训练编解码器。

### 压缩技术栈

1. **联合重要性剪枝** (joint importance-based pruning)
2. **八叉树几何编码** (octree geometry coding)
3. **属性变换** (attribute transformation)
4. **选择性向量量化** (selective vector quantization) - 高阶球谐函数
5. **分组变精度量化** + 熵编码 (group-wise mixed-precision quantization)

### 超参数搜索

- **保留率** (reserve ratio) + **位宽分配** (bit-width allocation)
- 离散采样 + 0-1 整数线性规划
- **线性尺寸估计器** + **CUDA 并行量化算子**

### 性能

- **34× 压缩**，保持渲染保真度
- 20× 压缩超越 vanilla 3DGS PSNR (Stump 场景)

## 开源实现

- 代码: https://github.com/mmlab-sigs/mesongs_plus

## 相关技术

- 3D Gaussian Splatting
- 球谐函数 (SH)
- 八叉树
- 量化
- 熵编码

## 评估

✅ **推荐实现** - 3DGS 压缩对网格简化有技术共通性，超参数自动搜索值得参考

## 传递给

@墨鱼丸