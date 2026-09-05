---
tags: [几何, 网格处理, 3D打印, 路径规划, UDF]
---

# WildFab: Multi-Axis 3D Printing from Models in the Wild

## 论文信息
- **arXiv**: [2609.02413](https://arxiv.org/abs/2609.02413)
- **会议**: Pacific Graphics 2026
- **日期**: 2026-09-02

## 核心方法
提出 WildFab，计算多轴 3D 打印的空间刀具路径和全局无碰撞运动。处理真实世界几何（包含 solid-shell 组合和非流形结构）。

## 技术要点
- **问题**: 真实世界模型包含 solid-shell 组合和非流形结构，处理困难
- **混合查询表示**: 结合 neural unsigned distance field (UDF) 和 regularized generalized winding number field (reg-GWN)
  - UDF 提供可微表面距离和方向查询
  - reg-GWN 解决 UDF 近表面歧义，提供可靠表面定位和 solid-void 指示
- **空间刀具路径计算**: 在 guidance-field level sets 和 reg-GWN gradient-magnitude ridges 之间迭代投影点
- **粗到细碰撞检测**: UDF-based rejection 识别潜在碰撞，time-varying reg-GWN 验证

## 几何算法
- 优化 guidance-field level sets 投影
- reg-GWN (regularized generalized winding number)
- UDF-based 碰撞检测

## 开源实现
源码即将发布

## 相关笔记
[[2026-09-05-MeshSplatBench-Triangle-Based-Neural-Rendering]]
