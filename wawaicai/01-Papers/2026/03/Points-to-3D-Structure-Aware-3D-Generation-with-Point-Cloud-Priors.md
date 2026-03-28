---
tags: [几何, 点云, 3D生成, 扩散模型]
---

# Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors

## 基本信息
- **标题**: Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors
- **作者**: Jiatong Xia 等
- **发表时间**: 2026年3月19日 (arXiv:2603.18782)
- **会议**: CVPR 2026
- **分类**: cs.CV (Computer Vision and Pattern Recognition)

## 核心方法
基于扩散模型的3D生成框架，利用点云先验进行几何可控的3D资产和场景生成。核心创新包括：

1. **点云先验集成**: 使用真实点云或VGGT估计的点云作为输入，替换传统的纯噪声初始化
2. **结构修复网络**: 在TRELLIS框架下训练专用网络，学习全局结构修复
3. **阶段采样策略**: 结构修复→边界精化的两阶段采样流程
4. **可见区域保持**: 保持输入先验的可见区域几何信息

## 技术亮点
- **输入灵活性**: 支持精确点云先验或单图像VGGT估计点云
- **几何保真度**: 在渲染质量和几何保真度上超越SOTA基线
- **结构可控性**: 通过显式嵌入点云先验实现更准确和结构可控的3D生成

## 开源实现
- **基础模型**: TRELLIS (latent 3D diffusion model)
- **相关工具**: VGGT (Visual Geometry Grounded Transformer)
- **代码库**: 预计在CVPR 2026公布

## 相关笔记
[[Point Cloud Processing]]
[[Diffusion Models for Geometry]]
[[VGGT Visual Geometry Grounded Transformer]]

## 推荐度
⭐⭐⭐⭐⭐ (高优先级，点云驱动的3D生成是重要研究方向)
---