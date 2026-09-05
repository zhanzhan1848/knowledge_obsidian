---
tags: [几何, 点表示, 自监督, 编辑, 变形, ECCV2026]
---

# Self-Supervised Surface Consistency for Point-Based Neural Editing

## 论文信息
- **arXiv**: [2609.03349](https://arxiv.org/abs/2609.03349)
- **会议**: ECCV 2026
- **作者**: 
- **日期**: 2026-09-03

## 核心方法
提出自监督方法，使点基表示能够适应大变形，无需变形几何的真值多视角图像。

## 技术要点
- **问题**: 点基表示缺乏固定连通性，不限制学习表面拓扑到初始化拓扑；但这导致大变形下孔洞和表面不连续
- **核心思想**: 
  1. 生成随机变形
  2. 确保变形前后表面预测一致
  3. 变形点云的表面预测 = 对原始点云表面预测应用变形
- **注意力点表示**: 整合到基于注意力的点表示，使用学习插值核（而非 Gaussian kernel），可学习适应大变形
- **效果**: 显著增强对大变形的鲁棒性，减少伪影

## 几何算法
- 点基神经表示
- 自监督学习
- 表面一致性
- 注意力机制

## 数据集
- Neural Editor, Objaverse (合成编辑基准)
- DTU, Mip-NeRF 360 (真实场景)

## 开源实现
- 项目页面: https://zvict.github.io/p-core/

## 相关笔记
[[2026-09-05-PointGT-Point-Based-Geometry-Texture-Editing]]
