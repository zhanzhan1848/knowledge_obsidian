---
title: Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields
authors: Dzmitry Malyshau
date: 2026-08-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17390
pdf: https://arxiv.org/pdf/2608.17390.pdf
tags: [rendering, real-time, WebGPU, ray-marching, terrain-rendering, rasterization, 2026]
status: unread
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields |
| 作者 | Dzmitry Malyshau |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17390) |
| PDF | [下载](https://arxiv.org/pdf/2608.17390.pdf) |

## 核心贡献
1. **六种渲染方法对比** - 在单一引擎中实现并对比六种地形渲染技术
2. **多层高度场处理** - 处理游戏地形中常见的多层、可编辑、非规则地形
3. **完整性能分析** - 针对多种设备进行系统性性能评估
4. **开源引擎和测量协议** - 释放完整引擎、测试工具和测量协议

## 技术方案

### 六种渲染方法
1. **Height-field ray marching** - 高度场光线行进
2. **Voxel-accelerated ray marching** - 体素加速光线行进
3. **Sliced proxy geometry** - 切片代理几何
4. **Per-sample bar rasterization** - 每样本条带光栅化
5. **Compute scattering** - 计算散射
6. **Fitted triangle mesh** - 拟合三角网格

### 约束条件
- 每个地面采样点保留两个固体区间
- 交互速率渲染
- 反映局部地形破坏而不重载关卡

### 关键发现
- 从顶部俯视角看，六种方法看起来差不多
- 在眼平高度地平线处差异明显：点散射失去覆盖、切片产生条带带、简化网格可能遗漏墙壁
- **Greedy TIN（三角不规则网络）** 在所有测量设备上具有最低平均帧时间
- 但拟合成本由第二层决定，而非地面起伏
- 使网格可编辑需要保留 319 MiB GPU 几何和 535 MiB CPU 三角化

## 实现细节
- 所有六种实现使用相同的原生 wgpu/WebGPU API 和规范 WGSL
- 使用 Vangers (1998) 的手工多层地形作为测试数据
- 以 CPU 光线投射结果为基准进行评分

## 可行性分析
- 实现难度：中
- 性能预期：实时渲染性能，交互速率
- 适用场景：游戏地形、WebGPU 应用、可编辑地形

## 相关工作
- [[地形 LOD 技术]]
- [[WebGPU 渲染]]
- [[Ray Marching 地形]]

## 笔记
非常实用的工程论文，对六种地形渲染方法进行了系统性对比。使用 WebGPU 和 WGSL 实现，对 WebGPU 游戏开发有重要参考价值。
