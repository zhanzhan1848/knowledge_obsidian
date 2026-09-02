---
title: Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows
authors: Sinan Wang et al.
date: 2026-08-25
source: ACM TOG (SIGGRAPH Asia 2026)
url: https://arxiv.org/abs/2608.25203
pdf: https://arxiv.org/pdf/2608.25203
tags: [rendering, fluid-rendering, wave-simulation, free-surface, Hamiltonian, 2D-3D-coupling, ocean-rendering, paper, 2026, SIGGRAPH-Asia]
status: unread
---

# Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows |
| 作者 | Sinan Wang et al. |
| 来源 | ACM Transactions on Graphics (SIGGRAPH Asia 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.25203) |
| PDF | [下载](https://arxiv.org/pdf/2608.25203) |
| DOI | https://doi.org/10.1145/3842540 |

## 核心贡献
1. 提出基于**经典 Zakharov  formulation** 的非线性、色散 2D 波浪模型
2. **哈密顿结构**确保 2D 表面标高和表面势作为规范对 ($η$, $ψ$)，实现与 3D 求解器的规范一致双向耦合
3. 在 2D-3D 界面处消除可见接缝伪影
4. 速度提升 10³× 比 BEM，离散 Kelvin 尾迹测试验证

## 技术方案

**问题**：大规模自由表面水体模拟通过将局部 3D 流体求解器耦合到更便宜的 2D 表面模型实现高效。但图形学中高效的 2D 波浪模型通常是线性或非色散的，与强非线性 3D 求解器耦合时在 2D-3D 接口产生明显反射和伪影。

**方法 — Zakharov  formulation 的 2D 波浪模型**：

哈密顿结构：表面标高 $η$ 和表面势 $ψ$ 形成规范对，受波能控制：
$$H = \int \frac{1}{2}|∇ψ|^2 + \frac{g}{2}η^2 + \frac{1}{2}∫(∇ψ)^2 η + \frac{1}{2}(∇η·∇ψ)^2 dA$$

该结构确保与 3D Navier-Stokes 求解器的规范一致双向耦合。

**2D 求解器优势**：
- 比 SWE、BEM、Airy 基线均方波高误差降低 1.7~5×
- 比 BEM 快 10³× 以上
- 更高非线性精度和耦合保真度

**与 3D NS 求解器耦合**：
- 抑制 Kelvin 尾迹测试中跨多种实验配置的可见解缝伪影
- 比纯 GPU NB-FLIP 模拟快 4× 以上

**色散匹配**：非线性色散 2D 模型与 3D 求解器的色散特性对齐。

## 实验结论
- 2D 求解器均方波高误差比 SWE、BEM、Airy 基线低 1.7~5×
- 比 BEM 快 10³× 以上
- 耦合 3D NS 求解器后消除可见接缝
- Kelvin 尾迹测试验证
- 比纯 GPU NB-FLIP 快 4× 以上

## 局限性
- 2D 模型本身有计算效率-精度权衡
- 需要 3D 求解器处理精细细节

## 可行性分析
- 实现难度：高（哈密顿系统推导和耦合方案复杂）
- 性能预期：实时海洋渲染可行（4× speedup over NB-FLIP）
- 适用场景：海洋渲染、游戏水体、船舶仿真

## 相关工作
- 自由表面水模拟 (流体渲染)
- SPH / NB-FLIP
- 波浪模型 (SWE, BEM, Airy)
- 海洋渲染

## 笔记
**对渲染领域的价值**：SIGGRAPH Asia 2026 论文，解决了大规模水体渲染中 2D-3D 耦合的接缝伪影问题。哈密顿结构的规范一致性是核心创新，对海洋和湖泊等大规模水体渲染有直接价值。
