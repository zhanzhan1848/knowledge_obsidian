# 每日渲染论文搜索报告

## 时间
- 日期: 2026-04-25
- 执行时间: 14:00 UTC
- 搜索范围: 最近 24 小时 (2026-04-23 ~ 2026-04-25)

## 搜索范围

### 来源
- arXiv cs.GR (计算机图形学)
- ACM Digital Library
- SIGGRAPH/SIGGRAPH Asia 会议

### 关键词
ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 搜索结果

### 新增论文 (3 篇)

| # | 论文 | 领域 | 创新性 | 推荐度 |
|---|------|------|--------|--------|
| 1 | CuRast: CUDA-Based Software Rasterization for Billions of Triangles | 软件光栅化/CUDA | ⭐⭐⭐⭐ | 推荐 |
| 2 | SketchFaceGS: Real-Time Sketch-Driven Face Editing with Gaussian Splatting | 3DGS/人脸编辑 | ⭐⭐⭐⭐⭐ | 重点关注 |
| 3 | Monte Carlo PDE Solvers for Nonlinear Radiative Boundary Conditions | 热辐射/Monte Carlo | ⭐⭐⭐⭐ | 推荐 |

### 领域分布

```
实时渲染/光栅化: 1 篇 (CuRast)
3D Gaussian Splatting: 1 篇 (SketchFaceGS)
热辐射模拟/Monte Carlo: 1 篇 (MC PDE Solvers)
```

## 关键发现

### 1. CuRast - 海量三角形软件光栅化
- **核心创新**: 3 阶段光栅化管线，无需预建加速结构
- **性能优势**: 数百亿三角形场景比 Vulkan 快 2-12x
- **局限**: 不支持透明混合，低 poly 场景不如 Vulkan
- **SIGGRAPH 2026 潜力**: 高吞吐海量几何处理方向值得关注

### 2. SketchFaceGS - CVPR 2026 Highlight
- **核心创新**: 首个 sketch-driven 3D Gaussian 人头生成框架
- **实时性**: 单次前向传播，实时交互编辑
- **架构**: Transformer UV Feature Prediction + 3D UV Feature Enhancement
- **代码已开源**: Jittor 实现可用

### 3. Monte Carlo PDE for Radiative BCs
- **核心创新**: Picard fixed-point 迭代处理非线性辐射边界条件
- **技术亮点**: Heteroscedastic regression 去噪填补了边界点方差缩减空白
- **应用**: 复杂几何热辐射模拟

## 结论

本次搜索发现了 3 篇与渲染相关的论文，其中 **SketchFaceGS** 特别值得关注 —— 它是 CVPR 2026 Highlight 论文，结合了当前热门的 Gaussian Splatting 与直观的草图交互，在头像生成和游戏资产编辑场景有实际应用价值。**CuRast** 则代表了大批量三角形光栅化的软硬件协同优化方向，与实时光栅化管线直接竞争。

---

*报告由 shengcai agent 自动生成 | 2026-04-25 14:00 UTC*
