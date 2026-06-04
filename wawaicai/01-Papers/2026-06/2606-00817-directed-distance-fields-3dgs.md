---
tags: [几何, 3DGS, 光线查询, 距离场]
date: 2026-06-04
category: [Geometry Processing, Rendering]
arXiv: 2606.00817
authors: 
title: "Directed Distance Fields for Constant-Time Ray Queries on Gaussian Splatting"
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.00817
pdf: https://arxiv.org/pdf/2606.00817
---

## 核心方法

### 问题
- 3DGS 只回答 primary rays（从相机穿过图像的射线）
- 无法追踪 secondary rays（阴影、环境光遮蔽、全局光照）

### 解决方案
- 将训练好的 3DGS 场景转换为 ray oracle
- 通过蒸馏 Directed Distance Function (DDF) 实现

### DDF 定义
- 小型神经场
- 输入：ray（origin + direction）
- 输出：到第一个表面的距离，以及 ray 是否击中任何物体

## 技术细节

### 监督信号研究
1. **深度渲染（来自 Gaussians）**：太模糊，无法教导薄部分
2. **干净距离监督**：可以恢复薄部分

### 性能指标
- 模型大小：52 MB
- 与 SDF sphere tracing 相比快 26-72 倍
- 查询时间和内存不随场景增长

### 架构
- DDF: small neural field
- 常数时间查询 vs 场景大小无关

## 创新点
1. DDF 作为 3DGS 的 ray oracle
2. 深度 vs 干净距离监督的对比研究
3. RT-core 硬件兼容

## 复杂度分析
- 查询时间：O(1) constant
- 内存：O(1) constant
- 训练：需要 3DGS 场景

## 开源参考
- 原文未提供代码链接
- 3DGS 相关项目：Inria, NVIDA

## 可行性评估

**推荐度**: ✅ 推荐实现

**理由**:
- 解决 3DGS 几何查询关键问题
- 常数时间性能有实用价值
- 与现有渲染 Pipeline 集成

**适用场景**:
- 实时阴影计算
- 环境光遮蔽
- 全局光照近似
- 神经隐式表面加速查询

**与 2606.05124 关联**:
- 两篇论文都解决 3DGS 几何表示问题
- DDF 可作为 geometry decoupling 的补充工具