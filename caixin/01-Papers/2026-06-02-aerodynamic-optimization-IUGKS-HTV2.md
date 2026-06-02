---
type: paper
created: 2026-06-02
updated: 2026-06-02
tags: [aerodynamic-optimization, surrogate-based-optimization, IUGKS, hypersonic-vehicle, HTV-2, multiscale-flow, rarefied-flow]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.00645
---

# Surrogate-Based Aerodynamic Shape Optimization in Multiscale Flows via the Implicit Unified Gas-Kinetic Scheme

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Surrogate-Based Aerodynamic Shape Optimization in Multiscale Flows via the Implicit Unified Gas-Kinetic Scheme |
| **作者** | Xiaozhe Xi, Wenpei Long, Wenzhi Guo, Junzhe Cao, Kun Xu |
| **发表** | arXiv 2026-06-02 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2606.00645) |
| **DOI** | 10.48550/arXiv.2606.00645 |
| **代码** | - |

---

## 核心贡献

> 针对高超声速滑翔飞行器 (HTV-2) 的多尺度流动气动外形优化

1. 将代理优化 (SBO) 与隐式统一气体动力学格式 (IUGKS) 耦合
2. 引入体积约束和压力中心约束
3. 分析不同高度 (70-100 km) 下的最优气动策略
4. 揭示流动稀薄度与气动主导参数的关系

---

## 技术方案

### 核心思想

针对连续介质假设失效的高稀薄度流动，使用 IUGKS 进行多尺度 CFD 求解，结合代理优化实现气动外形自动化设计。

### 关键几何参数

| 参数 | 描述 |
|------|------|
| R₁ | 迎风面半径 (windward radius) |
| R₂ | 翼尖钝度 (wingtip bluntness) |
| R₃ | 背风面半径 (leeward radius) |

### 优化结果

- **L/D 提升**: 70-100 km 高度范围内显著增加
- **最优策略随高度变化**:
  - 70 km: 减小 R₁ 减弱斜激波
  - 高稀薄度: 减小 R₃ 增强膨胀波
  - R₂ 减小对整个飞行包线一致有利

---

## 关键发现

1. **气动主导参数转移**: 随流动稀薄度增加，气动主导从 R₁ 转向 R₃
2. **翼尖钝度效应**: 减小 R₂ 在整个飞行包线内一致有利
3. **优化几何趋势**: 趋向更扁平、更细长的外形

---

## 数值方法

| 方法 | 类型 |
|------|------|
| IUGKS | 隐式统一气体动力学格式 |
| SBO | 代理优化 (Surrogate-Based Optimization) |
| 流动稀薄度 | 跨越连续介质到自由分子流 |

---

## 局限性

- 优化约束条件相对简化
- 未考虑非稳态效应

---

## 相关工作

- [[HTV-2 Hypersonic Vehicle]]
- [[Implicit Unified Gas-Kinetic Scheme]]
- [[Aerodynamic Shape Optimization]]
- [[Rarefied Flow CFD]]

---

## 实现建议

- **实现难度**: 高
- **预期性能**: 需针对稀薄流场调参
- **适用场景**: 高超声速飞行器设计、再入飞行器优化