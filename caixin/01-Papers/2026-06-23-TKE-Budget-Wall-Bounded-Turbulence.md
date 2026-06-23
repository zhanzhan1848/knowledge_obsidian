---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [turbulence, TKE, wall-bounded, scaling, Kolmogorov, mixing-length]
status: processed
domain: turbulence-physics
agent: caixin
source: https://arxiv.org/abs/2606.23520
---

# Scaling Patch Analysis of Turbulent Kinetic Energy Budget Equation in Wall-Bounded Flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Scaling Patch Analysis of TKE Budget Equation in Wall-Bounded Turbulent Flows |
| **arXiv ID** | 2606.23520 |
| **作者** | Tie Wei |
| **领域** | physics.flu-dyn / turbulence |
| **链接** | [原文](https://arxiv.org/abs/2606.23520) \| [PDF](https://arxiv.org/pdf/2606.23520) |
| **提交** | 2026-06-22 |

---

## 核心贡献

> 将 scaling patch 方法应用于壁面湍流中湍动能 (TKE) 方程的分析，在不同区域识别出主导平衡和特征尺度，建立统一解释框架。

1. **Scaling Patch 方法**: 将 TKE 方程的平衡分解为多个特征区域（scaling patches）
2. **近壁区**: 粘性扩散 ≈ 耗散，厚度 ~ Kolmogorov 尺度
3. **内层**: TKE 产生峰值主导 → 传统内尺度律 (inner scaling)
4. **外层**: Prandtl 混合长模型推导 TKE 产生的特征尺度
5. **中尺度 (meso-scaling)**: 新引入的中间尺度，桥接内层和外层

---

## TKE 方程主导平衡

| 区域 | 主导平衡 | 特征尺度 |
|------|---------|---------|
| 粘性子层 (近壁) | 粘性扩散 ≈ 耗散 | $\eta_K$ (Kolmogorov) |
| 内层 (inner) | TKE 产生峰值主导 | $u_\tau, \delta_\nu$ |
| 缓冲层 | 粘性扩散 + 耗散 + 生产 | 混合作用 |
| 外层 | 混合长模型 | $\delta, U_\infty$ |
| 中间区域 | 新 meso-scaling 桥接内外 | - |

---

## 关键方程

### TKE 方程 (雷诺平均)

$$\frac{\partial k}{\partial t} = P_k - \varepsilon + T_\nu + T_p + \Pi$$

其中: $P_k$ = 产生项, $\varepsilon$ = 耗散, $T_\nu$ = 粘性扩散, $T_p$ = 压力-速度关联, $\Pi$ = 压力应变重分布

### Kolmogorov 尺度

$$\eta = \left(\frac{\nu^3}{\varepsilon}\right)^{1/4}, \quad u_\eta = (\nu\varepsilon)^{1/4}$$

---

## 物理意义

- **内层扩展**: 粘性扩散 + 耗散项分组 → 不同 Re 数下-collapse增强
- **Prandtl 混合长**: 外层 TKE 产生的特征尺度推导
- **Meso-scaling**: 首次系统提出，描述内外层间的连续过渡

---

## 推荐结论

✅ **推荐 — 湍流建模参考**

**理由**:
- 为 RANS/LES 模型提供理论支撑
- 不同区域的尺度律对壁面模型 (wall modeling) 有直接意义
- 统一解释了壁面湍流结构

---

## 相关工作

- [[2026-06-23-RANS-Flow-MRI-Assimilation|RANS Data Assimilation]]
- [[2026-06-23-Vertical-Velocity-Intermittency-Wall-Flows|Vertical Velocity Intermittency]]
