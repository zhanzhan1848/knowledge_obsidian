---
title: "Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes"
authors: ["Tianshu Kuai et al."]
date: 2026-05-19
venue: SIGGRAPH 2026 (ACM TOG)
tags: [几何, 网格处理, Flow Matching, 三角网格, 生成模型]
---

# Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes

## 核心方法

将 Flow Matching (FM) 范式适配到三角网格的**三角剖分无关 (triangulation-agnostic)** 设置。

### 关键技术

1. **问题定义**: 在三角网格上学习生成信号，训练好的模型可应用于不同网格和三角剖分
2. **核心挑战**: 为三角剖分无关设计噪声分布
3. **解决方案**: 使用 **Matérn 过程** 的离散化作为噪声模型
   - 通过频谱定义三角剖分无关性
   - 提供简单高效的采样算法

### 方法 Pipeline

1. **噪声模型**: Matérn 过程离散化（三角剖分无关）
2. **去噪器**: 采用 **PoissonNet** (状态-of-the-art 网格信号学习方法，在梯度域处理)
3. **应用任务**:
   - 采样弹性静止状态
   - 生成人形姿态

## 创新点

- 首个三角剖分无关的网格 Flow Matching 方法
- Matérn 过程提供理论保证的三角剖分无关性
- 可处理超过 100 万三角形的网格

## 实验结果

- 在质量和多样性上显著超越 state-of-the-art
- 支持大规模网格处理

## 算法复杂度

- 时间: O(n) 训练和推理
- 空间: O(n) 存储

## 实现难度

- 算法复杂度: **中**
- 依赖: PyTorch, PoissonNet, 网格处理库
- 数值稳定性: Matérn 过程采样稳定

## 推荐结论

✅ **推荐实现** - 对网格信号生成和几何建模有重要价值

## 开源参考

- Project Page: https://matern-fm.github.io/
- libigl: 网格处理基础函数
- PoissonNet: 网格信号学习

## 相关技术

- [[Flow Matching]], [[Mesh Generation]], [[三角网格处理]], [[PoissonNet]], [[Signal on Meshes]]