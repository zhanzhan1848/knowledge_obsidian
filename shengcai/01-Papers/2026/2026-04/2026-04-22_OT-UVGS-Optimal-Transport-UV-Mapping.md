---
title: Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem
authors: Byunghyun Kim, et al.
date: 2026-04-21
source: arXiv / Eurographics 2026 Short Paper
url: https://arxiv.org/abs/2604.19127
pdf: https://arxiv.org/pdf/2604.19127
tags: [rendering, gaussian splatting, UV mapping, optimal transport, Eurographics, 2026]
status: unread
---

# Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem |
| 作者 | Byunghyun Kim, et al. |
| 来源 | Eurographics 2026 Short Paper |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.19127) |
| PDF | [下载](https://arxiv.org/pdf/2604.19127) |

## 核心贡献
1. **OT-UVGS**: 最优传输启发的UV映射方法
2. **Capacity Allocation视角**: 将UV映射重新定义为容量分配问题
3. **O(N log N)复杂度**: 高效可扩展
4. **Drop-in Replacement**: 可直接替代现有UVGS

## 技术方案

### 问题分析
现有UVGS的问题：
- 确定性球面投影忽略全局高斯分布
- 很多UV槽为空
- 密集区域碰撞频繁

### OT-UVGS解决方案
```
UV映射 → 容量分配问题 → 最优传输启发算法
       → 全局耦合分配
       → 保留原始UVGS表示
```

### 算法
- **Rank-based Sorting**: 基于排名的排序
- **O(N log N)复杂度**: N为高斯数量
- **可分离1D映射**: 轻量级实现

## 实验结论

### 数据集
- 184个物体中心场景
- Mip-NeRF数据集

### 改进指标
- PSNR (峰值信噪比): 一致提升
- SSIM (结构相似性): 一致提升
- LPIPS (感知相似性): 一致提升

### UV利用率
- 非空槽比例提高
- 碰撞减少
- 高斯保留率提高

## 可行性分析
- 实现难度：中 (算法相对简单)
- 性能预期：O(N log N)高效
- 适用场景：3D重建、神经渲染、VR/AR

## 相关工作
- UV-parameterized Gaussian Splatting (UVGS)
- Optimal transport for graphics

## 笔记

**Eurographics 2026 Short Paper**

**意义**: 通过重新审视映射方法，释放UVGS潜在容量
