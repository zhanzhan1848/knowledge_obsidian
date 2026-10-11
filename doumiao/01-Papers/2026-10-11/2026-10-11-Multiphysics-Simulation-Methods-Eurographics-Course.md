---
type: paper
created: 2026-10-11
updated: 2026-10-11
tags: [paper, fluid-rendering, course-notes, multiphysics, fluid-simulation, granular, deformable, rigid-body, eurographics, cs.GR]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.09822
---

# Simulation Methods for Multiphysics Phenomena in Visual Computing (EUROGRAPHICS 2026 Course Notes)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Simulation Methods for Multiphysics Phenomena in Visual Computing |
| **作者** | Fabian Löschner, Stefan Rhys Jeske, José Antonio Fernández-Fernández, Jan Bender |
| **发表** | EUROGRAPHICS CGF (2026), arXiv:2610.09822 [cs.GR], 2026-10-08 |
| **链接** | [arXiv](https://arxiv.org/abs/2610.09822) |
| **类型** | Course Notes / Tutorial（教学/综述） |

---

## 核心贡献

> 一份**面向图形学社区**的多物理场仿真综述课程笔记：涵盖刚体、可形变体、**流体**、**颗粒材料**及其相互作用的数学基础、关键算法与软件框架。是当前 SIGGRAPH/Eurographics 多物理场仿真方法的最完整教学材料。

1. **数学基础**：每个方法的底层数学框架、详细推导
2. **跨材料耦合策略**：刚体-流体、流体-可形变体、可形变-颗粒、流-固-粒三相耦合
4. **软件框架概览**：Taichi / Bullet / PhysX / Houdini / Blender 等 out-of-the-box 多物理场实现
5. **趋势章节**：ML-based physics simulation 的最新方向

---

## 技术方案

### 覆盖的多物理场类别

| 类别 | 主要方法 | 代表论文 |
|------|----------|----------|
| 刚体 | 接触力学、LCP、罚函数 | Bullet / PhysX / Drake |
| 可形变体 | FEM / MPM / XPBD / Position-Based | Arc-Length, Projective Dynamics |
| **流体** | Eulerian / Lagrangian / SPH / FLIP / PIC | MantaFlow, Mantaflow, Stable Fluids |
| **颗粒材料** | DEM / MPM 颗粒模式 / SPH 颗粒 | Bullet DEM, Taichi MPM |
| 多体耦合 | FLIP-FEM, MPM-MPM, SPH-FEM | 多篇综述与近期工作 |

### 流体部分典型章节（推断自摘要）

- 不可压缩 Navier-Stokes 求解（Eulerian 网格、MAC 网格）
- Lagrangian 方法（FLIP / PIC / APIC）
- SPH
- **多相流**（液-气、液-液）
- **自由表面流体**（level set / volume of fluid）
- 流体-刚体、流-粒耦合

### 软件框架速览

| 框架 | 主要应用 |
|------|----------|
| **Houdini** | 工业 VFX，多物理场统一节点图 |
| **Blender Mantaflow** | 开源多物理场（流体+粒子+烟雾+火焰+刚体） |
| **MantaFlow** | 研究/工业烟火焰水流 |
| **Taichi** | 高性能可微分多物理场 |
| **Bullet / PhysX** | 实时游戏引擎物理 |
| **Drake** | 机器人控制优化 |

---

## 与流体渲染的关系

- **教学/方法论核心**：是面向"流体渲染"研究人员的**多物理场仿真基础手册**
- 覆盖了渲染所需的全部前置物理：
  - 烟 → Eulerian 流体 + 体积渲染
  - 水 → 自由表面流体 + 表面渲染（反射/折射/SSS）
  - 火 → 反应流 + 黑体辐射
  - 飞溅/泡沫 → SPH 颗粒 + 表面张力
  - 多相耦合 → 流体-颗粒、流-固
- **新兴趋势章节**：ML-based physics（神经算子、神经 surrogate、扩散模型驱动流体）
- **强烈推荐作为参考手册**：写新论文时需要的物理基础综述

---

## 实验结论（非论文，是综述）

- 提供完整 reference 列表与软件框架对比
- 详细推导数学框架
- 讨论不同材料与耦合策略如何融入统一框架

---

## 局限性

- 是综述/教程，不提出新方法
- 内容广但不够深——每个具体方法仍需查询原始论文
- 偏方法论，对**渲染**端的讨论较少（主要聚焦仿真）

---

## 相关工作

- [[NVIDIA-GPU-Gems-Fluids]]
- [[MantaFlow-Documentation]]
- [[Stable-Fluids-Stam]]
- [[FLIP-Fluids-Bridson]]
- [[MPM-Material-Point-Method]]
- [[SPH-Müller]]
- [[Houdini-Fluids-Vellum]]
- [[Taichi-MPM]]
- [[Neural-Fluid-Surrogate-Survey]]

---

## 实现建议

- **实现难度**：N/A（综述）
- **预期性能**：N/A
- **适用场景**：作为方法论参考手册；新人入门；选择仿真技术栈时的决策依据
- **推荐度**：✅✅（强烈推荐——综述类教程是流体渲染方向研究人员必备的方法论词典）