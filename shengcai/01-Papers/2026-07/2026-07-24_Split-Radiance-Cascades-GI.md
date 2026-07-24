---
tags: [渲染, 全局光照, 实时光照, Radiance-Cascades, 2026-07]
date: [[2026-07-24]]
status: 待读
---

# Real-Time Global Illumination via Sparse Radiance Probes

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | Real-Time Global Illumination via Sparse Radiance Probes |
| 作者 | Rouli Freeman |
| 链接 | [arXiv:2607.20384](https://arxiv.org/abs/2607.20384) |
| PDF | [PDF](https://arxiv.org/pdf/2607.20384) |
| 发表 | arXiv cs.GR, 2026-07-22 |

## 核心贡献

1. **Split Radiance Cascades**: 将 Radiance Cascades 适配到准确的实时 3D 漫反射全局光照
2. **稀疏 Hashmap 存储**: 使用稀疏 hashmap 存储世界空间探针，解决高细节体积累储成本问题
3. **Ray Splitting 方法**: 通过从可见表面追踪光线并根据命中距离计算对级联的贡献来计算 Radiance Intervals

## 技术方案

### 问题背景
Radiance probe 方法是实时图形中近似漫反射全局光照的流行方法，但因探针间距大导致细节缺失。Radiance Cascade (RC) 通过提高空间分辨率和降低近距离物体的光照与遮挡角分辨率来解决此问题。

### 核心方法
- **稀疏世界空间探针**: 使用 hashmap 存储，允许高细节体积累积而不受 2D/屏幕空间限制
- **Ray Splitting**: 计算 RC 使用的 radiance intervals，追踪从可见表面发出的光线，根据命中距离计算对级联的贡献
- **3D 漫反射 GI**: 在单帧和时间累积场景中提供高质量间接光照

### 关键创新
```math
\text{Radiance Interval} = f(\text{hit distance}, \text{cascade level})
```

光线从可见表面追踪，根据命中距离分配到不同级联，实现细节层次化的全局光照。

## 实验结论

- 在多种场景中评估算法
- 单帧和时间累积上下文中均能提供高质量间接光照
- 解决了传统 RC 方法的 2D/屏幕空间限制

## 局限性

- 主要针对漫反射全局光照
- 需要预先计算探针布局

## 标签
#global-illumination #real-time-rendering #radiance-cascades #ray-tracing
