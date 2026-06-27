---
title: "Hierarchical Progressive Rendering for Immediate Feedback (HiPR)"
date: 2026-06-25
tags: [几何, 渲染, 路径追踪, 交互式]
paper_id: arXiv:2606.26612
authors: Rafael Padilla et al.
conference: cs.GR
---

# Hierarchical Progressive Rendering for Immediate Feedback

## 核心方法
Hierarchical Progressive Rendering (HiPR) 是一种动态渲染调度算法，使交互式路径追踪终于有实时感。

### 技术要点
- 大多数渲染器在任何场景更改后重新计算整个帧
- HiPR 根据优先级顺序更新部分像素，同时保持其他像素不变
- 不依赖误差驱动或时间重用启发式方法
- 将像素组织成从变化元素向外扩展的光路依赖层次结构
- 按感知影响优先排序，提供即时视觉反馈，最终收敛到无偏结果

## 创新点
- 首次实现真正的交互式路径追踪即时反馈
- 基于光路依赖关系的优先级调度
- 感知影响驱动的渲染策略

## 复杂度分析
- 时间：自适应 per-pixel 更新
- 空间：O(hierarchy depth)

## 相关 DOI
https://doi.org/10.1145/3799821.3820912

## 相关笔记
[[Path Tracing]]
[[Progressive Rendering]]
[[Interactive Rendering]]