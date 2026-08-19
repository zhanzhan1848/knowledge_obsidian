---
title: "Modelling flow-driven pore closure of weakening poroelastic media"
arxiv: "2608.17581"
date: 2026-08-19
tags: [poroelasticity, multi-physics, pore-closure, solute-transport, CFD, finite-deformation]
categories: [poroelasticity, multi-phase-flow]
---

# Modelling Flow-Driven Pore Closure of Weakening Poroelastic Media

## 论文信息
- **arXiv**: [2608.17581](https://arxiv.org/abs/2608.17581)
- **Subjects**: Fluid Dynamics (physics.flu-dyn); Soft Condensed Matter (cond-mat.soft)
- **状态**: 投稿至 Journal of Fluid Mechanics
- **关键词**: poroelasticity, pore closure, solute transport, weakening, multi-physics coupling

## 核心创新点

### 问题背景
- 多孔弹性材料（聚合物组织支架、多孔岩石、水凝胶）
- 固体骨架与孔隙流体中化学物种的相互作用导致材料弱化
- 孔隙闭合对材料性能有重要影响

### 三向耦合模型
1. **大变形多孔弹性** - 固体骨架的力学响应
2. **溶质输运** - 对流-扩散方程描述溶质传输
3. **材料弱化** - 刚度衰减方程，衰减速率依赖于溶质浓度

### 关键发现
三种参数 regimes:
1. **稳态无孔隙闭合**: 系统达到稳态但无孔隙闭合
2. **有限时间孔隙闭合**: 引入弱化后出现的新行为
3. **瞬时孔隙闭合**: 孔隙立即闭合

### 分析方法
- 数值和解析技术结合
- 时间尺度分离分析（小参数展开）
- 孔隙闭合时间近似公式推导

## 数值方法
- 大变形多孔弹性理论
- 对流-扩散-反应耦合求解
- 参数敏感性分析

## 物理机制
- 流动驱动的单轴压缩
- 溶质依赖的刚度衰减
- 流动与弱化耦合效应

## 应用场景
- 组织工程支架降解
- 岩石孔隙演化
- 药物递送材料设计

## 评估
- ⚠️ 谨慎：理论模型为主，具体CFD数值实现细节较少
- 对于理解多孔材料中孔隙闭合机制有重要价值
