---
title: "Skinned Motion Retargeting with Spatially Adaptive Interaction Guidance"
authors: []
date: 2026-05-19
venue: SIGGRAPH 2026
tags: [几何, 运动重定位, 骨骼动画, 几何感知]
---

# Skinned Motion Retargeting with Spatially Adaptive Interaction Guidance

## 核心方法

提出一种几何感知的运动重定位框架，通过**空间自适应锚点**保留交互语义。

### 技术要点

1. **问题**: 跨不同体型角色重定位运动时保持交互语义（自接触、近体距离）
2. **现有方法局限**: 依赖静态对应关系，在目标角色比例夸张时表现不佳

### 核心方案

1. **Transformer-based 锚点细化策略**
   - 预测锚点位移
   - 通过可微分软投影将平移锚点约束在目标角色几何上
2. **图-based 自编码器**
   - 给定锚点预测目标骨骼运动
   - 保留源运动的空间配置
3. **交替训练方案**
   - 锚点适应和运动重定位模块轮流优化

## 创新点

- 动态锚点重定位到目标角色可达区域
- 姿态相关的空间结构引导重定位
- 跨不同角色几何保持交互保真度

## 推荐结论

⚠️ **谨慎评估** - 主要应用于角色动画，非核心几何处理但涉及网格变形

## 相关技术

- [[Motion Retargeting]], [[Skeletal Animation]], [[Mesh Deformation]]