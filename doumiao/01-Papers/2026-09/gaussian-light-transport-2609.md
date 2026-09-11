---
title: "Gaussian Light Transport"
authors: Patrick Attimont et al.
date: 2026-09-10
tags: [global-illumination, volume-rendering, gaussian-splatting, real-time, SIGGRAPH-Asia-2026]
---

# Gaussian Light Transport

## 论文信息
- **arXiv**: [2609.11430](https://arxiv.org/abs/2609.11434)
- **会议**: SIGGRAPH Asia 2026 (Conference Track)
- **发表时间**: 2026-09-10
- **项目页**: https://patrick-attimont.com/projects/gaussian-light-transport/

## 核心创新

### 问题
- 传统光传输方法基于 **Neumann 级数**
- 内存需求大
- 渲染效率有限

### 方法: 13D 高斯混合模型

将光传输方程的解表示为 **13D 高斯混合模型**，涵盖：
- 位置 (position)
- 方向 (direction)
- 表面法线 (surface normal)
- 材质属性 (material properties)

### 关键优势

1. **减少函数数量**: 将场景属性纳入高斯表示，大幅减少函数数量
2. **直接优化**: 通过最小化渲染方程残差直接估计参数（而非迭代 Neumann 级数）
3. **高效剔除**: 引入高效剔除策略保持优化可处理性
4. **毫秒级渲染**: 实时渲染，视图独立的光传输解决方案
5. **低内存**: 内存需求仅为传统神经渲染方法的一小部分

## 技术细节

### 优化过程
- 优化和渲染都需要重复评估高维高斯函数的线性组合
- 剔除策略控制计算复杂度

### 渲染性能
- 渲染时间达到**毫秒级**
- 视图独立性 (view-independent)

## 应用场景

- 实时全局光照
- 体积光照效果
- 参与介质渲染

## 关键洞察

- 高斯混合模型不仅适用于场景表示，也适用于光传输计算
- 将场景属性（法线、材质）纳入表示可以显著加速
- 优化方法比传统蒙特卡洛积分更高效

## 相关工作链接
- [[Volume Rendering]]
- [[Global Illumination]]
- [[Gaussian Splatting]]

## 标签
#global-illumination #volume-rendering #gaussian-splatting #real-time #SIGGRAPH-Asia-2026
