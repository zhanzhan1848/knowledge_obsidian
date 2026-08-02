---
type: conference-report
created: 2026-08-02
updated: 2026-08-02
tags: [SIGGRAPH2026, real-time-rendering, path-tracing, ray-tracing, ML-upscaling, variable-rate, volumetric, tessellation, UGC]
status: processed
domain: rendering
agent: shengcai
source: https://advances.realtimerendering.com/s2026/index.html
---

# SIGGRAPH 2026 Advances in Real-Time Rendering — 要点整理

## 来源

[SIGGRAPH 2026 Advances in Real-Time Rendering in Games](https://advances.realtimerendering.com/s2026/index.html)
Conference: SIGGRAPH 2026 | Date: July 21, 2026 | Location: Petree D

---

## Part I — 2026 年 7 月 21 日 上午

### 1. ORCA - Online Radiance Cache Acceleration
**Speaker**: Jon Greenberg (EA SEED)

**核心内容**：
- 路径追踪在现代硬件上仍然很慢，实时游戏渲染面临挑战
- ORCA = Online Radiance Cache Acceleration
- **不依赖时序历史**：所有数据结构都是瞬态的，无需跨帧存活
- **适合全动态场景**：数据结构不需维持，场景全动态无约束
- **集成成本低**：对现有实时路径追踪器改动最小

**技术意义**：
辐射缓存的在线版本，避免了传统 radiance cache 需要持久化数据的问题。

---

### 2. Upgrading PSSR on PlayStation 5 Pro
**Speaker**: Daniel Craig (Sony Interactive Entertainment)

**核心内容**：
- 原版 PSSR 将整个重建管道作为单一"颜色预测网络"
- 问题：模型隐式解决已有高效封闭形式解的子问题
- 新方法：恢复显式封闭形式解，让模型专注于模式识别
- **效果**：质量↑、时序稳定性↑、运行时↓、内存↓、训练成本↓

**设计哲学**：
> "让模型做它最擅长的事——模式识别；已解决问题的部分交给封闭形式解"

---

### 3. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4
**Speaker**: Michał Olejnik (Activision Infinity Ward)

**核心内容**：
- 挑战：快节奏多人游戏中画面质量必须在快速相机运动和动态物体下稳定
- 传统固定采样率 + 屏幕空间去噪不足：遮挡伪影和时序滞后在竞技游戏中过于显眼
- VRRT 方案：
  - **动态分配每像素光线预算**
  - sub-1 spp：空间欠采样 + 时序重建
  - selective supersampling：>1 spp 在稳定性关键区域
  - **时序梯度预传递 + 显式遮挡检测**：主动识别不稳定像素，在伪影出现前增加采样
- 确定性性能保障

**意义**：生产级 VRRT 系统

---

## Part II — 2026 年 7 月 21 日 下午

### 4. Smolder — Real-Time Volumetric Effect Rendering in Glacier
**Speaker**: Alexander Mueller (IO Interactive)

**核心内容**：
- 冰川引擎中的实时体积效果渲染
- 用于游戏中的体积光、雾效等

---

### 5. SLIM — Scaling User-Generated 3D Worlds on Roblox
**Speaker**: Sergey Makeev (Roblox)

**核心内容**：
- Roblox 平台用户生成 3D 内容的大规模渲染方案
- 关注 kit-based UGC 表示在动态世界中的高效渲染

---

### 6. Adaptive Tessellation and Subdivision
**Speaker**: John Hable (Meta)

**核心内容**：
- GPU 上自适应曲面细分技术的改进
- 自适应细分曲面在动态场景中的应用

---

## 技术趋势总结

| 技术 | 类型 | 重要性 |
|------|------|--------|
| ORCA (Radiance Cache) | 路径追踪加速 | ⭐⭐⭐⭐⭐ |
| PSSR 升级 | ML 上采样 | ⭐⭐⭐⭐⭐ |
| VRRT | 可变率光线追踪 | ⭐⭐⭐⭐⭐ |
| 实时体积效果 | 渲染效果 | ⭐⭐⭐⭐ |
| UGC 规模化渲染 | 渲染管线 | ⭐⭐⭐⭐ |
| 自适应细分 | 几何渲染 | ⭐⭐⭐ |

---

## 与本知识库的关联

- ORCA → 可添加到 [[Path Tracing]] 和 [[Real-Time Rendering]] 笔记
- PSSR → 可添加到 [[ML-upscaling]] 和 [[SIGGRAPH 2026]] 笔记
- VRRT → 可添加到 [[Ray Tracing]] 和 [[Real-Time Rendering]] 笔记

---

## 相关笔记

- [[Path Tracing]]
- [[Real-Time Rendering]]
- [[ML-upscaling]]
- [[Ray Tracing]]
- [[Volumetric Rendering]]
- [[SIGGRAPH 2026]]
