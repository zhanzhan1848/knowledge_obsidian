---
tags: [几何, 网格处理, 网格合成, 相交检测]
date: 2026-04-13
source: arXiv cs.GR
paper_id: 2604.08799
project: https://threedle.github.io/MeshOn/
---

# MeshOn: Intersection-Free Mesh-to-Mesh Composition

## 核心方法

给定 accessory、base mesh 和用户定义的目标区域，MeshOn 使用多步优化框架将两个网格现实地贴合在一起，同时防止相交。

**关键技术点**：
1. **Vision-to-Language 对齐**：初始化形状的刚性配置
2. **吸引几何损失 + 物理屏障损失**：防止表面相交
3. **扩散先验辅助形变**：获得最终形变

## 创新点
1. **Intersection-free**：物理启发的屏障损失防止网格相交
2. **文本条件**：可选文本字符串指导 accessory 和 base mesh
3. **多材质支持**：可处理各种材质的 accessory

## 开源实现
- GitHub: threedle/MeshOn (待确认)
- 主页: https://threedle.github.io/MeshOn/

## 可行性分析
- **算法复杂度**：高 (多步优化 + 扩散模型)
- **数值稳定性**：中等 (优化方法)
- **依赖项**：扩散模型、VLMs
- **推荐度**：⭐⭐⭐⭐ 实用网格合成工具

## 相关笔记
[[2026-03-26-WorldMesh-Mesh-Conditioned-Image-Diffusion-3D-Scenes]]
