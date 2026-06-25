---
tags: [渲染, 光照一致, 辐射场, 3DGS, 2026]
date: [[2026-06-25]]
status: 待读
---

# Lighting-Consistent Object Transfer Across Radiance Fields

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | George Drettakis |
| 发表 | Computer Graphics Forum (EGSR) 2026 |
| 链接 | [arXiv:2606.22481](https://arxiv.org/abs/2606.22481) |
| PDF | [PDF](https://arxiv.org/pdf/2606.22481) |
| 项目 | [dot3d](https://repo-sam.inria.fr/nerphys/dot3d) |

## 核心贡献
1. 提出扩散模型解决 3D Gaussian Splatting (3DGS) 场景间光照不一致问题
2. 构建异构数据集（合成、生成、真实数据）训练光照调和模型
3. 实现完整的 3D 解决方案：提取源场景物体 → 合成到目标场景 → 渲染 → 调和 → 3DGS 优化

## 技术方案

### 问题定义
将从源场景提取的物体简单粘贴到目标场景会因光照条件不同产生不真实结果。

### 解决方案
1. 从源场景提取物体并合成到目标场景
2. 渲染目标场景中含合成物体的视图
3. 扩散模型调和每帧视图
4. 通过后优化步骤整合到 3DGS 表示

### 训练数据
异构数据集，包含：
- 不一致合成输入
- 一致输出
- 合成、生成和真实数据的组合

## 实验结论
- 显著提升物体跨场景传递的质量和易用性
- 视觉效果优于先前方法

## 标签
#3DGS #RadianceFields #LightingConsistency #NeuralRendering

## 相关笔记
[[2026-06-25_Mesh2GS-White-Box-3DGS-Plenoptic-Sampling]]
