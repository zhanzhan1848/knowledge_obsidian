---
title: "2026-04-26 arXiv cs.GR 论文汇总报告"
date: 2026-04-26
status: 归档
tags: [论文, 汇总, arXiv, cs.GR]
---

# 2026-04-26 arXiv cs.GR 论文搜索报告

## 搜索概要
- **搜索时间**: 2026-04-26 14:00 UTC
- **搜索范围**: 最近 7 天 arXiv cs.GR 论文
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, neural rendering, Gaussian splatting

## 本次发现

### 高相关性渲染论文 (4篇)

| ID | 标题 | 会议/期刊 | 相关度 |
|----|------|----------|--------|
| 2604.21749 | CuRast: Cuda-Based Software Rasterization | arXiv | ⭐⭐⭐⭐⭐ |
| 2604.19202 | SketchFaceGS: Real-Time Sketch-Driven Face Editing | CVPR 2026 | ⭐⭐⭐⭐⭐ |
| 2604.19127 | OT-UVGS: UV Mapping for Gaussian Splatting | Eurographics 2026 | ⭐⭐⭐⭐⭐ |
| 2604.15941 | Neural Gabor Gaussian Splatting | CVPR 2026 | ⭐⭐⭐⭐⭐ |

### 中等相关性论文 (3篇)

| ID | 标题 | 会议/期刊 | 相关度 |
|----|------|----------|--------|
| 2604.21717 | Monte Carlo PDE Solvers for Radiative BC | arXiv | ⭐⭐⭐ |
| 2604.18886 | Matrix-Free Multigrid on Octrees | arXiv (JCP) | ⭐⭐⭐⭐ |
| 2604.21689 | StyleID: Facial Identity Recognition | SIGGRAPH 2026 | ⭐⭐⭐ |

## 重点推荐实现

### 1. CuRast - CUDA 软件光栅化
- **适用场景**: 大规模三角形的实时渲染
- **优势**: 无需预构建加速结构，instanced 可达 12x 加速
- **传递**: @墨鱼丸 评估可行性

### 2. Neural Gabor Gaussian Splatting
- **适用场景**: 高频表面渲染（棋盘格等）
- **优势**: 解决 3DGS primitive 爆炸问题
- **传递**: @墨鱼丸 评估可行性

### 3. OT-UVGS
- **适用场景**: 3DGS 压缩存储和 UV 控制
- **优势**: 更好的 UV 利用率，O(N log N) 复杂度
- **传递**: @墨鱼丸 评估可行性

## 知识库更新
- 已创建 7 篇结构化笔记
- 存储位置: `~/knowledge-vault/shengcai/01-Papers/2026/`
- Git 同步待执行

## 下一步
1. 运行 `git-sync.sh` 同步到 GitHub
2. 通知 @墨鱼丸 关于推荐实现的评估请求
3. 关注 SIGGRAPH 2026 论文发布（会议日期 2026-07-19）