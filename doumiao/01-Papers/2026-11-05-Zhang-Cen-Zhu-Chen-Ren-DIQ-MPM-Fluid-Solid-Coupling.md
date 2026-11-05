---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, mpm, particle-system, fluid-solid-coupling, implicit, schur-complement, numerical-fracture, two-way-coupling]
status: processed
domain: fluid-rendering
agent: doumiao
source: http://ren-bo.net/papers/zkr_tvcg2026.pdf
---

# DIQ-MPM: Dual Interface Quadrature MPM for Simulating Large Deformation and Fluid-Solid Coupling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DIQ-MPM: Dual Interface Quadrature MPM for Simulating Large Deformation and Fluid-Solid Coupling |
| **作者** | Kangrui Zhang, Ruihong Cen, Siyan Zhu, Ruoyan Chen, Bo Ren — **南开大学 VCIP** |
| **发表** | **IEEE Transactions on Visualization and Computer Graphics, Vol. 32, No. 7, 2026**, 12 页 |
| **链接** | [PDF](http://ren-bo.net/papers/zkr_tvcg2026.pdf) (42.2 MB) · [视频](http://ren-bo.net/Videos/zkr_tvcg2026.mp4) · [补充材料](http://ren-bo.net/papers/zkr_tvcg2026_supp.pdf) |
| **分类** | 粒子系统 / MPM / 流体-固体耦合 |

---

## 核心贡献

> **用"双界面求积 (Dual Interface Quadrature, DIQ)"机制，在不依赖重叠网格的前提下实现总拉格朗日固体 (TLMPM) 与欧拉不可压流体的强耦合**，并通过 **Schur 补**构造**统一的稀疏纯压力线性系统**，实现高效稳定的两向耦合。

1. **框架**：**隐式 TLMPM**（全拉格朗日物质点法） + **混合速度-压力格式 (mixed velocity-pressure scheme)**。
   - 稳健模拟**大变形可压缩固体**，同时**消除数值断裂 (numerical fractures)**。
2. **核心机制：Dual Interface Quadrature (DIQ)**
   - 在**当前构型 (current configuration)** 与**参考构型 (reference configuration)** 之间**一致地映射流固界面信息**；
   - 使得**无需重叠网格**即可实现**强流固耦合**。
3. **统一压力系统**
   - 通过 **Schur 补**构造**统一的稀疏纯压力 (pressure-only) 线性系统**；
   - 每个时间步只需求解**单个对称正定 (SPD) 系统** → **高效且稳定**。
4. **接触处理**：整合**基于粒子的接触力模型**，在隐式 TLMPM 内解析**固体-固体**与**固体-边界**接触。
5. **结果**：稳定捕捉**自由滑移耦合 (free-slip coupling)**、**大变形**、以及**可压缩固体与不可压流体的复杂交互**。

---

## 技术方案

### 背景问题：cell-crossing issue

```
Eulerian MPM (EMPM) 的问题:
  形状函数是线性的 → 物质点跨越 Eulerian 网格时，
  作用在网格上的力（形状函数导数）不连续 → 收敛率下降
  ↓
大变形时更严重:
  粒子在 Eulerian 网格上的支撑不足 → 数值应力集中 → 数值断裂
  ↓
传统解法 (IQ-MPM): 在 MPM 固体中引入压力变量，
  构造单体式纯压力线性系统，严格强制自由滑移边界条件
  ★ 但仍依赖重叠网格 (overlapping grids) → 工程复杂
```

### DIQ 如何解决

```
┌─────────────────┐         ┌─────────────────┐
│  TLMPM 固体      │         │  Eulerian 不可压  │
│  (Total Lagrangian)│        │  流体 (IPIC 风格)  │
│  参考构型 σ_ref   │         │  当前构型          │
└────────┬────────┘         └────────┬─────────┘
         │  DIQ: 双界面求积             │
         │  在 current ↔ reference 之间   │
         │  一致映射界面信息              │
         ▼                              ▼
   Schur 补 → 统一稀疏纯压力系统 (SPD)
         ↓
   单次求解 → 两向耦合 + 严格 free-slip
         ↓
   粒子接触力模型 → 固体-固体 / 固体-边界
```

### 与 IQ-MPM 的区别

| 维度 | IQ-MPM | **DIQ-MPM** |
|------|--------|-------------|
| 固体格式 | 引入压力变量的 MPM 固体 | **隐式 TLMPM**（总拉格朗日） |
| 网格重叠 | **依赖重叠网格** | **无需重叠网格** |
| 界面处理 | 重叠区映射 | **DIQ：current ↔ reference 一致映射** |
| 线性系统 | 单体式纯压力 SPD | **Schur 补统一稀疏纯压力 SPD** |
| 断裂 | 缓解 | **消除数值断裂** |

---

## 摘要原文

> We present DIQ-MPM, a novel monolithic two-way coupling framework for simulating interactions between solids modeled with the total Lagrangian formulation and Eulerian incompressible fluids using the Material Point Method (MPM). Our approach combines an implicit TLMPM formulation with a mixed velocity-pressure scheme to robustly simulate compressible solids undergoing large deformations, while eliminating numerical fractures. To enable strong fluid–solid coupling without relying on overlapping grids, we introduce a Dual Interface Quadrature (DIQ) mechanism that maps fluid-solid interface information consistently between the current and reference configurations. This allows us to construct a unified sparse pressure-only system via Schur complement, leading to efficient and stable coupling. We also integrate a particle-based contact force model to resolve solid-solid and solid-boundary contacts within implicit TLMPM. Experimental results demonstrate that our method stably captures free-slip coupling, large deformation phenomena, and complex interactions between compressible solids and incompressible fluids.

---

## 关联笔记
- [[2026-10-27-Tot-Deformation-MPM-Perfectly-Elastic-Solids]] — 同为 MPM 数值断裂问题（纯弹性固体）
- [[2026-10-29-Feng-Luan-Mastering-Multi-State-Dynamics-Continuum-Damage-Viscoplastic-MPM]] — 相场损伤 MPM
- [[2026-11-05-Cao-Ren-Xu-Mo-Hu-End-to-End-Differentiable-SPH-Fluid-Rigid-Optimization]] — SPH 侧的流体-刚体耦合与可微优化
- 技术笔记：[[粒子渲染]]
