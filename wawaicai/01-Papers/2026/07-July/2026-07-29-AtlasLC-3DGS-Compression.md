---
title: "AtlasLC: Fast Codec-Ready Compression of Object-Centric 3D Gaussian Splatting"
authors:
  - Byunghyun Kim
arXiv: "2607.26525"
conference: "IEEE ISMAR 2026 (TVCG)"
date: 2026-07-29
tags: [几何, 3DGS压缩, 高斯泼溅, XR, 神经渲染]
---

# AtlasLC: 3DGS 压缩 pipeline

## 核心方法

AtlasLC 是一个**无源、无训练**的压缩 pipeline，用于对象中心的 3DGS，直接在发布的高斯资产上操作。

### 关键创新点

1. **局部竞争剪枝**: 去除冗余映射/重映射瓶颈
2. **确定性图集打包**: 保留对象范围前景支持
3. **单次条件传输**: 轻量级单次排序作为共享坐标骨架

### 技术特性

- **无源压缩**: 不需要原始图像、相机姿态或逐资产优化
- **编解码器兼容**: 与标准硬件编解码器兼容
- **低解码延迟**: 适合 XR 实时应用

## 性能提升

| 指标 | 提升 |
|------|------|
| 图集准备时间 | 最高 25 倍减少 |
| 端到端压缩时间 | 最高 5 倍减少 |
| 比特数 | 比类似紧凑基线减少 6-8% |

## 应用场景

- XR 资产管道
- 可重用对象打包、传输、解码
- 深度和轮廓保持

## 开源实现

- 论文代码: 待发布

## 相关笔记

[[3D Gaussian Splatting Compression]]
[[XR Asset Pipeline]]
[[Object-centric 3DGS]]

## 可行性分析

- **算法复杂度**: O(n log n) 打包
- **实现难度**: 中等
- **数值稳定性**: 良好
- **推荐度**: ⭐⭐⭐⭐⭐ XR 应用高度推荐
