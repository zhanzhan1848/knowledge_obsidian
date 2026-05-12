---
title: Daily Search Report - 2026-05-12
authors: shengcai
date: 2026-05-12
source: arXiv cs.GR (24h监控)
url: (汇总报告)
pdf: N/A
tags: [rendering, daily-search, report, 2026]
status: current
---

# Daily Search Report — 2026-05-12

## 搜索配置
- **时间范围**: 2026-05-11 ~ 2026-05-12 (最近24小时)
- **来源**: arXiv cs.GR, SIGGRAPH 2026 Technical Papers
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 搜索结果概览

### arXiv cs.GR (最近48h)
共发现 **37篇** 论文，筛选出渲染领域相关论文：

| arXiv ID | 标题 | 领域 | 相关度 |
|----------|------|------|--------|
| 2605.10457 | GRCA: Emitter-Centric Ray-Triangle Filtering (LiDAR) | 光线追踪/加速结构 | ⭐⭐⭐⭐⭐ |
| 2605.05876 | 3D Surface Splatting for Inverse Rendering | 可微分渲染/逆渲染 | ⭐⭐⭐⭐ |
| 2605.07450 | LoBoFit: Garment Refitting (Local Bone Mapping) | 几何/服装仿真 | ⭐⭐ |
| 2605.07252 | PersonaGest: Co-Speech Gesture Generation | 动画/人体 | ⭐⭐ |
| 2605.08744 | MeshFIM: Fill-in-the-Middle Mesh Editing | 几何处理 | ⭐⭐ |
| 2605.08824 | HairGPT: 3D Hairstyle Synthesis | 头发仿真 | ⭐⭐ |
| 2605.09362 | FrameTwin: Wireframe 3D Printing | 曲线/3D打印 | ⭐ |
| 2605.09299 | Divergence-Free Fluid Reconstruction | 流体重建 | ⭐ |
| 2605.08088 | DDAC: Prioritized Animation Logic (Godot) | 游戏引擎/动画 | ⭐ |

### SIGGRAPH 2026 Technical Papers
- 官网：https://s2026.siggraph.org/program/technical-papers/
- 投稿截止：2026-01-22（已过）
- 论文 Acceptance 结果尚未公布
- 程序Chair: Mirela Ben-Chen, Justin Solomon

## 重点论文分析

### 🥩 GRCA: Emitter-Centric Ray-Triangle Filtering
**亮点**: 反向光线追踪思想，无需 BVH 加速结构，动态场景下 10x+ 加速
- 算法: 问"哪些光线能命中三角形"而非"光线命中什么"
- 性能: 14.55x over Embree (CPU), 7.97x over OptiX (GPU)
- 场景: LiDAR 仿真 + 通用光线追踪

### 🥬 3D Surface Splatting (3DSS)
**亮点**: 首个可微分 surface splatting 渲染器，EWA coverage compositing，jointly recovers shape + BRDF + illumination
- 创新: coverage-based opacity 从 EWA 权重自然产生
- 优势: 抗锯齿轮廓 + 有效的 visibility gradients
- 可直接重建为 mesh（桥接传统工作流）

## 知识库更新
- `01-Papers/2026/05-May/2026-05-12_GRCA_Emitter_Centric_Ray_Triangle_Filtering.md`
- `01-Papers/2026/05-May/2026-05-08_3DSS_3D_Surface_Splatting_Inverse_Rendering.md`

## 行动建议
1. **GRCA** 适合高动态场景的光线追踪加速，建议关注其"反向追踪"思想在通用渲染中的潜在应用
2. **3DSS** 对逆渲染有兴趣的团队值得关注，EWA splatting 方法可借鉴
3. 等待 SIGGRAPH 2026 论文 acceptance 结果（预计5-6月公布）

## 下次搜索
- 时间: 2026-05-13 02:00 UTC
- 继续监控 arXiv cs.GR + SIGGRAPH 2026 更新