---
tags: [渲染, 逆渲染, 材质重建, 扩散模型, PBR, 2026, ECCV]
date: 2026-07-18
status: 待读
---

# Diffusion-Based Material Regularization for Physics-Based Inverse Rendering

## 基本信息

| 标题 | Diffusion-Based Material Regularization for Physics-Based Inverse Rendering |
|------|-------|
| 作者 | Jingwang Ling 等 (UIUC, NVIDIA, 清华大学) |
| 发表 | ECCV 2026 |
| 链接 | [arXiv:2606.31065](https://arxiv.org/abs/2606.31065) |
| 代码 | [Project Page](https://gerwang.github.io/diffusion-regularized-inverse-rendering/) |

## 核心贡献

1. **桥接范式**：将扩散模型预测作为相似核（similarity kernel）而非目标值
2. **正则化损失**：惩罚扩散预测近常数的表面区域上的优化材质偏差
3. **端到端管道**：联合重建几何、材质和光照，输出可直接用于标准渲染管线

## 技术方案

### 问题背景
- 物理逆渲染：准确但欠约束，材质-光照歧义导致 baking artifacts
- 数据驱动扩散模型：视觉可信但不满足渲染方程，物理不准确

### 核心方法：三阶段管道

**Stage 1: Preprocessing**
- 使用条件扩散模型（DiffusionRenderer）预测每视角 intrinsic G-buffers: G = [A, R, M, N]

**Stage 2: Neural Shape Reconstruction**
- 通过神经体渲染重建体素网格 SDF
- 用预测的法线 N 监督（$\mathcal{L}_{shape}$）

**Stage 3: Physics-Based Inverse Rendering (PBIR)**
- 联合优化形状、空间变化材质和环境贴图
- 最小化光度损失 $\mathcal{L}_{img}$ 和材质聚类正则化器 $\mathcal{L}_{mat}$
- Albedo 通过 scale-agnostic transform $\psi$ 正则化

### 关键创新

**扩散预测作为相似核而非目标值**：
- 扩散预测在表面区域近常数时，惩罚优化材质的偏差
- 同时允许优化自由匹配输入图像

### 实验数据

在 Synthetic4Relight, Stanford-ORB, DTC-Synthetic 数据集上：
- 重建精度显著超越 SOTA 基线
- 重光照质量显著超越基线

## 可行性分析

- **实现难度**：中
- **渲染相关**：高（PBR 材质重建、物理准确重光照）
- **适用场景**：3D 资产重建、AR/VR 物体、电商产品展示
- **输出兼容性**：直接兼容标准渲染管线的 triangle meshes + Disney BRDF

## 行动建议

已传递给 @墨鱼丸 进行算法评估。

## 标签

#渲染 #逆渲染 #PBR #扩散模型 #材质重建 #ECCV2026
