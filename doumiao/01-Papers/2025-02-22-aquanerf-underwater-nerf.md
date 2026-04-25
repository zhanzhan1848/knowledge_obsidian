---
title: "AquaNeRF: Neural Radiance Fields in Underwater Media with Distractor Removal"
date: 2025-02-22
tags: [fluid-rendering, underwater-rendering, nerF, volume-rendering]
authors: [Nantheera Anantrasirichai, et al.]
paper_id: 2502.16351
subject: cs.CV
venue: ISCAS 2025
status: reviewed
---

## 核心创新点

### 问题定义
水下场景的NeRF渲染，解决水下视觉伪影

### 技术挑战
1. **漂浮物 (Floaters)** - 悬浮颗粒干扰
2. **移动物体** - 游动的鱼等

### 核心方法
1. **单表面估计** - 每条光线估计单一表面，减少漂浮物影响
2. **高斯权重函数** - 小偏移量确保周围介质透射率恒定
3. **深度缩放函数** - 提升近相机体积的梯度

### 性能指标
- PSNR: Nerfacto +7.5%, SeaThru-NeRF +6.2%
- 减少伪影同时保留静态目标和背景细节

## 渲染技术
- **类型**: 体积渲染 / Neural Radiance Fields
- **方法**: MLP-based NeRF + 水下介质建模
- **逼真度**: ⭐⭐⭐⭐

## 适用场景
- 海洋生物研究
- 水下场景重建
- 水下摄影可视化

## 资源链接
- 论文: https://arxiv.org/abs/2502.16351
- DOI: https://doi.org/10.1109/ISCAS56072.2025.11043480

## 技术亮点
- 首个针对水下场景优化的NeRF
- 有效移除漂浮物和移动物体干扰
- 保留水下光学现象

---
*由豆苗自动收集于 2026-04-25*
