---
tags: [几何, 点云, 上采样, 高斯溅射]
---

# Mesh-based Point Cloud Upsampling with 3D Gaussian Splatting

## 基本信息
- **标题**: Mesh-based point cloud upsampling with 3D Gaussian splatting
- **期刊**: Machine Vision and Applications
- **发表时间**: 2026年
- **分类**: 点云处理、几何重建

## 核心方法
基于网格和3D高斯溅射的点云上采样方法：

1. **网格驱动**: 利用网格结构信息指导点云上采样
2. **高斯溅射**: 使用3D高斯溅射技术提高点云密度和质量
3. **特征一致性**: 通过特征一致性学习处理密度不平衡问题

## 技术贡献
- **密度均衡**: 解决LiDAR点云中常见的密度不平衡问题
- **几何保持**: 保持原始点云的几何结构特征
- **边缘感知**: 在边缘区域保持更高采样密度

## 开源参考
- **相关算法**: Point cloud upsampling algorithms systematic review
- **基础方法**: Pu-net, Point cloud upsampling network
- **处理流程**: Patch-based progressive 3D point set upsampling

## 相关笔记
[[Point Cloud Processing]]
[[Mesh Generation]]
[[3D Gaussian Splatting]]

## 推荐度
⭐⭐⭐⭐ (中等优先级，点云上采样是基础但重要的技术)
---