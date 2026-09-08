---
tags: [点云, 神经编辑, 表面一致性, 自监督, 变形]
---

# Self-Supervised Surface Consistency for Point-Based Neural Editing

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.03349](https://arxiv.org/abs/2609.03349) |
| 分类 | cs.CV, cs.GR |
| 日期 | 2026-09-03 |
| 会议 | ECCV 2026 |
| 项目 | [p-core](https://zvict.github.io/p-core/) |

## 核心问题

点基神经表示缺乏固定连通性，导致大变形下出现孔洞和表面不连续。

## 核心方法

1. **自监督表面一致性**：
   - 生成随机变形
   - 确保变形前后表面预测一致
   - 变形点云表面预测 = 原始点云表面预测 + 变形

2. **基于注意力的点表示**：
   - 使用学习型插值核（而非Gaussian核）
   - 可学习适应大变形，无需增减点

## 关键创新点

- 自监督学习，无需变形几何的多视角图像
- 学习型插值核替代固定Gaussian核
- 零样本编辑优于现有点基方法
- 减少大变形伪影

## 数据集

- Neural Editor, Objaverse (合成编辑)
- DTU, Mip-NeRF 360 (真实场景)

## 开源实现

- 待发布

## 相关笔记

[[PointGT-Point-Based-Geometry-Texture-Editing]]

## 可行性分析

✅ **推荐实现**

- 点基表示编辑的创新方法
- 自监督学习减少对标注数据依赖
- 可用于点云变形和表面编辑
