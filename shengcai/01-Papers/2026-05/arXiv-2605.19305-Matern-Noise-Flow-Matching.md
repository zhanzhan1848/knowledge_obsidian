---
tags: [渲染, 网格处理, Flow Matching, Matérn 噪声, SIGGRAPH2026, 2026]
date: 2026-05-22
status: 待读
---

# Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Tianshu Kuai et al. |
| 发表 | SIGGRAPH 2026 / ACM TOG |
| 链接 | [arXiv:2605.19305](https://arxiv.org/abs/2605.19305) |
| 项目页 | [Matérn-FM](https://matern-fm.github.io/) |

## 核心贡献

1. **三角剖分无关的 Flow Matching**: 训练后的模型可应用于不同网格和三角剖分
2. **Matérn 过程作为噪声分布**: 在三角剖分无关的方式下定义噪声分布
3. **谱域定义三角剖分无关性**: 通过谱特性定义分布的三角剖分无关性
4. **简单高效的采样算法**: 用于 Matérn 过程的采样

## 技术方案

### 问题背景

- 图像等规则域的噪声分布容易定义
- 网格上的三角剖分无关噪声分布设计困难
- 需要定义在三角网格上的 noise model

### 数学定义

三角剖分无关性通过**谱**定义:
```math
\text{Spectrum}(\text{Matérn Process}) = \text{Triangulation-Invariant}
```

### Matérn 过程

Matérn 核函数:
```math
k(d) = \frac{1}{2^{\nu-1}\Gamma(\nu)} \left(\frac{d}{\ell}\right)^\nu K_\nu\left(\frac{d}{\ell}\right)
```

其中:
- $d$: 距离
- $\ell$: 尺度参数
- $\nu$: 平滑度参数
- $K_\nu$: 修正贝塞尔函数

### Flow Matching on Meshes

使用 PoissonNet 作为去噪器:
```math
\text{Denoiser} = \text{PoissonNet}(\text{gradient domain})
```

## 实验

### 任务
1. 采样弹性静止状态
2. 生成人形姿态

### 结果
- 超过 100 万三角形的网格
- 质量显著超过 SOTA
- 多样性高

## 与渲染相关

- 网格上的信号生成
- 可用于纹理/材质生成
- 三角剖分无关处理
- Flow Matching 框架

## 标签

#FlowMatching #Mesh #三角剖分 #Matérn过程 #SIGGRAPH2026 #信号生成