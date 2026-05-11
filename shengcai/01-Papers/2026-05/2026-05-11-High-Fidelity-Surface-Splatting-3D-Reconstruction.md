---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, surface-reconstruction, IMLS, multi-view, rendering, high-frequency]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.07254
---

# High-Fidelity Surface Splatting-Based 3D Reconstruction from Multi-View Images

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | High-Fidelity Surface Splatting-Based 3D Reconstruction from Multi-View Images |
| **作者** | Nandhana Sunil, Abhirami R Iyer, Avirup Mandal |
| **发表** | arXiv cs.CV/cs.GR (2026-05-08) |
| **链接** | [原文](https://arxiv.org/abs/2605.07254) |
| **DOI** | https://doi.org/10.48550/arXiv.2605.07254 |

---

## 核心贡献

> 使用 compact polynomial kernel 改进 IMLS，实现高保真曲面重建

1. 提出 **compact polynomial kernel** with local support — 比指数核更灵活，可控频率内容，保高精度几何
2. 结合 **stochastic regularization with Laplacian filtering** 进一步增强细节保留
3. 支持端到端重建和渲染，无需 post-processing 即可从多视图数据提取高质量几何和清晰视觉

---

## 技术方案

### 核心思想

Implicit Moving Least Squares (IMLS) 可直接将点云转换为 signed distance 和 texture fields，但现有 IMLS 使用指数核难以处理高频细节。用 compact polynomial kernel 替代指数核，允许更好的频率控制。

### 关键技术

| 技术 | 说明 |
|------|------|
| Compact polynomial kernel | 局部支撑核，比指数核更灵活 |
| Stochastic regularization | 随机正则化 |
| Laplacian filtering | 拉普拉斯滤波增强细节 |
| Multi-view surface reconstruction | 多视图曲面重建 |
| End-to-end reconstruction & rendering | 端到端重建和渲染 |

---

## 实验结论

- **数据集**: 多视图图像
- **基线**: 现有 IMLS 和其他表面重建方法
- **结果**: 在表面重建和渲染任务上达到 SOTA，获得更准确的几何和更清晰的视觉效果

---

## 局限性

依赖多视图输入的稠密程度；polynomial kernel 参数需要调优。

---

## 实现建议

- **实现难度**: 中 — 核函数替换相对直接，需要处理多项式核的局部支撑和 Laplacian 正则化
- **预期性能**: 相比指数核 IMLS，高频细节保留显著提升
- **适用场景**: 多视图几何重建、高频细节恢复、端到端 3D 重建和渲染 pipeline

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[NeRF]]
- [[IMLS Surface Reconstruction]]
- [[Surface Splatting]]
