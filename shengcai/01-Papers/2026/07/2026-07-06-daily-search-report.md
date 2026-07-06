# 每日渲染论文搜索报告 — 2026-07-06

## 搜索概况

| 项目 | 详情 |
|------|------|
| **搜索时间** | 2026-07-06 14:00 UTC |
| **搜索范围** | arXiv cs.GR, SIGGRAPH 2026 |
| **关键词** | ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching |
| **论文总数** | 41 篇 (cs.GR 本周) |
| **筛选结果** | 8 篇渲染相关论文 |

---

## 渲染相关论文

### 🔥 高优先级

| 论文 | 来源 | 会议 | 优先级 |
|------|------|------|--------|
| **GRay: Ray Tracing 3D Gaussians Near the Speed of Splats** | arXiv:2606.30869 | I3D 2026 | ⭐⭐⭐⭐⭐ |
| **Rendering Coherent Scattering via Quantum Collision Models** | arXiv:2606.29989 | arXiv | ⭐⭐⭐⭐ |
| **Scalable and Physically Grounded Feed-Forward Neural Rendering (RenderFormer++)** | arXiv:2606.30380 | arXiv | ⭐⭐⭐⭐ |

### 中优先级

| 论文 | 来源 | 会议 | 优先级 |
|------|------|------|--------|
| **Dipole Diffusion Error in Thin Geometry** | arXiv:2606.29387 | arXiv | ⭐⭐⭐⭐ |
| **Spectral Subsurface Scattering from RGB via Biophysical Skin Inversion** | arXiv:2606.27604 | arXiv | ⭐⭐⭐ |
| **Intrinsic Decomposition and Editing of 3D Gaussian Splats** | arXiv:2606.31637 | Proc. ACM Comput. Graph. | ⭐⭐⭐ |
| **NURBS Splatting: Differentiable Rendering for Vector Graphics** | arXiv:2606.31764 | ECCV 2026 | ⭐⭐⭐ |
| **DANTE-W: Diffuse Albedo Neural Texturing in the Wild** | arXiv:2606.30677 | arXiv | ⭐⭐⭐ |

---

## 重点论文摘要

### GRay: Ray Tracing 3D Gaussians Near the Speed of Splats ⭐⭐⭐⭐⭐
**作者**: George Drettakis et al. (INRIA) | **I3D 2026**

**核心发现**: 密集初始化产生的细小 Gaussian 反而加速光线追踪（logarithmic vs linear scaling）。GRay 比 3DGRT 快 4x 渲染、10x 优化，同时质量相当。

**推荐理由**: 与已有 GRTX 工作（2606.09606, 2606.11314）互补，实现接近实时的 Gaussian 光线追踪。

### Rendering Coherent Scattering via Quantum Collision Models ⭐⭐⭐⭐
**作者**: João S. Ferreira | **arXiv 2026**

**核心发现**: 首次将量子碰撞模型引入渲染，用量子计算生成新型 BSDF，支持相干光—材料相互作用。

**推荐理由**: 前沿研究，开辟量子光学渲染新方向。实现难度高，适合科研而非生产。

### RenderFormer++ (Scalable Feed-Forward Neural GI) ⭐⭐⭐⭐
**作者**: Youcheng Cai et al. | **arXiv 2026**

**核心发现**: PITG（物理信息传输引导）+ HOCT（层级对象中心 Token 化）实现大规模场景前馈全局光照。

**推荐理由**: 实时 GI 预计算潜力大，与神经渲染发展趋势一致。

---

## SIGGRAPH 2026 动态

- **时间**: 2026 年 7 月 19-23 日，洛杉矶
- **状态**: 会议尚未举行，论文尚未正式公布
- **投稿截止**: 已过
- **主页**: https://s2026.siggraph.org/

---

## 生成的笔记

1. `2026-07-06_GRay_Gaussian_Ray_Tracing_I3D2026.md`
2. `2026-07-06_Quantum_Collision_Rendering.md`
3. `2026-07-06_RenderFormer_Plus_Plus_Neural_GI.md`
4. `2026-07-06_Subsurface_Dipole_Thin_Geometry.md`
5. `2026-07-06_Spectral_Subsurface_Skin_RGB.md`
6. `2026-07-06_Intrinsic_Decomposition_3DGS.md`
7. `2026-07-06_NURBS_Splatting_Differentiable_Rendering.md`
8. `2026-07-06_DANTE_W_Neural_Texturing.md`

---

## 下一步

- 将 GRay 论文传递给 @墨鱼丸 进行算法评估
- 关注 RenderFormer++ 的训练代码发布
- 监测 SIGGRAPH 2026 论文正式公布（7 月中旬）
