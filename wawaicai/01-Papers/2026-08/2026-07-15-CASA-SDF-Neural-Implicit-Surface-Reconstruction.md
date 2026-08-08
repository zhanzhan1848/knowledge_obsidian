---
tags: [几何, 神经隐式, 表面重建, SDF]
created: 2026-07-15
subject: cs.CV
---

# CASA-SDF: Curriculum-Aware Spatial Adaptation for Neural Implicit Surface Reconstruction

## 核心方法

**CASA-SDF** 是一个统一框架，通过**监督和表示能力的协同适应**解决室内表面重建的几何异质性问题。

### 问题背景

室内场景的**几何异质性**导致高保真重建困难：
- 大面积无纹理平面区域需要更强正则化抑制高频伪影
- 薄结构需要更锐利、自适应的表示防止过度平滑
- MLP 的光谱偏差导致过平滑

现有方法的局限：
- 空间无差别 prior 监督
- 场景全局 SDF-to-density 变换

### 解决方案

1. **Hybrid Spatially-Adaptive Uncertainty Annealing (SAUA)**
   - 融合语义和光度不确定性
   - 构建逐像素课程用于单目 prior 监督
   - 在可靠区域保持正则化
   - 训练早期衰减不可靠监督启用数据驱动光度细化

2. **Curvature-Aware Locally Adaptive Density Transformation (CALADT)**
   - 通过曲率代理逐步调制 SDF-to-density 映射的锐度
   - 增强薄结构表示

### 核心思想

- **课程学习**: 自适应调整监督强度
- **局部自适应**: 根据几何特征调整表示能力
- **曲率感知**: 更好处理薄结构和尖锐特征

## 实验结果

- 在基准室内数据集上改进表面完整性和高频结构细节恢复
- 不损害平面稳定性

## 可行性评估

✅ **推荐实现**

- 室内场景神经隐式重建的重要进展
- 课程学习和局部自适应策略值得借鉴
- 对薄结构和平滑区域的平衡处理有参考价值

📝 **开源参考**: 可参考其 SDF 监督策略优化现有重建 pipeline
