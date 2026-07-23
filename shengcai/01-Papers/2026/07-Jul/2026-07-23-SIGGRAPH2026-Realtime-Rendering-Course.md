---
title: SIGGRAPH 2026 Advances in Real-Time Rendering - Course Notes
authors: Various (Activision, EA SEED, Sony, IO Interactive, Roblox, Meta)
date: 2026-07-21
source: SIGGRAPH 2026
url: https://advances.realtimerendering.com/s2026/index.html
tags: [rendering, conference, 2026, SIGGRAPH, real-time, ray-tracing, path-tracing, upscaling, volumetric]
status: unread
---

# SIGGRAPH 2026 Advances in Real-Time Rendering - Course Notes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Advances in Real-Time Rendering in Games |
| 组织者 | Natalya Tatarchuk (Activision) |
| 来源 | SIGGRAPH 2026 |
| 日期 | 2026-07-21 |
| 链接 | [官网](https://advances.realtimerendering.com/s2026/index.html) |

## 课程概述
现代视频游戏采用复杂的算法来产生突破性的3D渲染。演讲者来自 Activision, EA SEED, Sony, IO Interactive, Roblox, Meta 等公司。

主题涵盖：
- 实时光线追踪和路径追踪技术
- ML超分辨率算法
- 自适应细分
- 实时体积效果
- UGC表示的高效渲染

---

## Part I: Game and Rendering Trends (上午)

### 1. ORCA: Online Radiance Cache Acceleration (EA SEED)
**演讲者**: Jon Greenberg

#### 核心内容
- 路径追踪在现代硬件上较慢，实时游戏渲染面临挑战
- **ORCA** 方法：通过自定义辐射缓存加速路径追踪

#### 技术特点
- **不依赖时间历史**：所有数据结构是瞬时的，不需要跨帧存活
- **适合完全动态场景**：理想用于动态场景
- **最小侵入**：可最小化集成到现有实时路径追踪器

#### 关键创新
```math
传统路径追踪：
path = trace_ray(scene, origin, direction)
radiance += evaluate_bounce(path)

ORCA 辐射缓存：
if (cache_hit(position, direction)):
    radiance = lookup_cache(position, direction)
else:
    radiance = trace_and_cache(position, direction)
```

---

### 2. Upgraded PSSR on PlayStation5 Pro (Sony)
**演讲者**: Daniel Craig

#### 背景
机器学习超分辨率已成为实时渲染的核心技术。

#### 升级版 PSSR 设计
- **原版问题**：将整个重建管线作为单一颜色预测网络，导致效率低下
- **改进方案**：恢复显式闭合形式解，让模型专注于模式识别

#### 改进成果
- 提升视觉质量
- 改善时间稳定性
- 减少运行时、内存和训练成本

#### 设计原则
```
原版 PSSR: 隐式解决多个不同问题
升级版 PSSR: 显式闭合形式 + ML 模式识别
```

---

### 3. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4 (Activision)
**演讲者**: Michał Olejnik

#### 问题背景
快节奏多人射击游戏中：
- 图像质量必须在快速相机运动下保持稳定
- 动态物体移动 + 帧时间预算严格

传统固定率光线追踪 + 屏幕空间去噪**不足**：
- 遮挡伪影
- 时间滞后
- 竞技游戏中过于干扰

#### VRRT 系统设计
**可变采样率**：
- 子1样本/像素追踪（空间欠采样 + 时间重建）
- 选择性超级采样（>1 spp）

**关键技术**：
1. **Temporal Gradient Pre-pass**：主动识别不稳定像素
2. **Explicit Disocclusion Detection**：显式检测遮挡
3. **GPU-driven Frame-level Scheduler**：空间光线再分配，保持恒定总光线数

#### 成果
- 稳定GPU成本
- 消除性能峰值
- 适合竞技游戏

---

## Part II: Engine and Effects (下午)

### 4. Smolder: Real-Time Volumetric Effect Rendering (IO Interactive)
**演讲者**: Alexander Mueller

#### 背景
IO Interactive 的 Glacier 引擎和 007 First Light 项目

#### 功能
- 完全集成的可扩展实时体积效果渲染框架
- 与所有光照系统集成
- 支持不透明、透明、体积雾层

#### 技术特点
- 体积效果作为"任何其他类型VFX"使用
- 艺术家可自由创作
- 支持 Bond 角色的玩家控制体积效果

#### 评估
- 深入算法解析
- 优缺点评估
- 未来方向讨论

---

### 5. SLIM: Scaling User-Generated 3D Worlds (Roblox)
**演讲者**: Sergey Makeev

#### 问题
Roblox 游戏由任意用户生成内容构建：
- 无传统美术指导约束
- 无固定内容预算
- 无手动创作LOD
- 无可预测运行时行为

#### SLIM 解决方案
**云端系统**：
- 自动生成轻量级设备自适应运行时表示
- 保留 authored appearance, behavior, semantics

#### 覆盖范围
- 表示生成权衡
- 客户端选择
- 质量保真度
- 回退到原始内容的语义完整性

---

### 6. Adaptive Tessellation and Subdivision (Meta)
**演讲者**: John Hable

#### 内容
- Compute shader 细分和细分曲面
- Clamped parallelogram tessellation
- 权衡讨论

---

## 关键趋势总结

### 渲染技术趋势
| 技术 | 公司 | 重点 |
|------|------|------|
| Radiance Cache | EA SEED | 动态场景支持 |
| ML Upscaling | Sony | 质量/效率平衡 |
| Variable Rate RT | Activision | 竞技级稳定性 |
| Volumetric Rendering | IO Interactive | 集成工作流 |
| UGC Scaling | Roblox | 云端自动优化 |

### 共同主题
1. **性能稳定性**：GPU驱动的帧级调度
2. **ML辅助渲染**：超分辨率、去噪、加速
3. **动态场景适应**：不依赖预计算
4. **自动化优化**：减少人工干预

## 相关工作
- [[Path Tracing Optimization]]
- [[Neural Radiance Cache]]
- [[Variable Rate Sampling]]
- [[Volumetric Rendering]]

## 笔记
SIGGRAPH 2026 的实时渲染课程展示了行业最前沿的实践。

**关键启示**：
1. **路径追踪实用化**：ORCA等方法正在解决实时性挑战
2. **ML与渲染结合**：PSSR等ML超分辨率成为标准配置
3. **可变采样率**：自适应质量分配是趋势
4. **体积渲染集成**：VFX工作流统一

**推荐给墨鱼丸**：
- ORCA 的辐射缓存设计值得研究
- VRRT 的可变率追踪对性能优化有启发
- PSSR 的设计原则（显式+ML混合）可用于其他ML渲染系统
