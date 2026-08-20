---
title: Daily Paper Search Report 2026-08-20
date: 2026-08-20
tags: [rendering, report, daily-search]
---

# Daily Paper Search Report - 2026-08-20

## 搜索范围
- **来源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia
- **时间**: 最近 24 小时 (2026-08-19 ~ 2026-08-20)
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching

## 搜索结果

### 新发现论文

| 序号 | 论文标题 | 来源 | 分类 |
|------|----------|------|------|
| 1 | Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds | arXiv cs.GR | ray tracing |
| 2 | GS-Voxel: Fitting-Free Structured Latents for Large-Scale 3DGS Generation | arXiv cs.CV | neural rendering |

### 论文详情

#### 1. VoroTracing (⭐ 重点推荐)
- **作者**: Bernardo Taveira, Carl Lindström, Joakim Johnander, Fredrik Kahl (Chalmers/Zenseact)
- **核心突破**: 可微分 Voronoi 光线追踪，在 RTX 5090 上达到 **623 FPS**，比最快光线追踪方法快 3.2×
- **创新点**: 
  - 八面体表面纹理减少内存访问
  - 表面集中不透明度促进早期终止
  - GPU 优化渲染管线
- **链接**: https://arxiv.org/abs/2608.17682
- **推荐度**: ⭐⭐⭐⭐⭐

#### 2. GS-Voxel
- **作者**: Ming Qian et al.
- **核心突破**: 将无序 3DGS 转换为结构化体素潜在空间，支持大规模场景生成
- **创新点**: 
  - 拟合自由转换
  - GS-specific VAE 编码
  - 重叠感知平铺推理
- **链接**: https://arxiv.org/abs/2608.17988
- **推荐度**: ⭐⭐⭐⭐

## 领域动态

### SIGGRAPH Asia 2026
- 会议网站已上线：https://asia.siggraph.org/2026/
- 投稿通道开放中

### 技术趋势
1. **Voronoi 分区光线追踪**正在成为高效神经渲染的新方向
2. **3DGS 潜在空间生成**为大尺度场景可控生成奠定基础
3. **光线追踪 vs 光栅化**的速度差距正在缩小

## 知识库更新
- ✅ 创建笔记: `2026-08-20-VoroTracing-Differentiable-Voronoi-Ray-Tracing.md`
- ✅ 创建笔记: `2026-08-18-GS-Voxel-Fitting-Free-Structured-Latents.md`

## 下一步
- [ ] 深入分析 VoroTracing 的 GPU 实现细节
- [ ] 跟踪 SIGGRAPH Asia 2026 论文发布
- [ ] 关注 VoroTracing 开源代码发布

---
*搜索时间: 2026-08-20 14:00 UTC*
*Agent: shengcai 🥬*
