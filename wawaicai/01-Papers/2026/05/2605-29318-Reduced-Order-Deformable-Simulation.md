---
tags: [几何, 网格变形, 降阶模拟, RKPM, CVPR2026]
created: 2026-05-30
---

# Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes

## 论文信息
- **arXiv**: [2605.29318](https://arxiv.org/abs/2605.29318)
- **发表**: CVPR 2026
- **日期**: 2026-05-28

## 核心方法

### 问题定义
解决变形物体的降阶模拟问题，现有方法依赖网格或神经场表示，存在获取困难或需逐形状优化的局限。

### 核心创新
- 提出 **Reproducing Kernel Particle Method (RKPM)** 表示方法
- 通过在 Hessian 矩阵的广义特征系统上求解，构建降阶 skinning 权重
- 40x 训练加速（相比神经场逐形状优化）
- 更低的模拟误差（对比 FEM 收敛结果）

### 技术要点
```
关键公式：
- 广义特征系统：H(v) · φ = λ · M · φ
- H: Hessian 矩阵（弹性能量二阶导）
- M: 质量矩阵
- φ: 降阶模态基

优势：
- 无需网格输入（支持 Gaussian Splats）
- mesh-free 降阶模拟
```

## 算法复杂度
- 时间复杂度：O(n²) 广义特征分解
- 空间复杂度：O(n²) Hessian 矩阵存储

## 实现难度
- **算法复杂度**：中
- **数值稳定性**：良好（基于成熟的 RKPM 框架）
- **依赖项**：无特定开源库依赖

## 开源参考
- 项目页面：this https URL（见论文）

## 推荐结论
✅ **推荐实现** - 对几何变形模拟有重要参考价值

## 备注
支持多种几何表示：meshes, Gaussian Splats，适合机器人仿真应用