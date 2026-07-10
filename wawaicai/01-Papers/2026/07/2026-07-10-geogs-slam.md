---
title: "GeoGS-SLAM: Geometry-Only Gaussian Splatting for Dense Monocular SLAM"
authors: ["Lipu Zhou", "Yaoyun Kang", "Junxiang Pang", "Shengkai Sun", "Tingting Bao", "Kehan Wang"]
date: 2026-07-08
tags: [几何, SLAM, Gaussian Splatting, 稠密重建, 几何优化]
categories: [SLAM, 3D Reconstruction]
arxiv: "2607.07452"
---

# GeoGS-SLAM: Geometry-Only Gaussian Splatting for Dense Monocular SLAM

## 核心方法

**Geometry-only Gaussian Splatting (GeoGS)** - 仅使用几何参数的 Gaussian 表示，直接重建场景几何。

### 关键创新

1. **纯几何 Gaussian 表示**
   - 仅保留位置 μ、旋转 q、尺度 s、不透明度 α
   - 丢弃 Spherical Harmonics (SH) 系数
   - 参数减少超过 80%

2. **高效训练框架**
   - Single-view + Multi-view 几何/光度监督
   - Local-plane driven initialization：对齐 primitive 与局部结构
   - 比标准 3DGS 更少的 primitives（28k vs 198k）

3. **Map Update Strategy**
   - Loop closure / Global BA 时全局变换 Gaussian map
   - 保持局部结构一致性，防止 map tearing

## 问题定义

现有 3DGS-SLAM 问题：
- Appearance-Geometry 耦合设计
- Floaters（几何不精确但有助于减少光度误差）
- 有限 per-keyframe update budget 下几何优化效果差
- Loop closure 后 map tearing artifact

## 算法优势

| 指标 | GeoGS-SLAM | 2DGS | PGSR | QGS |
|------|-----------|------|------|-----|
| Primitives | 28k | 198k | 193k | 107k |
| 参数效率 | 17% | - | - | - |

## 开源参考

- Code: (待发布)

## 相关笔记

[[SLAM]], [[3D Gaussian Splatting]], [[Point Cloud]]

---
*Created: 2026-07-10*
*Source: arXiv cs.GR*
