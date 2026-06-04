---
tags: [几何, luminaire, 光线追踪, 渲染]
date: 2026-06-04
category: [Rendering, Geometry Processing]
arXiv: 2606.04319
authors: 
title: "Learning Complex Luminaires with Light Tracing"
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.04319
pdf: https://arxiv.org/pdf/2606.04319
---

## 核心方法

### 神经光照估计
- 估计复杂 luminaires 的 appearance
- 适用于具有复杂光传输的 luminaires（如小型发射器被多层 specular layers 包围）

### 光线追踪 (Light Tracing)
- 从发射器到出射表面的路径构建
- appearance 估计作为分布学习问题

### 概率密度函数建模
- 使用 large normalizing flow network 建模出射表面上的 radiance pdf
- 通过估计 pdf × flux 恢复出射 radiance

### 知识蒸馏
- 将学习的 appearance 蒸馏到轻量级 MLP
- 直接估计出射表面上的 radiance

### 附加网络
- Sampling network: 高效计算直接照明
- Blending network: 将 luminaire 合成到场景

## 创新点
1. Light tracing 生成路径分布
2. Normalizing flow 建模 radiance 分布
3. 蒸馏到实时 MLP

## 复杂度分析
- 推理速度：高（蒸馏后 MLP）
- 训练复杂度：高（flow network）
- 渲染质量：低 sample count 下仍保持高质量

## 开源参考
- 原文未提供代码链接

## 可行性评估

**推荐度**: ⚠️ 谨慎评估

**理由**:
- 主要贡献在渲染/光照，非几何处理
- 与几何处理间接相关（几何形状影响光传输）
- 技术创新度高，但实用价值待验证

**适用场景**:
- 复杂几何灯具渲染
- 参与介质渲染
- 光传输模拟