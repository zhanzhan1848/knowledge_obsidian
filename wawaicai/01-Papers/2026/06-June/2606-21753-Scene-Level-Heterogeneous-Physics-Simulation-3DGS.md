---
title: "Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats"
arXiv: "2606.21753"
authors: ["Xiaoyang Liu", "et al."]
conference: "CVPR 2026 Findings"
date: 2026-06-19
tags: [3D高斯泼溅, 物理仿真, 异构模拟, 流体, 变形]
---

# Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

## 核心方法

### 研究问题
3DGS 资产无法参与物理交互：
- 生产级物理引擎不理解 3DGS 表示
- 先前方法仅展示物体中心物理（在理想平面上）

### 解决方案
**首个** 支持场景级、异构、多求解器物理模拟的框架

### 核心贡献：Representation Abstraction Framework

将所有资产转换为统一物理粒子集：
- 3DGS
- Virtual Meshes
- Fluids

### 技术架构

```
资产输入 → 表示抽象 → 统一粒子集 → 求解器无关物理内核 → 视觉重建
```

## 突破性能力

### 双向交互
1. 可变形 3DGS 资产 ↔ 标准 CG 资产（流体、网格）
2. 大规模捕获静态环境交互

### 复杂现象
- 耦合现象捕获
- 此前无法实现的真实效果

## 技术特点

### 求解器无关性
- 支持多种物理求解器
- 统一处理接口

### 物理一致性
- Material Point Method (MPM) 框架
- 物理一致动力学

## 应用场景
- 虚拟现实交互
- 游戏物理
- 机器人仿真

## 相关笔记
[[3DGS物理]]
[[变形模拟]]
[[流体-结构交互]]
