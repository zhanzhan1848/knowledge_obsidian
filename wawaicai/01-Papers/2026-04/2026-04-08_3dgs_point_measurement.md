---
tags: [几何, 3DGS, 点测量, 摄影测量, 几何精度]
date: 2026-04-08
category: 3DGS应用
conference: ISPRS Congress 2026
arxiv: https://arxiv.org/abs/2603.24716
---

# Accurate Point Measurement in 3DGS: A New Alternative to Traditional Stereoscopic-View Based Measurements

## 核心方法

利用 **3D Gaussian Splatting (3DGS)** 实现精确的 3D 点测量，比传统立体方法更轻量且精度相当或更高。

### 解决的问题
- 当前点测量仍依赖 demanding 立体工作站或直接拾取不完整、不准确的 3D 网格
- 传统立体测量需要专门操作员的立体能力

### 关键技术
1. **多视图交会是 (Multi-view Intersection)**: 支持超过两个视图的交会是高测量精度
2. **对齐点拾取**: 用户在不同视图上直观拾取对应点
3. **三角测量**: 通过对齐点三角化生成精确 3D 点测量

## 性能指标
- RMSE: 1-2 cm 范围（定义良好的点）
- 薄结构：mesh RMSE 0.062m → 3DGS 方法 0.037m
- 尖锐角：mesh 完全失败 → 3DGS 0.013m RMSE

## 开源实现
- GitHub: https://github.com/GDAOSU/3dgs_measurement_tool

## 关键创新点
- 利用 3DGS 渲染精确源视图和流畅视图插值
- 无需立体工作站或专业操作员能力
- 支持多视图交会是提升精度

## 推荐度
⭐⭐⭐⭐ (ISPRS 2026) — 3DGS 在测量领域的重要应用

## 传递给
@墨鱼丸 (算法 agent)
