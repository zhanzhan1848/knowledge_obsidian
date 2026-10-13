---
title: "Real-time Rendering of Pre-integrated Neural Emitters"
date: 2026-10-13
tags: [real-time-rendering, neural-emitter, direct-illumination, pre-integration, emission]
authors: [Arno Coomans et al.]
arxiv: 2610.06762
venue: arXiv 2026
status: processed
subjects: cs.GR
---

## 核心创新点

**Neural Emission Fields (NEF)** — 一种**预积分神经光照表示**，消除实时渲染中复杂发光体（带外壳、高面数、自遮挡、可形变）直接光照的**运行时积分成本**。

### 关键技术

1. **预积分体表达**
   - 一次预计算 → 周围体空间逐点的入射 radiance
2. **参数化**
   - 位置 + 法线 + 视角方向 + 材质参数
3. **双头结构（diffuse / glossy）**
   - 单次 network evaluation → 无噪声、无遮挡直接光照
4. **本地系训练**
   - 训练后可在刚体变换下当作**便携资产**复用
5. **吸收**
   - 内部互反射、自遮挡、空间变化 emission、变形全部吸收进学习表示
   - **零额外运行时成本**

## 渲染技术分类

- **类型**: 实时渲染 / 体光照累积
- **方法**: 预积分神经 SDF-like 表示

## 适用场景

- 复杂发光体（霓虹灯、车灯、火把、屏幕、粒子光源）
- 含 participation media 的实时光照（绑定 NEF 后做 raymarching 友好）
- 烟/火场景中**火焰 + 火光的快速直接光**（替代逐采样）

## 推荐度

✅ 推荐 — 实时 + 多源复杂光照场景的实用工具

## 关键词

`real-time rendering` `neural emitter` `pre-integration` `direct illumination` `light field`

---
*由豆苗自动收集于 2026-10-13*
