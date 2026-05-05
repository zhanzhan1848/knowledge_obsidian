---
title: Vertex Features for Neural Global Illumination
authors: Sheng Li et al.
date: 2026-04-29 (v2)
source: arXiv cs.GR / ACM SIGGRAPH Asia 2025
url: https://arxiv.org/abs/2508.07852
pdf: https://arxiv.org/pdf/2508.07852
tags: [rendering, neural-rendering, global-illumination, memory-efficiency, feature-encoding, paper, 2026]
status: unread
---

# Vertex Features for Neural Global Illumination

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Vertex Features for Neural Global Illumination |
| 作者 | Sheng Li et al. |
| 来源 | arXiv cs.GR / ACM SIGGRAPH Asia 2025 |
| 年份 | 2025 (accepted), v2 2026-04-29 |
| 链接 | [原文](https://arxiv.org/abs/2508.07852) |
| PDF | [下载](https://arxiv.org/pdf/2508.07852) |

## 核心贡献
1. **神经顶点特征**：将可学习特征直接存储在 mesh 顶点上，而非均匀分布在 3D 空间中
2. **多分辨率表面特征编码**：根据训练损失动态细化 mesh，捕获高频光照细节
3. **内存优化**：内存消耗降至网格方法的 1/5，同时保持相近渲染质量

## 技术方案

### 问题背景
传统网格编码（如 multi-resolution hash grid）在空空间中分配大量特征（约 55%-72% hash 表容量），导致内存浪费

### 核心方法：神经顶点特征
场景几何由 mesh 顶点定义，特征直接存储在顶点上：
```math
\mathcal{G} \in \mathbb{R}^{n \times d}
```
其中 $n = |\mathcal{V}|$ 是顶点数，$d$ 是特征向量长度

查询时通过重心坐标插值：
```math
\mathbf{f}_{\mathbf{x}} = (1-u-v) \cdot \mathbf{g}_i + u \cdot \mathbf{g}_j + v \cdot \mathbf{g}_k
```

### 多分辨率表面特征编码
引入 per-face LOD 因子 $k_i$，在必要区域增加特征密度而不修改 mesh 拓扑

### 优势
- **内存高效**：只在表面分配特征，利用几何先验
- **缓存友好**：顶点特征更符合 GPU 缓存层次结构
- **推理加速**：减少的内存访问带来更快的推理

## 实验结论
- 内存消耗降至 grid-based 方法的 1/5
- 在 Neural Radiosity、Dynamic Neural Radiosity、Neural Path Guiding 上验证
- 保持相近渲染质量的同时显著降低内存开销

## 局限性
- 依赖于显式 mesh 表示
- 在 mesh 稀疏区域可能需要额外处理

## 可行性分析
- **实现难度**：中
  - 需要 mesh 和顶点属性的基础设施
  - 重心坐标插值实现简单
- **性能预期**：内存效率提升 5 倍，推理速度提升
- **适用场景**：神经渲染、光线追踪、实时 GI 应用

## 相关工作
- [[Multi-resolution Hash Grid Encoding (Müller 2022)]]
- [[Neural Radiosity (Hadadan 2021)]]
- [[Dynamic Neural Radiosity (Su 2024)]]
- [[Neural Path Guiding (Dong 2023)]]

## 笔记
被 SIGGRAPH Asia 2025 接收。由同一作者团队完成 v2 更新。
提供了一种通用的神经渲染特征编码改进方案，可与现有神经渲染管线集成。
