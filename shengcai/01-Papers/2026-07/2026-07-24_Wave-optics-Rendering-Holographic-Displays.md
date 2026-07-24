---
tags: [渲染, 全息显示, 波光学, MPI, CGH, 2026-07]
date: [[2026-07-24]]
status: 待读
---

# Fast Wave-optics Rendering of Multiplane Images for 3D Holographic Displays

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | Fast Wave-optics Rendering of Multiplane Images for 3D Holographic Displays |
| 作者 | Brian Chao |
| 链接 | [arXiv:2607.19731](https://arxiv.org/abs/2607.19731) |
| PDF | [PDF](https://arxiv.org/pdf/2607.19731) |
| 发表 | arXiv cs.GR, 2026-07-22 |

## 核心贡献

1. **MPI-based CGH 算法**: 基于多平面图像 (MPI) 的计算机生成全息术算法
2. **250,000x 加速**: 相比 SOTA 原始基元 CGH 算法，运行时提升最高 250,000 倍
3. **质量与效率兼顾**: 相比传统层基 CGH 算法质量显著提升

## 技术方案

### 问题背景
神经渲染解锁了前所未有的 3D 重建和新视角合成能力，但这些渲染在传统屏幕上查看大大限制了感知真实感和沉浸感。全息显示等新型 3D 显示技术需要专门的渲染算法。

### 核心方法
- **MPI 输入格式**: 使用多平面图像作为输入表示
- **波光学渲染管线**: 将 MPI 内容转换为全息显示器兼容格式
- **高效 hologram 合成**: 大幅降低计算成本

### 性能对比

| 方法 | 速度 | 质量 |
|------|------|------|
| SOTA 原始基元 CGH | baseline | comparable |
| 传统层基 CGH | fast | lower |
| 本文方法 | 250,000x faster | comparable to SOTA |

## 实验验证

- 多种 3D 场景数据集
- 仿真和实验捕获结果
- 4D 光场重建性能优异

## 标签
#holographic-display #wave-optics #multiplane-image #CGH #neural-rendering
