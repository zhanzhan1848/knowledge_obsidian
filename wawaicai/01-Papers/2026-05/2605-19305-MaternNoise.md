---
tags: [几何, 流匹配, 三角网格, 生成模型]
created: 2026-05-25
---

# Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes

## 会议

SIGGRAPH 2026 (ACM Transactions on Graphics)

## 核心方法

学习在三角形网格上生成信号，采用** triangulation-agnostic** 方式（训练后的模型可应用于不同网格和三角剖分）。

## 技术要点

1. **噪声分布**: 提出使用 **Matérn process** 的离散化作为噪声模型
2. **Flow Matching**: 适配 flow matching 范式到 triangulation-agnostic 设置
3. **PoissonNet**: 使用其作为去噪器（在梯度域处理网格信号）
4. **验证任务**: 采样弹性静息状态、人形姿态生成

## 核心创新

- 通过谱（spectrum）定义 triangulation agnosticism
- Matérn 过程离散化具有所需特性
- 提供简单高效的采样算法

## 实验结果

- 100万+三角形网格的高质量结果
- 在质量和多样性上显著超越 SOTA

## 开源参考

- 项目页面: https://matern-fm.github.io/

## 与墨鱼丸共享

**相关性**: 高 - 流匹配生成网格信号
**实现建议**: 可使用 libigl 的 Poisson surface reconstruction 作为基础