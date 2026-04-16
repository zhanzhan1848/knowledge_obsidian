---
type: paper
created: 2026-04-16
updated: 2026-04-16
tags: [ray-tracing, 3DGS, monte-carlo, differentiable-rendering, stochastic]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.23637
---

# Stochastic Ray Tracing for the Reconstruction of 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stochastic Ray Tracing for the Reconstruction of 3D Gaussian Splatting |
| **作者** | Peiyu Xu et al. |
| **发表** | arXiv 2026 (cs.CV) |
| **链接** | [原文](https://arxiv.org/abs/2603.23637) |
| **DOI** | 10.48550/arXiv.2603.23637 |
| **代码** | https://xupati.github.io/stoch3DGS/ |

---

## 核心贡献

> 首个使用无偏蒙特卡洛估计器实现无需排序的随机光线追踪来重建和渲染标准与可重光照3DGS场景的框架。

1. 提出排序无关（sorting-free）的随机光线追踪公式，突破传统3DGS ray tracing需要对所有相交高斯排序的性能瓶颈
2. 设计无偏蒙特卡洛估计器，每条光线仅评估少量采样的高斯，大幅降低计算开销
3. 将随机估计器扩展到可重光照3DGS，全光线追踪阴影射线，显著提升重建保真度

---

## 技术方案

### 核心思想

传统基于光线追踪的3DGS（3DGRT等）需要对每条光线上的所有相交高斯进行排序，导致 O(N log N) 的复杂度。该工作提出随机采样策略：用无偏蒙特卡洛估计器替代确定性排序，仅从相交高斯集合中随机采样小子集进行颜色计算。

### 关键技术

| 技术 | 说明 |
|------|------|
| 随机光线追踪 | 每条光线仅采样少量高斯，避免全排序开销 |
| 无偏蒙特卡洛估计器 | 对像素颜色梯度提供无偏估计 |
| 可重光照3DGS | 全光线追踪阴影射线，无光栅化近似 |

### 方法对比

| 方法 | 排序 | 阴影近似 | 每光线高斯数 |
|------|------|----------|-------------|
| 3DGRT (2024) | 需要 | 阴影映射 | 全部 |
| 该方法 | 不需要 | 全光线追踪 | 采样子集 |

---

## 实验结论

- **数据集**: 标准3DGS基准场景
- **基线**: 3DGRT、rasterization-based 3DGS
- **结果**: 
  - 标准3DGS：重建质量和速度匹配rasterization-based 3DGS，显著优于排序型ray tracing
  - 可重光照3DGS：重建保真度大幅超越prior work

---

## 局限性

- 随机采样可能引入方差，需要适量采样来平衡方差与效率
- 对高密度区域可能需要更多采样来保证质量

---

## 实现建议

- **实现难度**: 中高（需理解蒙特卡洛方法和3DGS的光线追踪实现）
- **预期性能**: 相比3DGRT显著加速，与rasterization-based 3DGS相当
- **适用场景**: 高质量3DGS重建、可重光照场景、实时渲染管线

---

## 相关笔记

- [[3DGS-Ray-Tracing-baseline]]
- [[Monte-Carlo-Rendering]]
- [[Relightable-3DGS]]
