---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [geometry, UV-parametrization, mesh, 3DGS, Gaussian-splatting, avatar]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.22673
---

# URHead: A Unified UV-Space Representation for Joint Mesh-3DGS Optimization in Head Avatars

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | URHead: A Unified UV-Space Representation for Joint Mesh-3DGS Optimization in Head Avatars |
| **作者** | Jisoo Park et al. |
| **发表** | ECCV 2026, arXiv cs.GR |
| **链接** | [原文](https://arxiv.org/abs/2607.22673) |
| **DOI** | 10.48550/arXiv.2607.22673 |
| **代码** | project page/code available |

---

## 核心贡献

> 在统一 UV 参数化空间中联合优化 Mesh 和 3D Gaussian Splatting

1. **UV 空间统一表示** - Mesh 和 3DGS 共享同一 UV 参数化
2. **自适应 Gaussian 采样** - 联合优化自动学习两种表示的角色分配
3. **保持参数可控性** - 支持完整参数控制同时保留细节

---

## 技术方案

### 核心思想

- 传统 Mesh 方法提供精确几何控制但缺乏照片级真实感
- 3DGS 方法达到照片级真实感但结构一致性差
- 本文关键创新：在 UV 空间统一两种表示，通过联合优化自动解耦和分配角色

### 关键技术

| 技术 | 说明 |
|------|------|
| UV 参数化共享 | Mesh 和 3DGS 共享同一 UV map |
| 自适应 Gaussian 采样 | 自动确定哪些区域使用 mesh/3DGS |
| 联合优化 | 端到端训练两种表示 |

---

## 实验结论

- 重建质量超过现有 SOTA 方法
- 动画一致性优于对比方法
- 支持参数化头部动画控制

---

## 局限性

- 专注于头部 avatar 场景
- 对非人脸对象的泛化性待验证

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[UV Mapping]]
- [[Mesh-3DGS Integration]]
- [[Head Avatar]]

---

## 实现建议

- **实现难度**: 高（需同时处理 mesh 和 3DGS）
- **依赖**: 3DGS 框架、Mesh 处理库
- **适用场景**: 数字人、avatar 重建、动画
