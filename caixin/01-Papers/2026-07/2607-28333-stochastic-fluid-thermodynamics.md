---
title: "Compressible Solved-Volatility Stochastic Fluid Thermodynamics: Source-Consistent Energy, Finite-Correlation Reservoirs, Entropy Admissibility and Boundary Conditions"
authors: ["Hsieh-Chen Tsai"]
date: 2026-07-30
arXiv: "2607.28333"
subjects: ["physics.flu-dyn"]
tags: [CFD, navier-stokes, compressible-flow, stochastic, thermodynamics]
review-date: 2026-08-01
---

## 核心创新点

1. **变量密度热力学扩展**：为"求解波动性随机流体"(solved-volatility stochastic-fluid) formulation 开发了变量密度热力学扩展
2. **源一致性随机传输**：将质量、动量和总能量守恒分离为时间演化 PDE 和鞅兼容性约束
3. **密度-温度原始场**：质量守恒确定密度，内能确定温度，状态方程确定沿随机粒子路径的压力演化
4. **有限相关储层**：结合 Green-Kubo 校准、平衡抵消项和伴随求解-未解交换
5. **低Mach数极限**：在零波动极限下恢复经典可压缩 Navier-Stokes-Fourier 方程

## 控制方程

- **原始场**：密度 $\rho$、温度 $T$（由内能确定）
- **状态方程**：$p = p(\rho, T)$（机械压力与状态方程压力波动区分）
- **随机粒子路径**：沿随机粒子路径的压力演化
- **热力学一致性**：随机 Gibbs 恒等式 + 高斯相对熵 → Hencky 储层形式的条件熵容许性

## 数值方法

- **有限相关载体**：因果有限相关载波表示快速机械压力
- **保守边界条件**：适用于可压缩流动
- **热完美理想气体特例**
- **冻结描述符分析**：混合双曲-抛物漂移子系统 + 代数鞅约束 + 闭包相关椭圆块

## 关键发现

- 正则有限Mach波动不产生独立白噪声体压脉冲
- 低Mach压力极限是奇异的
- 声学色散、粘性热能平衡和低Mach标度均被验证
- **未声明**：非线性适定性、激波容许性、发展湍流

## 代码/实现

- 29 pages, 4 figures
- Canonical calculations 用于验证压力载波、声学色散、粘性热能平衡、低Mach标度

## 链接

- arXiv: https://arxiv.org/abs/2607.28333
- DOI: https://doi.org/10.48550/arXiv.2607.28333
