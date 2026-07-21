---
title: SIGGRAPH 2026 Advances in Real-Time Rendering in Games
authors: Natalya Tatarchuk, Jon Greenberg, Daniel Craig, Michał Olejnik, Alexander Mueller, Sergey Makeev, John Hable
date: 2026-07-21
status: 已读
source: SIGGRAPH 2026 Course
url: https://advances.realtimerendering.com/s2026/index.html
tags: [渲染, 实时渲染, SIGGRAPH, 路径追踪, 光线追踪, 2026]
---

# SIGGRAPH 2026 Advances in Real-Time Rendering in Games

## 摘要

SIGGRAPH 2026 的"Advances in Real-Time Rendering in Games"课程由 Activision CTO Natalya Tatarchuk 组织，汇集了来自 Activision、EA SEED、Sony、IO Interactive、Roblox、Meta 等公司的渲染技术专家。课程涵盖路径追踪加速、光线追踪可变采样率、体积渲染、用户生成内容 scaling 等前沿技术。

## 核心贡献

### 1. ORCA: Online Radiance Cache Acceleration (EA SEED - Jon Greenberg)

**核心思想**: 通过即时辐射缓存加速路径追踪，不依赖时序历史，所有数据结构都是瞬态的，适合完全动态场景。

**技术要点**:
- 不需要历史帧数据
- 数据结构瞬态重建，适合动态场景
- 可集成到现有实时路径追踪器，改动最小

**创新性**: ⭐⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐⭐ | **难度**: 中

### 2. PlayStation Spectral Super Resolution (PSSR) 升级版 (Sony - Daniel Craig)

**核心思想**: 将重建管道从单一"颜色预测网络"拆分为多个明确的黑盒函数，让 ML 模型只负责模式识别。

**技术要点**:
- 原版 PSSR 将整个重建管道作为单一颜色预测网络
- 升级版恢复显式闭式解（closed-form solutions）
- 让 ML 聚焦于模式识别，减少训练成本和运行时开销
- 改善视觉质量和时序稳定性

**创新性**: ⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐⭐ | **难度**: 中

### 3. Variable Rate Ray Tracing (VRRT) in Call of Duty: Modern Warfare 4 (Infinity Ward - Michał Olejnik)

**核心思想**: 动态分配每像素光线预算，支持 sub-1 sample-per-pixel 和 selective supersampling，通过时序梯度预通道和显式去遮挡检测。

**技术要点**:
- 支持 <1 spp（空间欠采样 + 时序重建）和 >1 spp（选择性超采样）
- 时序梯度预通道 + 显式去遮挡检测
- GPU 驱动的帧级调度器
- 保证稳定 GPU 成本，消除性能峰值

**创新性**: ⭐⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐⭐ | **难度**: 高

### 4. Smolder: IO Interactive 实时体积渲染框架

**核心思想**: 完全集成、可扩展的实时体积效果渲染框架，已用于 Glacier engine 和 007 First Light。

**技术要点**:
- 全集成体积效果渲染框架
- 与 Glacier 所有光照系统集成
- 支持 opaque、transparent、volumetric fog 各层
- 艺术家可自由使用体积效果

**创新性**: ⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐ | **难度**: 高

### 5. SLIM: Scaling User-Generated 3D Worlds on Roblox

**核心思想**: 云端系统，自动为 Roblox 世界生成轻量级、设备自适应的运行时表示。

**技术要点**:
- 自动化生成设备自适应运行时表示
- 保留 authored appearance、behavior、semantics
- 处理任意用户生成内容，无传统 art-direction 约束
- 跨 petabytes 级 UGC 部署

**创新性**: ⭐⭐⭐⭐ | **实用性**: ⭐⭐⭐⭐⭐ | **难度**: 高

### 6. Adaptive Tessellation and Subdivision (Meta - John Hable)

**核心思想**: 使用 compute shader 实现自适应曲面细分。

**技术要点**:
- Clamped parallelogram tessellation
- 讨论 tradeoffs

## 会议信息

| 项目 | 详情 |
|------|------|
| 会议 | SIGGRAPH 2026 |
| 日期 | 2026年7月21日 |
| 地点 | Los Angeles, Petree D |
| Part I | 9:00am - 12:15pm PDT |
| Part II | 2:00pm - 5:15pm PDT |

## 可行性评估

| 技术 | 实现难度 | 推荐度 | 备注 |
|------|----------|--------|------|
| ORCA | 中 | ✅ 强烈推荐 | 适合动态场景，改动小 |
| PSSR 升级 | 中 | ✅ 推荐 | 减少 ML 负担，提高效率 |
| VRRT | 高 | ✅ 推荐 | 需 GPU 调度器支持 |
| Smolder | 高 | ⚠️ 评估 | 适合有体积渲染需求的项目 |
| SLIM | 高 | ❌ 不适合独立研究 | 平台级系统 |

## 行动建议

已将以下方案传递给 @墨鱼丸 进行算法评估：
1. **ORCA** - 路径追踪加速，适合动态场景
2. **VRRT** - 可变率光线追踪，保证帧时间稳定
3. **PSSR 升级思路** - 分离 ML 和传统算法职责

## 相关链接

- [SIGGRAPH 2026 Advances 官网](https://advances.realtimerendering.com/s2026/index.html)
- [NVIDIA SIGGRAPH 2026 Blog](https://blogs.nvidia.com/blog/siggraph-news-2026/)
