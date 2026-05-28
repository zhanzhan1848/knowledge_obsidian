# 每日论文搜索报告 — 2026-05-28

## 搜索配置
- **时间**: 2026-05-28 14:00 UTC
- **搜索范围**: arXiv cs.GR、ACM Digital Library、NVIDIA Research
- **关键词**: ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching
- **时间窗口**: 最近 24 小时

## 搜索结果

### arXiv 新论 (cs.GR)

| 论文 | 来源 | 核心贡献 |
|------|------|----------|
| **GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering** | arXiv → HPCA 2026 | 通过 ray space 变换将各向异性 Gaussians 统一为单位球体构建高效 BVH；硬件 checkpointing 消除多轮追踪冗余遍历。加速 4.36× |
| **Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization** | arXiv cs.GR | 将 Radiant Foam 的 Voronoi 图推广到 bounded power diagram，实现统一渲染范式；几何/外观解耦 |

### NVIDIA Research 2026 论文

| 论文 | 会议 | 核心贡献 |
|------|------|----------|
| **Taming Optimization Variance in Compact Neural Shading Networks** | SIGGRAPH Conference 2026 | 多实例训练控制小型网络方差；提升实时神经着色稳定性 |
| **Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time** | Eurographics 2026 | 随机成对 MIS 实现大量邻居无偏复用；聚焦有效采样像素 |
| **ReSTIR PT Enhanced: Algorithmic Advances** | I3D 2026 | 2-3× 加速；reciprocal neighbor selection；更鲁棒的 shift mapping |
| **Gradient-Domain ReSTIR Path Tracing** | Eurographics 2026 | 首个实时梯度域路径追踪方法；高度选择性空间复用 🏆 相关 |
| **Wave Tracing: Generalizing The Path Integral To Wave Optics** | Eurographics 2026 🏆 Best Paper Honorable Mention | 将路径积分推广到波动光学；双线性路径积分建模干涉；椭圆锥采样 |

## 本日关键发现

### 1. ReSTIR 生态持续成熟
ReSTIR PT Enhanced 和 Gradient-Domain ReSTIR PT 的出现表明 ReSTIR 从研究走向生产。Stochastic Pairwise MIS 解决了空间复用稀疏问题，Gradient-Domain 则首次将梯度域技术引入实时场景。

### 2. 神经渲染与光线追踪融合
- **Power Foam** 尝试统一可微分 ray tracing 与 rasterization
- **Taming Neural Shading** 解决紧凑网络训练不稳定问题
- **GRTX** 针对 3DGS 的 ray tracing 效率瓶颈

### 3. 波动光学新突破
**Wave Tracing** 获得 Eurographics Best Paper Honorable Mention，将经典路径积分推广到波动光学领域，是光传输理论的重要进展。

## 已创建笔记
```
2026-05-28_GRTX_Gaussian_Ray_Tracing.md
2026-05-28_Power_Foam_Unified_Ray_Tracing_Rasterization.md
2026-05-28_Taming_Neural_Shading_Variance_SIGGRAPH2026.md
2026-05-28_Stochastic_Pairwise_MIS_Eurographics2026.md
2026-05-28_ReSTIR_PT_Enhanced_I3D2026.md
2026-05-28_Gradient_Domain_ReSTIR_PT_Eurographics2026.md
2026-05-28_Wave_Tracing_Path_Integral_Eurographics2026.md
```

## 重点关注
1. **ReSTIR PT Enhanced** — 最接近生产可用，2-3× 加速建议优先传递给 @墨鱼丸 评估
2. **GRTX** — HPCA 2026 论文，软件部分可直接复现
3. **Wave Tracing** — 理论价值高，波动光学渲染方向值得关注