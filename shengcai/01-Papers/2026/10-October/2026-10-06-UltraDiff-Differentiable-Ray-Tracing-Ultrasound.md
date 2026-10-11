---
title: "UltraDiff: Differentiable Ray Tracing in Ultrasound for Shape Optimization"
authors: (arXiv preprint, see source URL)
date: 2026-10-06
source: arXiv (cs.GR, cs.CV)
url: https://arxiv.org/abs/2610.07941
pdf: https://arxiv.org/pdf/2610.07941
arxiv_id: "2610.07941v1"
tags: [rendering, paper, 2026, differentiable-rendering, ray-tracing, path-tracing, ultrasound, inverse-rendering, mitsuba3]
status: unread
---

# UltraDiff: Differentiable Ray Tracing in Ultrasound for Shape Optimization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | UltraDiff: Differentiable Ray Tracing in Ultrasound for Shape Optimization |
| 类别 | cs.GR, cs.CV |
| 年份 | 2026 |
| 发布时间 | 2026-10-06 |
| 链接 | [原文](https://arxiv.org/abs/2610.07941) |
| PDF | [下载](https://arxiv.org/pdf/2610.07941) |
| 项目页 | 见 arXiv 摘要 |

## 核心贡献
1. 将**可微渲染范式从光传输扩展到医学超声**——超声图像形成类比 transient rendering：回波按 tof 桶分，而非投影到图像平面。
2. 提出 **UltraDiff**：模块化可微超声光线追踪框架，将成像表述为 path-space 积分，对换能器到组织界面的传播时间 gating。
3. 基于 **Mitsuba 3** 实现了 forward model 与 scene-parameter 梯度的 Monte Carlo 估计器，并展示**无监督**（analysis-by-synthesis）的 inverse geometry estimation（无需预分割 B-mode 图像）。

## 技术方案
- 形式化：
```math
  I(\mathbf{u}) \;\approx\;
  \int_{\Omega^+} \iint
  W\!\bigl(t - \|\mathbf{x}-\mathbf{u}\|_2/c\bigr)\,
  \rho(\mathbf{x})\, G(\mathbf{x})\, d\mathbf{x}\, d\omega
```
  - $W$：时窗函数（time gating）
  - $G(\mathbf{x})$：光线几何衰减
  - $\rho(\mathbf{x})$：组织散射系数
- 与 transient rendering 同构 — 复用 Mitsuba 3 的 transient / time-domain 处理路径。
- 求 SDF 对参数的梯度，做 gradient-based shape optimization：以球为起点，B-mode 损失驱动，使回波与测量一致。
- 验证：仿真 B-mode sweep 恢复椎体表面；并使用真实机器人采集脊柱 phantom。

## 实验结论
- 仿真数据：成功从球形初始 SDF 优化到接近真实椎体几何。
- 真实 phantom：与强监督 SOTA 几何精度 **相当**，且**无需预分割**。
- 在可微渲染框架内复用现有 transient path tracing 管线，证明思路可跨领域迁移。

## 局限性
- 仅在 B-mode 2D 影像评估；3D volumetric ultrasound 尚未展示。
- 声学介质参数（声速 c、衰减）目前假设均匀。

## 可行性分析
- 实现难度：**中-高**。强依赖 Mitsuba 3 + transient 插件；域专家（声学）知识门槛较高。
- 性能预期：与 Mitsuba 3 实时性相当（GPU 加速后接近 interactive）。
- 适用场景：医学影像分析、机器人辅助超声、acoustic inverse problems。
- 推荐度：**⭐⭐⭐** — 跨领域思路创新，但与生菜团队聚焦的纯渲染关系较弱；作为拓展研究可保留索引。

## 相关工作
- Transient Rendering 相关（Mitsuba 3 transient plugin）
- [[2026-08-09_Query-Efficient-Stochastic-Volume-Rendering-INR]]
- Inverse Rendering 系列（见仓库）。

## 笔记
- 思路启发：可微 transient 渲染为时域/波传播型成像模式提供通用模板。团队可在未来研究"可微微波成像、太赫兹成像"时复用此模式。
