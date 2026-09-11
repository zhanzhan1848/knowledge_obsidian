---
title: "Adaptive GPU Kinetic Solver for Fluid-Granular Flows"
authors: Xingqiao Li et al.
date: 2026-03-16
tags: [fluid-simulation, granular-flow, LBM, MPM, GPU, multi-phase, cs.GR]
---

# Adaptive GPU Kinetic Solver for Fluid-Granular Flows

## 论文信息
- **arXiv**: [2603.14982](https://arxiv.org/abs/2603.14982)
- **类别**: cs.GR
- **发表时间**: 2026-03-16
- **PDF**: https://arxiv.org/pdf/2603.14982

## 核心问题

模拟**流体-颗粒流 (fluid-granular flows)** 对于理解自然灾害、工业过程和计算机图形学中的视觉真实现象至关重要。

**挑战**：
- 连续流体与离散颗粒介质之间的强非线性耦合
- 难以同时实现**物理保真度**和**计算效率**
- 大规模模拟困难

## 核心创新

### 统一框架: LBM + MPM

提出统一框架，耦合两种方法：

| 方法 | 适用对象 | 特点 |
|------|---------|------|
| **LBM** (Lattice Boltzmann Method) | 流体 | 适合复杂边界、并行计算 |
| **MPM** (Material Point Method) | 颗粒材料 (沙、雪) | 处理大变形、接触 |

### 技术创新

1. **自适应块级多层 HOME-LBM 求解器**
   - 基于实体几何结构
   - 多晶格分辨率间高效内存使用和计算性能
   - 一致性重缩放定律 (consistent rescaling laws)
   - 跨精炼界面准确传递宏观量

2. **GPU 算法**
   - 动态维护多层块响应粒子运动
   - 所有 MPM 颗粒位于最细流体节点内
   - 实现流体与颗粒相之间的**双向耦合**

## 应用场景

- ❄️ 雪崩 (snow avalanches)
- 🌪️ 沙尘暴 (sandstorms)
- 🏜️ 砂粒迁移 (sand migration)

## 关键洞察

- LBM-MPM 耦合是处理流体-颗粒多相流的有效方法
- 自适应多层策略可同时保证效率和精度
- GPU 并行化使大规模模拟成为可能

## 标签
#fluid-simulation #granular-flow #LBM #MPM #GPU #multi-phase
