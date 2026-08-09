---
tags: [几何, 曲面生成, 扩散模型, 最小曲面, 生成式AI]
---

# Fourier-Latent Diffusion for Constrained Generation of Triply Periodic Minimal Surfaces

## 论文信息
- **arXiv ID**: [2608.02151](https://arxiv.org/abs/2608.02151)
- **作者**: Shu Yan et al.
- **日期**: 2026-08-03 (v1), 2026-08-04 (v2)
- **会议**: -
- **主题**: 最小曲面生成、扩散模型、周期结构

## 核心方法

### 问题定义
现有 TPMS (Triply Periodic Minimal Surface) 生成方法受限於少量规范族，或产生偏离精确最小性的近似曲面。本论文提出基于扩散的可控生成框架。

### 核心创新
1. **大规模数据集**: 构建超过 18K 个独特 TPMS 的数据集，通过在可镜像基本绑定体积上列举允许边界环并求解多样最小曲面补丁
2. **Fourier 隐空间**: 将曲面投影到紧凑 Fourier 隐空间，明确强制周期性和 $D_{2h}$ 对称性
3. **Transformer 扩散模型**: 在隐空间训练，支持无条件采样、确定性反演、局部编辑和条件生成

### 算法流程
```
边界环枚举 → 最小曲面求解 → Fourier 隐投影 → Transformer 扩散模型训练
                                                    ↓
                                    无条件/条件生成 ← 用户约束
```

## 技术细节

### 关键公式
- 最小曲面 mean curvature = 0
- 周期性约束: $f(x + \mathbf{a}) = f(x)$ for lattice vectors $\mathbf{a}$
- $D_{2h}$ 对称性群

### 损失函数
- 扩散模型损失: $\mathcal{L} = \mathbb{E}_{x, t, \epsilon}[||\epsilon - \epsilon_\theta(x_t, t)||^2]$
- 弹性属性条件损失

## 复杂度分析
- **时间**: 数据集构建 O(N)，模型训练 O(epochs × N)
- **空间**: Fourier 隐向量维度 d << 原始曲面采样点数

## 开源实现
- 待发布: [GitHub](https://github.com/xxx/tpms-diffusion)

## 相关笔记
[[几何, 曲面生成, 扩散模型]]
[[几何, 参数化, 周期性曲面]]
