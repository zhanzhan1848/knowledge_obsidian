---
tags: [几何, 3D重建, 前馈重建, 综述, Feed-Forward]
date: 2026-04-20
authors: Weijie Wang, Qihang Cao, Sensen Gao, et al.
source: arXiv cs.GR
arxiv: 2604.14025
---

# Awesome Feed-Forward 3D: 前馈3D重建综述

## 核心方法

本文提出了一种以**模型设计策略**为中心的新型分类法，将前馈3D重建研究分为五个关键问题：

1. **特征增强** (Feature Enhancement) - 鲁棒的2D到3D提升
2. **几何感知** (Geometry Awareness) - 稀疏输入的几何先验
3. **模型效率** (Model Efficiency) - 降低计算和内存
4. **增强策略** (Augmentation Strategies) - 利用生成模型
5. **时序感知模型** (Temporal-aware Models) - 动态4D重建

## 输出表示

综述覆盖了多种3D表示：
- **NeRF** - 神经辐射场
- **3DGS** - 3D高斯溅射
- **Pointmap** - 点图
- **Mesh** - 网格
- **SDF** - 有符号距离场
- **Occupancy** - 占用字段

## 核心洞察

前馈方法的核心优势：
- 单次前向传播即可从图像重建3D
- 跨场景泛化能力强
- 推理速度快，支持实时应用

架构模式：
- 图像特征提取骨干网络
- 多视图信息融合机制
- 几何感知设计原则

## 应用领域

- 自动驾驶
- 机器人技术
- 场景理解
- SfM/SLAM
- 视频生成

## 未来方向

- 严格基准测试
- 系统效率优化
- 可扩展表示
- 世界模型
- 统一感知与重建

## 开源资源

- GitHub: https://github.com/ziplab/Awesome-Feed-Forward-3D
- Project: https://ff3d-survey.github.io

## 相关笔记

[[2026-04-20-Lyra-2.0-Explorable-3D-Worlds]]
[[2026-04-20-SATO-Arist-Mesh-Generation]]
