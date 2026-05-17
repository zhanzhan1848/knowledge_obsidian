---
title: Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling
authors: (from arXiv:2605.11536)
date: 2026-05-12
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.11536
pdf: https://arxiv.org/pdf/2605.11536
tags: [rendering, time-of-flight, ray-tracing, monte-carlo, ReSTIR, 2026]
status: unread
---

# Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.11536) |
| PDF | [下载](https://arxiv.org/pdf/2605.11536) |

## 核心贡献
1. 提出时空蓄水池重采样(Spatio-temporal Reservoir Resampling)框架用于时域光传输渲染
2. 引入**路径长度感知偏移映射**(path-length-aware shift mapping)，通过牛顿法调整复用光路以满足时间门控约束
3. 支持交互帧率下的时间门控成像和瞬态光捕获

## 技术方案

### 核心思想
借鉴ReSTIR的复用技术，将其适配到时域光传输渲染。关键挑战：复用路径经常违反光路长度约束，导致无信号贡献。

### 路径长度感知偏移映射
通过牛顿法几何变换调整复用光路，使其满足时间门控约束。灵感来源于稳态焦散渲染中的镜面流形探索。

### 框架支持
- 时间门控成像(Time-gated imaging)
- 瞬态渲染(Transient rendering)
- 交互帧率性能
- 复杂场景+光泽/镜面材质+动态运动

## 实验结论
在延迟约束实际场景下实现交互帧率ToF渲染，演示了形状重建和导航两个下游应用。

## 局限性
依赖光路长度约束的物理有效性；对极端光学条件可能有限制。

## 可行性分析
- 实现难度：**中**
- 性能预期：交互帧率，适合延迟敏感应用
- 适用场景：时间门控成像、瞬态光传输捕获、穿墙成像、深度感知

## 相关工作
- ReSTIR (实时复用渲染)
- 瞬态渲染方法
- 时间飞行相机

## 标签
#时域渲染 #ToF #ReSTIR #光传输 #瞬态成像