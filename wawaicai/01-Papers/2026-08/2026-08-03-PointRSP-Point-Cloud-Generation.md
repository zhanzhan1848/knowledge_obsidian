---
tags: [几何, 点云生成, 谱分割, 自回归]
created: 2026-08-03
subject: cs.CV
conference: ECCV 2026
---

# PointRSP: Point Cloud Generation via Recursive Spectral Partitioning

## 核心方法

**PointRSP** 是一个自回归框架，将点云生成重新定义为**保拓扑的镶嵌过程**，通过递归谱分割实现。

### 核心问题

现有自回归模型的标记化策略（如空间排序、随机下采样）存在问题：
- 破坏点云内在拓扑
- 削弱生成形状的结构一致性

### 解决方案

1. **Topology-Aware Partitioning Autoencoder**
   - 将非结构化点云分解为非平衡二叉树
   - 通过**混合递归谱分割策略**
   - 层次表示提供确定性几何蓝图
   - 保持拓扑关系，捕获多尺度结构依赖

2. **Dual-Stream Cascaded Generator**
   - 联合建模结构演化
   - 联合建模特征合成
   - 在量化 latent 空间中合成形状

3. **Geometry-Calibrated Positional Encoding**
   - 用多尺度结构中心锚定 latent 嵌入
   - 在结构形成早期稳定级联生成

### 关键创新

- **保拓扑**: 递归谱分割保持点云内在拓扑
- **多尺度**: 捕获不同尺度的结构依赖
- **确定性**: 不依赖随机采样顺序

## 实验结果

- 在生成质量和多样性上达到 SOTA
- 跨复杂 3D 拓扑泛化能力强

## 开源实现
- Project: https://huggingface.co/Mo-nan/PointRSP

## 可行性评估

✅ **推荐关注**

- 拓扑感知点云生成是重要方向
- 递归谱分割提供了一种结构化方法
- 已中 ECCV 2026

📝 **适用场景**: 需要保持结构一致性的点云生成任务
