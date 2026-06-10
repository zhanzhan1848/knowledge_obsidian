# 每日论文搜索报告

> **日期**: 2026-06-10
> **搜索范围**: arXiv cs.GR (最近48小时) + SIGGRAPH/SIGGRAPH Asia 2025-2026
> **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering
> **执行时间**: 2026-06-10 14:11 UTC

---

## 搜索结果摘要

### arXiv cs.GR (48小时内)

共扫描48 篇论文，其中**流体渲染相关 1 篇**，渲染/模拟相关 3 篇。

| arXiv ID | 标题 | 相关度 | 标签 |
|---------|------|--------|------|
| 2606.10473 | **AnisoLift: 各向异性潜在表示粗粒度粒子液体增强** | ⭐⭐⭐⭐⭐ | #粒子液体 #细节增强 |
| 2606.09606 | Path-Traced Inverse Rendering with Global Illumination in 3D Gaussian Fields | ⭐⭐⭐ | #渲染 #Inverse-Rendering #Gaussian |
| 2606.09018 | Palette-Based Material Decomposition and Relighting with 2D Gaussian Splatting | ⭐⭐⭐ | #渲染 #材质分解 #Gaussian-Splatting |
| 2606.08469 | OctaOctree Neural Radiosity for Real-time Glossy Material Rendering | ⭐⭐⭐ | #渲染 #全局光照 #光泽材质 |
| 2606.08739 | Minimal Retroreflective Microfacet Model | ⭐⭐ | #BRDF #材质模型 |
| 2606.10050 | Continuous Neural Reparameterization for UV Repair | ⭐ | #几何 #UV |
| 2606.06565 | AI LOD: ML Model Precision Selection for Real-Time Human Motion | ⭐ | #游戏 #动画 |

### SIGGRAPH/SIGGRAPH Asia

- 无新公开论文（会议论文通常在 Accepted Paper List 公布）
- 搜索发现：2606.10753 (Speech-Driven 3D Facial Animation) 将在 SIGGRAPH 2026 演示

---

## 重点论文详情

### 🔥 核心论文：AnisoLift (2606.10473)
**各向异性潜在表示粗粒度粒子液体增强**

- **方向**：粒子液体模拟的粗粒增强（不上采样粒子数）
- **创新**：为每个粗粒粒子附加各向异性椭球分量，编码子粒子结构
- **方法**：结构化潜在闭包 + 粗粒支撑参考对齐
- **意义**：固定预算下提升液体模拟视觉质量，适合实时应用

详见笔记：[[2026-06-10-AnisoLift-Particle-Liquid-Enhancement]]

---

## 其他值得关注的渲染论文

### 1. Path-Traced Inverse Rendering with Global Illumination in 3D Gaussian Fields (2606.09606)
- **方向**：3D Gaussian Fields 的路径追踪逆渲染
- **创新**：无 splatting 的路径追踪逆渲染框架，统一光传输管线
- **意义**：更准确的材质-光照估计，全局光照下的阴影/反射/重光照

### 2. OctaOctree Neural Radiosity (2606.08469)
- **方向**：实时光泽材质渲染的神经辐射度
- **创新**：空间-角度八叉树表示，耦合空间层次与方向依赖存储
- **意义**：实时全局光照，单次网络查询实现主光线交点

### 3. Palette-Based Material Decomposition with 2DGS (2606.09018)
- **方向**：基于调色板的材质分解与物理重光照
- **创新**：紧凑全局调色板 BRDF 原型 + 空间连续材质场
- **意义**：材质编辑、重光照、跨场景材质迁移

---

## 趋势分析

1. **Gaussian 表示持续火热**：3DGS/2DGS 在逆渲染、材质分解、液体增强中的应用
2. **粒子模拟 + 深度学习**：AnisoLift 代表了用学习式闭包增强传统粒子求解器的新方向
3. **神经辐射度方法**：OctaOctree 等空间-角度表示为实时全局光照提供新思路

---

## 知识库更新

- ✅笔记创建：`2026-06-10-AnisoLift-Particle-Liquid-Enhancement.md`
- ✅ 本次报告：`2026-06-10_Daily-Search-Report.md`

---

*🌱 豆苗 — 流体渲染研究 Agent | 每日22:00 自动执行*