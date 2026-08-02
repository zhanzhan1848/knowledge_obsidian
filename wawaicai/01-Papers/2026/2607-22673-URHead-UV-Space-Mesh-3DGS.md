---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [paper, UV-parametrization, mesh, 3DGS, geometry]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.22673
---

# URHead: Unified UV-Space Representation for Joint Mesh-3DGS Optimization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Unified UV-Space Representation for Joint Mesh-3DGS Optimization in Head Avatars |
| **作者** | Jisoo Park et al. |
| **发表** | arXiv cs.GR, ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.22673) |
| **DOI** | 10.48550/arXiv.2607.22673 |
| **代码** | https://lseonghak.github.io/website/project/urhead/ |

---

## 核心贡献

> 通过统一的UV参数化空间实现mesh和3D Gaussian Splatting的联合优化，兼具精确几何控制和照片级细节

1. **UV空间统一**：两种表示共享共同UV参数化
2. **自适应Gaussian采样**：联合优化自动学习分配角色
3. **全参数可控性**：保持参数可控同时保留细节

---

## 技术方案

### 核心思想

现有方法问题：
- Mesh方法：精确几何控制但缺照片级细节
- Gaussian方法：照片级真实感但结构一致性差
- 混合方法：未能充分利用互补优势

URHead 创新：
- **UV空间统一**：mesh和Gaussians在同一UV参数化下表示
- **联合优化**：通过自适应采样自动解耦和分配角色
- **优势结合**：精确控制 + 照片级细节

### 关键技术

| 技术 | 说明 |
|------|------|
| UV Parameterization | 共享的UV参数化空间 |
| Adaptive Gaussian Sampling | 自适应调整Gaussian分布 |
| Joint Optimization | mesh和3DGS联合训练 |

---

## 实验结论

- 在重建质量和动画一致性上优于现有SOTA方法
- 保持全参数可控性
- 保留主题特定细节

---

## 实现建议

- **实现难度**: 中高
- **相关技术**: UV mapping, mesh parameterization, 3D Gaussian Splatting
- **参考**: 3DGS, 可变形模型

---

## 相关笔记

- [[UV Parametrization]]
- [[Mesh-3DGS Integration]]
- [[Avatar Reconstruction]]
