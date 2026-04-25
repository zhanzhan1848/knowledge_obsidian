---
title: "3D Dynamic Fluid Assets from Single-View Videos with Generative Gaussian Splatting"
date: 2025-03-02
tags: [fluid-rendering, water-rendering, 3DGS, gaussian-splatting, fluid-simulation]
authors: [Zhiwei Zhao, et al.]
paper_id: 2503.00868
subject: cs.GR
status: reviewed
---

## 核心创新点

### 问题定义
从单目视频中提取并重新模拟3D动态流体对象

### 核心技术
1. **3D Gaussian Splatting (3DGS)** - 生成和优化流体几何
2. **去噪与密集化** - 优化3DGS表示
3. **流速估计** - 使用光流估计流体表面速度
4. **3D体积速度场** - 从流体表面速度推导
5. **可微模拟** - 跨帧优化模拟参数

### 方法流程
1. 从单目图像生成3DGS流体几何
2. 去噪、密集化并对齐跨帧
3. 用光流估计表面速度
4. 推导3D体积速度场
5. 转换为无散度、基于网格的表示
6. 通过可微性优化模拟参数

### 性能指标
- 支持无粘性和粘性液体
- 可编辑输出几何
- 可扩展运动持续时间

## 渲染技术
- **类型**: 表面渲染 / 粒子渲染
- **方法**: 3D Gaussian Splatting + 光流
- **特点**: 物理动力学与视频匹配

## 适用场景
- 3D动态流体资产生成
- 低成本大规模流体资产创建
- 单目视频流体重建

## 资源链接
- 论文: https://arxiv.org/abs/2503.00868
- ACM Classes: I.2.0, I.3.7

## 技术亮点
- 首次实现从单目视频生成simulation-ready流体资产
- 可编辑几何和扩展运动
- 支持多种液体类型

---
*由豆苗自动收集于 2026-04-25*
