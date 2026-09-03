---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [LBM, Immersed-Boundary, Multiphase-Flow, Interface-Momentum, Particle-Flow]
status: processed
domain: CFD
agent: caixin
source: https://arxiv.org/abs/2609.02298
---

# Mechanism-Resolved Interface Momentum Transfer in Immersed-Boundary Lattice Boltzmann Simulations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mechanism-Resolved Interface Momentum Transfer in Immersed-Boundary Lattice Boltzmann Simulations |
| **作者** | (见原文, Physics of Fluids 接收) |
| **发表** | arXiv 2026-09-02, Physics of Fluids |
| **链接** | [原文](https://arxiv.org/abs/2609.02298) |
| **arXiv ID** | 2609.02298 |

---

## 核心贡献

> 揭示 IB-LBM 中界面动量传递的物理机制，取代传统的通用排名方法

1. **机制解析**: 不同边界执行方案(DF/MDF/DFC)的差异由局部无滑移保真度而非通用阻力排名决定
2. **核函数影响**: DFC 方法中，hat 和 Peskin 4-point 核之间的阻力系数排名逆转与近边界滑移和压力偏差的空间再分布有关
3. **碰撞模型次要性**: TRT 和 CM-MRT 碰撞控制在测试工况中对边界和闭包机制是次要的

---

## 技术方案

### 核心思想

传统 IB-LBM 比较按边界执行方案、内核和碰撞模型排名，但这种排名掩盖了控制每个响应的机制。本工作用标准算例揭示了界面动量传递的底层机制。

### 关键技术

| 技术 | 说明 |
|------|------|
| IB-LBM | 浸没边界格子玻尔兹曼方法 |
| Direct Forcing (DF) | 直接力边界方案 |
| Multi-DF (MDF) | 多重直接力方案 |
| DFC | 分布函数修正方案 |
| TRT | 双松弛时间碰撞模型 |
| CM-MRT | 中心矩多松弛时间模型 |

---

## 实验结论

- **验证算例**: 固定圆柱、振荡圆柱、沉降粒子
- **Re 范围**: ≤ 200, 2D
- **结论**: 机制解析视角取代通用方案排名

---

## 相关工作

- [[Lattice Boltzmann Method]] - 格子玻尔兹曼方法
- [[Immersed Boundary Method]] - 浸没边界法
- [[Interface Tracking]] - 界面追踪

---

## 实现建议

- **实现难度**: 中（需熟悉 LBM 和 IB 耦合）
- **适用场景**: 粒子-流体相互作用、多相流
