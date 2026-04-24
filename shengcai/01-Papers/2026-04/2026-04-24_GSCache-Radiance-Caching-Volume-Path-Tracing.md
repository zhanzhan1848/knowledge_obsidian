---
tags: [渲染, 路径追踪, 体积渲染, 辐射缓存, 高斯泼溅, 2025]
date: [[2026-04-24]]
status: 待读
---

# GSCache: Real-Time Radiance Caching for Volume Path Tracing using 3D Gaussian Splatting

## 基本信息
| 标题 | GSCache: Real-Time Radiance Caching for Volume Path Tracing using 3D Gaussian Splatting |
|------|-------|
| 作者 | David Bauer, Kwan-Liu Ma (UC Davis), Qi Wu (NVIDIA), Hamid Gadirov (University of Groningen) |
| 发表 | arXiv 2507.19718 |
| 链接 | [arXiv](https://arxiv.org/abs/2507.19718) |

## 核心贡献
1. **用于体积渲染的实时路径空间辐射缓存** - 缓存不同路径长度的衰减辐射率，可快速适应场景参数变化
2. **多层级 3D 高斯表示** - 利用 3D 高斯 splatting 作为多层级的路径空间辐射缓存
3. **实时训练优化** - 缓存可使用渲染器的噪声样本实时优化
4. **非侵入式设计** - 易于集成到现有渲染应用

## 技术方案

### 核心思想
- 实时路径追踪在科学可视化体积渲染中面临 Monte Carlo 噪声问题
- 体积渲染的采样方差较高，导致收敛慢
- 辐射缓存：通过缓存结构存储先前见过的辐射率样本，增强后续样本

### 缓存结构
- 多层级 3D 高斯集合，每层缓存特定长度路径的衰减路径空间辐射率
- 从高层到低层次采样缓存大小（类似 MIP map）
- 长路径对最终图像贡献更大，分配更多计算资源和表示能力

### 特点
- 缓存实时优化，无需干净样本（可用噪声数据）
- 可快速适应光照、传递函数、切片操作等场景变化
- 在低采样数时图像质量更好，计算成本相当

## 实验结论
- 对比 baseline path tracer (PT) with uniform sampling 和 next-event estimation (NEE)
- 在低采样数时性能优于基线 NEE path tracer
- 缓存渲染时间恒定，采样数增加时收益递增
- 非侵入式设计，易于集成

## 关键词
#路径追踪 #体积渲染 #辐射缓存 #高斯泼溅 #科学可视化

## 相关链接
- GitHub: (待补充)
