---
title: Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors
authors:
  - Jiatong Xia
date: 2026-03-19
updated: 2026-03-31
tags:
  - 3D生成
  - 点云先验
  - Diffusion
  - 结构补全
  - Neural Implicit
  - Geometry Processing
---

# Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors

## 核心方法

本文提出 **Points-to-3D**，一个基于扩散的框架，利用**点云先验**实现几何可控的 3D 资产生成和场景生成。

### 核心创新点
1. **点云先验嵌入**：首次将点云作为显式几何约束融入 3D 生成
2. **结构补全网络**：学习全局结构补全，保留可见区域
3. **分阶段采样策略**：
   - 结构补全 (Structural Inpainting)
   - 边界精化 (Boundary Refinement)
4. **灵活输入**：支持 LiDAR 点云或 VGGT 单图估计点云

### 技术pipeline
1. **初始化**：用点云先验替代纯噪声初始化 latent
2. **结构补全网络**：在 TRELLIS 框架上训练
3. **推理**：两阶段采样 — 全局几何完成 + 边界精化

## 算法复杂度
- **时间复杂度**：O(N log N) — 取决于点云密度
- **空间复杂度**：O(N) — 点云规模

## 开源实现
- **项目页面**：https://jiatongxia.github.io/points2-3D/
- **代码**：即将开源
- **基础框架**：TRELLIS latent 3D diffusion model

## 数据集与实验
- **物体场景**：优于 SOTA 基线
- **场景级生成**：验证几何保真度和渲染质量
- **会议**：CVPR 2026 接收

## 相关笔记
[[HGGT 手部网格重建]]
[[3DGS 点测量工具]]
[[TRELLIS 3D 生成模型]]

## 会议/期刊
- arXiv cs.CV
- CVPR 2026

## 可行性评估

✅ **推荐实现**

### 算法复杂度：中
- 依赖 latent diffusion model
- 两阶段推理 pipeline

### 数值稳定性：良
- 端到端训练
- 点云先验提供额外几何约束

### 依赖项
- TRELLIS 框架
- PyTorch
- latent 3D diffusion

### 应用场景
- 3D资产生成
- 自动驾驶感知
- 机器人抓取规划
- 场景重建
