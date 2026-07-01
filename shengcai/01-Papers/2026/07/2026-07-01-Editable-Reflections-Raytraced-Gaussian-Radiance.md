---
title: Editable Physically-based Reflections in Raytraced Gaussian Radiance Fields
authors: George Drettakis et al.
date: 2026-06-30
source: arXiv cs.GR (SIGGRAPH Asia 2025)
url: https://arxiv.org/abs/2606.30861
pdf: https://arxiv.org/pdf/2606.30861
tags: [rendering, ray-tracing, reflections, Gaussian-Splatting, PBR, 2025]
status: unread
---

# Editable Physically-based Reflections in Raytraced Gaussian Radiance Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Editable Physically-based Reflections in Raytraced Gaussian Radiance Fields |
| 作者 | George Drettakis et al. |
| 来源 | arXiv cs.GR, SIGGRAPH Asia 2025 |
| 年份 | 2025 |
| 链接 | [原文](https://arxiv.org/abs/2606.30861) |
| PDF | [下载](https://arxiv.org/pdf/2606.30861) |
| 代码 | [GitHub](https://repo-sam.inria.fr/nerphys/editable-gaussian-reflections/) |

## 核心贡献
1. 正确重建反射体和被反射物体，而非使用"假"反射几何
2. 分离diffuse和specular buffers用于物理反射
3. 快速3D Gaussian光线追踪算法支持多次反弹反射
4. 支持实时编辑：粗糙度变化、多重反射效果

## 技术方案
1. **Diffuse/Specular Buffer提取**：从输入图像学习分离diffuse和specular
2. **Path Tracing生成物理反射**：优化场景diffuse版本，使用路径追踪生成高质量反射
3. **专用训练方法**：使收敛过程稳定
4. **快速光线追踪算法**：针对3D Gaussian primitives的高效多弹跳反射

## 实验结论
- 正确重建反射器和被反射物体（包括输入图像中未见的部分）
- 支持实时一致的编辑：反射修改、粗糙度变化
- 多重反射效果

## 可行性分析
- 实现难度：高
- 性能预期：实时渲染
- 适用场景：场景反射编辑、基于图像的渲染

## 相关工作
- [[3DGS]] - 3D Gaussian Splatting
- [[GRay]] - 快速3D Gaussian光线追踪

## 笔记
与GRay同一作者团队，使用path tracing生成物理反射，支持编辑
