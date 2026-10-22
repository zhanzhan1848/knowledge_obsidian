---
type: paper
arxiv_id: 2610.29867
title: "Swarmlet: a GPU-resident reformulated vortex particle method for coupled multirotor aerodynamics and flight dynamics"
date: 2026-10-21
cats: [math.NA, physics.flu-dyn]
tags: [vortex-particle-method, LES, eddy-viscosity, actuator-line, 6DOF, GPU, swarm]
agent: caixin
status: processed
---

# Swarmlet: GPU 常驻 reformulated vortex particle method

- **arXiv**: [2610.29867](https://arxiv.org/abs/2610.29867) (v1, 2026-10-21 15:23 UTC)
- **作者**: Wyatt James Horne
- **链接**: https://arxiv.org/abs/2610.29867

## 内容

单/多旋翼飞行器非定常气动与飞行动力学的 GPU 求解器。

- **尾流**：无网格、演化核的涡粒子场，基于 **rVPM（reformulated VPM）** 大涡格式
- 粒子携带**紧支撑光滑核**：核外 4 个核半径处场**精确等于奇异 Biot–Savart 场**，因此 treecode 的多极远场**无正则化误差**（这是关键设计——常规 VPM 的 Gaussian 核在多极展开处引入 O(core) 误差）
- **亚滤波闭合**：固定滤波宽度上的动态涡粘，通过核扩散施加，带**显式稳定界**下的 Lagrangian excess 交换，强度经投影松弛；全局修正保证交换与松弛**守恒总涡量与线性冲量**
- **旋翼模型**：三级保真度（actuator-line / blade-element 类），每步沿扫掠弧（不论多长）连续脱落束缚环量，故尾流获得升力冲量
- 耦合 6-DOF 刚体与飞控

## 验证结果

| 检验 | 结果 |
|------|------|
| 与直接求和（direct summation）一致性 | $5\times10^{-7}$ |
| 时间收敛阶 | 三阶 |
| DJI 9443 螺旋桨悬停推力（**无标定**） | 误差 < 2% |
| Crazyflie 螺旋桨推力/扭矩（3 个转速，已标定翼型极曲线） | 误差 < 3.2% |
| 悬停四旋翼近尾流 vs PIV | 相对 $L^2$ 差 0.08–0.21 |
| 100 架四旋翼闭环编队 | 单 GPU，粗设置下完成 |

## 🥢 流体力学视角评述

- "核外 4 核半径精确等于奇异 Biot–Savart" 这一条是本方法最有价值的数值设计：把**卷积核的近场精确性**和**远场多极效率**解耦，是标准 VPM 常见误差来源的根治方案。
- 动态涡粘 + 显式稳定界 + Lagrangian excess 交换 + 投影松弛 + 全局守恒修正，五件套齐全的 subgrid closure，工程可信度高。
- 多体/群体（swarm）尺度闭合到 6-DOF 与飞控，意味着可以直接做**编队尾流相互作用**的气动控制研究。
- ⚠️ 待确认：粒子核分裂（core-splitting）策略细节；跨 GPU 通信的尾流远场策略。

## 关联

- [[2026-10-22-DiffVortex-quantum-inspired-vortex-solver]]
- [[vortex-method]] [[LES-subgrid-model]]
