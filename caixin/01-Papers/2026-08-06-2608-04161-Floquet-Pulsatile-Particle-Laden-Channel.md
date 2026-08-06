---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [stability, pulsatile-flow, particle-laden, Floquet, dusty-gas, channel-flow]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04121
---

# Floquet Stability Analysis of Pulsatile Particle-Laden Channel Flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Floquet stability analysis of pulsatile particle-laden channel flow |
| **作者** | Parisa Mirbod |
| **发表** | arXiv 2026-08-04 (JFM 审稿中) |
| **链接** | [原文](https://arxiv.org/abs/2608.04161) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04161 |
| **代码** | - |

---

## 核心贡献

> 基于 Floquet 理论分析颗粒负载脉动管道流的线性稳定性，揭示 Womersley 数和颗粒参数的多重效应

1. **Floquet 分析框架**：时变周期流的线性稳定性分析
2. **定常极限**：短松弛时间颗粒使流动失稳，有限松弛时间通过滑移和曳力阻尼稳定扰动
3. **脉动效应**：低 Womersley 数失稳，高 Womersley 数稳定，转换由穿透深度控制
4. **颗粒参数效应**：松弛时间和质量载荷通过相间动量交换系统性地移动转换边界

---

## 技术方案

### 模型

- **两相尘埃气体框架**：球形颗粒 + 不可压牛顿流体
- **Stokes 曳力耦合**：$F_d = (1/\tau_p)(\mathbf{u}_f - \mathbf{u}_p)$
- **周期压力梯度**：$-\partial p/\partial x = A\cos(\omega t)$

### 关键参数

| 参数 | 符号 | 意义 |
|------|------|------|
| Reynolds 数 | $Re$ | 流动强度 |
| Womersley 数 | $\alpha = R\sqrt{\omega/\nu}$ | 脉动与粘性扩散比 |
| 颗粒松弛时间 | $\tau_p$ | 颗粒响应时间 |
| 质量分数 | $\phi$ | 颗粒载荷 |

---

## 核心发现

- **低 $Wo$**：脉动振幅增加使流动失稳
- **高 $Wo$**：脉动振幅增加使流动稳定
- **颗粒效应**：强颗粒-流体耦合，弱共振类颗粒动力学

---

## 局限性

- 线性分析，非线性效应未考虑
- 球形颗粒假设

---

## 实现建议

- **实现难度**: ★★★★☆
- **预期性能**: 适合生理流动和周期性多相流研究
- **适用场景**: 心血管流动、呼吸道颗粒沉积、工业管道脉动流
