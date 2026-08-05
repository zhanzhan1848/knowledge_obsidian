---
type: report
created: 2026-08-05
updated: 2026-08-05
tags: [report, siggraph2026, real-time-rendering, ray-tracing, path-tracing]
status: processed
domain: rendering
agent: shengcai
source: https://advances.realtimerendering.com/s2026/index.html
---

# SIGGRAPH 2026 Advances in Real-Time Rendering 课程报告

## 概览

SIGGRAPH 2026的"Advances in Real-Time Rendering in Games"课程于7月21日举行，由Activision的Natalya Tatarchuk组织。演讲者来自Activision, EA SEED, Sony, IO Interactive, Roblox, Meta等公司。

---

## 核心演讲摘要

### 1. ORCA: Speeding up Path Tracing via Online Radiance Cache Acceleration
**演讲者**: Jon Greenberg (EA SEED)

**核心内容**:
- Path tracing在现代硬件上仍然很慢，实时游戏渲染面临挑战
- ORCA (Online Radiance Cache Acceleration) 是一种自定义radiance cache方法
- 不依赖时序历史，所有数据结构是瞬时的，不需要跨帧存活
- 非常适合完全动态场景
- 可最小化改动集成到现有实时路径追踪器

**技术要点**:
- Radiance Cache: 缓存间接光照贡献
- 无时序依赖：适合动态场景
- 低集成成本

**链接**: [课程PPT](https://advances.realtimerendering.com/s2026/content/ORCA%20Siggraph%20r3.4_%20Advances.pptx)

---

### 2. Upgrading PSSR on PlayStation 5 Pro
**演讲者**: Daniel Craig (Sony Interactive Entertainment)

**核心内容**:
- PSSR (PlayStation Spectral Super Resolution) 是索尼的ML超分辨率技术
- 重新设计将重建管道从单一"Color-Predicting Network"中解耦
- 恢复显式闭式解，将模型专注于模式识别
- 减少模型需要做的事，而不是增加

**技术改进**:
- 更好的视觉质量
- 更好的时序稳定性
- 更低的运行时/内存/训练成本

---

### 3. Variable Rate Ray Tracing in Call of Duty: Modern Warfare 4
**演讲者**: Michał Olejnik (Activision Infinity Ward)

**核心内容**:
- 快节奏多人射击游戏中实时光线追踪的特殊挑战
- 传统固定速率光线追踪+屏幕空间去噪在快速摄像机运动时不足
- 提出Variable Rate Ray Tracing (VRRT)系统

**技术要点**:
- 支持sub-1 sample-per-pixel（空间欠采样+时序重建）
- 支持selective supersampling (>1 spp)
- 利用时序梯度预通道和显式遮挡检测

---

### 4. Smolder: Real-Time Volumetric Effect Rendering in Glacier and 007 First Light
**演讲者**: Alexander Mueller (IO Interactive)

**核心内容**:
- 实时体积效果渲染技术
- 用于游戏Glacier和007 First Light

---

### 5. SLIM: Scaling User-Generated 3D Worlds on Roblox
**演讲者**: Sergey Makeev (Roblox)

**核心内容**:
- 渲染基于Kit的UGC表示的高效方法
- 动态世界中的可扩展渲染

---

### 6. Adaptive Tessellation and Subdivision
**演讲者**: John Hable (Meta)

**核心内容**:
- 自适应曲面细分和分裂改进
- GPU上的性能优化

---

## 相关资源

- [SIGGRAPH 2026 Advances in Real-Time Rendering 课程主页](https://advances.realtimerendering.com/s2026/index.html)
- [SIGGRAPH 2026 Technical Papers](https://s2026.siggraph.org/program/technical-papers/)

---

## 关键趋势

1. **路径追踪优化**: ORCA等radiance cache技术
2. **ML超分辨率**: PSSR等AI驱动升级方案
3. **可变利率渲染**: VRRT等自适应采样技术
4. **体积渲染**: 实时体积效果
5. **神经渲染**: NVIDIA等公司在SIGGRAPH展示的神经渲染进展
