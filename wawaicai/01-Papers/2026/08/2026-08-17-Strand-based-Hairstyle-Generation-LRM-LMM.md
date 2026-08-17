---
title: "Strand-based Hairstyle Generation via Large Reconstruction and Multimodal Models"
authors: [Conghui Hao, Tao Huang, Yuefan Shen, Tongtong Wang, Zhongtian Zheng, Kui Wu]
date: 2026-08-13
arXiv: "2608.13679"
tags: [几何, 几何重建, 发丝建模, LRM, 多模态模型, 方向场]
conference: arXiv cs.GR
---

# Strand-based Hairstyle Generation via Large Reconstruction and Multimodal Models

## 核心方法

本文提出一种**全自动发丝造型生成管道**，结合大重建模型（LRM）、大 Multimodal 模型（LMM）和经典几何处理，从单张图像生成高质量基于发丝的三维发型。

### 核心创新

1. **无需特定任务训练或数据收集**
2. **支持复杂发型**：马尾、包子头等此前难以重建的结构
3. **分钟级生成**：几分钟内生成生产级发丝几何

### 完整流程

```
输入图像 I
    ↓
1. LRM 重建头发网格 M^hair + 半身模板 + 头皮mask
    ↓
2. 渲染多视角 → LMM 生成线稿作为结构引导
    ↓
3. LMM 识别分缝线 + 分割发型区域（聚集/约束/松散/头皮）
    ↓
4. 三阶段 Diffusion-Correction-Diffusion 方向场补全
    ↓
5. 沿方向场追踪生成发丝
```

### 技术细节

#### 方向场恢复
- 多视角投影线稿提供初始方向
- 三阶段处理：
  1. Surface direction diffusion（表面方向扩散）
  2. Orientation ambiguity resolution（方向歧义消除）
  3. Volumetric field propagation（体积场传播）

#### 发丝追踪
- 在恢复的方向场上追踪发丝
- 支持直线、波浪、卷曲等多种发丝类型

## 算法要点

### LRM (Large Reconstruction Model)
- 从单视图快速重建 3D 表面
- 提供头发几何基础

### LMM (Large Multimodal Model)
- 生成多视角线稿
- 语义分割发型区域
- 提供结构化指导

### 经典几何处理
- 方向场扩散/补全
- 发丝追踪算法
- 表面法线投影

## 应用场景

- 数字人/虚拟化身创建
- 游戏/电影毛发资产生成
- AR/VR 头像个性化

## 开源实现

- GitHub: 待确认（论文未提供）
- 代码将公开

## 相关文献

- Zheng et al. 2023 "Neural hair reconstruction"
- Kerbl et al. 2023 "LRM" (3D Gaussian Splatting)
- Rosu et al. 2025 "DiffLocks" (diffusion-based strand generation)

## 可行性评估

| 维度 | 评分 |
|------|------|
| 算法创新 | ⭐⭐⭐⭐ (AI+几何结合巧妙) |
| 实现难度 | ⭐⭐⭐⭐ (依赖大模型) |
| 实用价值 | ⭐⭐⭐⭐⭐ |
| 代码开源 | 待确认 |

## 几何处理关键技术

1. **广义缠绕数**：头发内外判断
2. **方向场拉普拉斯平滑**：保持发丝连贯性
3. **结构张量传播**：体积方向插值

## 传递给 @墨鱼丸

**建议**：本文的几何处理管线（方向场构建→追踪）可独立提取用于其他丝状结构（如草、毛皮）的生成。关键模块：
1. 表面方向投影到网格
2. 三阶段方向场补全
3. 欧拉-拉格朗日发丝追踪
