---
tags: [渲染, 全局光照, 实时渲染, GI, Radiance-Cascades, 2026]
date: [[2026-07-27]]
status: 待读
---

# Real-Time Global Illumination via Sparse Radiance Probes

## 元信息
| 标题 | Real-Time Global Illumination via Sparse Radiance Probes |
|------|------|
| 作者 | Rouli Freeman |
| 链接 | [arXiv](https://arxiv.org/abs/2607.20384) |
| PDF | [2607.20384](https://arxiv.org/pdf/2607.20384) |
| 日期 | 2026-07-22 |

## 核心贡献

1. **稀疏辐射探针**: 使用稀疏 hashmap 存储世界空间探针，适合动态场景
2. **Ray Splitting**: 从可见表面追踪光线，根据击中距离计算 radiance intervals
3. **3D Radiance Cascades**: 将 Radiance Cascade 适配到准确的实时3D漫反射全局光照

## 技术方案

### Radiance Cascade 回顾
Radiance Cascade (RC) 通过以下方式解决探针间距导致的细节缺失：
- 增加近距离的空间分辨率
- 降低近距离光照和遮挡的角度分辨率
- 提供多尺度的无噪声无锯齿细节

### 现有实现问题
- 现有 RC 实现运行在 2D 或屏幕空间
- 存储高细节体积 radiance 信息成本过高

### Split Radiance Cascades 方法

**核心思想**: Ray Splitting
- 从可见表面发射光线
- 根据击中距离计算对各级联 radiance 的贡献
- 不依赖时序历史

**数据结构**: 稀疏 Hashmap
- 仅存储场景中有表面区域附近的探针
- 适合完全动态场景

## 公式

Radiance interval 计算:
```math
L_i = \int_{d_i}^{d_{i+1}} f(d) \, dd
```

其中 $f(d)$ 是沿射线距离 $d$ 的 radiance 贡献。

## 实验结果

- 多种场景验证
- 单帧上下文高质量间接光照
- 时间累积上下文进一步提升质量

## 可行性分析

| 维度 | 评估 |
|------|------|
| 实现难度 | 中等 |
| 性能 | 适合实时应用 |
| 适用场景 | 动态场景全局光照 |
| 创新性 | 高 (3D RC 首次实现) |

## 推荐度

⭐⭐⭐⭐⭐

## 相关工作

- Radiance Cascade (原始方法)
- 屏幕空间 GI 方法
- 基于探针的 GI 方法

## 标签

#全局光照 #实时渲染 #Radiance-Cascade #动态场景 #2026
