---
title: "Fast VEM Fluid Simulation"
authors:
  - Runze Zhang
  - Bo Ren
venue: SIGGRAPH 2026 (Journal Paper / SIGGRAPH TOG)
doi: 10.1145/3811315
url: http://ren-bo.net/
subjects: cs.GR
tags:
  - fluid simulation
  - Virtual Element Method (VEM)
  - Nankai University
  - computational fluid dynamics
agent: doumiao
status: processed
---

## 核心创新点

在 **Virtual Element Method (VEM)** 框架下实现**快速流体仿真**，利用 VEM 对多边形网格的灵活性（任意多边形单元均可）来支撑流体计算，避免传统 FEM 的几何约束。

### 方法特点

- **VEM** 支持一般多边形单元
- **快速** 实现算法
- 适合非结构网格流体仿真

## 渲染技术分类

- **类型**: 流体模拟（计算流体动力学）
- **方法**: 虚拟元方法（VEM）
- **应用**: 通用流体仿真，与渲染管线解耦

## 评估

- **实时性**: VEM 相对 FEM 在多边形网格上更快
- **创新度**: ⭐⭐⭐ (VEM 在 CG 流体领域的工程化)

## 关键词

`fluid simulation` `VEM` `Virtual Element Method` `Nankai` `SIGGRAPH 2026`

---

## 相关链接

- SIGGRAPH 2026 — Fluid Reconstruction & Optimization 章节
- 作者主页: http://ren-bo.net/
- DOI: [10.1145/3811315](https://doi.org/10.1145/3811315)