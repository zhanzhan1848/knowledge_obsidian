---
tags: [渲染, 全局光照, 高斯泼溅, 神经渲染, 2026, SIGGRAPH-Asia]
date: [[2026-09-12]]
status: 待读
---

# Gaussian Light Transport

## 基本信息

| 属性 | 内容 |
|------|------|
| 作者 | Patrick Attimont et al. |
| 发表 | SIGGRAPH Asia 2026 (Conference Track) |
| 链接 | [arXiv:2609.11430](https://arxiv.org/abs/2609.11430) |
| PDF | [PDF](https://arxiv.org/pdf/2609.11430) |
| 项目页 | [patrick-attimont.com](https://patrick-attimont.com/projects/gaussian-light-transport/) |

## 核心贡献

1. **13D Gaussian Mixture Model** — 将光传输方程的解表示为 13D 高斯混合模型，涵盖位置、方向、表面法线和材质属性
2. **残差优化** — 直接通过最小化渲染方程残差来估计模型参数，而非传统的 Neumann 级数
3. **高效剔除策略** — 引入高效剔除策略保持优化可处理性，实现毫秒级实时渲染
4. **视图无关GI** — 产生快速、视图无关的光传输解决方案

## 技术方案

### 核心思想
将全局光照表示为在位置、方向、表面法线和材质属性上的 13D 高斯混合模型。将场景属性纳入高斯表示大幅减少函数数量，加速评估。

### 关键公式

渲染方程的解通过优化高斯混合参数直接估计，而非迭代求解：

```math
L(\mathbf{x}, \omega) = \sum_{i=1}^{N} w_i \cdot G_i(\mathbf{x}, \omega, \mathbf{n}, \mathbf{m})
```

其中 $G_i$ 是 13D 高斯函数，$w_i$ 是权重，$\mathbf{x}$ 是位置，$\omega$ 是方向，$\mathbf{n}$ 是法线，$\mathbf{m}$ 是材质属性。

### 优化目标
通过最小化渲染方程残差进行优化：

```math
\min_{\{w_i, \mu_i, \Sigma_i\}} \| \mathcal{R}[L] - L_{\text{gt}} \|^2
```

### 剔除策略
为保持优化 tractable，引入高效 culling 策略，只保留贡献最大的高斯分量。

## 实验结论

- **渲染时间**: 毫秒级
- **内存需求**: 仅为传统神经渲染方法的一小部分
- **视图独立性**: 支持快速、视图无关的 GI 渲染
- **速度提升**: 相比传统方法显著加速

## 局限性

- 半梯度优化带来的偏差未量化
- 对复杂材质的泛化能力需进一步验证

## 可行性分析

| 维度 | 评估 |
|------|------|
| 实现难度 | 中高 |
| 创新性 | ⭐⭐⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐⭐ |
| 代码可用性 | 即将发布 |

## 相关笔记

[[2026-05-04-RealTime-GI-Dynamic-3D-Gaussian-Scenes]]
[[2026-06-TRON-Gaussian-Ray-Tracing]]
[[2026-08-02_NVIDIA-SIGGRAPH2026-ArtiFixer-GI]]

## 标签

#全局光照 #高斯混合 #光传输 #实时渲染 #SIGGRAPH-Asia-2026
