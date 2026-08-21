---
title: Six Ways to Draw Vangers with WebGPU
authors: Dzmitry Malyshau
date: 2026-08-18
source: arXiv
url: https://arxiv.org/abs/2608.17390
pdf: https://arxiv.org/pdf/2608.17390
tags: [rendering, real-time, WebGPU, terrain-rendering, ray-marching, rasterization]
status: unread
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields |
| 作者 | Dzmitry Malyshau |
| 来源 | arXiv cs.GR (Journal of Computer Graphics Techniques) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17390) |
| PDF | [下载](https://arxiv.org/pdf/2608.17390) |

## 核心贡献
1. 比较六种地形渲染方法：height-field ray marching, voxel-accelerated ray marching, sliced proxy geometry, per-sample bar rasterization, compute scattering, fitted triangle mesh
2. 全部使用WebGPU API和WGSL实现
3. 针对可编辑多层高度场提出特定约束

## 技术方案
**背景**: 游戏地形通常不是单值平滑的，不适合传统数字高程模型评估方法。

**六种方法**:
1. **Height-field ray marching**: 经典方法
2. **Voxel-accelerated ray marching**: 体素加速
3. **Sliced proxy geometry**: 代理几何
4. **Per-sample bar rasterization**: 采样光栅化
5. **Compute scattering**: 计算散射
6. **Fitted triangle mesh**: 拟合三角形网格

**约束**: 必须保持每个地面采样点的两个固体间隔、交互帧率、反映局部地形破坏无需重载关卡。

**发现**: 从顶视相机看六种方法无法区分，但眼高水平看：点散射丢失覆盖、切片产生条带、简化网格可能漏墙。在选定质量设置下，贪婪三角不规则网络(TIN)在所有测量设备上平均帧时间最低，但拟合成本由第二层决定。

## 实验结论
- 发布引擎、测试框架和单命令测量协议
- 所有实现使用相同原生wgpu/WebGPU API和WGSL

## 局限性
- 可编辑地形保留319 MiB GPU几何和535 MiB CPU三角化
- 适用特定游戏地形场景

## 可行性分析
- 实现难度：低-中
- 性能预期：TIN方法最优但内存开销大
- 适用场景：游戏地形渲染、WebGPU实现参考

## 相关工作
- Height-field rendering
- WebGPU
- Terrain LOD

## 笔记
**实用价值**: 详细的WebGPU地形渲染实现对比，对实时渲染引擎开发有参考价值。
