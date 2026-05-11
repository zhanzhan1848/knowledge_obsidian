---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, surface-reconstruction, unsigned-distance, mesh-reconstruction, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.19568
---

# SpUDD: Superpower Contouring of Unsigned Distance Data

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SpUDD: Superpower Contouring of Unsigned Distance Data |
| **作者** | Ningna Wang, Xiana Carrera, Christopher Batty, Oded Stein, Silvia Sellán |
| **发表** | arXiv cs.GR (2026-04-21, v2 2026-05-08) |
| **链接** | [原文](https://arxiv.org/abs/2604.19568) |
| **DOI** | https://doi.org/10.48550/arXiv.2604.19568 |

---

## 核心贡献

> 从离散无符号距离数据重建任意曲面的理论基础与算法

1. 提出 **superpower contour** 理论概念（基于 power diagram），证明在采样密度极限下收敛到真实曲面
2. 无需 sign information、accurate gradients、continuous distance function 或 extensive training
3. 仅依赖离散无符号距离样本即可重建开放、非定向、非流形曲面

---

## 技术方案

### 核心思想

研究距离样本生成的 power diagram，提出 superpower contour 作为初始曲面代理，再用算法生成多边形网格逼近未知真实几何。

### 关键技术

| 技术 | 说明 |
|------|------|
| Power diagram / Power diagram | 由距离样本生成 |
| Superpower contour | 收敛到真实曲面的理论概念 |
| Polygonal mesh approximation | 多边形网格逼近 |
| Discrete unsigned distance | 离散无符号距离输入 |

---

## 实验结论

- **数据集**: 合成和真实无符号距离数据
- **基线**: 其他离散无符号距离重建策略
- **结果**: 大幅超越其他可想象的策略，为离散无符号距离重建任务设定新基准

---

## 局限性

理论收敛需要采样密度趋于无穷，实际应用中受采样密度限制。

---

## 实现建议

- **实现难度**: 中 — 理论深度高但算法相对直接，核心是 superpower contour 的构造和 mesh 生成
- **预期性能**: 对无符号距离数据的重建质量远超现有方法
- **适用场景**: 开放曲面重建、非流形几何处理、无 sign 信息的距离场重建

---

## 相关工作

- [[Mesh Reconstruction]]
- [[Signed Distance Field]]
- [[Unsigned Distance Function]]
- [[Implicit Surface]]
