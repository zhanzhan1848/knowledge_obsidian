---
tags: [渲染, 3DGS, 镜面反射, 光线追踪替代, 曲面重建, 2026]
date: [[2026-04-02]]
status: 待读
---

# Ref-DGS: Reflective Dual Gaussian Splatting

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Ningjing Fan et al. |
| 发表 | arXiv:2603.07664 [cs.CV/cs.GR] |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.07664) |
| 项目页 | [Ref-DGS](https://straybirdflower.github.io/Ref-DGS/) |

## 核心贡献
1. 提出**双 Gaussian 场景表示**：几何 Gaussians + 局部反射 Gaussians，捕获近场镜面反射，**无需显式光线追踪**
2. 全局环境反射场（global environment reflection field）建模远场镜面反射
3. 提出**轻量级物理感知自适应混合着色器**（physically-aware adaptive mixing shader）
4. 训练速度显著快于 ray-based Gaussian 方法

## 技术方案

### 问题
强镜面反射（尤其近场）是精确曲面重建和新视角合成的根本挑战。现有 Gaussian 方法无法建模近场镜面反射，而 ray tracing 虽可建模但计算代价极高。

### 双 Gaussian 表示
- **几何 Gaussians**：用于曲面重建
- **局部反射 Gaussians**：捕获近场镜面交互（无需 ray tracing）
- **全局环境反射场**：捕获远场镜面反射

### 自适应混合着色器
融合全局和局部反射特征，预测镜面辐射，无需显式光线追踪。

## 实验结论
- 反射场景上达到 SOTA
- 训练速度远快于 ray-based 方法

## 标签
#镜面反射 #3DGS #光线追踪替代 #曲面重建
