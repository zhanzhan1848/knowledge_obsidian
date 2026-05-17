---
title: "Hierarchical Transformer Preconditioner for Interactive Physics Simulation"
authors: (from arXiv:2605.13343)
date: 2026-05-11
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.13343
pdf: https://arxiv.org/pdf/2605.13343
tags: [physics, simulation, neural-preconditioner, transformer, GPU, 2026]
status: unread
---

# Hierarchical Transformer Preconditioner for Interactive Physics Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Hierarchical Transformer Preconditioner for Interactive Physics Simulation |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.13343) |
| PDF | [下载](https://arxiv.com/pdf/2605.13343) |

## 核心贡献
1. 提出**层次Transformer预条件器**，基于弱容许H矩阵划分
2. O(N)缩放近似逆计算（固定块大小）
3. **cosine-Hutchinson probe目标**：学习MA在收敛关键谱子空间上的作用

## 技术方案

### H-matrix结构先验
- 多尺度结构先验：密集对角叶子 + 粗化非对角块
- 低秩远场因子 + highway连接

### 关键创新
- cosine-Hutchinson probe目标：优化MAz与z的角对齐，而非强制特征值到指定位置
- 移除SAI风格目标的不必要谱放置约束
- 改善不规则谱的条件数

### 性能
- 僵硬多相泊松系统（100:1密度对比，N=1024-16384）
- 帧率：~143 到 ~21 fps
- N=8192时：17.9 ms/帧
- 比GPU Jacobi快2.2倍，比GPU IC/DILU快~28倍

## 可行性分析
- 实现难度：**高**
- 性能预期：交互帧率物理仿真
- 适用场景：游戏物理、实时仿真、可微物理

## 标签
#物理仿真 #预条件器 #Transformer #GPU加速 #实时