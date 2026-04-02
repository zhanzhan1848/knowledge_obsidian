---
title: "SPREAD: Spatial-Physical REasoning via Geometry Aware Diffusion"
arXiv: "2603.27573"
authors: "Kuixiang Shao et al."
date: 2026-03-29
tags: [几何, 场景生成, 点云, 物理推理, 扩散模型, Graph Transformer]
---

# SPREAD: Spatial-Physical REasoning via Geometry Aware Diffusion

## 核心方法

基于扩散的框架，通过 Graph Transformer 联合学习空间和物理关系，明确基于姿态点云进行几何感知。

### 核心创新

1. **点云条件**：显式使用 pose scene point clouds 作为几何感知条件
2. **可微分物理约束**：碰撞避免、关系约束、重力
3. **物理连贯场景**：生成 simulation-ready 环境

### 技术要点

- **Graph Transformer**：学习空间-物理关系
- **点云编码**：几何感知（显式，不是隐式）
- **可微分引导**：无需后处理验证

## 相关：DiffSoup (2603.27151)

---
title: "DiffSoup: Direct Differentiable Rasterization of Triangle Soup"
arXiv: "2603.27151"
authors: "Kenji Tojo et al."
date: 2026-03-28
tags: [几何, 网格简化, 辐射场, 可微栅格化, 三角形Soup]
---

# DiffSoup: Direct Differentiable Rasterization of Triangle Soup

## 核心方法

辐射场重建需要对大量多视角 RGB 图像进行高质量 3D 表示恢复。引入 DiffSoup，一种使用少量三角形 + 神经纹理 + 二值不透明度的辐射场表示。

### 核心创新

1. **Binary Opacity 表示**：直接可微，通过随机不透明度掩码实现稳定训练
2. **无需 Mollifier**：无需平滑栅格化
3. **标准深度测试**：无缝集成传统图形管线
4. **消费级设备支持**：笔记本/移动端交互式渲染

## 可行性分析

✅ **推荐参考** — 网格简化 / 几何表示转换

## 相关：TopoCtrl (2603.26926)

---
title: "TopoCtrl: Post-Optimization Topology Editing"
arXiv: "2603.26926"
authors: "et al."
date: 2026-03-29
tags: [几何, 拓扑优化, 拓扑编辑, 潜扩散, 结构特征]
---

# TopoCtrl: Post-Optimization Topology Editing

## 核心方法

拓扑优化可生成高性能结构，设计师常需修订拓扑以反映制造偏好、结构直觉或下游约束。

### 核心创新

1. **后优化控制框架**：利用预训练拓扑基础模型的潜空间
2. **Latent Diffusion**：编码 → 部分噪声 → 回归引导去噪
3. **可解释结构特征控制**：成员厚度、特征长度、关节数等

### 关键技术

- **轻量回归模型**：在带注释的潜表示上训练
- **可微分引导信号**：避免特征特定重新推导
- **保持结构连贯性**：部分噪声保持实例相似性

## 可行性分析

⚠️ 适用于**结构拓扑编辑**，非通用几何处理
