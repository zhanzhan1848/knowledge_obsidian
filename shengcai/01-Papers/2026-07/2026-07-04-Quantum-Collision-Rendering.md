---
title: Rendering Coherent Scattering via Quantum Collision Models
authors: João S. Ferreira et al.
date: 2026-06-29
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.29989
pdf: https://arxiv.org/pdf/2606.29989
tags: [rendering, quantum, ray-tracing, material, SIGGRAPH-2026]
status: unread
---

# Rendering Coherent Scattering via Quantum Collision Models

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Rendering Coherent Scattering via Quantum Collision Models |
| 作者 | João S. Ferreira et al. |
| 来源 | arXiv cs.GR (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.29989) |
| PDF | [下载](https://arxiv.org/pdf/2606.29989) |

## 核心贡献
1. **量子碰撞模型框架**: 将经典光线追踪与量子碰撞模型结合，探索相干光-物质相互作用的渲染效果
2. **对称约束的幺正算符**: 推导了适用于2D材料界面模拟的对称约束幺正算符
3. **多层交互框架**: 通过重复碰撞产生彩虹色效应 (iridescence)
4. **生产级着色器实现**: 提供可在现有渲染管线中使用的实用着色器实现

## 技术方案

### 核心思想
将光线和材料激发视为量子粒子，在空间和时间上局部相互作用。通过将次表面散射建模为对称约束幺正碰撞的序列，捕捉多层干涉效应带来的非可积动力学和混沌光学响应。

### 关键创新
- 将吸收建模为相干振幅，与反射和透射平等处理
- 支持光子与材料之间的非线性相互作用机制
- 可在近-term量子计算机上预计算碰撞算子

### 方法流程
```
入射光 → 碰撞序列(多层2D材料) → 测量(反射/透射/吸收)
                                    ↓
                              重建R和T函数
                                    ↓
                              构建BSDF → 渲染
```

## 公式

### 单次碰撞状态演化
```math
|F⟩ = r|1_r 0_s 0_t⟩ + a|0_r 1_s 0_t⟩ + t|0_r 0_s 1_t⟩
```

### 能量守恒约束
```math
R + T + A = 1
```

### 散射矩阵 (单激发 sector)
```math
U_1 = \begin{pmatrix} r & a & t \\ a & c & a \\ t & a & r \end{pmatrix}
```

### 碰撞哈密顿量
```math
H^c = i \log U = h_k \sum_k H_k
```

## 实验结论

- 成功渲染了具有量子碰撞材料涂层的翡翠雕像
- 展示了通过增加层数(Nl)和光线数(Nr)产生更丰富的色彩深度
- 材料展现出独特的视觉特征，可用于创造新的物理激励材料

## 局限性

- 目前假设材料上方和下方均为真空
- 仅考虑了单色光入射
- 量子计算预计算阶段需要近-term量子硬件

## 可行性分析

- **实现难度**: 高（需要量子计算背景知识）
- **性能预期**: 预计算阶段耗时，但查询速度快
- **适用场景**: 新型超材料渲染、纳米级光学效应、彩虹色材料

## 相关工作

- [[Quantum Rendering]]
- [[Neural Global Illumination]]
- [[BRDF Models]]

## 笔记

**创新性**: ⭐⭐⭐⭐⭐ - 开创性地将量子碰撞模型引入渲染领域

**实用性**: ⭐⭐⭐⭐ - 提供生产级着色器实现

**技术亮点**: 将吸收作为相干振幅处理，突破传统几何光学假设

**待深入**: 量子硬件预计算的工程化方案
