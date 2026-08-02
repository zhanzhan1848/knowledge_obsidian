---
type: report
date: 2026-08-02
agent: shengcai
domain: rendering
status: complete
tags: [daily-search, arxiv, SIGGRAPH2026, rendering, ray-tracing, path-tracing, global-illumination, PSSR, 3DGS, neural-rendering]
---

# 🥬 生菜日报 | 2026-08-02

## 搜索概况

| 项目 | 内容 |
|------|------|
| **搜索时间** | 2026-08-02 14:00 UTC |
| **搜索范围** | arXiv cs.GR (最近 24h)、SIGGRAPH 2026、ACM DL |
| **关键词** | ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching |
| **搜索结果** | arXiv cs.GR 无新增（Jul 31 已有 2 篇已处理）；SIGGRAPH 2026 多项实时渲染进展 |

---

## 📄 arXiv cs.GR 最新论文

### 已有笔记（Jul 28-31 批次）

> 注：最近 24h 内 arXiv cs.GR 无新增纯 GR 提交（上次新增为 Jul 31 的 2607.28047 和 2607.27943，已处理）。

| 论文 | 核心领域 | 重要性 | 处理状态 |
|------|---------|--------|---------|
| **2607.28047** - Query-Efficient Stochastic Volume Rendering Framework | 神经体绘制、Delta Tracking、RTX+Tensor Core | ⭐⭐⭐⭐⭐ | ✅ 已处理 |
| **2607.27943** - GTC: Compact Mipmapped SVBRDF via Shared Gaussians | PBR 纹理压缩、ASTC 对标 | ⭐⭐⭐⭐⭐ | ✅ 已处理 |
| **2607.26525** - AtlasLC: Object-Centric 3DGS 压缩 (ISMAR 2026) | 3DGS 压缩、XR 资产管线 | ⭐⭐⭐⭐ | ✅ 已处理 |
| **2607.26506** - Global Pass Barriers Without Per-Resource RHI Tracking | GPU 内存屏障、Vulkan/wgpu | ⭐⭐⭐⭐ | ✅ 已处理 |
| **2607.26889** - StructureGS: 关节物体重建 (ECCV 2026) | 3DGS 关节物体、几何感知 | ⭐⭐⭐ | 待深入 |

---

## 🎯 SIGGRAPH 2026 亮点：实时渲染进展

> 来源：[Advances in Real-Time Rendering in Games 2026](https://advances.realtimerendering.com/s2026/index.html)

### 1. ORCA - Online Radiance Cache Acceleration（EA SEED）

**Speeding up Path Tracing via ORCA**

- **核心**：为实时路径追踪设计的在线辐射缓存加速方案
- **特点**：
  - 不依赖时序历史，所有数据结构瞬态（无需跨帧存活）
  - 适合全动态场景
  - 对现有实时路径追踪器改动最小
- **意义**：路径追踪在现代硬件上仍较慢，ORCA 提供了一种实用加速路径
- **关键词**：#path-tracing #radiance-cache #real-time

### 2. PSSR 升级版 - PlayStation Spectral Super Resolution（Sony）

**Upgrading PSSR on PlayStation 5 Pro**

- **核心**：将重建管道中已有封闭形式解的部分恢复显式，减少 ML 模型负担
- **技术路线**：原版 PSSR 将整个重建作为单一颜色预测网络 → 新版将已有高效封闭解的部分恢复显式
- **效果**：视觉质量和时序稳定性提升，同时降低运行时、内存和训练成本
- **意义**：为 ML 上采样器的设计提供新思路——让模型专注模式识别，而非已解决的子问题
- **关键词**：#ML-upscaling #PSSR #real-time #machine-learning

### 3. Variable Rate Ray Tracing - Call of Duty: Modern Warfare 4（Activision）

**Variable Rate Ray Tracing (VRRT)**

- **挑战**：快节奏多人游戏中，画面质量必须在快速相机运动和动态物体下保持稳定
- **方案**：
  - 动态分配每像素光线预算
  - 支持 sub-1 spp（空间欠采样+时序重建）和 selective supersampling（>1 spp）
  - 时序梯度预传递 + 显式遮挡检测，主动识别不稳定像素并选择性增加采样
- **意义**：生产级 VRRT 系统，解决传统固定采样率在竞争性游戏中不足的问题
- **关键词**：#ray-tracing #variable-rate #real-time-gaming #denoising

### 4. Smolder - 冰川引擎实时体积效果渲染（IO Interactive）

**Real-Time Volumetric Effect Rendering in Glacier**

- **技术**：冰川引擎中的实时体积效果渲染
- **关键词**：#volumetric-rendering #real-time

### 5. SLIM - Roblox 用户生成 3D 世界规模化（Roblox）

**Scaling User-Generated 3D Worlds on Roblox**

- **技术**：高效渲染大规模 UGC 内容的方案
- **关键词**：#UGC #real-time #scale

### 6. Adaptive Tessellation and Subdivision（Meta）

- **技术**：自适应细分曲面技术改进
- **关键词**：#tessellation #subdivision

---

## 🟢 NVIDIA @ SIGGRAPH 2026 渲染相关

> 来源：[Jon Peddie Research - Nvidia plays a strong hand at Siggraph](https://www.jonpeddie.com/news/nvidia-plays-a-strong-hand-at-siggraph/)

### ArtiFixer

- **定位**：Gaussian Splats 的 AI 修复工具
- **功能**：修复 splat 中的噪声和缺失输入数据
- **亮点**：直接从场景几何预测照片级全局光照，**无需追踪任何光线**
- **意义**：神经网络驱动的无光线全局光照预测，可能是渲染领域的新方向

### MotionBricks

- NVIDIA Research 论文
- 神经渲染 + 运动模糊相关

### Omniverse 开放

- Omniverse 完全解耦并开源
- Omniverse 库成为 agent 工具
- Blender 集成蓝图：NemoClaw agent 可调用 RTX 传感器模拟和物理工具

---

## 📊 技术热度分析

| 技术方向 | 热度 | 趋势 |
|---------|------|------|
| **Path Tracing 加速** | 🔥🔥🔥🔥🔥 | 工业界加速落地（ORCA、VRRT） |
| **ML 上采样/超分** | 🔥🔥🔥🔥 | PS5 Pro PSSR 升级版，新思路 |
| **Variable Rate Rendering** | 🔥🔥🔥🔥 | 游戏行业广泛探索 |
| **3DGS 压缩** | 🔥🔥🔥🔥 | AtlasLC 成熟度高，XR 实用化加速 |
| **神经全局光照** | 🔥🔥🔥🔥 | ArtiFixer 无光线 GI 预测 |
| **神经体绘制** | 🔥🔥🔥 | Delta Tracking + 异构 GPU |
| **PBR 纹理压缩** | 🔥🔥🔥 | GTC 对标 ASTC，性能优异 |
| **体积渲染** | 🔥🔥🔥 | Smolder 在冰川引擎落地 |

---

## 💡 可行性评估摘要

### 高优先级（新论文）

| 论文/技术 | 可行性 | 理由 |
|---------|--------|------|
| **GTC: Shared Gaussians SVBRDF** | ✅ 推荐 | ASTC 对标，随机访问，非神经解码，实时友好 |
| **AtlasLC: 3DGS 压缩** | ✅ 推荐 | XR 实用化关键，5-25x 压缩加速，无需重训练 |
| **ORCA: Radiance Cache** | ✅ 推荐 | 瞬态数据结构，全动态场景，集成成本低 |
| **VRRT** | ⚠️ 谨慎 | 方案具体到 CoD，需泛化 |
| **ArtiFixer** | ⚠️ 待观察 | 新方向，需更多信息 |

---

## 📅 下一步

1. 深入分析 GTC 和 AtlasLC 的具体实现细节，提取可复用组件
2. 关注 ORCA 开源动态（EA SEED 是否有公开代码）
3. 追踪 ArtiFixer 的技术论文
4. 将压缩相关方案传递给 @墨鱼丸

---

*搜索时间：2026-08-02 14:00 UTC | Agent: 生菜 (shengcai)*
