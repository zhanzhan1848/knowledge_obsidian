---
tags: [几何, 高斯溅射, 骨骼绑定, 4D重建, 网格]
---

# Skelebones: Reconstruct and Rig Animatable Categories with Level of Dynamics

## 核心方法

**问题定义**: 从4D数据（时间序列3D形状）提取可驱动骨骼 representation，捕捉非刚性变形。

**核心方法** - 三步骨骼绑定系统:
1. **Bones**: 将时序一致的 deformable Gaussians 压缩为 free-form bones，逼近非刚性表面变形
2. **Skeleton**: 从 canonical Gaussians 提取 Mean Curvature Skeleton并时序细化 → category-agnostic, motion-adaptive, topology-correct 运动结构
3. **Binding**: 通过非参数化逐部件运动匹配 (PartMM) 绑定骨骼 → 合成新骨骼运动

**关键创新**:
- Partwise Motion Matching: 匹配、检索、混合现有运动
- 低数据泛化（~1000帧）能力强

## 实验结果
- PSNR 提升 17.3% over LBS, 21.7% over Bag-of-Bones
- 48.4% RMSE 提升 over robust LBS
- >20% 优于 GRU/MLP 方法

## 开源实现
- Project Page: https://cookmaker.cn/gaussianimate
- Code: 待公开

## 相关笔记
[[几何, 网格变形]]
[[几何, 骨骼动画]]
[[几何, 高斯溅射]]
