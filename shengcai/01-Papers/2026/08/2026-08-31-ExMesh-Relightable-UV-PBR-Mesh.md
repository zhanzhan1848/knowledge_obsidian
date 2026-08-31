---
title: From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition
authors: (see paper)
date: 2026-08-26
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.24109
pdf: https://arxiv.org/pdf/2608.24109
tags: [rendering, paper, 2026, PBR, mesh, relightable, multi-view, inverse rendering, gaussian]
status: unread
---

# From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition (ExMesh++)

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition |
| 作者 | (见论文) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.24109) |
| PDF | [下载](https://arxiv.org/pdf/2608.24109) |

## 核心贡献
1. 提出 ExMesh++，从多视图图像重建可编辑、可重光照的 UV-PBR 网格资产
2. **第一阶段**：通过自适应顶点分裂与合并优化显式网格几何与拓扑，同时保持 UV 一致性
3. **第二阶段**：将几何-材质-光照联合分解，生成标准 PBR 纹理贴图
4. 解决现有方法的问题：隐式场/高斯原语需表面提取和纹理烘焙，inverse rendering 方法的材质/光照与神经场绑定

## 技术方案
**两阶段框架：**
- **阶段一（几何优化）**：自适应顶点分裂/合并 → 保持 UV 一致性的显式网格
- **阶段二（材质分解）**：从多视图图像分解出 albedo, normal, roughness, metallic 等 PBR 参数

**解决的问题：**
- 现有方法中几何、材质、光照变量相互补偿导致分解歧义
- 中间表示（隐式场、高斯）到最终网格资产的转换质量损失

## 实验结论
（待补充详细实验数据）

## 局限性
- 依赖多视图输入
- 联合优化可能导致材质/光照分解不唯一

## 可行性分析
- 实现难度：高（涉及网格优化 + 逆渲染 + PBR 材质分解）
- 性能预期：（待评估）
- 适用场景：数字资产重建、游戏/影视资产生产、AR/VR 内容创建

## 相关工作
- ExMesh
- 多视图重建
- Inverse rendering
- PBR 材质估计
- 3D Gaussian Splatting

## 笔记
ExMesh++ 是对 ExMesh 的重要扩展，将神经渲染方法与标准游戏/影视资产管线结合。
