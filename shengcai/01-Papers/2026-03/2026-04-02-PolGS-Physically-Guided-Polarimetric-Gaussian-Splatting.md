---
tags: [渲染, 3DGS, 偏振, PBR, 镜面反射, 曲面重建, 2026]
date: [[2026-04-02]]
status: 待读
---

# PolGS++: Physically-Guided Polarimetric Gaussian Splatting for Fast Reflective Surface Reconstruction

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Yufei Han et al. |
| 发表 | arXiv:2603.10801 [cs.CV] |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.10801) |

## 核心贡献
1. 将**偏振 BRDF (pBRDF)** 模型整合到 3DGS，显式解耦漫反射和镜面分量
2. 提出**深度引导可见性掩码获取机制**，无需代价高昂的光线追踪交点即可实现基于 AoP（入射角偏振）的切空间一致性约束
3. 训练仅需约 **10 分钟**，兼顾质量和效率

## 技术方案

### pBRDF 模型
整合偏振 BRDF 到 Gaussian Splatting，提供物理基础的反射建模和更强的几何线索。

### 深度引导可见性掩码
无需 ray-tracing intersections，通过深度信息引导获取可见性掩码，实现 AoP-based tangent-space consistency constraints。

### 物理引导设计
解耦漫反射和镜面反射，提升重建质量和效率。

## 实验结论
- 合成和真实数据集验证有效性
- 训练时间约 10 分钟
- 镜面曲面重建质量优于原始 3DGS

## 局限性
- 金属表面 pBRDF 含复值索引和相位项，可能导致重建不准确

## 标签
#偏振 #3DGS #PBR #镜面反射 #曲面重建
