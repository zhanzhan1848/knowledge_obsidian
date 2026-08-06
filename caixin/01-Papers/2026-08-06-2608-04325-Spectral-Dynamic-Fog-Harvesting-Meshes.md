---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [fog-harvesting, droplet-capture, mesh-geometry, spectral-analysis, Eulerian-Lagrangian]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04325
---

# A Spectral-Dynamic Approach to Unraveling the Physics of Droplet Capture in Fog Harvesting Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A spectral-dynamic approach to unraveling the physics of droplet capture in fog harvesting meshes |
| **作者** | Ashoke De |
| **发表** | arXiv 2026-08-05 (Physics of Fluids 2026) |
| **链接** | [原文](https://arxiv.org/abs/2608.04325) |
| **DOI** | https://doi.org/10.1063/5.0341564 |
| **代码** | - |

---

## 核心贡献

> 提出频谱-动力学框架，揭示雾收集效率与速度脉动谱分布的内在关联

1. **频谱分析**：发现捕获效率不仅与速度脉动幅度相关，还与谱分布和持续性相关
2. **动态匹配参数**：$\Pi = \tau_{droplet}/\tau_{flow}$，当 $\Pi \sim O(1)$ 时捕获效率最高
3. **最优几何**：三角形网格（适度增强谱分布）优于弱/强局域化方案
4. **雾收集机理**：建立几何优化设计指南

---

## 技术方案

### 数值方法

- **Eulerian-Lagrangian 两向耦合模型**
- 粒径范围：2-40 μm
- 五种代表性网格几何

### 频谱分析

频率域分析：网格几何将脉动能量在孔隙和 obstruction 区域重新分配

### 关键参数

$$\Pi = \frac{\tau_{droplet}}{\tau_{flow}}$$

- $\Pi \sim 1$：持续 droplet-flow 相互作用，捕获效率最高
- $\Pi \ll 1$：过早 bypass，捕获不足
- $\Pi \gg 1$：强迫不足

---

## 网格几何比较

| 几何 | 谱特征 | 捕获效率 |
|------|--------|---------|
| 三角形网格 | 适度宽带增强 | 最高 |
| 窄带/强局域化 | 高度局域化 | 低 |

---

## 局限性

- 二维模拟为主
- 特定雾条件，通用性待验证

---

## 实现建议

- **实现难度**: ★★★☆☆
- **预期性能**: 为雾收集器设计提供机理指导
- **适用场景**: 干旱地区饮水收集、海岸雾气利用
