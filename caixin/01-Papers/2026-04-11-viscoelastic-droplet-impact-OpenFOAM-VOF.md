# 2604.07854 — 黏弹性液滴撞击：OpenFOAM VOF模拟

## 论文信息
- **arXiv**: [2604.07854](https://arxiv.org/abs/2604.07854) [physics.flu-dyn]
- **提交**: Thu, 9 Apr 2026
- **PDF**: [pdf](https://arxiv.org/pdf/2604.07854)
- **Subjects**: Fluid Dynamics (physics.flu-dyn)

---

## 核心创新点

### 🎯 科学问题
黏弹性液滴撞击固体表面的动力学行为在 inkjet printing、spray coating、microfluidics 中具有重要应用。如何精确控制铺展、回缩和反弹是关键挑战。

### 💡 关键创新
1. **3D高保真VOF求解器**: 基于 OpenFOAM
2. **Log-conformation formulation**: 提高数值稳定性（聚合物应力对数构型）
3. **速度相关动态接触角模型**: 精确捕捉润湿动力学
4. **黏弹性+毛细-重力耦合**: Oldroyd-B模型 + Weber/Eötvös数分析

### 🔬 物理参数
| 参数 | 值 |
|---|---|
| 液滴直径 | 2 cm |
| 撞击速度 | 4 m/s |
| 表面张力 | 0.05–0.15 N/m |
| 松弛时间 | 0.02–0.12 s |

---

## 数值方法

### 求解器
- **框架**: OpenFOAM (VOF方法)
- **界面追踪**: Volume of Fluid (VOF)
- **黏弹性本构**: Oldroyd-B
- **构型**: Log-conformation representation
- **接触角**: 速度依赖动态模型

### 关键发现
- Relaxation time从0.02s增至0.12s → 弹性储能增加
  - 最大铺展直径增加 **12.9%**（24.97mm → 28.09-28.17mm）
  - 最小液滴高度降低 **16.6%**
- 表面张力从0.05增至0.15 N/m → 最大铺展降低约1.1%

### 润湿性对比
- **均匀表面**: 对称铺展
- **杂交表面** (0°/160°): 显著不对称铺展 + 定向流体迁移
- 最终形态: "dustpan-like" and "shoe-like"

---

## 控制方程

### 连续性方程
∇·u = 0

### 动量方程
∂u/∂t + (u·∇)u = -∇p/ρ + ν∇²u + (1/ρ)∇·τ

### Oldroyd-B本构方程
τ + λτ̇ = η_p(∇u + (∇u)^T) + λ[τ·∇u + (∇u)^T·τ]（简化形式）

---

## 软件工具
- [[OpenFOAM]]
- [[VOF method]]
- [[Log-conformation]]
- [[Oldroyd-B model]]

## 研究方向
- [[Viscoelastic droplet impact]]
- [[Dynamic contact angle]]
- [[Multi-phase flow]]
- [[Wettability contrast]]

---
*由 [[鲜毛肚]] 自动提取 | 2026-04-11*
