---
tags: [几何, 神经隐式, 表面重建, 曲率, SDF]
type: paper
date: 2026-07-20
source: arXiv cs.CV (cross-list cs.GR)
---

# Curriculum-Aware Spatial Adaptation with Curvature-Guided Density for Neural Implicit Surface Reconstruction

## 论文信息

- **arXiv**: [2607.13492](https://arxiv.org/abs/2607.13492)
- **作者**: (待补充)
- **会议/期刊**: cs.CV → CGF (Computer Graphics Forum)
- **日期**: 2026-07-15

## 核心方法

### 问题定义
- 高保真室内表面重建面临显著挑战
- **几何异质性**: 室内场景的几何异质性明显
  - 大面积无纹理平面区域需要更强正则化抑制高频伪影
  - 薄结构需要更锐利、自适应表示防止过平滑

### 现有方法局限
- 空间无差别先验监督
- 场景全局 SDF-to-density 变换
- 无法平衡平面平滑性和细节保留

### 创新点：CASA-SDF
**课程感知空间自适应 SDF**

#### 1. Hybrid Spatially-Adaptive Uncertainty Annealing (SAUA)
- 融合语义和光度不确定性
- 构建像素级课程用于单目先验监督
- 策略：
  - 可靠区域保持正则化
  - 训练早期衰减不可靠监督
  - 启用数据驱动光度细化

#### 2. Curvature-Aware Locally Adaptive Density Transformation (CALADT)
- 通过曲率代理逐步调制 SDF-to-density 映射锐度
- 增强薄结构表示能力

## 技术细节

### 曲率代理 (Curvature Proxy)
- 估计局部曲面曲率
- 指导 SDF-to-density 转换
- 薄结构区域增大锐度

### 课程学习策略
- 渐进式调整监督强度
- 平衡全局结构和局部细节

## 相关技术

- [[Neural Implicit Surface]]
- [[SDF (Signed Distance Field)]]
- [[Surface Reconstruction]]
- [[Curvature Estimation]]
- [[Monocular Depth]]
- [[3D Reconstruction]]

## 可行性评估

⚠️ **谨慎评估**

- 神经隐式方法，训练成本高
- 室内场景专用
- 曲率指导机制有启发性
- 适合研究集成到现有 pipeline

## 参考文献

- 相关 DOI: https://doi.org/10.1111/cgf.70541
