---
title: "Skeletal-Anchored Dual Harmonics for Structured 3D Modeling"
authors:
  - Zhentao Huang
date: 2026-06-05
tags: [几何, 形状表示, 点云, 骨骼, 谐波, 重建]
cite: "arXiv:2606.07337 [cs.GR]"
url: "https://arxiv.org/abs/2606.07337"
---

# SADH: Skeletal-Anchored Dual Harmonics for Structured 3D Modeling

## 核心方法

将 3D 形状表示为**紧凑表面 patch 集合**，每个 patch 根植于对象体积内优化的内部锚点。

### 双通道球谐 (Dual-Channel SH) 参数化

- **通道 1**：建模局部径向几何
- **通道 2**：通过广义视线锥定义自适应 patch 支持

### 与传统方法的区别

| 方法 | 表征 |
|------|------|
| Medial spheres | 各向同性 |
| Gaussian kernels | 各向同性 |
| **SADH SH patches** | **各向异性 + 自适应空间支持** |

### 分阶段优化流程

```
无组织点云
    ↓
阶段 1：表面几何 + 锚点位置 + patch 朝向 + 结构连接
    ↓
阶段 2：形成连贯中尺度骨骼结构
    ↓
geodesic anchor graph 保持相邻 patch 间结构关系
```

## 关键创新

1. **双通道 SH**：直接编码各向异性局部表面几何 + 自适应空间支持
2. **体积内锚点优化**：锚点直接在对象体积内优化
3. **测地锚点图**：保持 patch 间结构关系

## 实验结果

在复杂 3D 形状上：
- 精确表面重建
- 紧凑连贯的骨骼组织

## 可行性评估

⚠️ **中等推荐**

| 维度 | 评分 |
|------|------|
| 算法创新性 | 中高（SH patch 新颖） |
| 工程可行性 | 中（需 SH 基础 + 优化） |
| 对点云处理的相关性 | 高（端到端从点云重建） |

### 潜在应用
- 点云形状表征
- 结构化 3D 建模
- 骨骼提取
- 从无组织点云的结构化表示