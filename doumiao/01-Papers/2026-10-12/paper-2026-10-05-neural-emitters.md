---
title: "Real-time Rendering of Pre-integrated Neural Emitters"
date: 2026-10-05
tags: [real-time-rendering, neural-emission-fields, participating-media, direct-illumination, volume-rendering]
authors: [Arno Coomans, Floor Verhoeven, Edoardo A. Dominici, et al.]
paper_id: 2610.06762
subject: cs.GR
status: reviewed
priority: medium
relevance: ⭐⭐⭐⭐
---

## 核心创新点

### 问题定义
实时渲染中，处理具有遮挡外壳、高多边形发光网格、空间变化发射或可形变装配的非平凡发光体的**直接光照**仍是一个瓶颈。

### 现有方案的不足
1. **分析方法** - 局限于简单发光几何
3. **纯采样估计器** - 需要高采样预算才无噪
2. **代理表示** - 仍需运行时积分输出辐射

### 核心方法
**Neural Emission Fields (NEF)** - 一种在发光体周围体积中**预算**照明的表示，**消除运行时积分**。

### 关键设计
- 神经场由位置、法线、视角方向、材料参数参数化
- **双头 diffuse/glossy 架构**
- 训练在发光体**局部坐标系**，因此训练好的 NEF 是**可便携的照明资产**
- 刚性变换下跨场景可复用

## 渲染技术

### 类型
- **预积分** 体积照明表示
- 神经场编码照明

### 优势
- 每次着色点一次网络评估即得无噪无遮挡直接照明
- 内部互反射、自遮挡、空间变化发射、可形变都被吸收进学习表示
- 运行时零额外成本

## 关键技术

| 技术 | 说明 |
|------|------|
| **Neural Emission Field (NEF)** | 发光体周围体积照明神经表示 |
| **Diffuse/Glossy 双头** | 联合编码漫反射与光泽反射 |
| **Pre-integration** | 预算出射照明 |
| **Local Frame Training** | 便携性、跨场景复用 |
| **Rigid Transform Reuse** | 资产化照明 |

## 实现建议

### 实现难度
**中** - 需要神经场训练 + 实时渲染管线集成

### 预期性能
- **帧率**: 实时（单次网络评估/着色点）
- **GPU 需求**: 中（神经场推理）
- **训练**: 离线预算，训练后实时

### 适用场景
- ✅ 复杂发光体（车灯、屏幕、灯罩、可形变 LED 阵列）
- ✅ 实时 PBR 引擎的复杂直接照明
- ✅ 跨场景照明资产复用

### 推荐度
**✅ 推荐** - 对实时渲染复杂发光体的实用神经解决方案

## 相关工作

- [[Neural Radiance Fields]]
- [[Real-Time Rendering]]
- [[Pre-integrated Lighting]]
- [[Participating Media]]
- [[Neural Materials]]

## 资源链接

- 论文: https://arxiv.org/abs/2610.06762

## 一句话总结
> 提出 Neural Emission Fields (NEF)，在发光体局部坐标系预算其周围体积的照明，运行时仅需一次网络评估即可获得无噪无遮挡直接照明（包括内部互反射、自遮挡、形变），并作为可便携的照明资产在刚性变换下跨场景复用。

---
*由豆苗自动收集于 2026-10-12*