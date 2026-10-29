---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, fluid-rendering, particle-system, SPH, solid-simulation, residual-stress, visuigrapp]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.24210
---

# Colour-Field Based Particle Categorization for Residual Stress Detection and Reduction in Solid SPH Simulations

## 📋 基本信息

| 字段 | 内容 |
|------|------|
| **标题** | Colour-Field Based Particle Categorization for Residual Stress Detection and Reduction in Solid SPH Simulations |
| **arXiv** | [2610.24210](https://arxiv.org/abs/2610.24210) |
| **发表** | **VISIGRAPP 2023** — 18th International Joint Conference on Computer Vision, Imaging and Computer Graphics Theory and Applications, Volume 1: GRAPP, pp. 237-241 |
| **提交日期** | 2026-10-16（arXiv 重新收录） |
| **作者** | Gizem Kayar |
| **领域** | cs.GR |

> 📌 这是 **2023 年 VISIGRAPP 论文的 arXiv 重新收录**，属于回顾性条目，非最新会议首发。

---

## 📝 摘要

即使在没有外力或热压力的情况下，物体内部仍会残留**残余应力 (residual stress)**，这可能导致显著的塑性变形。当残余应力产生不良影响时，需要一种高效的方案来**追踪并消除**它。

**Smoothed Particle Hydrodynamics (SPH)** 已广泛用于固体力学仿真，而其固有的**色场生成方法 (colour-field generation approach)** 是追踪残余应力的有前景的手段。

本文提出利用色场方法**消除**残余应力，防止固体发生不期望的**过早失效**。

---

## 🔑 核心贡献

1. **色场粒子分类**：利用 SPH 的内在色场（color field）机制对粒子进行分类，识别处于残余应力状态的粒子
2. **残余应力消除**：不止检测，还能主动消除残余应力
3. **防止过早失效**：目标是避免固体在无外载情况下发生破坏
4. **SPH 力学应用**：将 SPH 从流体扩展到固体力学（残余应力问题）

---

## 🧪 技术方案

### 核心思想

```
SPH 粒子系统
   │
   ├──► 密度/色场 (colour field) 计算
   │        │
   │        ▼
   │   粒子分类 (categorization)
   │        ├──► 类别 A: 承载残余应力
   │        └──► 类别 B: 正常
   │
   ▼
残余应力消除（调整受影响粒子的状态）
   │
   ▼
避免过早失效
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Color Field** | SPH 求解器中用于计算密度/压力等标量场的机制，此处复用为应力状态的指示器 |
| **Particle Categorization** | 按色场值对粒子分组，定位残余应力承载区 |
| **SPH 固体力学** | 把 SPH 用于固体（而非流体）的力学分析 |
| **应力消除机制** | 对识别出的高应力粒子施加修正，释放残余应力 |

---

## 📊 渲染方法分类

- **类型**：粒子渲染（粒子系统可视化）
- **技术**：SPH 粒子渲染 + 应力着色的分类可视化

## 🎯 视觉质量

- **逼真度**：⭐⭐⭐（工程分析可视化，非影视级渲染）
- **风格化支持**：是（色场分类天然适合调试可视化）
- **物理准确性**：中高（SPH 固体力学，残余应力为工程近似）

## ⚡ 性能预期

- **计算**：SPH 求解器量级；残余应力检测为额外 O(N) 遍历
- **GPU 需求**：中（GPU SPH 可加速；色场本身是 GPU 友好的稠密场）
- **内存占用**：中

## 🔧 实现建议

- **着色器复杂度**：低
- **管线要求**：
  - SPH 固体力学求解器（带 color field 输出）
  - 粒子分类着色（按应力类别上色）
  - 应力消除模块（修改粒子状态/邻域搜索核）
- **推荐度**：⚠️ 有条件推荐——方法巧妙且低成本，但对**流体渲染**本身是间接相关；可借鉴"用求解器原生场量做可视化分类"的思路

## ⚠️ 局限性

- **2023 年旧论文**（arXiv 重新收录），方法不算前沿
- 论文仅 5 页（VISIGRAPP short paper），细节有限
- 固体力学 SPH 的残余应力处理本身是难点，作者方法为启发式
- 与"流体渲染"主线关联较弱，属 SPH 应用延伸

## 🔗 相关工作

- [[SPH]] · [[Particle-System-Rendering]]
- [[GPU-Based-Adaptive-Surface-Reconstruction-SPH-Fluids]]（Kanai Lab, WSCG 2014）
- [[2025-03-29_Journey-into-SPH-Simulation]]
- [[2025-03-29_Fluid-Implicit-Particle-Simulation-CPU-GPU]]

## 📚 引用

```bibtex
@inproceedings{kayar2023colour,
  title={Colour-Field Based Particle Categorization for Residual Stress Detection
         and Reduction in Solid SPH Simulations},
  author={Kayar, Gizem},
  booktitle={Proceedings of the 18th International Joint Conference on Computer Vision,
             Imaging and Computer Graphics Theory and Applications (VISIGRAPP 2023) - Volume 1: GRAPP},
  pages={237--241},
  year={2023}
}
```

---
*创建日期: 2026-10-29*
*来源: arXiv cs.GR 每日论文搜索（2023 会议论文重新收录）*
*标签: #particle-system #SPH #solid-simulation #residual-stress #visuigrapp*
