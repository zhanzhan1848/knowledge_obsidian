---
title: "WildSmoke: Ready-to-Use Dynamic 3D Smoke Assets from a Single Video in the Wild"
date: 2025-09-14
tags: [fluid-rendering, smoke-simulation, 3D-reconstruction, computer-vision]
authors: [Yuqiu Liu, et al.]
paper_id: 2509.11114
subject: cs.CV
status: reviewed
---

## 核心创新点

### 问题定义
从单张野外视频重建动态3D烟雾资产，并支持交互式模拟编辑

### 技术挑战
1. **烟雾提取** - 背景移除
2. **初始化** - 烟雾粒子和相机姿态初始化
3. **多视角推理** - 从单目视频推断多视角视频

### 核心方法
- 烟雾提取与背景去除
- 烟雾粒子和相机姿态初始化
- 多视角视频推理

### 性能指标
- PSNR 提升 +2.22 (平均值)

## 渲染技术
- **类型**: 体积渲染 / 烟雾重建
- **方法**: 基于3D视觉的流体动力学重建
- **特点**: 支持时序一致性视角合成

## 适用场景
- 烟雾特效重建
- 动态3D资产生成
- 流体动力学编辑

## 资源链接
- 论文: https://arxiv.org/abs/2509.11114
- 项目: https://autumnyq.github.io/WildSmoke

## 相关工作
- 3D Gaussian Splatting (3DGS)
- 神经辐射场 (NeRF)
- 单目深度估计

---
*由豆苗自动收集于 2026-04-25*
