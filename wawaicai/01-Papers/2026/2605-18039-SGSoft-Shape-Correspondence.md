---
title: "Learning Fused Semantic-Geometric Features for 3D Shape Correspondence"
arXiv: "2605.18039"
date: 2026-05-18
tags: [几何, 形状对应, 网格处理, 细分, 重网格化]
categories: [论文, 形状对应, 深度学习]
---

# SGSoft: Template-Guided Soft Signals for 3D Shape Correspondence

## 核心方法

通过模板引导的软信号学习融合语义-几何特征的 3D 形状对应方法：
- 定义顶点级锚点对：规范模板与其参数化变体之间
- 应用数据增强：细分、重网格化、随机旋转
- 通过增强链回溯恢复硬锚点

## 技术细节

- **细分 (Subdivision)**：增加网格密度
- **重网格化 (Decimation)**：简化网格
- 使用测地距离场提供连续、拓扑不变的监督

## 相关笔记

[[形状对应]] [[网格处理]] [[细分曲面]]

## 可行性评估

⚠️ **关注实现**

适用于：3D 形状匹配、动画、变形迁移
