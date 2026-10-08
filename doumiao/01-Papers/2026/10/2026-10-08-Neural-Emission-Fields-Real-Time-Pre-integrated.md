---
title: "Real-time Rendering of Pre-integrated Neural Emitters"
date: 2026-10-05
venue: arXiv cs.GR
arxiv: 2610.06762v1
url: http://arxiv.org/abs/2610.06762v1
subjects: cs.GR
tags:
  - real-time rendering
  - neural emission fields
  - pre-integration
  - area light
  - volumetric emitter
  - portable lighting asset
agent: doumiao
status: processed
---

## 核心创新点

**Neural Emission Fields (NEF)**：在**发射器局部坐标系预计算**整个体素空间的照明场，运行时仅需**单次网络评估**获得**无噪非遮挡直接照明**，对实时发射体（火焰、灯、变形 emissive 体）渲染有突破意义。

### 关键贡献

1. **预积分神经场** — 体素空间照明一次预算，零运行时积分
2. **两分支架构** — diffuse / glossy 头分别处理；无噪非遮挡直接光照单次推理
3. **局部坐标系训练** — NEF 作为**可移植照明资产**，刚性变换可跨场景复用
4. **吸收内部特性** — interreflections、自遮挡、空间变化发射、变形全部吸收进网络，运行时零额外成本

### 解决痛点

| 现有方案 | 限制 |
|---------|------|
| 简化解析表示 | 仅适用简单发射体几何 |
| 运行时采样 | 高样本才无噪（实时不可行） |
| 代理表示 | 仍需运行时积分 |
| **NEF (本文)** | **无积分、噪声零、单次评估** |

## 渲染技术分类

- **类型**: 实时直接照明
- **方法**: 神经网络预积分（pre-integration neural fields）
- **应用**: 实时火焰、灯具、变形 emissive 装配、可移植光照资产

## 评估

- **逼真度**: ⭐⭐⭐⭐⭐ (无噪、内部 interreflection 物理一致)
- **实时性**: ✅ 单次网络评估/着色点
- **创新度**: ⭐⭐⭐⭐ (把"采样"问题转换成"学习"问题)

## 实现建议

- **着色器复杂度**: 中（神经场查询 + 双分支）
- **管线要求**: 训练在 GPU 离线；运行时集成到任意着色器
- **跨场景复用**: ✅ 刚性变换下资产化
- **推荐度**: ✅ 强烈推荐 — 适合实时游戏、VR 中的**复杂发光体**

## 与流体渲染关联

- **火焰渲染**：NEF 把火焰作为 emissive 体积，可直接在实时引擎渲染，无需昂贵的体积积分
- **烟雾 / 大气散射**：可推广到**参与介质**直接光照
- **体积云**：大幅减少运行时光线步进开销

## 关键词

`neural emission fields` `real-time rendering` `pre-integration` `area light` `volumetric emitter` `portable asset` `cs.GR`