---
type: paper
created: 2026-04-09
updated: 2026-04-09
tags: [paper, turbulence, passive-scalar, space-time-correlation, kraichnan-model, scalar-transport]
status: processed
domain: turbulence-modeling
agent: caixin
source: https://arxiv.org/abs/2604.07052
---

# Space-time correlations of passive scalars in colored-noise flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Space-time correlations of passive scalars in colored-noise flows |
| **作者** | Long Wang, Guowei He |
| **发表** | arXiv 2026-04-08 (Submitted to Phys. Rev. E) |
| **链接** | [原文](https://arxiv.org/abs/2604.07052) / [PDF](https://arxiv.org/pdf/2604.07052) |
| **DOI** | 10.48550/arXiv.2604.07052 |

---

## 核心贡献

> 在惯性-对流子区间推导了有色噪声速度场中被动标量的时空关联解析解，验证椭圆近似(EA)模型

1. 推导了波数相关关联时间和幂律空间谱的高斯有色噪声速度场中被动标量的解析时空关联
2. 验证 EA 模型：等相关轮廓在共动参考系 $(r-U\tau, V\tau)$ 中自相似，通用空间-时间截距比 1.55
3. 同时恢复 Obukhov-Corrsin 标度（空间）和 random-sweeping 机制（时间）

---

## 物理背景

### Kraichnan 白噪声模型

经典 Kraichnan 模型假设速度为 $\delta$-关联（白噪声）：

```math
\langle \mathbf{u}_i(\mathbf{k}, \omega) \mathbf{u}_j(\mathbf{k}', \omega') \rangle \propto \delta(\omega + \omega')
```

→ 导致指数时间退关联，与实际湍流不符。

### 有色噪声扩展

本文考虑波数依赖的关联时间 $\tau(k)$ 和幂律空间谱：

```math
\langle \tilde{u}_i(\mathbf{k}, t) \tilde{u}_j(\mathbf{k}', t') \rangle \propto D(k) e^{-|t-t'|/\tau(k)} \delta(\mathbf{k}+\mathbf{k}')
```

---

## 关键结果

| 量 | 结论 |
|-----|------|
| 空间关联 | 恢复 Obukhov-Corrsin 标度 $E_\theta(k) \propto k^{-5/3}$ |
| 时间关联 | 高斯退关联（非指数），符合 random-sweeping 机制 |
| 时空比 | 通用截距比 $r/V\tau = 1.55$ |
| EA 模型 | 在共动系 $(r-U\tau, V\tau)$ 中自相似性成立 |

---

## 物理机制

```
时间退关联 = 大尺度扫掠（mean-flow advection）
     +
空间退关联 = 小尺度畸变（small-scale distortion）
```

---

## 相关工作

- [[Kraichnan model]] — 被动标量湍流经典模型
- [[Obukhov-Corrsin scaling]] — 惯性子区标量谱
- [[Random sweeping]] — 随机扫掠机制
- [[Elliptic approximation]] — 椭圆近似模型

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ 高（解析推导为主）
- **适用场景**: 湍流标量输运理论、大气/海洋扩散建模

---

*📅 收集日期: 2026-04-09 | 来源: arXiv physics.flu-dyn*
