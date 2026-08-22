---
title: Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields
authors: Anonymous
date: 2026-08-17
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17390
pdf: https://arxiv.org/pdf/2608.17390
tags: [rendering, paper, 2026, terrain-rendering, ray-marching, voxel, rasterization, WebGPU]
status: unread
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields |
| 作者 | Anonymous |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17390) |
| PDF | [下载](https://arxiv.org/pdf/2608.17390) |

## 核心贡献
1. 在单一引擎中实现**六种地形渲染方法**的统一比较
2. 所有方法使用相同 native WebGPU API 和 WGSL
3. 针对 Vangers (1998) 游戏的多层高度场地形数据进行测试
4. 约束：保留地面样本的两个固体区间、交互速率、局部地形破坏无需重新加载
5. 发布引擎、测试框架和单命令测量协议

## 六种渲染方法

| 方法 | 描述 |
|------|------|
| Height-field Ray Marching | 高度场光线步进 |
| Voxel-accelerated Ray Marching | 体素加速光线步进 |
| Sliced Proxy Geometry | 切片代理几何 |
| Per-sample BAR Rasterization | 每样本条带光栅化 |
| Compute Scattering | 计算散射 |
| Fitted Triangle Mesh | 拟合三角形网格 |

## 技术细节

### 测试场景
- Vangers (1998) 手编多层地形
- CPU ray cast 作为 ground truth

### 关键发现
- **俯视视角**：六种方法视觉不可区分
- **眼平高度**：point scattering 失去覆盖、切片有条纹、简化网格可能遗漏墙壁
- **greedy triangulated TIN**：在所有测试设备上平均帧时间最低
- **fit cost** 由第二层决定而非地面起伏
- **可编辑性**：保留 319 MiB GPU 几何 + 535 MiB CPU 三角化

## 实验结论
- greedy triangulated TIN 最低平均帧时间
- 俯视时方法可互换，眼平高度时差异显著
- 发布开源工具用于地形渲染评估

## 局限性
- 论文针对1998年老游戏数据，现代地形可能不同
- 可编辑网格内存开销大

## 可行性分析
- 实现难度：**中**
- 性能预期：TIN 方法最优，内存开销需权衡
- 适用场景：游戏地形渲染、WebGPU 应用

## 相关工作
- [[地形渲染相关工作]]

## 笔记
实用的工程对比论文，六种方法在同一引擎同一数据路径下评估，对实际项目选型有参考价值。
