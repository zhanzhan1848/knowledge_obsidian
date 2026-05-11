---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, surface-splatting, inverse-rendering, differentiable-rendering, BRDF]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.05876
---

# 3D Surface Splatting for Inverse Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 3D Surface Splatting for Inverse Rendering |
| **作者** | Mae Younes et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.05876) |

---

## 核心贡献

> 提出 3DSS，首个可微分表面 splatting 渲染器，用于基于物理的逆渲染

1. 表面分离问题可直接从重建核本身表述
2. 基于覆盖度的合成模型：反锯齿轮廓和清晰的可见性梯度
3. 联合恢复形状、空间变化 BRDF 材质和光照

---

## 技术方案

### 核心思想

中心洞察：表面分离问题可以从重建核本身直接表述

方法：
- 基于覆盖度的合成模型，per-layer opacity 来自累积 EWA 重建权重
- 前向微面 shading + co-optimized HDR 环境光照
- 密度感知自适应细化

### 关键技术

| 技术 | 说明 |
|------|------|
| EWA | Elliptical Weighted Average |
| 覆盖度合成 | 反锯齿轮廓 |
| BRDF 优化 | 空间变化材质 |

---

## 实验结论

- **评估**: 几何重建、新视角合成、新光照重光照
- **结果**: 优于 mesh-based、implicit、Gaussian splatting 基线

---

## 局限性

- 需要高质量多视图输入
- 对复杂材质可能需要更多约束

---

## 实现建议

- **实现难度**: 较高
- **适用场景**: 逆渲染、材质捕获、几何重建

---

## 相关工作

- [[Surface Splatting]]
- [[Inverse Rendering]]
- [[Differentiable Rendering]]
