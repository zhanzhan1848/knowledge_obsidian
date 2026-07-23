---
title: "Fast Multi-view Topologically Consistent Face Reconstruction in the Wild via UV-space Neural Fusion"
authors: ["..."]
date: 2026-07-19
tags: [人脸重建, UV空间, 网格重建, 几何处理, 神经隐式]
venue: arXiv cs.CV (交叉列表至 cs.GR)
paper: https://arxiv.org/abs/2607.18798
code: https://github.com/grignarder/UVFaceFusion
arXiv: 2607.18798
---

## 核心方法

UVFaceFusion：多视角、固定拓扑人脸重建的前馈框架。

### 关键创新点
1. **UV空间神经融合**：在标准UV空间进行几何-几何融合，减少对数据集特定外观和采集条件的依赖
2. **固定拓扑网格**：直接从融合的UV空间点图采样生成mesh
3. **高效推理**：16视角输入，RTX 4090上<3秒完成重建

### 算法流程
1. 多视角图像 → VGGT 获取密集点图 + Pixel3DMM 获取UV对应
2. 各视角点图提升到标准UV域
3. **Mask-aware 神经融合网络**预测完整UV空间点图
4. 从UV点图直接采样固定拓扑mesh

### 技术亮点
- 仅在 Ava-256 上训练，泛化到多种公开数据集和野外采集
- 融合网络学习几何对应而非外观
- 兼顾几何保真度和拓扑一致性

## 算法复杂度
- **时间**：前馈网络，<3秒（16视角，RTX 4090）
- **空间**：UV空间融合，O(n) 内存
- **可并行**：网络推理天然并行

## 开源实现
- GitHub: https://github.com/grignarder/UVFaceFusion
- VGGT, Pixel3DMM 作为预处理

## 相关笔记
[[人脸重建]]
[[UV参数化]]
[[网格重建]]
[[神经隐式]]

## 可行性评估

✅ **推荐关注**

- UV空间融合方法可迁移到其他几何融合任务
- 固定拓扑mesh采样适合动画/游戏管线
- 训练-推理分离，适合集成到现有 pipeline

### 开源参考
- libigl: UV参数化、mesh采样
- 融合网络代码已开源
