---
tags: [渲染, 动作合成, 稀疏控制, 扩散模型, 锚点, 2026]
date: [[2026-05-16]]
status: 待读
---

# AnchorRoute: Human Motion Synthesis with Interval-Routed Sparse Control

## 基本信息

| 属性 | 值 |
|------|-----|
| 作者 | Pengcheng Fang 等 |
| 链接 | [arXiv:2605.14716](https://arxiv.org/abs/2605.14716) |

## 核心贡献

1. 提出 **AnchorRoute**，稀疏锚点运动合成框架
2. 使用锚点作为生成和精化的共享脚手架
3. 支持根3D、平面根和身体点控制
4. 支持以下锚点类型：
   - 根位置
   - 平面轨迹样本
   - 身体点目标

## 技术方案

### 锚点条件特征
- 生成前将稀疏锚点转换为锚点条件特征
- 通过 AnchorKV 和双上下文条件将条件内存注入冻结的 Transition Masked Diffusion 先验

### RouteSolver 精化
- 锚点时间戳定义精化间隔
- 残差决定校正集中位置
- 将软令牌更新投影到锚点定义的逐段仿射区间基上
- 生成时锚点条件与残差路由精化耦合

### 性能
- 在稀疏关键关节协议下优于先前稀疏控制方法
- 在各种控制族上持续改善锚点 adherence
- 生成器和精化互补：生成器保留文本-运动质量，RouteSolver 提供更强锚点 adherence 的可控路径

## 可行性分析

- **实现难度**：高（扩散模型 + 优化框架）
- **实用价值**：高（动画生成）
- **渲染相关度**：低（更多与动作捕捉/动画相关）

## 相关链接

- [PDF](https://arxiv.org/pdf/2605.14716)
- [HTML](https://arxiv.org/html/2605.14716v1)