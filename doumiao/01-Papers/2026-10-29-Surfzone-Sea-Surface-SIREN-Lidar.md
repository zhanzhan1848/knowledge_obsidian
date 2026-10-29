---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, fluid-rendering, ocean-rendering, lidar, neRF, wave-analysis, differentiable]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.27352
---

# Continuous and Differentiable Neural Network Representations of the Surfzone Sea-Surface from Lidar Point Clouds

## 📋 基本信息

| 字段 | 内容 |
|------|------|
| **标题** | Continuous and Differentiable Neural Network Representations of the Surfzone Sea-Surface from Lidar Point Clouds |
| **arXiv** | [2610.27352](https://arxiv.org/abs/2610.27352) |
| **提交日期** | 2026-10-19 |
| **作者** | David R. Culver, Matthias Morzfeld, Falk Feddersen |
| **机构** | UC Santa Barbara（COMSET / Physics 系） |
| **领域** | cs.GR / physics.flu-dyn |
| **数据采集** | 加州 Monterey, CA（燃气-电动 UAS 无人机悬停扫描） |

---

## 📝 摘要

海浪通常通过海面观测来分析。多波束扫描激光雷达 (LiDAR) 能够通过时序点云对水面 $\eta(x,y)$ 进行二维测量。然而点云数据必须经过网格化、插值或映射才能用于波浪分析。

本文提出并测试了一种从时序 LiDAR 点云创建**连续且可微分（空间与时间）但无网格**的海面表示的方法。

---

## 🔑 核心贡献

1. **SIREN 架构**：用正弦激活网络 (SIREN) 表示海面高度场 $\eta(x,y,t)$，连续且可微分，任意时空点可直接求值
2. **无网格表示**：不需要对点云做网格化/插值，避免了传统流程的采样偏差
3. **实地数据验证**：使用 60 秒时空 LiDAR 数据（4 米尺度的破碎波），来自 Monterey 悬停无人机
4. **可微导数分析**：可计算时空偏导，用于**方向性波浪分析 (directional wave analysis)**
5. **波浪速度估计**：通过 SIREN 生成时空切片反演波传播速度
6. **可靠性与可复现性检验**：在同一数据上独立训练两个 SIREN，差异与仪器误差同量级

---

## 🧪 技术方案

### 核心思想

```
LiDAR 时序点云 (t₁...tₙ)          连续可微海面表示
   │  {(xᵢ, yᵢ, zᵢ, tᵢ)}                   │
   │                                       ▼
   └───────────────────►  SIREN: η(x, y, t) ──► ∂η/∂x, ∂η/∂y, ∂η/∂t
                              (正弦基函数)                │
                                                        ▼
                                          方向性波分析 + 波速估计
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **SIREN (sinusoidal representation networks)** | 使用 $\sin(\omega x + b)$ 激活拟合高频海面，天然适合带符号的连续高度场 |
| **连续-可微-无网格** | 任意 $(x,y,t)$ 均可求值，无需重采样；天然支持梯度反传 |
| **多波束 LiDAR** | 每条扫描线提供水面剖面，时序拼接得到时空点云 |
| **自相似性分析** | 破碎波区域外的平均速度与雷诺应力剖面呈现自相似性 |
| **仪器误差对照** | SIREN 误差与仪器误差相当，且对局部数据密度不敏感 |

---

## 📊 渲染方法分类

- **类型**：表面渲染（海面几何表示）+ 神经表示
- **技术**：SIREN 神经场、LiDAR 重建、可微分表示

## 🎯 视觉质量

- **逼真度**：⭐⭐⭐⭐（几何高度准确，但非渲染方案）
- **风格化支持**：不适用
- **物理准确性**：高（SIREN 误差 ≈ 仪器误差）

## ⚡ 性能预期

- **推理**：SIREN 前向传播为毫秒级；训练需数秒到数分钟
- **GPU 需求**：低（小型 MLP）
- **内存占用**：极低（数千参数）

## 🔧 实现建议

- **着色器复杂度**：低（几何已由 SIREN 求值，渲染可接入任意水面着色器）
- **管线要求**：
  - LiDAR 点云采集/预处理
  - SIREN 训练（需处理高频拟合与过拟合平衡）
  - 水面法线/泡沫/折射渲染层
- **推荐度**：✅ 推荐——为**渲染驱动的海面重建**提供了比传统网格化更优雅的路径，尤其适合需要精确波形导数的物理-渲染耦合场景

## ⚠️ 局限性

- **SIREN 天然过滤最高波数变化**（飞溅、浪花 spray），这正是视觉渲染最关心的部分 ⚠️
- 破碎波 (breaking waves) 区域的描述能力弱于规则波
- 数据贫乏区两个独立 SIREN 的差异会放大
- 这是**测量/重建**工作而非渲染工作，实际视觉保真度需自建渲染层

## 🔗 相关工作

- [[2026-10-29-NFSR-NeRF-Inspired-Super-resolution-Reacting-Flows]]
- [[Nerf-Taichi]] · [[SIREN]]
- [[2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures]]
- [[2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures]]
- [[Ocean-Rendering]] · [[Coastal-Simulation]]

## 📚 引用

```bibtex
@article{culver2026surfzone,
  title={Continuous and Differentiable Neural Network Representations of the Surfzone
         Sea-Surface from Lidar Point Clouds},
  author={Culver, David R. and Morzfeld, Matthias and Feddersen, Falk},
  journal={arXiv preprint arXiv:2610.27352},
  year={2026}
}
```

---
*创建日期: 2026-10-29*
*来源: arXiv cs.GR 每日论文搜索*
*标签: #ocean-rendering #surfzone #lidar #siren #neural-representation #wave-analysis #differentiable*
