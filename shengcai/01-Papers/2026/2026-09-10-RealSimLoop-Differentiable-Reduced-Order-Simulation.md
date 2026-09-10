---
title: RealSimLoop: Online Real-to-Sim Adaptation via Differentiable Reduced-Order Simulation with Vision Feedback
authors: Zhihao Cen, Guoxin Fang, et al.
date: 2026-09-09
source: arXiv (cs.GR)
url: https://arxiv.org/abs/2609.09828
pdf: https://arxiv.org/pdf/2609.09828
tags: [rendering, differentiable-rendering, real-time, physics-simulation, paper, 2026]
status: unread
---

# RealSimLoop: Online Real-to-Sim Adaptation via Differentiable Reduced-Order Simulation with Vision Feedback

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RealSimLoop: Online Real-to-Sim Adaptation via Differentiable Reduced-Order Simulation with Vision Feedback |
| 作者 | Zhihao Cen, Guoxin Fang, et al. |
| 来源 | arXiv:2609.09828 (cs.GR, cs.CV, cs.RO) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.09828) |
| PDF | [下载](https://arxiv.org/pdf/2609.09828) |

## 核心贡献
1. **可微分降阶神经子空间仿真**：在降阶神经子空间内执行可微分仿真，大幅加速优化循环，实现准实时性能
2. **可微分渲染耦合**：将高效动力学模型与可微分渲染耦合，通过高保真像素数据直接反向传播梯度，精化材料刚度等物理参数
3. **滑动窗口目标函数**：实现鲁棒的在线适应，追踪时变材料属性，有效弥补模型简化或未建模动力学导致的真实到仿真差距

## 技术方案
RealSimLoop 通过以下方式实现实时真实到仿真适应：

- **降阶神经子空间**：将高维物理仿真压缩到低维神经子空间，大幅降低计算成本
- **可微分渲染管线**：利用可微分渲染获取像素级梯度，反向传播到物理参数
- **滑动窗口优化**：时变材料属性的在线追踪和适应

## 实验结论
- 在外部力预测和 3D 应力场重建与新视角合成任务上验证了方法的有效性
- 优于传统离线方法
- 准实时性能：通过降阶神经子空间实现高效优化循环

## 局限性
- 依赖可微分渲染器，对非可微分渲染管线不适用
- 降阶模型可能丢失高频细节

## 可行性分析
- 实现难度：中（需要可微分渲染器和降阶模型知识）
- 性能预期：准实时，适合在线应用
- 适用场景：机器人操纵、物理参数估计、实时仿真对齐

## 相关工作
- [[Differentiable Rendering]]
- [[Model Reduction for Physics Simulation]]
- [[Real-to-Sim Transfer]]

## 笔记
与渲染领域直接相关：可微分渲染是现代渲染研究热点，结合物理仿真的思路对实时渲染和物理基础渲染有参考价值。
