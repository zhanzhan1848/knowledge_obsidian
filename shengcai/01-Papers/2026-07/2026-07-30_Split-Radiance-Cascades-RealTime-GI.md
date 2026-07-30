---
tags: [渲染, 实时渲染, 全局光照, 2026]
date: 2026-07-30
status: 待读
---

# Split Radiance Cascades: Real-Time Global Illumination via Sparse Radiance Probes

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Rouli Freeman |
| 发表 | arXiv cs.GR (2026-07-22) |
| 链接 | [原文](https://arxiv.org/abs/2607.20384) |

## 核心贡献

1. **Ray Splitting**: 通过从可见表面追踪光线，根据击中距离计算级联贡献，用于计算 RC 使用的辐射率区间
2. **Sparse Hashmap 存储**: 使用稀疏哈希映射存储世界空间探针，实现 3D 漫反射全局光照

## 技术方案

### 问题
- 传统辐射率探针方法因探针间距大，缺乏细节
- Radiance Cascade (RC) 通过提高空间分辨率和降低近处物体的角分辨率解决此问题
- 现有 RC 实现局限于 2D 或屏幕空间，存储高精度体素辐射率成本过高

### 方法
- 将 Radiance Cascades 适配为精确的实时 3D 漫反射全局光照
- 使用稀疏哈希映射存储世界空间探针
- 引入光线分割计算辐射率区间

## 公式

辐射率区间计算：
```math
L_{interval} = [L_{min}, L_{max}] = f(d_{hit})
```

## 实验结论

- 在多种场景上验证，可提供高质量间接光照
- 支持单帧和时间累积场景

## 局限性

- 主要针对漫反射全局光照
- 高频细节可能需要额外处理

## 推荐度

- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐⭐
- **难度**: 中

## 标签

#实时渲染 #全局光照 #RadianceCascades #GI
