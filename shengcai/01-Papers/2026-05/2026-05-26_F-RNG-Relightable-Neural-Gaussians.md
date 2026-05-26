---
title: F-RNG Feed-Forward Relightable Neural Gaussians
authors: (待补充)
venue: arXiv
date: 2026-05-25
tags: [渲染, 3DGS, 重光照, 前馈网络, 神经渲染]
status: 待读
arxiv: "2605.25975"
links:
  - arXiv: https://arxiv.org/abs/2605.25975
  - PDF: https://arxiv.org/pdf/2605.25975
---

# F-RNG: Feed-Forward Relightable Neural Gaussians

## 核心贡献

1. **前馈重光照框架**: 直接从稀疏视角输入生成可重光照3DGS资产
2. **利用大模型先验**: 基于LRM和IDM，无需重新训练
3. **Latent-interpolated细粒度几何合成**: 增强LRM几何表示
4. **先验引导的可重光照外观蒸馏**: 提取可重光照神经表示
5. **通用神经渲染器**: 支持任意新光源下的灵活高保真重光照

## 技术方案

### 架构
- **基础**: Large Reconstruction Model (LRM)
- **辅助**: Intrinsic Decomposition Model (IDM)
- **训练成本**: 仅需小型网络，可接受的数据和计算资源

### 关键模块

1. **几何增强**:  latent-interpolated fine-grained geometry synthesis
2. **外观分解**: prior-guided relightable appearance distillation
3. **神经渲染器**: universal neural renderer for novel lighting

### 性能
- **重光照速度**: ~25× faster than state-of-the-art LRM-based methods
- **质量提升**: ~+2.0 dB

## 核心思想

```
稀疏视角输入 → LRM几何增强 → IDM先验外观蒸馏 → 通用神经渲染器 → 可重光照3DGS资产
```

## 特点

- **即插即用**: 无需重新训练或微调底层LRM/IDM
- **可扩展**: 自动受益于未来更好的LRM和IDM
- **稀疏输入**: 支持稀疏视角重建
- **开集物体**: 支持复杂外观如毛发等

## 应用场景

- 娱乐（游戏、电影）
- 电商（商品3D重建）
- 虚拟现实

## 推荐度

⭐⭐⭐⭐⭐ (5/5)

前馈可重光照3DGS方向突破性工作，实现效率和质量双重提升。

## 行动建议
已传递给 @墨鱼丸 进行算法评估。适合作为重光照模块的实现参考。