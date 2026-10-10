---
title: "Simulation Methods for Multiphysics Phenomena in Visual Computing"
date: 2026-10-07
tags: [fluid-rendering, multiphysics-simulation, course-notes, eurographics-2026]
authors: [Fabian Löschner, Stefan Rhys Jeske, José Antonio Fernández-Fernández, Jan Bender]
paper_id: 2610.09822
subject: cs.GR
venue: Eurographics 2026 (State of the Art Course)
status: reviewed
doi: 10.2312/egt.20261002
---

## 核心创新点

### 问题定义
为计算机图形学社区提供**多物理仿真方法**的综合性教程，覆盖：
- 刚体（rigid bodies）
- 变形体（deformable bodies）
- **流体（fluids）** ⭐ 核心
- 颗粒材料（granular materials）
- 以及它们之间的**耦合策略**

### 课程章节（推测）
1. 数学基础与符号系统
2. 刚体仿真方法（碰撞检测、Lagrangian 动力学）
3. 变形体仿真（质点弹簧、PBD、FEM）
4. **流体仿真（⭐）**
   - Eulerian：网格流体（Navier-Stokes 求解）
   - Lagrangian：SPH、PIC/FLIP、MPM
   - 混合方法：APIC、PolyPic
5. 颗粒材料仿真（DEM）
6. **耦合方法**：
   - 流体-刚体
   - 流体-变形体
   - 流体-颗粒
7. 软件框架综述
8. 机器学习方法在多物理仿真中的应用

## 渲染技术

### 流体渲染相关内容
- **仿真输出可视化**：如何将仿真结果（密度场、速度场）转化为可视图像
- **粒子到表面重建**：从 Lagrangian 粒子重建网格（Marching Cubes、SDF 提取）
- **体积渲染**：体素流体密度场的直接体积渲染
- **次表面散射**：流体（特别是水/玻璃）的次表面散射

### 性能预期
- 实时流体仿真：稳定 30-60 FPS（简化方法）
- 离线流体仿真：高质量（高分辨率 + 长时间序列）

## 实现建议

### 推荐学习方法
- **理论先行**：先理解 Navier-Stokes 方程与离散化方法
- **框架实战**：用 Taichi/PBD 等现代框架验证理论
- **开源代码**：参考 MantaFlow、Blender Mantaflow 实现

### 推荐软件框架
| 类别 | 框架 | 适用场景 |
|------|------|----------|
| 通用 | Bullet / PhysX | 刚体（耦合流体） |
| 流体 | MantaFlow | 离线/实时流体 |
| 多物理 | Taichi | 高性能多物理 |
| 变形体 | SOFA | 实时变形体 |
| 实时 | PBD / XPBD | 实时流体-刚体耦合 |

## 适用场景

### 离线应用
- 电影 VFX：水、烟、火、爆炸、泥浆
- 建筑设计：风环境模拟、洪水分析
- 工业仿真：多相流反应器

### 实时应用
- 游戏：可交互流体、刚体破坏
- VR/AR：实时流体交互
- 数字孪生：物理仿真可视化

## 与流体渲染知识库其他笔记的关系

- **[[MPM-MLS-Paper]]**：MPM 方法在多物理统一框架中扮演重要角色
- **[[VersaGauss]]**：3DGS 多相动力学的具体实现
- **[[Fluid-Gen-Zero]]**：神经-物理混合管线的最新尝试
- **[[SPH-Tutorial]]**：Lagrangian 流体方法的基础

## 资源链接

- **课程页**: https://doi.org/10.2312/egt.20261002
- **arXiv**: https://arxiv.org/abs/2610.09822
- **作者主页**: Jan Bender（多物理仿真领域权威）

## 教学价值

> 这是 CG 多物理仿真的**系统性入门到进阶教程**，适合作为：
> 1. 研究生课程的参考材料
> 2. 工业界工程师的方法论手册
> 3. 学习从单一物理到耦合物理的进阶读物

## 后续追踪

- Eurographics 2026 会议演讲时间（2026 年 4-5 月）
- 配套幻灯片与代码仓库是否公开
- 是否有续作或扩展（机器学习方法专章）

---
*🌱 豆苗收集于 2026-10-10*
*整理自 Eurographics 2026 课程笔记*
