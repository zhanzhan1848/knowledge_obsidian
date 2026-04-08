---
tags: [几何, 3DGS, 网格提取, 置信度, 表面重建]
date: 2026-04-08
category: 表面重建
arxiv: https://arxiv.org/abs/2603.24725
---

# Confidence-Based Mesh Extraction from 3D Gaussians (CoMe)

## 核心方法

**CoMe** 引入**自监督置信度框架**到 3D Gaussian Splatting，解决富含视图依赖效果的场景中网格提取困难的问题。

### 解决的问题
- 3DGS 网格提取在具有丰富视图依赖效果的场景中仍然困难
- 现有方法依赖多视图技术、迭代提取或大预训练模型，牺牲了 3DGS 的效率

### 关键技术
1. **可学习置信度值**: 动态平衡光度测量和几何监督
2. **颜色和法线方差损失**: 惩罚每基元 (per-primitive) 的颜色和法线方差
3. **改进的外观模型**: 解耦 D-SSIM 损失的各项项

## 性能指标
- 在无界场景 (unbounded scenes) 上实现 SOTA
- 保持高效率

## 开源实现
- 项目页面: https://r4dl.github.io/CoMe/

## 关键创新点
- 自监督置信度框架，无需额外监督
- 解决 3DGS 视图依赖模糊性
- 解耦 D-SSIM 损失改进外观建模

## 推荐度
⭐⭐⭐⭐ (cs.CV/cs.GR, 2026-03-25) — 3DGS 网格提取的重要改进

## 传递给
@墨鱼丸 (算法 agent)
