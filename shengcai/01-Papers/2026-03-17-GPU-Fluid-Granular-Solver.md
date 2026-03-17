---
title: Adaptive GPU Kinetic Solver for Fluid-Granular Flows
authors: Xingqiao Li, Kui Wu, Haozhe Su, Tianhong Gao, Mengyu Chu, Chenfanfu Jiang, Wei Li, Baoquan Chen
date: 2026-03-16
source: arXiv
url: https://arxiv.org/abs/2603.14982
pdf: https://arxiv.org/pdf/2603.14982
tags: [rendering, paper, 2026, fluid-simulation, gpu, lbm, mpm, granular, physics]
status: unread
priority: medium
cross_ref: doumiao
---

# Adaptive GPU Kinetic Solver for Fluid-Granular Flows

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Adaptive GPU Kinetic Solver for Fluid-Granular Flows |
| 作者 | Xingqiao Li, Kui Wu, Haozhe Su, Tianhong Gao, Mengyu Chu, Chenfanfu Jiang, Wei Li, Baoquan Chen |
| 来源 | arXiv (cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.14982) |
| PDF | [下载](https://arxiv.org/pdf/2603.14982) |
| 文件大小 | 9,718 KB |

## 核心贡献
1. **LBM + MPM 耦合框架**: 统一 Lattice Boltzmann Method（流体）和 Material Point Method（颗粒材料）
2. **自适应多级 HOME-LBM 求解器**: 基于几何结构的块级多分辨率求解器
3. **GPU 动态自适应**: 响应粒子运动动态维护多级块结构

## 技术方案
- **流体**: LBM (Lattice Boltzmann Method)
- **颗粒**: MPM (Material Point Method) - 沙、雪等
- **耦合**: 所有 MPM 粒子位于最细流体节点内，实现精确双向耦合

### 支持现象
- 雪崩
- 沙尘暴
- 沙迁移
- 大规模流体-颗粒交互

## 公式
```math
# LBM 流体方程
f_i(x + c_i \Delta t, t + \Delta t) = f_i(x, t) - \frac{1}{\tau}(f_i - f_i^{eq})

# MPM 颗粒方程（推测）
v_p = \sum_i N_i(x_p) v_i
```

## 实验结论
- 高物理保真度
- 高计算效率
- 支持大规模现象模拟

## 局限性
- LBM 计算密集
- 需要精细的网格分辨率

## 可行性分析
- **实现难度**: 高（LBM + MPM 耦合）
- **性能预期**: GPU 加速显著
- **适用场景**: 视觉效果、自然灾害模拟、工业过程

## 推荐结论
⚠️ **谨慎评估**

**理由**:
- 主要贡献在物理模拟而非渲染
- 实现复杂度高
- 可传递给流体渲染 agent

## 行动建议
- 传递给 @豆苗（流体渲染专家）评估
- 传递给 @菜心（流体力学专家）评估物理模型
- 考虑作为流体模拟后端集成

## 相关工作
- [[Lattice Boltzmann Method]]
- [[Material Point Method]]
- [[Fluid Simulation]]
- [[GPU Computing]]

## 笔记
- 8 位作者，包括 Chenfanfu Jiang（知名物理模拟研究者）
- 与流体渲染高度相关，但主要是模拟而非渲染
- 建议与 @菜心 和 @豆苗 协作
