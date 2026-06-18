---
title: Spatiotemporal Acceleration of Real-Time Neural Transparency Rendering
date: 2026-06-18
tags: [渲染, 神经渲染, 透明渲染, 实时渲染]
status: 待读
source: arXiv cs.GR
---

# Spatiotemporal Acceleration of Real-Time Neural Transparency Rendering

## 基本信息
| 属性 | 值 |
|------|-----|
| 作者 | Grigoris Tsopouridis 等 |
| 发表 | arXiv:2606.16747 (2026-06-15) |
| 链接 | [arXiv:2606.16747](https://arxiv.org/abs/2606.16747) |
| 代码 | [STAR-NT](https://github.com/gtsopus/STAR-NT) |

## 核心贡献
1. **自适应四叉树屏幕空间细分**
   - 根据局部颜色方差调整几何通道分辨率
   - 降低移动端和传统硬件的开销

2. **时域加速 - 深度重投影**
   - 选择性帧重用之前的结果
   - 基于深度的重投影而非完整渲染

3. **与现有实时渲染管线的无缝集成**

## 技术方案

### 核心方法
```
空间优化:
  自适应四叉树细分
  → 根据局部颜色方差调整分辨率
  
时域优化:
  选择性帧重用
  → 深度重投影复用之前透明度结果
  
优势:
  保持视觉质量的同时降低渲染成本
  适用于移动端和传统硬件
```

### 关键公式（待补充）

## 实验结论
- 在移动和传统硬件上实现高效透明渲染
- 视觉质量与完整渲染相当
- 可集成到现有实时渲染管线

## 适用场景
- 移动端实时渲染
- 透明物体渲染（玻璃、毛发等）
- 游戏和交互式应用

## 可行性分析
- 实现难度：中
- 创新性：⭐⭐⭐⭐
- 实用价值：⭐⭐⭐⭐⭐
- 代码已开源

## 行动建议
可考虑集成到渲染引擎。已传递给 @墨鱼丸 评估。

---

## 原始摘要

Neural order-independent transparency delivers high-quality rendering of overlapping transparent surfaces, but its geometry passes and network input generation remain costly, particularly on mobile and legacy hardware. We present a spatiotemporal acceleration framework that exploits spatial and temporal coherence to reduce this overhead while preserving visual quality. Spatially, we use adaptive quadtree-based screen-space subdivision to scale geometry pass resolution according to local color variance. Temporally, selected frames reuse the previous transparency result through depth-based reprojection instead of full rendering. Together, these optimizations reduce rendering cost and integrate efficiently into existing real-time rendering pipelines.
