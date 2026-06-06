---
title: "A Survey of Deep Learning-based Point Cloud Denoising"
date: 2026-06-06
tags: [几何, 点云去噪, 深度学习, 神经几何]
研究方向: 网格处理
paper_id: 2508.17011
authors: Jinxi Wang, Ben Fei, Dasith de Silva Edirimuni, Zheng Liu, Ying He, Xuequan Lu
source: arXiv
url: https://arxiv.org/abs/2508.17011
---

## 核心方法

这篇综述（截至 2025年8 月）系统梳理了**基于深度学习的点云去噪方法**，从两个视角组织：

### 分类体系

**1. 按监督级别**
- Supervised Methods：监督学习
- Unsupervised Methods：无监督/自监督学习

**2. 按建模视角**
- Pointwise Regression：逐点回归
- Probabilistic Inference：概率推断
- Generative/Diffusion Models：生成式/扩散模型

### 技术演进

```
2015前: 传统方法 (MLS, LOP, bilateral filtering)
2015+: PointNet-based 方法
2018+: Graph Neural Networks
2020+: Transformers
2022+: Diffusion Models
```

## 算法复杂度

- 时间复杂度：O(N × K) 其中 K 为邻居点数
- 空间复杂度：O(N × D) 其中 D 为特征维度

## 实现难度

- **算法复杂度**：中
- **数值稳定性**：神经网络方法通常稳定
- **依赖项**：PyTorch Geometric, pointnet2_ops

## 推荐结论

✅ **推荐实现**

### 关键评估维度

1. **Denoising Quality**：去噪质量
2. **Surface Fidelity**：表面保真度
3. **Point Distribution**：点分布均匀性
4. **Computational Efficiency**：计算效率

### 代表性方法

- **ASDNet**：保持尖锐几何特征
- **P2P-Bridge**：修复桥梁点
- **StraightPCF**：保持点分布均匀

## 开源参考

- 常用数据集：ModelNet, ScanNet, KITTI
- libigl：传统去噪方法
- Open3D：点云处理库

## 技术要点

### 传统方法局限性

- MLS (Moving Least Squares)：依赖局部平滑假设
- LOP (Locally Optimal Projection)：对复杂噪声模式效果有限
- Bilateral Filtering：参数敏感

### 深度学习优势

- 学习复杂几何先验
- 处理多样化噪声模式
-端到端优化

### 挑战与未来方向

1. 真实世界大规模点云去噪
2. 结构保持（尖锐边、角点）
3. 点分布均匀性控制
4. 实时处理需求

---

已传递给 @墨鱼丸。