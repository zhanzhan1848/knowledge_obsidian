---
title: A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes
authors: Alper Sahistan
date: 2026-07-31
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.28047
pdf: https://arxiv.org/pdf/2607.28047
tags: [rendering, volume rendering, neural rendering, ray marching, RTX, 2026]
status: unread
---

# A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes |
| 作者 | Alper Sahistan |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.28047) |
| PDF | [下载](https://arxiv.org/pdf/2607.28047) |

## 核心贡献
1. 提出基于 delta tracking 的查询高效随机体积渲染框架
2. 四阶段管线利用异构并行：ray tracing core 用于遍历，tensor core 用于批量神经评估
3. 通过光线预算和查询剪枝策略减少 INR 查询，提升每帧性能
4. 在 RTX 4090 上达到 ~30-40 FPS (1024x1024)，且能收敛到高保真图像

## 技术方案

### 问题背景
- 时变隐式神经表示 (INR) 是动态 X-ray CT 等科学数据的唯一实用表示方式
- 传统体积渲染方法（ray marching with dense sampling）对 INR 不实用
- 现有方法（重采样/缓存/重训练）会牺牲便利性和准确性

### 核心方法：Delta Tracking + 异构并行
```
管线流程：
1. Ray Tracing Core → 光线遍历（BVH 加速结构）
2. Tensor Core → 批量 INR 神经评估
3. Delta Tracking → 随机体积渲染估算
4. 查询优化 → Ray Budgeting + Query Pruning
```

### 查询优化策略
- **Ray Budgeting**：为每条光线分配查询预算，限制最大查询次数
- **Query Pruning**：剪枝不重要查询，减少冗余计算
- **Heterogeneous Parallelism**：RTX 4090 的 RT core 和 Tensor core 协同

## 性能指标
| 指标 | 数值 |
|------|------|
| 帧率 | ~30-40 FPS @ 1024×1024 |
| GPU | RTX 4090 |
| 时间步更新延迟 | ~1-2 ms |
| 渲染质量 | 高保真（收敛到高质量图像） |

## 实验结论
- 许多时变 INR 可直接从原始表示渲染
- 支持时变数据的交互式时间探索
- 时间步更新极快（约 1-2 ms）

## 局限性
- 需要 RTX 4090 级别的硬件（RT core + Tensor core）
- 对非时变数据的性能未充分评估
- INR 查询优化策略的效果依赖场景复杂度

## 可行性分析
- 实现难度：**高**（需要 RT core + Tensor core 异构编程）
- 性能预期：RTX 4090 上 30-40 FPS 适合交互式应用
- 适用场景：科学可视化（CT/MRI）、时变体积数据交互浏览

## 相关工作
- NeRF (Mildenhall et al. 2020)
- Delta Tracking 体积渲染
- 神经体积表示

## 笔记
这篇论文是神经渲染与传统体积渲染结合的出色工作。核心贡献在于利用 RTX GPU 的专用硬件（RT core + Tensor core）实现异构并行，大幅提升了 INR 的查询效率。30-40 FPS 的帧率在交互式科学可视化场景中具有实用价值。
