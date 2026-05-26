---
title: Learning View-Dependent Splatting Kernels
authors: Zhanpeng Liu, Fan Pei, Kun Zhou, Hongzhi Wu
venue: SIGGRAPH 2026
date: 2026-05-25
tags: [渲染, 3DGS, 高斯溅射, SIGGRAPH2026]
status: 待读
arxiv: "2605.25426"
links:
  - arXiv: https://arxiv.org/abs/2605.25426
  - PDF: https://arxiv.org/pdf/2605.25426
---

# Learning View-Dependent Splatting Kernels

## 核心贡献

1. **可微分框架**: 自动学习视图相关的2D核函数用于splatting管道
2. **视图自适应核**: 学习随视角变化的核函数，而非固定核
3. **联合优化**: 神经网络与每 primitive 属性联合优化
4. **泛化能力**: 扩展到2D splatting和图像表示

## 技术方案

### 体积元定义
- 包围椭球体 (bounding ellipsoid) + 3D核潜向量
- 投影网络输入: 椭球体属性 + 3D核潜向量
- 输出: 2D核潜向量

### 核函数
- 径向对称2D核，基于Mahalanobis距离
- 有界投影椭球体内

### 优化目标
- 提升重建质量
- 提高表示效率
- 多视角输入图像监督

## 核心公式

### 2D核生成
```python
# 投影网络: ellipsoid attributes + 3D kernel latent -> 2D kernel latent
latent_2d = projection_network(ellipsoid_attrs, latent_3d)

# 解码器: 2D kernel latent -> radially symmetric 2D kernel (Mahalanobis distance)
kernel = decoder(latent_2d)
```

## 实验结论

- 标准benchmark表现优异
- 对比analytical和learned kernels均更优
- 视图相关核函数显著改善重建质量

## 实现难度
- **算法复杂度**: 中等 (神经网络训练)
- **代码工作量**: 中等 (需要修改3DGS pipeline)
- **依赖项**: 3DGS基础、PyTorch、可微分渲染

## 推荐度

⭐⭐⭐⭐ (4/5)

SIGGRAPH 2026论文，方向新颖，值得深入研究。

## 行动建议
已传递给 @墨鱼丸 进行算法评估。