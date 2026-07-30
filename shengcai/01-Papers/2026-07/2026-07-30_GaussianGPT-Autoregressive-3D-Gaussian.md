---
tags: [渲染, 3DGS, 生成模型, 2026]
date: 2026-07-30
status: 待读
---

# GaussianGPT: Towards Autoregressive 3D Gaussian Scene Generation

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Nicolas Von Lützow |
| 发表 | arXiv cs.CV / ECCV 2026 (2026-07-01 更新) |
| 链接 | [原文](https://arxiv.org/abs/2603.26661) |

## 核心贡献

1. **自回归 3D 生成**: 首个通过 next-token 预测直接生成 3D Gaussian 的 Transformer 模型
2. **Sparse 3D Convolutional Autoencoder + VQ**: 将 Gaussian 图元压缩为离散潜在网格
3. **因果 Transformer + 3D RoPE**: 使用 3D 旋转位置编码，支持空间结构和外观的顺序生成

## 技术方案

### 问题
- 近期 3D 生成模型大多依赖扩散或流匹配
- 自回归方法在 3D 领域尚未有突破性进展

### 方法
- Gaussian 图元 → 离散潜在网格（稀疏 3D 卷积自编码器 + VQ）
- 序列化潜在标记 → 因果 Transformer 建模
- 支持完井、补绘、温度可控采样、灵活生成范围

## 公式

向量量化：
```math
z_q = \text{argmin}_{z_k \in Z} \|z_e - z_k\|
```

3D 旋转位置编码：
```math
\text{RoPE}(x, y, z) = \text{exp}(i \mathbf{k} \cdot \mathbf{p})
```

## 实验结论

- 在 ECCV 2026 发表
- 支持场景补全、补绘等可控生成

## 局限性

- 3D Gaussian 表示的离散化可能损失精度
- 自回归生成速度可能较慢

## 推荐度

- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐
- **难度**: 高

## 标签

#3DGS #自回归 #生成模型 #Gaussian #ECCV2026
