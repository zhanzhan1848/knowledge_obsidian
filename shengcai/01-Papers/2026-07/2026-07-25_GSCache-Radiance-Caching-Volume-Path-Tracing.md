---
type: paper
created: 2026-07-25
updated: 2026-07-25
tags: [paper, radiance-caching, volume-rendering, 3DGS, path-tracing]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2507.19718
---

# GSCache: Real-Time Radiance Caching for Volume Path Tracing using 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GSCache: Real-Time Radiance Caching for Volume Path Tracing using 3D Gaussian Splatting |
| **作者** | David Bauer et al. |
| **发表** | arXiv 2025 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2507.19718) |
| **DOI** | 10.48550/arXiv.2507.19718 |

---

## 核心贡献

> 将 3D Gaussian Splatting 适配为多层路径空间辐射缓存，实现体积渲染的去噪加速

1. 将 3DGS 适配为多层、路径空间辐射缓存
2. 缓存可在运行时训练，动态适应光照和传递函数变化
3. 保持计算效率的同时显著提升渲染质量

---

## 技术方案

### 核心思想

传统体积路径追踪因蒙特卡洛积分导致渲染慢、像素方差高。GSCache 利用 3DGS 作为可训练辐射缓存，减少噪声而不增加渲染成本。

### 关键技术

| 技术 | 说明 |
|------|------|
| 路径空间辐射缓存 | 在路径空间存储和复用辐射度 |
| 多层 3DGS | 多层次细节的缓存表示 |
| 运行时训练 | 动态适应光照/传递函数变化 |
| Next-event estimation | 支持基准路径追踪器 |

### 对比基线

- 均匀采样 + next-event estimation 的基准路径追踪器
- SOTA 神经辐射缓存方法

---

## 实验结论

- 噪声更少、质量更高的图像，且不增加渲染成本
- 在科学可视化体积渲染应用中显著提升质量
- 计算效率与现有方法相当

---

## 局限性

- 依赖 3DGS 场景表示
- 对极端光照条件适应性待验证

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 实时体积渲染去噪
- **适用场景**: 科学可视化、医学成像、体积数据渲染
