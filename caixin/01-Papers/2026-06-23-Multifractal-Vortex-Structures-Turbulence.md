---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [vortex, multifractal, turbulence, coherent-eddies, holder-exponent]
status: processed
domain: turbulence-physics
agent: caixin
source: https://arxiv.org/abs/2606.21484
---

# Multifractal Sets of Coherent and Incoherent Vortices in Turbulence

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Multifractal Sets of Coherent and Incoherent Vortices in Turbulence |
| **arXiv ID** | 2606.21484 |
| **作者** | Susumu Goto |
| **领域** | physics.flu-dyn, nlin.CD |
| **链接** | [原文](https://arxiv.org/abs/2606.21484) \| [PDF](https://arxiv.org/pdf/2606.21484) |

---

## 核心贡献

> 直接数值验证湍流的多分形理论 (Frisch & Parisi 1985)，提出直接估计特定 Hölder 指数 $h$ 对应涡旋结构的多分形维数 $D(h)$ 的方法。

1. **直接 $D(h)$ 估计方法**: 提出一种简单方法直接估计给定 Hölder 指数 $h$ 的涡旋结构的多分形维数
2. **实验验证**: 高雷诺数湍流模拟数据验证，$D(h)$ 与间接测量实验数据高度吻合
3. **涡旋层级结构**: $h \ll 1/3$ → 相干涡旋 (coherent eddies)，$h \gg 1/3$ → 无特征结构 (featureless)

---

## 多分形理论背景

Frisch & Parisi (1985) 提出湍流中速度奇异性满足：

$$\delta u(r) \sim r^h, \quad P(h) \sim r^{1-D(h)}$$

### 关键阈值: $h = 1/3$ (Kolmogorov)

| Hölder 指数 | 涡旋结构类型 | 物理特征 |
|------------|-------------|---------|
| $h \ll 1/3$ | 相干涡旋 (coherent eddies) | 层级结构，能量逆向传递 |
| $h \gg 1/3$ | 无特征结构 (incoherent) | 耗散级运动 |

---

## 方法

1. **DNS 数据**: 高雷诺数湍流直接数值模拟
2. **涡旋识别**: 基于速度梯度张量的某种标量（待补充）
3. **Hölder 指数估计**: 局部速度奇异性分析
4. **$D(h)$ 测量**: 盒计数法直接估计分形维数

---

## 推荐结论

✅ **推荐 — 湍流结构理论**

**理由**:
- 直接验证了经典多分形理论
- 相干/非相干涡旋的区分对涡旋方法 (vortex method)、涡识别算法有直接意义
- 为 LES 涡模型和 vortex Reynolds stress 模型提供理论依据

---

## 相关工作

- [[2026-06-23-Bi-stable-NES-VIV|BNES VIV]] (vortex method 应用)
- [[2026-06-23-TKE-Budget-Wall-Bounded-Turbulence|TKE Budget]]
