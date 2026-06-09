---
tags: [渲染, 光线追踪, 3D-Gaussian, 可微渲染, 2026-03]
date: 2026-06-09
status: 已读
---

# Stochastic Ray Tracing for the Reconstruction of 3D Gaussian Splatting

## 基本信息
| 标题 | Stochastic Ray Tracing for the Reconstruction of 3D Gaussian Splatting |
|------|------|
| 作者 | Peiyu Xu 等 |
| 发表 | arXiv (cs.CV) |
| 年份 | 2026 (v2: March 26, 2026) |
| 链接 | [arXiv:2603.23637](https://arxiv.org/abs/2603.23637) |
| 项目 | [xupaya.github.io/stoch3DGS/](https://xupaya.github.io/stoch3DGS/) |

## 核心贡献

1. **无排序随机公式**：首个使用随机光线追踪重建和渲染标准及可重光照 3DGS 场景的框架

2. **无偏蒙特卡洛估计器**：对小部分 Gaussians 进行采样评估，绕过排序需求

3. **完全光线追踪阴影**：为可重光照 3DGS 提供完全光线追踪的阴影光线

## 技术方案

### 问题
- 现有基于光线追踪的 3DGS 方法因需要对每条光线排序所有相交的 Gaussians 而速度慢
- 现有方法仍依赖光栅化风格的近似（如阴影映射）进行可重光照场景

### 核心方法
- **随机采样**：每条光线仅采样少量 Gaussians 子集
- **无偏梯度估计**：用于 3DGS 重建的蒙特卡洛估计器
- **统一框架**：同时处理标准 3DGS 和可重光照 3DGS

## 性能

### 标准 3DGS
- 匹配光栅化 3DGS 的重建质量和速度
- 大幅超越基于排序的光线追踪

### 可重光照 3DGS
- 全光线追踪阴影
- 比之前工作更高的重建保真度

## 创新性
⭐⭐⭐⭐⭐

## 实用性
⭐⭐⭐⭐⭐

## 实现难度
**中**

- 需实现随机采样而非确定性排序
- 蒙特卡洛估计器实现
- 与现有 3DGS 训练框架集成

## 推荐度
**✅ 推荐实现**

解决 3DGS 光线追踪的性能瓶颈，首次实现统一的可重光照框架。

## 标签
#3DGS #光线追踪 #可微渲染 #随机采样 #渲染