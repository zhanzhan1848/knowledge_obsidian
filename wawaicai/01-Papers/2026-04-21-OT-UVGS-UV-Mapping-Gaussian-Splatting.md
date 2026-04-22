---
title: Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem
tags: [几何, 参数化, UV展开, Gaussian-Splatting]
cite: arXiv:2604.19127
date: 2026-04-21
authors: [Byunghyun Kim]
venue: Eurographics 2026 Short Papers
---

# Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem

## 核心方法

将 UV mapping 重新定义为 **capacity allocation problem**，提出 **OT-UVGS** (Optimal Transport UVGS)。

### 问题背景
- UV-parameterized Gaussian Splatting (UVGS) 将3D高斯映射到规则UV张量
- 现有方法使用确定性球面投影，忽略全局高斯分布
- 导致UV槽空置、密集区域碰撞

### 核心创新
- 解释为固定UV预算下的容量分配问题
- 使用一维最优传输启发式映射
- O(N log N) 复杂度（ N 为高斯数量）

### 算法特点
- 全局耦合分配
- 保持原始UVGS表示
- 可作为球面UVGS的直接替代

## 实验结果

在 184 个 object-centric 场景和 Mip-NeRF 数据集上：
- PSNR 提升
- SSIM 提升
- LPIPS 提升
- UV利用率更高（非空槽比例更高、碰撞更少、高斯保留率更高）

## 复杂度分析
- 时间复杂度：O(N log N)
- 空间复杂度：O(N)

## 开源实现
- 待查找

## 相关笔记
[[UV展开]]
[[参数化]]
[[Gaussian-Splatting]]