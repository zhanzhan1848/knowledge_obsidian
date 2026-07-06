---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, gaussian-splatting, intrinsic-decomposition, albedo, shading, editing]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.31637
---

# Intrinsic Decomposition and Editing of 3D Gaussian Splats

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Intrinsic Decomposition and Editing of 3D Gaussian Splats |
| **作者** | George Drettakis et al. |
| **发表** | Proc. ACM Comput. Graph. Interact. Tech. 9, 1, Article 10 (May 2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.31637) |
| **DOI** | 10.1145/3804495 |

---

## 核心贡献

> 将图像内蕴分解扩展到 3D Gaussian Splatting 表示，支持在不改变光照的情况下修改物体颜色和纹理

1. **独立 Gaussian Primitive 分解**：将漫反射反照率和着色建模为独立 Gaussian 集合，每层适应各自特征
2. **数据驱动优化程序**：利用数据驱动预测引导多视图图像分解为内蕴集合
3. **编辑工作流**：用户只需修改单张图像中平面的反照率，捕捉到内蕴辐射场后可从任意视角重新渲染编辑后场景

---

## 技术方案

### 核心思想

内蕴分解将图像颜色表示为漫反射反照率 × 着色（+ 视角相关残差）。扩展到 Gaussian Splatting 需要解决：如何用 Gaussian 集合分别表示各层、如何引导分解收敛。

### 关键技术

| 技术 | 说明 |
|------|------|
| 独立 Gaussian 集合 | 反照率和着色各用一套 Gaussian 建模 |
| 数据驱动分解引导 | 神经网络预测引导优化 |
| 平面反照率编辑 | 单图编辑，任意视角一致渲染 |

---

## 实验结论

- **无需分割**：分割无关的辐射场编辑
- **视角一致性**：任意视点下编辑渲染一致
- **光照保持**：修改颜色不影响场景光照

---

## 局限性

- 目前限于平面表面编辑
- 依赖数据驱动预测质量

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 适合离线编辑应用
- **适用场景**: 照片级场景编辑、材质替换、光照保持的颜色修改
