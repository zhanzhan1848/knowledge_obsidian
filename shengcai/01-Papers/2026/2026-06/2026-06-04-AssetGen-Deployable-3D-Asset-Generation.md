---
title: AssetGen: Deployable 3D Asset Generation at Interactive Speed
authors: Dilin Wang, Xiaoyu Xiang, Kihyuk Sohn, Tom Monnier, Yu-Ying Yeh, Thu Nguyen-Phuoc, Jiawen Zhang, Yuchen Fan, Antoine Toisoul, Hyunyoung Jung, Prithviraj Dhar, Michael Bunnell, Nikolaos Sarafianos, Chuhang Zou, Roman Shapovalov, Andrea Vedaldi, Rakesh Ranjan
date: 2026-06-04
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.26137
pdf: https://arxiv.org/pdf/2605.26137
tags: [rendering, 3D-generation, real-time, PBR, mesh, texture]
status: unread
---

# AssetGen: Deployable 3D Asset Generation at Interactive Speed

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | AssetGen: Deployable 3D Asset Generation at Interactive Speed |
| 作者 | Dilin Wang et al. (17 authors) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.26137) |
| PDF | [下载](https://arxiv.org/pdf/2605.26137) |

## 核心贡献
1. 给定单张参考图像，30秒内生成高质量mesh（带baked normals）、彩色纹理、可控多边形预算，适用于实时渲染（包括移动端）
2. AssetGen Flash变体将延迟进一步降低至14秒，用于交互式和agentic创作流程
3. Coarse-to-refine VecSet框架：GPU上进行mesh简化、清理、法线烘焙；快速并行UV展开
4. 多视角纹理生成 + backprojection + 3D inpainting
5. 模型蒸馏、内核优化、流水线并行化协同设计加速系统

## 技术方案
**VecSet Framework (Coarse-to-refine)**:
- 几何生成：粗到精的mesh生成流水线
- Mesh simplification, cleaning, normal baking on GPU
- Fast parallel UV unwrapping
- Multi-view texture generation → backprojection → 3D inpainting

**Pipeline Acceleration**:
- Model distillation
- Kernel optimization
- Pipeline parallelization

**Output**:
- 高质量mesh + baked normals
- 彩色纹理
- 受控多边形预算（适合实时渲染）

## 实验结论
- 30秒内生成production-ready 3D资产
- 14秒preview质量结果
- 在移动端可用的多边形预算下仍保持竞争力视觉质量
- 自动化和盲测人类评估证明与领先商业解决方案 competitive

## 局限性
- 单一图像作为输入，复杂遮挡场景可能受限
- 需要可控多边形预算与视觉质量之间的权衡

## 可行性分析
- 实现难度：中（基于已有3D生成方法）
- 性能预期：30秒/14秒生成时间，适合交互式工作流
- 适用场景：游戏开发、AR/VR内容创作、实时渲染流水线

## 相关工作
- [[2026-04-10-RealTime-3DGS-Edge-GPU-Tradeoffs]]
- [[2026-05-04-GRTX-Efficient-Ray-Tracing-3D-Gaussian]]