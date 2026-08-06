---
tags: [几何, 参数化, 最小曲面, 生成模型]
date: 2026-08-06
---

# Fourier-Latent Diffusion for Constrained Generation of Triply Periodic Minimal Surfaces

## 核心方法

提出基于扩散的生成框架，用于可控生成低残余平均曲率的 **TPMS** (Triply Periodic Minimal Surfaces) 结构。

### 关键创新点

1. **大数据集**：构建超过 18K 独特 TPMS 的数据集
2. **Fourier 潜在空间**：将表面投影到紧凑的傅里叶潜在空间
   - 显式强制周期性和 D₂ₕ 对称性
3. **Transformer-based Diffusion Model**：支持：
   - 无条件采样
   - 确定性反演
   - 局部编辑
   - 用户指定约束条件生成

### 应用场景

- TPMS 逆设计
- 满足稀疏几何约束
- 匹配目标均质线性弹性特性

## 开源实现

- 代码即将开源

## 链接

- arXiv: https://arxiv.org/abs/2608.02151
- PDF: https://arxiv.org/pdf/2608.02151
