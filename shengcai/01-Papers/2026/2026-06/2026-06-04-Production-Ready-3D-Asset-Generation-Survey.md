---
title: From Visual Synthesis to Interactive Worlds: Toward Production-Ready 3D Asset Generation
authors: Jiafeng Wu, Zhuofan Lou et al.
date: 2026-06-04
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.23629
pdf: https://arxiv.org/pdf/2604.23629
tags: [rendering, 3D-generation, survey, real-time, PBR, topology, UV, rigging]
status: unread
---

# From Visual Synthesis to Interactive Worlds: Toward Production-Ready 3D Asset Generation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | From Visual Synthesis to Interactive Worlds: Toward Production-Ready 3D Asset Generation |
| 作者 | Jiafeng Wu, Zhuofan Lou et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.23629) |
| PDF | [下载](https://arxiv.org/pdf/2604.23629) |

## 核心贡献
1. 首个系统性梳理"production-ready 3D content generation"的综述
2. 以资产生产流水线为组织维度，而非算法家族
3. 横向：区分三类资产（general objects, characters, scenes）
4. 纵向：追踪每个层级完整生命周期（几何合成→拓扑优化→UV展开→PBR外观→绑定→场景组装）
5. 综合评估指标：几何保真度、外观质量、资产可用性、场景级物理 plausibility

## 技术方案
**Two-dimensional Taxonomy**:
- **Horizontal Axis**: Asset tiers (general objects → characters → scenes)
- **Vertical Axis**: Production lifecycle
  1. Data foundations & geometry synthesis
  2. Topology optimization
  3. UV unwrapping
  4. PBR appearance
  5. Rigging
  6. Scene assembly

**Evaluation Metrics**:
- Geometric fidelity
- Appearance quality
- Asset usability
- Scene-level physical plausibility

## 开放挑战
1. Data quality
2. Generation controllability
3. End-to-end assetization
4. Physically grounded generation

## 局限性
- 综述性质，无直接算法贡献
- 面向交互式应用，与离线渲染场景有别

## 可行性分析
- 实现难度：不适用（综述论文）
- 性能预期：不适用
- 适用场景：技术调研、方向规划、参考框架

## 相关工作
- [[2026-06-04-AssetGen-Deployable-3D-Asset-Generation]]
- [[2026-04-10-RealTime-3DGS-Edge-GPU-Tradeoffs]]