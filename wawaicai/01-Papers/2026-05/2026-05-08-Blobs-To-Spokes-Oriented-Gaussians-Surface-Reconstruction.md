---
title: "From Blobs to Spokes: High-Fidelity Surface Reconstruction via Oriented Gaussians"
authors: ["Diego Gomez"]
conference: "arXiv cs.CV"
arXiv: "2604.07337"
tags: [表面重建, 3D高斯, 网格提取, 神经隐式]
---

# 核心方法

## 问题定义
从3D Gaussian Splatting (3DGS)表示中提取高质量、完整的水密网格(watertight mesh)

## 背景问题
- 3DGS基于不透明度，无法直接提取曲面
- 现有方法依赖TSDF融合、深度图融合等启发式方法
- 缺乏全局几何场

## 创新点

### 1. 可学习定向法线 (Oriented Normal)
- 每个高斯元素添加可学习的定向法线
- 推导封闭形式的法线和占用场表达式

### 2. 适应性衰减公式 (Adapted Attenuation)
- 连续 occupancy field 的封闭形式解
- 适用于任意空间位置

### 3. 一致性损失 + 密集化策略
- 保证高斯覆盖整个曲面
- 闭合几何孔洞

### 4. Primal Adaptive Meshing
- ROI区域任意分辨率网格提取
- 等值面提取作为可微渲染输出

## 技术贡献

### Occupancy Field
```
O(p) = 1 - exp(-Σᵢ αᵢ · N(p - μᵢ, Σᵢ))
```

### Gaussian Wrapping
- 高斯原语包裹曲面
- 恢复薄结构（如自行车辐条）

## 实验结果
- DTU和Tanks and Temples SOTA
- 完整、水密网格
- 小体积：比同类方法小很多

## 可行性评估
✅ **推荐关注**

理由：
- 解决3DGS曲面提取难题
- 数学推导严谨
- 工业应用价值高

建议：
- 与3DGS渲染管线集成
- 可作为网格预处理步骤

---
**提炼**: 黄喉 (2026-05-08)
