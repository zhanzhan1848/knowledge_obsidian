---
tags: [几何, 点云, 编辑, 神经编辑, 表面一致性, 自监督]
---

# P-CORE: Self-Supervised Surface Consistency for Point-Based Neural Editing

## 论文信息
- **arXiv**: [2609.03349](https://arxiv.org/abs/2609.03349)
- **日期**: 2026-09-03
- **作者**: (待补充)

## 核心方法
提出自监督方法使点基表示能够适应大变形，无需变形几何的 ground truth 多视角图像。核心思想：生成随机变形，确保变形前后预测表面的一致性。

## 技术要点
- **问题**: 
  - 点基表示无固定连接性，不将学习表面拓扑限制为初始化拓扑
  - 但在大的变形下容易出现孔洞和表面不连续
- **解决**:
  - 生成随机变形
  - 确保变形前后表面预测的一致性
  - 变形点云的表面预测 = 原始点云表面预测 + 变形应用
  - 融入基于注意力的点表示 (attention-based point representations)
  - 使用学习的插值核而非高斯核
- **效果**: 在 Neural Editor、Objaverse 数据集上显著优于现有点基方法，零样本编辑效果更好

## 几何算法
- 点基神经表示 (point-based neural representation)
- 注意力插值核 (learned interpolation kernel)
- 表面一致性损失 (surface consistency loss)
- 非刚性变形编辑 (non-rigid deformation editing)

## 相关笔记
[[2026-09-05-PointGT-Point-Based-Geometry-Texture-Editing]]
