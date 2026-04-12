---
tags: [几何, 网格变形, 风格化, SIGGRAPH2026]
---

# GeoStyle: Image-Guided Geometric Stylization of 3D Meshes

## 核心方法

**问题定义**: 如何根据单张图像对3D网格进行大胆的几何风格化变形，同时保持拓扑和语义完整性。

**核心方法**:
1. **粗到细风格化管线** (coarse-to-fine stylization pipeline)：先用扩散模型从图像提取风格表示，然后逐步对网格进行变形
2. **保持原始网格有效拓扑**和**部件级语义**
3. **近似VAE编码器**：从网格渲染提供高效可靠的梯度

**技术亮点**:
- 利用预训练扩散模型提取图像的抽象风格表示
- 网格变形可表达多样几何变化（夸张姿态、轮廓剪影等）
- 支持独特艺术3D创作

## 算法复杂度
- 时间：待评估（基于扩散模型 + 网格变形）
- 空间：GPU显存需求较高

## 开源实现
- Project Page: https://changwoonchoi.github.io/GeoStyle
- 待查找代码仓库

## 相关笔记
[[几何, 网格变形]]
[[会议, SIGGRAPH2026]]
