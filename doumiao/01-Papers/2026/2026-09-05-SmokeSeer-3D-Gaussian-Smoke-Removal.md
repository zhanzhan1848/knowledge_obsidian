---
title: "SmokeSeer: 3D Gaussian Splatting for Smoke Removal and Scene Reconstruction"
authors:
  - Ioannis Gkioulekas
  - et al.
date: 2025-12-23 (v3)
arxiv: 2509.17329
subjects: cs.CV
tags:
  - smoke removal
  - 3D Gaussian Splatting
  - scene reconstruction
  - thermal imaging
  - volume rendering
  - multi-view
---

## 核心创新点

从**多视角RGB+热成像视频**中同时进行**3D场景重建**和**烟雾去除**。

### 核心方法

1. **双模态融合** — 利用热成像中烟雾散射减少的特性"看穿"烟雾
2. **3D Gaussian Splatting** — 融合热成像和RGB信息
3. **烟雾/非烟雾分解** — 分离烟雾和非烟雾成分
4. **时变烟雾处理** — 适应时间变化的烟雾密度

### 技术优势

- 处理大范围烟雾密度
- 适应时变烟雾
- 无需专业设备
- 开源代码和数据

### 项目主页

https://imaging.cs.cmu.edu/smokeseer

## 渲染技术分类

- **类型**: 体积渲染
- **方法**: 3D Gaussian Splatting + 烟雾分解
- **关键词**: 烟雾去除, 场景重建, 热成像

## 评估

- **逼真度**: ⭐⭐⭐⭐⭐
- **创新度**: ⭐⭐⭐⭐ (热成像+RGB融合)
- **实用性**: ⭐⭐⭐⭐⭐ (开源)

## 关键词

`smoke removal` `3D Gaussian Splatting` `thermal imaging` `scene reconstruction` `volume rendering`
