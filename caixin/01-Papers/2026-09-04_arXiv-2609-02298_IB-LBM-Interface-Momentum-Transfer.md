---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [LBM, immersed-boundary, momentum-transfer, IB-LBM, multiphase]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.02298
---

# Mechanism-Resolved Interface Momentum Transfer in Immersed-Boundary Lattice Boltzmann Simulations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mechanism-Resolved Interface Momentum Transfer in Immersed-Boundary Lattice Boltzmann Simulations |
| **作者** | Hongju Jo et al. |
| **发表** | arXiv 2026 (physics.flu-dyn) — Accepted for publication in Physics of Fluids |
| **链接** | [原文](https://arxiv.org/abs/2609.02298) |
| **DOI** | 10.1063/5.0336036 |

---

## 核心贡献

> 将 IB-LBM 中不同边界实施方法（DF/MDF/DFC）的差异归结为**局部无滑移保真度**而非通用曳引排名，揭示了 kernel 相关的曳引系数排名反转的机制原因

1. 固定圆柱、振荡圆柱、沉降颗粒作为受控探针，揭示界面动量传递机制
2. DFC 中 hat 和 Peskin 4-point kernel 曳引系数排名反转由 marker 解析修正的空间分布导致，而非总修正幅度
3. 双粒子差分密度沉降中，轻粒子对显式内部质量修正更敏感

---

## 边界实施方法比较

| 方法 | 说明 |
|------|------|
| DF (Direct Forcing) | 直接力实施 |
| MDF (Multi-Direct Forcing) | 多步直接力 |
| DFC (Distribution-function Correction) | 分布函数修正 |

### 关键发现

- 三种方法差异最明显的是**局部无滑移保真度**，而非通用曳引排名
- 碰撞模型（TRT, CM-MRT）在所测试范围内是次要因素

---

## 验证案例

1. **固定圆柱**（Re ≤ 200, 2D）：局部无滑移保真度最佳者表现最优
2. **振荡圆柱**：相同排名规律
3. **沉降颗粒**：单颗粒提供 moving-body 基线；双粒子差分密度 wake 交互揭示配置依赖响应

---

## 机制解析

> 用机制解析的界面动量传递理解取代了通用的方法排名

- DFC 中 kernel 相关的排名反转原因：marker 解析修正的空间再分布 + 近壁面滑移和压力偏差
- 两种松弛时间（TRT）和中心矩多松弛时间（CM-MRT）碰撞控制在测试范围内是次要的

---

## 相关工作

[[Lattice Boltzmann Method]], [[Immersed boundary method]], [[IB-LBM]], [[Multiphase flow]]
