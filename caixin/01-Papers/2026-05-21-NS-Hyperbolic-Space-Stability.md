---
type: paper
created: 2026-05-21
updated: 2026-05-24
tags: [Navier-Stokes, hyperbolic-space, global-stability, PDE, mathematical-fluid-dynamics]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2605.22212v1
---

# Global exponential stability for the three-dimensional Navier-Stokes equations on hyperbolic space

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Global exponential stability for the three-dimensional Navier-Stokes equations on hyperbolic space |
| **作者** | Zhi-Wei Wang |
| **发表** | arXiv (math-ph, math.AP, math.DG, physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2605.22212v1) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 证明双曲3空间 $\HH^3$ 上三维不可压缩 Navier-Stokes 方程 (带变形 Laplacian) 在足够小初始数据下存在唯一整体 mild 解且指数衰减。

1. **指数稳定性**: 在双曲空间 $\HH^3$ 上，N-S 方程解指数衰减到零
2. **衰减率**: $\mu \lambda_\Def^{(3)}$，其中 $\lambda_\Def^{(3)} = 26/9$ 是 $L^3$ 中变形 Laplacian 的有效谱间隙
3. **与平坦空间的对比**: 在平坦 $\R^3$ 上，相应的 Kato 型结果仅给出代数衰减
4. **曲率的贡献**: 负曲率提供的谱间隙导致指数稳定性

---

## 技术方案

### 关键发现

1. **$L^2$ 范数的超临界性**: 在 $\HH^3$ 上与 $\R^3$ 相同，由局部紫外尺度热核标度决定
2. **Fujita-Kato 积分的标度指数**: $1/2 - 3/(2p)$，仅取决于初始数据的可积性，不依赖几何
3. **临界情况**: 
   - $p \geq 3$ (Kato 临界空间): 积分有界，谱间隙贡献指数时间衰减
   - $p < 3$: 积分在 $t=0$ 发散，$p \le 2$ 时对所有 $t>0$ 严格发散

### 曲率的作用边界

- 曲率能改善什么: 整体正则性和指数稳定性
- 曲率不能改善什么: Fujita-Kato 积分的临界标度

---

## 相关工作

- [[Navier-Stokes-theory]]
- [[hyperbolic-geometry]]
- [[PDE-stability]]

---

## 实现建议

- **实现难度**: N/A (纯理论分析)
- **适用场景**: 流体力学数学理论、几何分析

---

## 备注

- 7 页