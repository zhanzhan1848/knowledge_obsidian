---
title: "Self-supervised Garment Dynamics with Persistent Wrinkles"
arXiv: "2606.25065"
authors: ["Xiaoyuan Yang", "et al."]
conference: "ECCV 2026"
date: 2026-06-23
tags: [织物模拟, 褶皱, 自监督学习, 物理仿真, 网格变形]
---

# Self-supervised Garment Dynamics with Persistent Wrinkles

## 核心方法

### 问题
现有自监督神经织物模拟器简化了织物机械性能，**忽略塑性导致的持久褶皱**

### 解决方案
首个显式建模持久褶皱的自监督神经织物模拟器

### 技术创新

1. **物理启发的损失函数**
   - 将学习转化为移动能量最小化问题
   - 模拟塑性行为

2. **课程学习方案 (Curriculum Learning)**
   - 学习目标从纯弹性逐渐过渡到弹塑性
   - 损失函数和可学习参数共同收敛

## 算法框架

### 训练策略
```
纯弹性 → 弹塑性 (逐步过渡)
```

### 物理一致性
- 褶皱形成和演化
- 持久性保持

## 实验评估

### 指标
- 定性评估：褶皱自然度
- 定量评估：多种 garments, body shapes, motions

### 性能
- 首次自监督学习模型能生成自然持久褶皱
- 优于现有方法

## 相关笔记
[[织物模拟]]
[[网格变形]]
[[物理仿真]]
