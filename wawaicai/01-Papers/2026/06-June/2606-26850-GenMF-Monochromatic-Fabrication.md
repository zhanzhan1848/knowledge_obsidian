---
title: "GenMF: Appearance-Preserving Refinement of Generated 3D Assets for Monochromatic Fabrication"
date: 2026-06-25
tags: [几何, 网格处理, 3D打印, 外观保留, 几何细化]
paper_id: arXiv:2606.26850
authors: Chentao Shen et al.
conference: cs.GR
---

# GenMF: Appearance-Preserving Refinement for Monochromatic Fabrication

## 核心方法
将纹理依赖的视觉线索转换为几何诱导的着色效果，将几何细化表述为外观保留与制造导向鲁棒性之间的平衡。

### 关键挑战
- 生成资产的视觉保真度主要编码在纹理而非几何中
- 单色材料制造时纹理信息大量丢失
- 恢复纹理依赖外观所需的几何扰动可能引入尖锐局部特征和高频表面结构
- 这些特征会增加应力集中和制造风险

### 技术方案
1. **Appearance-Oriented Geometry Refinement** - 外观导向几何细化框架
2. **Differentiable Stress-Aware Regularization** - 基于学习热应力预测器的可微分应力感知正则化
3. **Fabrication-Oriented Robustness** - 制造导向鲁棒性

## 创新点
- 首次将纹理依赖外观转换为几何诱导着色效果
- 引入可微分应力感知正则化减少结构应力
- 弥合模拟与物理制造之间的差距

## 应用
- 物理 3D 打印示例表明细化几何在保持可识别视觉细节的同时适合制造

## 开源实现
- 预处理论文

## 相关笔记
[[Mesh Refinement]]
[[3D Printing]]
[[Geometry Processing]]