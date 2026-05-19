---
title: "Geometry-Aware Neural Optimizer (GANO) for Shape Optimization and Inversion"
date: 2026-05-14
tags: [几何, 形状优化, 深度学习, 自动微分, 神经代理模型]
cite: arXiv:2605.04474 [cs.LG]
authors: Rui Zhang et al.
venue: ICML 2026
---

# GANO: Geometry-Aware Neural Optimizer

## 核心方法

提出 **GANO**，端到端可微分的框架，统一几何表示、场级预测和自动化优化/反演。

### 问题背景
- 形状优化和反演在 PDE 控制系统中的核心作用
- 经典管道需要昂贵的正演模拟+几何处理
- 神经代理模型加速正演分析但不闭合优化循环

### 核心创新

1. **Auto-decoder 编码形状**: 流形约束几何表示
2. **去噪机制(Denoising)**: 稳定隐空间更新
3. **几何感知神经代理**: 提供几何更新的可靠梯度路径
4. **Null-space 投影**: 支持部件级控制
5. **无重网格投影(Remeshing-free projection)**: 加速几何处理

### 理论贡献
- **证明**: 去噪诱导隐式 Jacobian 正则化，降低解码器灵敏度
- 实现受控变形

## 实验结果

### 基准测试
- 2D Helmholtz
- 2D Airfoil
- 3D Vehicles

### 性能提升
- Airfoil: **+55.9%** lift-to-drag 提升
- Vehicles: **~7%** drag reduction

## 开源参考
- 论文链接: https://arxiv.org/abs/2605.04474
- PDF: https://arxiv.org/pdf/2605.04474

## 可行性分析

### ⚠️ 取决于应用

| 维度 | 评估 |
|------|------|
| 算法复杂度 | 高（深度学习 + 几何 + 优化）|
| 数值稳定性 | 高（有理论保证）|
| 依赖项 | PyTorch, auto-decoder, PDE求解器 |

### 实现建议
- 适合研究型项目
- 工程应用需要较多资源
- remeshing-free projection 思路值得借鉴

## 相关笔记
[[形状优化]]
[[神经隐式表示]]
[[自动微分几何]]
