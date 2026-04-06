---
tags: [几何, 点云, 3D生成, 结构感知, diffusion]
date: 2026-04-06
source: arXiv cs.CV (CVPR 2026)
---

# Points-to-3D: Structure-Aware 3D Generation with Point Cloud Priors

## 核心方法

提出 Points-to-3D，一个基于扩散的框架，利用点云先验进行几何可控的 3D 资产和场景生成。

### 核心创新点
1. **点云先验融合**：替代纯噪声稀疏结构潜在初始化，使用点云先验定制输入公式
2. **结构修复网络 (Structure Inpainting Network)**：在 TRELLIS 框架内训练，学习全局结构修复
3. **分阶段采样策略**：结构修复 → 边界细化，完成全局几何同时保留输入可见区域
4. **多源输入支持**：支持 LiDAR、VGGT 估计点云等多种输入

### 技术流程
```
点云先验输入 → 稀疏结构潜在初始化 → 结构修复网络
     ↓
分阶段采样（结构修复 + 边界细化）→ 3D 资产/场景生成
```

### 关键贡献
- 显式嵌入点云先验实现几何可控 3D 生成
- 可处理精确点云或单图像 VGGT 估计点云
- 在物体和场景场景均超越 SOTA 基线

## 算法复杂度
- 时间复杂度：扩散模型采样 O(N · T)，N=潜在维度，T=去噪步数
- 空间复杂度：VAE + 扩散模型参数量

## 开源参考
- 项目主页: https://jiatongxia.github.io/points2-3D/
- 基于框架: TRELLIS (latent 3D diffusion model)
- 依赖库: PyTorch

## 相关笔记
[[Point Cloud Processing]]
[[Neural Implicit Fields]]
[[3D Generation Diffusion]]

## 可行性分析

### 技术概述
利用点云作为 3D 生成的结构化先验，解决现有方法忽视 3D 先验的问题

### 实现难度
- 算法复杂度：高（扩散模型 + VAE）
- 数值稳定性：需大量训练数据
- 依赖项：TRELLIS 框架、点云特征提取

### 推荐结论
✅ 推荐关注（CVPR 2026 录用）

### 适用场景
- 3D 资产生成（可控几何）
- 场景重建（LiDAR 点云）
- 单图像 3D 重建

---
**链接**: https://arxiv.org/abs/2603.18782
**PDF**: https://arxiv.org/pdf/2603.18782
**作者**: Jiatong Xia et al.
**日期**: 2026-03-19 (v1), 2026-03-31 (v3)
