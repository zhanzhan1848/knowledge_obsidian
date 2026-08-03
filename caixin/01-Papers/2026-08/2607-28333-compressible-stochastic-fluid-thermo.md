---
title: Compressible solved-volatility stochastic fluid thermodynamics: source-consistent energy, finite-correlation reservoirs, entropy admissibility and boundary conditions
arxiv: 2607.28333
authors: Hsieh-Chen Tsai
date: 2026-07-30
category: turbulence-modeling
tags: [turbulence, stochastic-closure, compressible-NS, stochastic-transport, entropy, thermodynamic]
journal: physics.flu-dyn
---

# Compressible solved-volatility stochastic fluid thermodynamics

## 核心创新点

将[[2607.25536]]的可变密度热力学扩展到**可压缩流动**，建立完整的**随机输运理论**。

### 主要贡献

1. **源项一致随机输运**：质量、动量、总能量分离为时变PDE+martingale兼容性约束
2. **原始热力学场**：密度ρ和温度T为原始场
   - 质量守恒→密度演化
   - 内能→温度演化
   - 状态方程→压力演化
3. **有限相关库**：Green-Kubo校准
4. **随机Gibbs恒等式**：熵容许性证明
5. **压力波动区分**：状态方程压力波动 vs 机械应力脉冲

## 关键方程

### 守恒方程
- **质量守恒**：密度演化
- **动量守恒**：随机输运形式
- **能量守恒**：总能量分解

### 湍流统计
- 发展的湍流统计
- 对数壁面标度
- CFD验证（待完成）

## 极限情况

**零波动极限** → 经典可压缩Navier-Stokes-Fourier方程

## 系统结构

**混合双曲-抛物型漂移子系统** + 代数martingale约束
- 闭合依赖椭圆块
- **奇异低马赫压力极限**

## 数值验证

- 压力载体验证
- 声波色散
- 粘性-热能平衡
- 低马赫标度

## 链接

- PDF: https://arxiv.org/pdf/2607.28333
- HTML: https://arxiv.org/html/2607.28333v1

## 评价

✅ **随机湍流封闭理论完整化** — 从[[2607.25536]]的单相不可压扩展到可压缩完整理论，是湍流随机封闭的重要里程碑
