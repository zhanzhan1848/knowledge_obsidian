---
tags: [渲染, ray-tracing, 3D-Gaussian-Splatting, differentiable-rendering, 2026]
date: [[2026-08-19]]
status: 待读
source: arXiv cs.GR
---

# 3DGART: 3D Gaussian Accelerated Ray Tracing - Fast training through particle-based backward propagation

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Laurent Vit 等 |
| 发表 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | https://arxiv.org/abs/2608.17298 |
| PDF | https://arxiv.org/pdf/2608.17298 |

## 核心贡献

1. **问题诊断**：Gaussian ray tracing 训练的瓶颈不是光线遍历本身，而是**像素中心的反向传播**——大量线程同时向同一 primitive 参数累积梯度，导致严重的原子竞争和线程串行化

2. **核心方法**：将反向传播重构为**以 primitive 为中心**而非像素为中心
   - 使用保守的透视修正 screen-space bounds
   - 构建紧凑的中间缓冲区
   - 建立 tile-primitive 映射，使每线程按 primitive 聚合计算梯度
   - 将 scatter 操作转换为结构化的 gather 类操作

## 技术方案

3D Gaussian Splatting 基于光栅化，在以下方面受限：
- 精确的视图相关性排序
- 二次射线效果（反射、折射、阴影）

Gaussian ray tracing 通过显式射线-图元求交解决这些问题，但训练成本高。

**3DGART 框架**：
- 关键洞察：瓶颈在反向传播而非光线遍历
- 解决方案：以 primitive 为单位组织梯度计算

## 实验结论

- Mip-NeRF 360 上：
  - 比 per-pixel baseline **快 3-3.5×**
  - 比 3DGRT **快 4×**
  - 质量更优
- 使全光线追踪 Gaussian 训练实际可行
- 训练速度与光栅化管线竞争，同时保留光线追踪优势

## 创新性

- ⭐⭐⭐⭐⭐ 关键洞察精准，工程实现有效

## 实用性

- ⭐⭐⭐⭐⭐ 高度实用，解决 3DGS ray tracing 训练痛点

## 推荐度

**✅ 强烈推荐**

3DGART 解决了 3D Gaussian Splatting 集成光线追踪效果的关键瓶颈，思路可迁移到其他基于粒子的渲染系统。

## 相关工作

- 相关概念：3D Gaussian Splatting, Ray Tracing, Backward Propagation, Mip-NeRF 360
