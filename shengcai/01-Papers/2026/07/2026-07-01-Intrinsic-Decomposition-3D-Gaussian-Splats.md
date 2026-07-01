---
title: Intrinsic decomposition and editing of 3D Gaussian splats
authors: George Drettakis et al.
date: 2026-06-30
source: arXiv cs.GR (Proc. ACM Comput. Graph. Interact. Tech. 2026)
url: https://arxiv.org/abs/2606.31637
pdf: https://arxiv.org/pdf/2606.31637
tags: [rendering, intrinsic-decomposition, Gaussian-Splatting, editing, PBR, 2026]
status: unread
---

# Intrinsic decomposition and editing of 3D Gaussian splats

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Intrinsic decomposition and editing of 3D Gaussian splats |
| 作者 | George Drettakis et al. |
| 来源 | arXiv cs.GR, Proc. ACM Comput. Graph. Interact. Tech. 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.31637) |

## 核心贡献
1. 将intrinsic decomposition扩展到Gaussian splatting表示
2. 三个关键方面解决方案：
   - 用独立Gaussian primitives集合建模intrinsic decomposition
   - 数据驱动预测引导的优化，分离为diffuse albedo和shading
   - 编辑工作流：修改平面表面albedo即可编辑纹理
3. 支持任意视角重新渲染编辑后场景，保持合理光照

## 技术方案
- **独立Gaussian集合**：每个集合适应其表示层的特征
- **数据驱动优化**：使用预测引导分离diffuse/shading
- **编辑工作流**：用户修改 albedo → 捕获到intrinsic radiance field → 任意视角重渲染

## 实验结论
- 支持修改物体颜色和纹理而不改变光照
- 在任意视角下渲染编辑后场景

## 可行性分析
- 实现难度：中
- 性能预期：实时渲染
- 适用场景：基于图像的渲染、场景编辑

## 相关工作
- [[3DGS]] - 3D Gaussian Splatting
- [[Intrinsic-Images]]

## 笔记
Proc. ACM Comput. Graph. Interact. Tech. = I3D / EG类似期刊
George Drettakis团队工作，与GRay、Editable Reflections同期
