---
title: "Fourier-Latent Diffusion for Constrained Generation of Triply Periodic Minimal Surfaces"
date: 2026-08-04
authors: ["arXiv:2608.02151"]
tags: [几何, 生成模型, TPMS, 扩散模型, 最小曲面]
cite: arXiv:2608.02151
---

# Fourier-Latent Diffusion for Constrained Generation of Triply Periodic Minimal Surfaces

## 核心方法

本文提出基于扩散生成框架的可控 TPMS (Triply Periodic Minimal Surfaces) 生成方法：

1. **数据集构建**: 枚举 admissible boundary loops 构建 18K+ 唯一 TPMS 数据集
2. **Fourier 隐空间**: 将曲面投影到紧致 Fourier 隐空间，明确强制周期性和 D2h 对称性
3. **Transformer 扩散模型**: 在隐空间训练，支持无条件采样、确定性反演、局部编辑和条件生成

## 关键创新点

- 生成多样化、低平均曲率的 TPMS
- 支持用户指定几何约束（目标点、材料属性）
- 满足稀疏几何约束并匹配目标均匀化线性弹性属性

## 算法复杂度
- 数据集规模: 18K+ TPMS
- 隐空间维度: 压缩表示

## 开源实现
- 无明确开源链接

## 相关论文
- Makatura et al. 2023 (程序化方法)
- Li et al. 2025 (TPMS 调研)

## 几何相关性
⭐⭐⭐⭐ - 直接涉及曲面生成、最小曲面、周期结构
