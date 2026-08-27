---
title: "Differentiable Vector Graphics via Error-Bounded Forward Relaxation"
authors: ["Chenglong Liu"]
date: 2026-08-21
arXiv: "2608.20803"
conference: "ECCV 2026 Oral"
tags: [可微渲染, 矢量图形, 贝塞尔曲线, 逆向设计]
---

# CubicSplat: 误差界前向松弛的可微矢量图形

## 核心方法

解决经典光栅化对几何不连续的问题，提出 **CubicSplat** 可微矢量光栅化器。

### 关键创新

**梯度矛盾 (Gradient Seesaw) 问题**
- 设计选择改善前向几何精确性可能系统性降低梯度信号，反之亦然

**CubicSplat 解决方案**
- 用均匀多段线代理 Bézier 最近点求解器
- 几何误差界 O(S⁻²)
- 静态计算图天然产生良好条件的梯度
- 基于合成推导的可见性机制剪枝退化图元

### 性能指标

- **DIV2K/Kodak 基线**：最高 2dB PSNR 增益（闭合填充设置）
- **训练速度**：比之前方法快 4 倍

## 论文信息
- **发表**: ECCV 2026 Oral
- **代码**: https://github.com/CubicSplat/repo

## 可行性评估

✅ **ECCV 2026 Oral 论文**

- 代码已开源
- 可微矢量图形在设计自动化、UI 生成等领域有应用
- 梯度优化问题的分析框架有参考价值

## 相关技术
- 可微渲染
- 矢量图形
- 贝塞尔曲线
- 前向模式自动微分
