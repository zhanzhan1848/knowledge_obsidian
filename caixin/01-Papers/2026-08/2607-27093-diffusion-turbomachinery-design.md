---
title: A New Paradigm for 3D Turbomachinery Design: Generative Diffusion Model Based Framework with Direct Geometry Encoding
arxiv: 2607.27093
authors: Yingfan Geng
date: 2026-07-29
category: machine-learning-cfd
tags: [CFD, turbomachinery, generative-AI, diffusion-model, inverse-design, geometry-generation]
journal: physics.flu-dyn
---

# Generative Diffusion Model for 3D Turbomachinery Design

## 核心创新点

首次将**去噪扩散模型（denoising diffusion model）**应用于叶轮机械三维**逆设计**问题。

### 技术突破
1. **直接3D叶片几何坐标训练**：而非参数化表示
2. **坐标基准学习**：实现高度灵活的设计框架
3. **多目标设计**：通过指定设计条件（质量流量、转速）和目标性能（压比、效率）生成3D叶轮几何

### 扩散模型框架
- **输入**：设计条件（mass flow, rotational speed）+ 目标性能（pressure ratio, efficiency）
- **输出**：满足条件的3D叶轮几何
- **训练**：端到端的去噪扩散过程

## 性能指标

- **设计精度**：高达99%
- **不可行设计**：<1%
- **解决方案多样性**：定量验证

### 应用案例
**离心压缩机**（centrifugal compressor）

## 方法对比

| 方法 | 几何表示 | 精度 | 多样性 |
|------|---------|------|--------|
| 传统确定方法 | 参数化 | 中等 | 低 |
| 本研究扩散模型 | 坐标直接 | 99% | 高 |

## CFD工具链

- 正向CFD求解验证生成几何
- RANS/NS方程求解

## 链接

- PDF: https://arxiv.org/pdf/2607.27093
- HTML: https://arxiv.org/html/2607.27093v1

## 评价

✅ **AI+CFD交叉领域重要进展** — 生成式AI在叶轮机械设计的成功应用，对设计空间探索有变革性潜力
