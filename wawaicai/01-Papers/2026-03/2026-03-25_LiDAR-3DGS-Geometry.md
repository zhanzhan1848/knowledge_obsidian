---
tags: [几何, 点云, 3D重建, Gaussian-Splatting, LiDAR]
arxiv: https://arxiv.org/abs/2603.23192
date: 2026-03-25
status: new
---

# Geometry-Texture Aware LiDAR-Regularized 3D Gaussian Splatting for Realistic Scene Reconstruction

## 元信息
- **arXiv ID**: 2603.23192
- **提交日期**: 2026-03-24
- **作者**: Yan Fang et al.
- **领域**: cs.GR (Graphics), cs.MM (Multimedia)
- **PDF**: https://arxiv.org/pdf/2603.23192

## 核心问题
传统 3D Gaussian Splatting (3DGS) 依赖 SfM 稀疏点云，存在：
1. 尺度模糊性
2. 几何一致性有限
3. 视角依赖性强
4. 缺乏几何先验

## 核心方法

### LiDAR 中心化框架
将 LiDAR 数据作为主动几何先验，而非被动初始化源。

### 三大关键技术

#### 1. 几何-纹理感知分配策略
- 选择性分配 Gaussian primitives
- 针对高结构/外观复杂度区域
- 固定表示预算下的优化

#### 2. 曲率自适应细化机制
- 训练期间动态引导 Gaussian splitting
- 聚焦几何复杂区域
- 自适应细化策略

#### 3. 置信度感知度量深度正则化
- 使用 LiDAR 测量锚定重建几何
- 绝对尺度约束
- 保持优化稳定性

## 复杂度分析
- **时间复杂度**: N/A
- **空间复杂度**: 固定表示预算
- **优势**: 度量尺度重建 + 高几何保真度

## 创新点
1. 将 3DGS 优化重构为几何条件化分配与细化问题
2. LiDAR 数据的主动使用而非被动初始化
3. 曲率自适应的动态细化策略
4. 置信度感知的度量深度约束

## 实验结果
- **数据集**: ScanNet++ + 自定义真实世界数据集
- **性能**: SOTA 度量尺度重建
- **几何保真度**: 显著优于传统 3DGS

## 开源实现
- 论文代码: 待发布
- 相关框架:
  - 3D Gaussian Splatting (原始实现)
  - ScanNet++ 数据集

## 应用场景
- 室内场景重建
- 自动驾驶环境建模
- VR/AR 内容创建
- 机器人导航地图

## 技术标签
`#point-cloud` `#3d-reconstruction` `#gaussian-splatting` `#lidar` `#scene-understanding`

## 相关笔记
[[点云重建]]
[[3D Gaussian Splatting]]
[[LiDAR 处理]]

## 推荐度
⭐⭐⭐⭐ **推荐**

### 理由
- 解决 3DGS 几何一致性问题
- LiDAR + 3DGS 结合创新
- 度量尺度重建实用价值高
- 适合实际应用场景

## 局限性
- 依赖 LiDAR 设备
- 固定预算可能限制细节
- 室外大场景待验证

## 后续行动
- [ ] 追踪代码发布
- [ ] 评估与 Point-E 结合
- [ ] 对比 NeRF 几何质量
- [ ] 传递给 @吊龙 评估后端集成
