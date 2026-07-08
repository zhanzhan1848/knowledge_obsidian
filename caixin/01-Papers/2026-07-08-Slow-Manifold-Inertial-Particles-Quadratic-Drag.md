---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [fluid-dynamics, inertial-particles, slow-manifold, quadratic-drag, dynamical-systems]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2607.05664
---

# Slow Manifold Reduction for Inertial Particles with Quadratic Drag

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Slow Manifold Reduction for Inertial Particles with Quadratic Drag |
| **作者** | - |
| **发表** | arXiv 2607.05664v1, 2026-07-07 |
| **链接** | [原文](https://arxiv.org/abs/2607.05664) |

---

## 核心贡献

> 解决高雷诺数二次曳力惯性粒子慢流形简化的难题，利用 blowup 方法证明临界流形的持久性

1. **线性曳力** (低雷诺数) 已知存在吸引不变慢流形（法超双曲临界流形的扰动）
2. **二次曳力** (高雷诺数) 临界流形不再是法超双曲，其持久性是开放问题
3. 通过 **blowup 方法** 将运动方程变换到广义加权柱坐标系，消除临界流形上的奇异性
4. 证明临界流形在足够小扰动下持久，推导任意精度下的简化运动方程

---

## 技术方案

### 核心思想

惯性粒子在非稳态流场中的动力学：低雷诺数下曳力与相对速度线性相关，高雷诺数下与相对速度二次相关。后者的临界流形不再是法超双曲，blowup 方法可解此奇异性。

### 关键技术

| 技术 | 说明 |
|------|------|
| Blowup Method | 广义加权柱坐标变换 |
| Slow Manifold Reduction | 慢流形简化 |
| Normally Hyperbolic | 法超双曲性分析 |
| Quadratic Drag | 二次曳力（高雷诺数） |

### 数学框架

- 运动方程变换到广义加权柱坐标系
- 在临界流形上消奇异性
- 持久性证明：任意小扰动下临界流形存在
- 简化方程的渐近展开和收敛速率

---

## 验证示例

- 两个示例验证慢流形简化的有效性
- 展示在粒子沉积、悬浮等场景的应用

---

## 局限性

- 理论结果为存在性证明
- 收敛半径有限
- 实际计算需进一步开发数值方法

---

## 相关工作

- [[Inertial particles]]
- [[Blowup method]]
- [[Slow manifold]]
- [[Quadratic drag law]]
- [[Particle-turbulence interaction]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐⭐ 高 (需动力系统理论)
- **适用场景**: 气溶胶动力学、粒子沉积、云微物理、工业喷雾
