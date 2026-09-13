---
title: Gaussian Light Transport
authors: Patrick Attimont et al.
date: 2026-09-10
source: SIGGRAPH Asia 2026 Conference Track
url: https://arxiv.org/abs/2609.11430
pdf: https://arxiv.org/pdf/2609.11430
tags: [rendering, global-illumination, gaussian-splatting, real-time, 2026, siggraph-asia]
status: unread
---

# Gaussian Light Transport

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Gaussian Light Transport |
| 作者 | Patrick Attimont et al. |
| 来源 | SIGGRAPH Asia 2026 (Conference Track) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.11430) |
| PDF | [下载](https://arxiv.org/pdf/2609.11430) |
| 项目页 | [patrick-attimont.com/projects/gaussian-light-transport](https://patrick-attimont.com/projects/gaussian-light-transport/) |

## 核心贡献
1. 提出将光传输方程的解表达为 **13维 Gaussian 混合模型**（位置、方向、法线、材质属性）
2. 将场景属性（法线、材质）纳入 Gaussian 表示，大幅减少函数数量并加速评估
3. 通过直接最小化渲染方程残差来估计模型参数，而非传统的 Neumann 级数迭代
4. 引入高效 culling 策略保持优化可计算，实现**毫秒级实时渲染**

## 技术方案

### 核心思想
将光传输方程的解建模为高维 Gaussian 混合模型：

```math
L(\mathbf{x}, \omega) = \sum_{i=1}^{N} w_i \cdot G_i(\mathbf{x}, \omega, \mathbf{n}, \mathbf{m})
```

其中 $G_i$ 为 13 维 Gaussian 函数（位置 3D + 方向 2D + 法线 3D + 材质属性 5D），$w_i$ 为权重。

### 优化目标
直接最小化渲染方程残差：

```math
\min_{\{w_i, \mu_i, \Sigma_i\}} \| L_{gt} - L_{predicted} \|^2
```

### 关键技术
- **高维 Gaussian 表示**：将法线和材质属性融入 Gaussian 参数，减少函数数量
- **高效 culling**：在优化和渲染过程中对高维 Gaussian 进行裁剪，保持实时性
- **毫秒级渲染**：预计算完成后，渲染时间达到毫秒级别，视图无关

### 与传统方法对比
| 方法 | 渲染时间 | 内存需求 | 视图依赖 |
|------|----------|----------|----------|
| Neural Radiance Caching | 秒级 | 高 | 是 |
| Gaussian Light Transport | **毫秒级** | **低** | **否** |

## 实验结论
- 渲染时间达到毫秒级，远超传统神经渲染方法
- 内存需求仅为传统神经渲染方法的一小部分
- 解决方案视图无关，切换视角无需重新计算
- 在复杂场景全局光照任务上验证了方法有效性

## 局限性
- 需要预计算阶段（优化过程）
- Gaussian 数量受限于 culling 策略的效率
- 对极端几何或材质场景可能需要更多 Gaussian 函数

## 可行性分析
- **实现难度**：中高。涉及高维 Gaussian 混合模型的优化和高效评估，需要数值计算和 GPU 并行优化知识
- **性能预期**：优。毫秒级渲染时间，适合实时应用
- **适用场景**：实时全局光照、交互式渲染、视图无关的光照预览

## 相关工作
- Neural Radiance Caching
- 2D/3D Gaussian Splatting
- Light Transport Simulation

## 笔记
> 🔥 **重点关注**：SIGGRAPH Asia 2026 Conference Track 论文，核心创新是将光传输方程的解用 13D Gaussian 混合模型表示，结合场景属性（法线、材质）大幅减少表示所需的函数数量。属于神经渲染与经典渲染方程的交叉创新，值得深入研究。
