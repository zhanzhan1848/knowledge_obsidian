---
title: PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars
authors: Julian Kaltheuner, et al.
date: 2026-05-20
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.20185
pdf: https://arxiv.org/pdf/2605.20185
tags: [rendering, gaussian, avatar, neural-field, hierarchical, real-time, 2026]
status: unread
---

# PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars |
| 作者 | Julian Kaltheuner, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.20185) |
| PDF | [下载](https://arxiv.org/pdf/2605.20185) |

## 核心贡献
1. **解耦表示与模板拓扑** - 使用参数化人体模型仅用于运动传输，Avatar 表示为在体积规范空间中锚定的高斯
2. **神经场引导的表征** - 由连续神经场控制的体积规范空间
3. **3D 重心坐标锚传输** - 保持运动一致性，允许锚点自由偏离模板表面
4. **双层空间一致优化** - Sobolev 预条件神经场更新 + KNN 预条件规范锚几何

## 技术方案

### 表征设计
- 高斯锚定在体积规范空间，由连续神经场管理
- 解耦 avatar 表征空间与模板变形空间
- 避免基于表面的参数化的几何约束

### 运动传输
- 3D 重心坐标锚传输指导运动，不约束几何
- 允许锚点自由偏离模板表面
- 天然产生密集、稳定的时间表面对应

### 自组织机制
- 锚密度自发组织：向高曲率区域、外观变化、非一致运动迁移
- 无需显式启发式规则

### 多层次重建
- 单个表征支持多细节层次层次重建
- 粗级监督通过共享场和耦合锚图传播到更细级别

## 实验结论
- 在复杂服装和挑战性非刚性运动的基准测试中达到 SOTA 渲染质量
- 对不完美人体模型初始化有强泛化能力
- 在所有细节层次实时渲染

## 局限性
- 专注于 avatar 渲染
- 需要人体模型初始化

## 可行性分析
- 实现难度：高（涉及神经场、多层次优化）
- 性能预期：实时渲染（所有细节层次）
- 适用场景：数字人、虚拟形象、实时渲染

## 相关工作
- [[3D Gaussian Splatting]]
- [[Neural Radiance Fields]]
- [[Avatar Rendering]]

## 笔记
数字人渲染的重要进展，结合高斯与神经场。实时性能对游戏/VR 应用有价值。