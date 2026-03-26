---
title: Geometry-Texture Aware LiDAR-Regularized 3D Gaussian Splatting
authors: Yan Fang et al.
date: 2026-03-26
source: arXiv cs.GR
url: https://arxiv.org/abs/2603.23192
pdf: https://arxiv.org/pdf/2603.23192
tags: [rendering, paper, 2026, 3DGS, gaussian-splatting, lidar, scene-reconstruction]
status: unread
---

# Geometry-Texture Aware LiDAR-Regularized 3D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Geometry-Texture Aware LiDAR-Regularized 3D Gaussian Splatting for Realistic Scene Reconstruction |
| 作者 | Yan Fang et al. |
| 来源 | arXiv:2603.23192 [cs.GR] |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.23192) |
| PDF | [下载](https://arxiv.org/pdf/2603.23192) |

## 核心贡献
1. **LiDAR-centric 3DGS框架**：将LiDAR几何先验显式融入整个高斯优化过程，而非仅作为初始化源
2. **几何-纹理感知分配策略**：选择性将高斯基元分配到高结构或外观复杂度区域
3. **曲率自适应细化机制**：在训练期间动态引导高斯分裂向几何复杂区域

## 技术方案
- 解决传统3DGS依赖SfM稀疏点云导致的尺度模糊和几何一致性问题
- 将3DGS优化重新表述为固定表示预算下的几何条件分配与细化问题
- 引入置信度感知度量深度正则化，使用LiDAR测量锚定重建几何到绝对尺度
- 在ScanNet++数据集和真实世界数据集上验证，达到SOTA度量尺度重建性能

## 公式
```math
# 几何-纹理感知分配
# 根据结构复杂度和外观复杂度分配高斯基元

# 曲率自适应细化
# 动态引导高斯分裂到高曲率区域

# 置信度感知深度正则化
L_depth = λ * ||D_pred - D_lidar|| * C_conf
```

## 代码
```cpp
// 伪代码：几何-纹理感知分配
void allocateGaussians(PointCloud lidar, Image textures) {
    for (auto& point : lidar) {
        float structural_complexity = computeCurvature(point);
        float appearance_complexity = computeTextureVariance(point);
        
        if (structural_complexity > threshold_s || 
            appearance_complexity > threshold_a) {
            assignGaussianPrimitive(point);
        }
    }
}
```

## 实验结论
- 在ScanNet++数据集上达到SOTA性能
- 高几何保真度的度量尺度重建
- 相比纯SfM方法，几何一致性显著提升

## 局限性
- 依赖LiDAR传感器数据
- 需要额外的深度正则化计算

## 可行性分析
- 实现难度：中等（需要集成LiDAR数据管道）
- 性能预期：高（实时渲染+高保真重建）
- 适用场景：室内场景重建、数字孪生、机器人导航

## 相关工作
- [[3D Gaussian Splatting]]
- [[NeRF]]
- [[Structure-from-Motion]]

## 笔记
这篇论文解决了3DGS在实际应用中的关键问题——几何一致性和尺度模糊。通过引入LiDAR先验，显著提升了重建质量。对于需要精确度量重建的应用场景非常有价值。
