---
title: Radiometrically Consistent Gaussian Surfels for Inverse Rendering
authors: Kyu Beom Han et al.
date: 2026-03-02
source: arXiv (ICLR 2026 Oral)
url: https://arxiv.org/abs/2603.01491
pdf: https://arxiv.org/pdf/2603.01491
tags: [rendering, inverse-rendering, gaussian-splatting, ray-tracing, PBR, global-illumination, 2026]
status: unread
---

# Radiometrically Consistent Gaussian Surfels for Inverse Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Radiometrically Consistent Gaussian Surfels for Inverse Rendering |
| 作者 | Kyu Beom Han et al. |
| 来源 | arXiv (ICLR 2026 Oral) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.01491) |
| PDF | [下载](https://arxiv.org/pdf/2603.01491) |

## 核心贡献
1. 提出**辐射一致性（Radiometric Consistency）**约束，为未观察视角提供监督信号
2. 通过最小化高斯基元学习辐射与物理渲染结果之间的残差，建立自校正反馈循环
3. 提出 **RadioGS**：利用 Gaussian Surfels 和 2D Gaussian Ray Tracing 的逆渲染框架
4. 支持基于微调的重新照明策略，在几分钟内适应新光照，渲染成本 <10ms

## 技术方案

### 辐射一致性原理
```math
L_{radio} = \sum_{g \in Gaussians} \| L_{learned}(g) - L_{physically\_based}(g) \|^2
```

核心思想：
- 现有方法从有限训练视角监督高斯基元，缺乏对未观察视角间接辐射的建模
- 辐射一致性通过物理渲染提供监督，使高斯基元能够正确建模相互反射
- 自校正反馈循环同时利用物理渲染和Novel-View Synthesis的优势

### RadioGS 架构
- 使用 Gaussian Surfels 表示场景
- 2D Gaussian Ray Tracing 进行光线追踪
- 可微分化简：支持端到端训练

## 实验结论
- 在逆渲染基准测试中优于现有基于 Gaussian 的方法
- 保持计算效率
- 支持快速重新照明（<10ms 渲染）

## 局限性
- 需要预训练的 Gaussian 基础
- 对复杂全局光照效果的建模仍有挑战

## 可行性分析
- 实现难度：高（需要实现 Gaussian Ray Tracing）
- 性能预期：<10ms 渲染
- 适用场景：逆渲染、材质分解、重新照明

## 相关工作
- Gaussian Splatting
- Inverse Rendering
- Physically Based Rendering
- Neural Radiance Fields

## 笔记
ICLR 2026 Oral 论文。核心创新是辐射一致性约束，这是一个物理启发的监督信号，能够让 Gaussian 在没有观察到的视角上正确建模间接光照和相互反射。这对于逆渲染的材质分解非常重要。
