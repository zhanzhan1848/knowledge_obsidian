---
title: "VisibilitySplat: Ray-Traced Occlusion for Relighting with 3D Gaussian Splatting"
authors: "Sven Kluge, Oliver Staadt"
date: 2026-10-14
source: arXiv (cs.CV, cs.GR)
venue: WSCG 2026 (CSRN Vol. 3601, pp. 131-140)
url: https://arxiv.org/abs/2610.19847
pdf: https://arxiv.org/pdf/2610.19847
arxiv_id: "2610.19847v1"
doi: 10.24132/CSRN.2026-E17
tags: [rendering, paper, 2026, ray-tracing, BVH, PBR, microfacet, BRDF, HDR-envmap, relighting, 3DGS, inverse-rendering, visibility]
status: unread
---

# VisibilitySplat: Ray-Traced Occlusion for Relighting with 3D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | VisibilitySplat: Ray-Traced Occlusion for Relighting with 3D Gaussian Splatting |
| 类别 | cs.CV (cross-list cs.GR) |
| 年份 | 2026 |
| 发布时间 | 2026-10-14 |
| 会议 | WSCG 2026 |
| 链接 | [原文](https://arxiv.org/abs/2610.19847) |
| PDF | [下载](https://arxiv.org/pdf/2610.19847) |
| DOI | [10.24132/CSRN.2026-E17](https://doi.org/10.24132/CSRN.2026-E17) |

## 核心贡献
1. 在 **3D Gaussian Splatting (3DGS)** 标准化栅格化管线之上，引入**稀疏的显式可见性 oracle**，从采样光源方向估计 Gaussian primitives 的**透射加权遮挡**（transmittance-weighted occlusion）。
2. Oracle 基于**点基光线追踪** + **BVH 包围体层次加速**实现，仅在 inverse-rendering 目标内稀疏查询；3DGS 主循环不变，保留训练效率、交互可视化和工具链兼容性。
3. 着色阶段采用基于物理的渲染 (**PBR**) 公式 + **microfacet BRDF** + 低分辨率 **HDR 环境贴图**，在 TensoIR 合成数据集上相对 NeRF / 张量表示 / 3DGS 基线，**NVS / albedo / relighting** 三项均有竞争性表现。

## 技术方案
### 核心思想
3DGS 标准管线使用 alpha-blending 栅格化，光照/材质分解时缺乏**显式可见性建模**导致阴影与遮挡信息错误。VisibilitySplat 在 3DGS 训练目标中**稀疏插入 BVH 光线追踪**来计算 Gaussian 之间的可见性。

### 关键技术

| 技术 | 说明 |
|------|------|
| 稀疏可见性 oracle | 在每个训练迭代中只采样少量光照方向查询可见性 |
| 点基光线追踪 + BVH | 针对 3DGS 稀疏点的专属加速结构 |
| Microfacet BRDF | principled physically-based 反射模型 |
| HDR 环境贴图 | 低分辨率但高动态范围，捕捉强光源 |
| 透射加权遮挡 | 通过累积 transmittance 计算部分遮挡 |

### 公式核心

```math
V(\mathbf{x}, \boldsymbol{\omega}_l) \approx \prod_{j} \alpha_j(\mathbf{x}, \boldsymbol{\omega}_l)
```

其中 $\alpha_j$ 是光线方向上每个 Gaussian 的累积透射率，$V$ 即最终可见性估计。

```math
L_o(\mathbf{x}, \boldsymbol{\omega}_o) = \int_{\Omega^+} f_r(\boldsymbol{\omega}_i, \boldsymbol{\omega}_o)\, V(\mathbf{x}, \boldsymbol{\omega}_i)\, L_i(\boldsymbol{\omega}_i)\, (\boldsymbol{\omega}_i \cdot \mathbf{n})\, d\boldsymbol{\omega}_i
```

microfacet BRDF $f_r$ + 可见性 $V$ + 入射 radiance $L_i$ 共同决定最终着色。

## 实验结论
- 数据集：TensoIR 合成基准。
- 基线：NeRF 系列（NeRF / Mip-NeRF）、张量表示（TensoIR）、3DGS 变体。
- 结果：在 **novel-view synthesis、albedo reconstruction、relighting** 三项上具有竞争表现；多个早期基线被超越。
- 消融：**显式可见性建模**是 relighting 和材质-光照解耦的关键贡献；纯 PBR 监督在 NVS 上更倾向于外观拟合（而非几何重建）。

## 局限性
- 稀疏 oracle 的采样密度与精度之间存在权衡 — 极端复杂场景可能仍欠采样。
- BVH 在 3DGS 高斯点云极密时的构建/更新成本。
- 仅在 TensoIR 合成数据评估，真实场景泛化未充分验证。
- 主要聚焦**环境光照**下的 relighting，对点光源 / 复杂光场支持未详述。

## 可行性分析
- 实现难度：**中**。需要：(1) 3DGS 训练管线；(2) 点云 BVH 构建；(3) 微分光线追踪与 3DGS 反向梯度集成。开源 3DGS 代码成熟，工作量可控。
- 性能预期：训练阶段因稀疏 oracle 增量开销可控；推理阶段沿用 3DGS 实时（>30 FPS）。
- 适用场景：单物体/小场景的高质量 relighting、电商 3D 资产、AR/VR 真实感重建。
- 推荐度：**⭐⭐⭐⭐⭐** — 同时打通"3DGS 实时可视化" + "PBR 物理正确性"两大需求，是 inverse-rendering + 实时可视化交汇点的代表性工作。

## 相关工作
- 3D Gaussian Splatting 原论文 (Kerbl et al., SIGGRAPH 2023)
- TensoIR (Jin et al., CVPR 2023) - 张量表示 inverse rendering
- NeRO / NeRF-based relighting 工作群
- [[2026-10-13_H2-Ray-Hierarchical-Ray-Tracing-3D-Gaussian]] — 同期 H2-Ray 也关注 BVH + 3DGS 渲染
- [[2026-04-01_RT-GS_Gaussian_Splatting_Reflections_Transmittance]] — RT-GS 类似思路但关注反射

## 笔记
- 关键启示：**栅格化 (rasterization) + 稀疏光线追踪 (ray tracing)** 混合架构是当前 inverse-rendering 的主流方向，3DGS 的成功进一步强化该趋势。
- 对团队的指导价值：若未来做实时 GI/relighting，可考虑"栅格化主循环 + BVH 稀疏查询"模式，避免全光线追踪的性能开销。
- 可联系点：可作为团队的 GPU 渲染方向的"参考实现"，与现有离线路径追踪器形成互补。