---
tags: [几何, 流体仿真, MPM, LBM, 颗粒动力学, GPU]
arxiv: 2603.14982
date: 2026-03-17
---

# Adaptive GPU Kinetic Solver for Fluid-Granular Flows

## 基本信息
- **标题**: Adaptive GPU Kinetic Solver for Fluid-Granular Flows
- **作者**: Xingqiao Li, Kui Wu, Haozhe Su, Tianhong Gao, Mengyu Chu, Chenfanfu Jiang, Wei Li, Baoquan Chen
- **arXiv ID**: [2603.14982](https://arxiv.org/abs/2603.14982)
- **发布日期**: 2026-03-16
- **分类**: cs.GR

## 摘要
提出了一个统一框架用于大规模流体-颗粒仿真，耦合 Lattice Boltzmann Method (LBM) 用于流体和 Material Point Method (MPM) 用于颗粒材料（沙、雪）。

## 核心方法

### 1. 自适应 HOME-LBM 求解器
- 基于块的块多级结构
- 基于固体几何结构
- 多个格子分辨率的高效内存和计算性能

### 2. 矩重缩放定律
- 精确传输宏观量跨细化界面
- 一致的物理守恒

### 3. GPU 动态维护
- 动态维护多级块
- 响应粒子运动
- GPU 加速算法

### 4. 流体-颗粒耦合
- 所有 MPM 粒子位于最细流体节点内
- 精确的双向耦合
- 流体和颗粒相的准确交互

## 创新点
1. 统一的 LBM-MPM 框架
2. 自适应多级求解器
3. GPU 动态网格维护
4. 精确的双向耦合机制

## 应用场景
- 雪崩仿真
- 沙尘暴
- 沙迁移
- 工业颗粒处理
- 自然灾害模拟

## 性能特点
- 高物理保真度
- 高计算效率
- 大规模仿真支持
- 实时性能潜力

## 技术复杂度
- **算法复杂度**: 高
- **实现难度**: 高
- **数值稳定性**: 良好
- **GPU 优化**: 必需

## 几何相关性
- **MPM 粒子**: 颗粒几何表示
- **自适应网格**: 几何细化结构
- **耦合界面**: 几何边界处理

## 开源参考
- arXiv: [https://arxiv.org/abs/2603.14982](https://arxiv.org/abs/2603.14982)
- PDF: [https://arxiv.org/pdf/2603.14982](https://arxiv.org/pdf/2603.14982)

## 相关技术
- [[LBM 格子玻尔兹曼方法]]
- [[MPM 物质点法]]
- [[流体仿真]]
- [[颗粒动力学]]
- [[GPU 并行计算]]

## 可行性评估
⚠️ **谨慎评估**
- 主要用于流体仿真
- 几何处理相关性中等
- 实现复杂度高
- 适用于特定应用场景
- MPM 部分对几何处理有参考价值
