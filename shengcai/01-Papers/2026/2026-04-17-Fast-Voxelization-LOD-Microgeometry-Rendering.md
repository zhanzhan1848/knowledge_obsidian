---
title: Fast Voxelization and Level of Detail for Microgeometry Rendering
authors: Javier Fabre et al.
date: 2026-04-14
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.13191
pdf: https://arxiv.org/pdf/2604.13191
tags: [rendering, voxelization, level-of-detail, microgeometry, path-tracing, 2026]
status: unread
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Fast Voxelization and Level of Detail for Microgeometry Rendering |
| 作者 | Javier Fabre et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.13191) |
| PDF | [下载](https://arxiv.org/pdf/2604.13191) |

## 核心贡献
1. 高效并行体素化方法，设计用于在多个分辨率级别快速数据聚合
2. 基于分层 SGGX 聚类的新型表示方法，比基线方法提供更好精度
3. 面向微观几何的 LOD 渲染模型，用于路径追踪器

## 技术方案

### 问题背景
许多材料由于其微观结构（如纤维、刷面金属脊）的形状和局部对齐而表现出各向异性光散射模式。这些表面非常稀疏，需要高空间分辨率才能正确表示为体积。

### 技术方法
1. **并行体素化**：CUDA 实现的体素化器，支持三角形网格和具有显式纤维的体积织物
2. **分层 SGGX 聚类**：提供比 MIP mapping 更好的精度
3. **LoD 渲染模型**：路径追踪器中使用的新型细节层次表示

```cpp
// SGGX 分布函数 (示意)
float SGGX(float NdH, float roughness) {
    float alpha = roughness * roughness;
    float alpha2 = alpha * alpha;
    float denom = NdH * NdH * (alpha2 - 1.0f) + 1.0f;
    return alpha2 / (3.14159f * denom * denom);
}
```

## 实验结论
- 验证了 CUDA 体素化器在三角形网格和体积织物上的有效性
- 路径追踪结果显示 LoD 模型能够保持视觉质量同时降低计算成本

## 局限性
- 主要针对微观几何，对宏观场景的适用性有限

## 可行性分析
- 实现难度：中
- 性能预期：可显著加速微观几何渲染的体素化过程
- 适用场景：纤维织物渲染、刷面金属、微结构材质

## 相关工作
- [[2026-04-04-Real-time-Neural-Six-way-Lightmaps]]
- MIP mapping approaches
- SGGX microfacet models

## 笔记
 Accepted for publication in The Visual Computer
