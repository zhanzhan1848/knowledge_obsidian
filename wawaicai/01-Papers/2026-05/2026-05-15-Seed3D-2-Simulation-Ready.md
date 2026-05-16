---
title: "Seed3D 2.0: High-Fidelity Simulation-Ready 3D Content Generation"
authors: ["Diandian Gu", "Zhongcong Xu" et al."]
date: 2026-04-22
arXiv: "2605.13862"
categories: ["3D生成", "几何处理", "PBR材质"]
tags: [3D-generation, simulation-ready, PBR, two-stage-pipeline]
source: arXiv cs.GR
---

## 系统架构：Seed3D 2.0

### 几何模块 (Coarse-to-Fine)
1. **全局结构学习** (global structure learning)
2. **高频细节恢复** (high-frequency detail recovery)
3. **Locality-aware VAE**：更高空间压缩、更高效解码

### 纹理和材质模块
- 统一的 **PBR 模型**：直接生成多视图 albedo + metallic-roughness maps
- **Mixture-of-Experts scaling**
- **VLM-based semantic conditioning**：改善材质精度和视觉保真度

### Simulation-Ready 模型套件
1. Scene layout planning
2. Part-aware decomposition  
3. Training-free articulation generation
4. Coherent scene construction + part-level physical interaction

## 性能评估

### 人类偏好研究
对比 5 个最新商业模型：
- **胜率：69.0% - 89.9%**（纹理 3D 资产生成）

## 创新点

1. **粗到细两阶段管线**：解耦全局结构和细节恢复
2. **统一 PBR 模型**：替代级联管线
3. **Simulation-ready**：物理交互能力

## 技术要点

- **Locality-aware VAE**：空间压缩优化
- **PBR (Physically Based Rendering)**：基于物理的材质和光照

## 开源

- 官方页面：https://seed.bytedance.com/seed3d_2_0
- 实验平台：exp.volcengine.com

## 相关笔记

[[3D-content-generation]]
[[PBR-materials]]
[[mesh-generation]]
[[simulation-ready]]