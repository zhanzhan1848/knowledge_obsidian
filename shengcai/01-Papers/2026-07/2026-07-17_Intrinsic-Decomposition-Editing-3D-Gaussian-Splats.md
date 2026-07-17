---
type: paper
created: 2026-07-17
updated: 2026-07-17
tags: [paper, intrinsic-decomposition, 3DGS, editing, PBR, rendering, cs.GR]
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
| **发表** | Proc. ACM Comput. Graph. Interact. Tech. (SIGGRAPH 2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.31637) |
| **DOI** | https://doi.org/10.1145/3804495 |

---

## 核心贡献

> 将内禀分解扩展到Gaussian Splatting表示的辐射场

1. **独立Gaussian原语集合建模**: 每组适应各自代表层的特征
2. **数据驱动引导的优化**: 从多视角照片分解到内禀集
3. **编辑workflow**: 用户简单修改单张图像的albedo，全局面可重渲染

---

## 技术方案

### 核心思想

内禀分解将图像颜色表示为漫反射albedo和shading的乘积（可能加上视角相关残差）。这使得修改物体颜色和纹理而不改变光照成为可能。

### 三个关键方面

1. **建模**: 内禀分解建模为独立Gaussian原语集合
2. **优化**: 数据驱动预测引导的多视角分解
3. **编辑**: 用户修改→内禀辐射场捕获→任意视角重渲染

### Gaussian表示

- Albedo Gaussians
- Shading Gaussians
- View-dependent residual Gaussians

### 关键技术

| 技术 | 说明 |
|------|------|
| 独立原语集合 | 自适应各层特征 |
| 数据驱动分解 | 深度学习引导优化 |
| 辐射场编辑 | 保持光照的视图编辑 |

---

## 实验结论

- 支持任意视角的编辑重渲染
- 保持 plausibly lighting
- 适用于 planar 表面编辑

---

## 局限性

- 主要针对 planar 表面
- 需要多视角输入

---

## 实现建议

- **实现难度**: 中高
- **适用场景**: 图像编辑、AR/VR 内容创建、 relighting
- **推荐度**: ⭐⭐⭐⭐
