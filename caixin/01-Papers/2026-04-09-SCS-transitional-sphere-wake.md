---
type: paper
created: 2026-04-09
updated: 2026-04-09
tags: [paper, turbulence-transition, Tollmien-Schlichting, vortex, sphere-wake, coherent-structures]
status: processed
domain: turbulence-research
agent: caixin
source: https://arxiv.org/abs/2604.06965
---

# Solitary wave structure of transitional flow in the wake of a sphere

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Solitary wave structure of transitional flow in the wake of a sphere |
| **作者** | Lin Niu, Hua-Shu Dou, Changquan Zhou, Wenqian Xu |
| **发表** | Physics of Fluids 37, 014111 (2025) / arXiv 2026-04-08 |
| **链接** | [原文](https://arxiv.org/abs/2604.06965) / [PDF](https://arxiv.org/pdf/2604.06965) |
| **DOI** | 10.1063/5.0251193 |

---

## 核心贡献

> 在球体尾流过渡流中发现孤立波-like 相干结构 (SCS)，揭示其形成与演化机制

1. 发现在球体尾流过渡流中存在孤立波-like 相干结构（SCS）
2. 揭示 SCS 在 T-S 波阶段的形成，以及下游的长距离保持
3. 证明涡旋结构是 SCS 发展的结果而非原因

---

## 物理背景

### 已有研究

- SCS（soliton-like coherent structure）在过渡/湍流边界层中已被验证存在
- Niu et al. 前期工作发现球体尾流中也有 SCS

### 本研究问题

- SCS 的形成和行为机制尚未被充分理解
- SCS 与湍流过渡的关系（因果？并行？）

---

## 数值方法

- **方法**: 直接数值模拟 (DNS) — 4 个不同雷诺数
- **几何**: 二维/三维球体尾流
- **参数**: 雷诺数范围覆盖过渡区

---

## 主要发现

### 演化阶段

```
T-S 波阶段（早期）
    ↓
波包形式出现
    ↓
Reynolds 数增加
    ↓
速度间断点位置达到最大振幅
    ↓
T-S 波崩溃 + 3D 结构形成
    ↓
SCS 保持形状和振幅长距离传播
```

### SCS 特征

| 特征 | 描述 |
|------|------|
| 振幅保持 | 在长距离下游传播中保持形状 |
| 涡旋结构 | 位于 SCS 边界外围 |
| 高剪切层 | 围绕 SCS 边界分布 |

### 关键结论

- 涡旋结构是 SCS 发展的**结果**而非**原因**
- SCS 与边界层过渡流中观察到的现象具有相似性

---

## 局限性

- 二维模拟可能不完全代表三维流动
- 特定雷诺数区间的研究，外推性需谨慎

---

## 相关工作

- [[Tollmien-Schlichting wave]] — T-S 波
- [[Turbulence transition]] — 湍流过渡
- [[Solitary wave]] — 孤立波
- [[Coherent structures]] — 相干结构
- [[Sphere wake]] — 球体尾流

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐⭐ 高（DNS 大规模计算）
- **适用场景**: 湍流过渡理论、航空航天尾流研究

---

*📅 收集日期: 2026-04-09 | 来源: arXiv physics.flu-dyn | Journal: Physics of Fluids 2025*
