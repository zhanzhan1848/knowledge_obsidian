---
tags: [几何, 3DGS, surfel-splatting, 几何重建, 神经渲染]
---

# Hybrid Latents: Geometry-Appearance-Aware Surfel Splatting

## 论文信息

- **arXiv**: [2604.14928](https://arxiv.org/abs/2604.14928)
- **Authors**: Neel Kelkar et al.
- **Submitted**: Thu, 16 Apr 2026 (v1)
- **Subjects**: cs.CV, cs.GR
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2604.14928)

## 核心方法

混合 Gaussian-hash grid 辐射场表示，从多视角图像重建 2D Gaussian 场景模型。

### 关键算法
1. **混合表示**：per-Gaussian latent features + hash-grid features，减少几何-外观纠缠
2. **频率分解**：显式分解低频/高频成分，避免高频纹理补偿几何误差
3. **硬透明度 Dropout**：增强几何-外观分离
4. **概率剪枝 + BCE opacity loss**：冗余高斯剪除，最小化场景基元数量

### 创新点
- 类似 NeST splatting 的几何-外观分离策略，但加入了 per-Gaussian latent
- 无需逐场景优化（feed-forward），减少 10 倍基元数量同时提高精度
- 概率剪枝 + 稀疏性诱导 BCE opacity loss

## 复杂度分析
- **时间**：前馈推理（无逐场景优化）
- **空间**：Gaussian 基元 + hash grid + latent features

## 实现难度
- **算法复杂度**：高（3DGS + hash grid + transformer/MLP）
- **数值稳定性**：Gaussian 优化收敛性
- **依赖项**：3DGS 基础库、hash grid 实现（tiny-cuda-nn 或类似）

## 推荐结论
✅ 推荐关注（几何-外观分离策略对网格处理有参考价值）

## 开源参考
- 3DGS: https://github.com/graphdeco-inria/gaussian溅射
- NeST Splatting: 相关文献
- tiny-cuda-nn: hash grid MLP

## 应用场景
- 神经隐式几何重建
- 新视角合成
- 几何-外观分离压缩

## 相关笔记
[[3DGS-Geometry-Reconstruction]]
