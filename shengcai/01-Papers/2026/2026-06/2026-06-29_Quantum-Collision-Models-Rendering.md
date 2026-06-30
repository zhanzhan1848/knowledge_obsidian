---
title: Rendering Coherent Scattering via Quantum Collision Models
authors: João S. Ferreira et al.
date: 2026-06-29
source: arXiv cs.GR (Submitted to SIGGRAPH 2026)
url: https://arxiv.org/abs/2606.29989
pdf: https://arxiv.org/pdf/2606.29989
tags: [rendering, quantum, ray-tracing, material, SIGGRAPH2026]
status: unread
---

# Rendering Coherent Scattering via Quantum Collision Models

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Rendering Coherent Scattering via Quantum Collision Models |
| 作者 | João S. Ferreira et al. |
| 来源 | arXiv cs.GR (Submitted to SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.29989) |
| PDF | [下载](https://arxiv.org/pdf/2606.29989) |

## 核心贡献
1. 提出将经典光线追踪与量子碰撞模型（Quantum Collision Models, QCM）结合的着色框架
2. 推导了适用于2D材料界面的对称约束幺正算符
3. 提出多层交互框架，通过重复碰撞产生彩虹色效应
4. 提供可用于生产渲染管线的实用着色器实现

## 技术方案

### 核心思想
传统光渲染技术将材料的光学性质视为静态，但这一假设在材料光学性质随入射光动态演化的情况下不再成立。本工作将经典光线追踪与量子碰撞模型结合，探索相干光-物质相互作用在渲染中的效果。

### 关键方法
1. **量子碰撞模型（QCM）**：将入射光和材料激发视为量子粒子，在时空中局部相互作用
2. **次表面散射建模**：将次表面散射建模为一系列对称约束的幺正碰撞序列
3. **2D材料堆叠**：模拟多层2D材料（如石墨）中的光学激发受限在单个平面内
4. **LUT重建BSDF**：通过预计算的碰撞算符重建反射率R和透射率T作为多维查找表

### 光-单次碰撞交互
初始状态 |I⟩=|1e0t0s⟩（入射光场mode e有1个光子，透射mode t和表面mode s为空）

碰撞后状态：
```math
|F\rangle = r|1_r 0_s 0_t\rangle + a|0_r 1_s 0_t\rangle + t|0_r 0_s 1_t\rangle
```

满足能量和动量守恒：
```math
R + T + A = 1
```

## 公式

### 散射矩阵（单激发 sector）
```math
U_1 = \begin{pmatrix} r & a & t \\ a & c & a \\ t & a & r \end{pmatrix}
```

其中 c = -a(\bar{r}+\bar{t})/\bar{a}

### 碰撞哈密顿量
```math
H^c = i \log U = h_k \sum_k H_k
```

### 反射率/透射率计算
```math
R = \frac{\langle b_r^\dagger b_r \rangle_F}{\langle b_r^\dagger b_r \rangle_I}, \quad T = \frac{\langle b_t^\dagger b_t \rangle_F}{\langle b_r^\dagger b_r \rangle_I}
```

## 实验结论
- 展示了几种具有独特光学特征的新物理启发材料
- 通过增加层数(N_l)和光线数(N_r)可获得更丰富的色彩对比
- 碰撞算符可使用近-term量子计算机预计算，生成标准BSDF

## 局限性
- 目前假设材料上下方为真空（未来扩展到不同介电常数介质）
- 量子计算机预计算目前受硬件限制
- 多层交互的计算复杂度随层数指数增长

## 可行性分析
- 实现难度：高（需要量子计算背景知识）
- 性能预期：需要量子硬件支持，经典模拟可行性低
- 适用场景：科研探索、新材料可视化、特殊视觉效果

## 相关工作
- [[2026-06-HoloPathTracer-Wave-Path-Tracing-Holography]]
- [[2026-06-Richer-Material-Generation-Procedural-Data-Enhancement]]

## 笔记
这是一篇将量子物理与渲染结合的前沿研究，探索了相干光-物质相互作用在渲染中的新物理现象。虽然实用价值有限（需要量子硬件），但为未来材料渲染提供了新的理论框架。