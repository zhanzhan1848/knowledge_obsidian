---
title: "Self-supervised Garment Dynamics with Persistent Wrinkles"
date: 2026-06-23
tags: [几何, 服装模拟, 皱纹, 自监督学习, 塑性]
paper_id: arXiv:2606.25065
authors: Xiaoyuan Yang et al.
conference: ECCV 2026
---

# Self-supervised Garment Dynamics with Persistent Wrinkles

## 核心方法
首个明确建模持久皱纹的自监督神经服装模拟器。

### 关键挑战
- 现有方法大大简化了织物的机械特性，忽略塑性导致的持久皱纹
- 这种简化允许通过能量最小化进行简单训练，但缺乏可信的皱纹影响视觉真实感

### 技术方案
1. **Physics-Inspired Loss Function** - 将学习转化为移动能量最小化问题以模拟塑性
2. **Physics-Inspired Curriculum Learning** - 学习目标材料逐渐从纯弹性变为弹塑性
3. **Joint Convergence** - 允许损失函数和学习参数共同收敛

## 创新点
- 首次实现自监督学习模型生成自然持久皱纹
- 课程学习方案解决损失函数变化带来的训练困难
- 在各种服装、体型和身体运动上优于现有方法

## 评估指标
根据多种指标评估，包括皱纹自然度、视觉真实感和物理准确性

## 相关笔记
[[Cloth Simulation]]
[[Neural Physics]]
[[Self-supervised Learning]]