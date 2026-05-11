---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, surface-reconstruction, point-cloud, 3DGS, IMLS, multi-view]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.07254
---

# High-Fidelity Surface Splatting-Based 3D Reconstruction from Multi-View Images

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | High-Fidelity Surface Splatting-Based 3D Reconstruction from Multi-View Images |
| **作者** | Avirup Mandal et al. |
| **发表** | arXiv cs.CV (cross-listed cs.GR, 2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.07254) |

---

## 核心贡献

> 提出基于紧致多项式核的 IMLS 表面重建方法，支持端到端重建和渲染

1. 紧致多项式核替代指数核：更好的频率控制和改进的几何保真度
2. 随机正则化 + Laplacian 滤波：增强高频细节保留
3. 端到端优化：联合优化几何和外观

---

## 技术方案

### 核心思想

现有 IMLS 公式使用指数核，难以处理高频细节

改进：
1. 紧致多项式核：局部支持，更大灵活性
2. 随机正则化 + Laplacian 滤波：增强细节
3. 多视图数据联合优化

### 关键技术

| 技术 | 说明 |
|------|------|
| IMLS | Implicit Moving Least Squares |
| 多项式核 | 紧致局部支持 |
| Laplacian 滤波 | 细节增强 |

---

## 实验结论

- **性能**: 表面重建和渲染 SOTA
- **质量**: 更准确的几何和更锐利的视觉效果

---

## 局限性

- 需要多视图输入
- 对稀疏视图可能效果有限

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 多视图重建、神经渲染、3D 内容创建

---

## 相关工作

- [[Surface Reconstruction]]
- [[3D Gaussian Splatting]]
- [[Neural Rendering]]
