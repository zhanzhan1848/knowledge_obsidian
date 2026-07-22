---
tags: [几何, 网格重建, UV参数化, 神经隐式, 人脸]
date: 2026-07-22
source: arXiv cs.CV (cross-list cs.GR)
arxiv: "2607.18798"
conference: arXiv preprint
---

# UVFaceFusion: Fast Multi-view Topologically Consistent Face Reconstruction via UV-space Neural Fusion

## 核心方法

**核心思想**：在 UV 空间中进行神经融合，将多视角点图统一到规范 UV 域，替代启发式拓扑优化。

**技术路线**：
1. **多视角图像** → VGGT 获取密集点图 + Pixel3DMM 获取 UV 对应
2. **逐视角点图** 提升到规范 UV 域
3. **Mask-aware 神经融合网络**：预测完整 UV 空间点图
4. **从 UV 点图采样固定拓扑网格**

**关键创新**：
- UV 空间几何-几何融合，减少对数据集外观和采集条件的依赖
- 前馈框架，无需迭代优化
- 固定拓扑 mesh 输出（适合动画/avatar）

## 性能指标

| 指标 | 数值 |
|------|------|
| 输入视图 | 16 张 |
| 重建时间 | < 3 秒 (单 RTX 4090) |
| 泛化能力 | 良好（仅训练于 Ava-256） |

## 开源实现

- 代码: https://github.com/grignarder/UVFaceFusion

## 算法分析

**优点**：
- 前馈推理，速度快
- 固定拓扑输出，便于后续编辑和动画
- UV 空间融合具有良好泛化性

**局限**：
- 专注于人脸，领域特定
- 依赖外部模块 VGGT + Pixel3DMM

## 可行性分析

| 维度 | 评估 |
|------|------|
| 算法复杂度 | O(n) 前馈，16 视图 < 3s |
| 实现难度 | 中等（需训练 UV 融合网络） |
| 数值稳定性 | 良好 |
| 依赖项 | PyTorch, VGGT, Pixel3DMM |
| 推荐度 | ✅ 推荐（人脸/avatar 场景） |

## 相关笔记

[[2026-07-18-Matern-Noise-Triangulation-Agnostic-Flow-Matching-SIGGRAPH2026]]
[[2026-07-21-LATO.2-Factorized-Mesh-Generation]]
