---
type: paper
created: 2026-04-23
updated: 2026-04-23
tags: [geometry, mesh-reconstruction, unsigned-distance, surface-reconstruction]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.19568
---

# Superpower Contouring of Unsigned Distance Data

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Superpower Contouring of Unsigned Distance Data |
| **作者** | Ningna Wang et al. |
| **发表** | arXiv cs.GR (Apr 2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.19568) |
| **DOI** | 10.48550/arXiv.2604.19568 |

---

## 核心贡献

> 从无符号距离数据（unsigned distance）重建任意曲面（开放、非 orientable、非 manifold）

1. 提出 **Superpower Contour** 概念，基于 power diagram 收敛到真实曲面
2. 提供严格数学证明：在采样密度趋于无穷时 superpower contour 收敛到真实曲面
3. 设计高效算法生成逼近未知几何的多边形网格

---

## 技术方案

### 核心思想

现有方法依赖 signed distance、精确梯度或大规模训练数据。本文转向无符号距离数据，利用 **power diagram** 几何性质，提出 superpower contour 作为初始曲面代理。

### 关键技术

| 技术 | 说明 |
|------|------|
| Power Diagram | 由距离样本生成的 power diagram，中心思想 |
| Superpower Contour | 论文提出的新概念，收敛到真实曲面 |
| Polygonal Mesh Approximation | 基于 superpower contour 生成多边形网格 |

---

## 算法流程

```
Unsigned Distance Data → Power Diagram → Superpower Contour → Polygonal Mesh
```

---

## 实验结论

- 在离散无符号距离重建任务上大幅优于其他可想到的策略
- 为这一数学丰富问题（无符号距离重建）的未来工作奠定了基础

---

## 局限性

需要有限数量的无符号距离采样点

---

## 相关工作

- [[Mesh Reconstruction]]
- [[Signed Distance Field]]
- [[Power Diagram]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 优于传统 marching cubes 类方法在无符号场景
- **适用场景**: 开放曲面、非流形网格重建、扫描数据处理

---

## 开源参考

- libigl: `igl::contour` 相关函数
- 论文 PDF: https://arxiv.org/pdf/2604.19568