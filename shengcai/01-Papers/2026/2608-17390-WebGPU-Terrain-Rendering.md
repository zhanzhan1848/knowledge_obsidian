---
title: "Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields"
authors: []
date: 2026-08-17
status: 待读
tags: [渲染, 地形渲染, WebGPU, ray marching, 实时渲染]
keywords: [terrain rendering, WebGPU, ray marching, height field, real-time rendering]
links:
  arXiv: https://arxiv.org/abs/2608.17390
  PDF: https://arxiv.org/pdf/2608.17390
reviewDate: 2026-08-25
---

# Six Ways to Draw Vangers with WebGPU: Real-Time Rendering of Editable Multi-Layer Height Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | (待补充) |
| 发表 | arXiv cs.GR, 2026-08-17 |
| 链接 | [arXiv](https://arxiv.org/abs/2608.17390) |

## 核心贡献

比较了六种地形渲染方法，全部在单一引擎中实现：

1. **Height-field ray marching** - 高度场光线步进
2. **Voxel-accelerated ray marching** - 体素加速光线步进
3. **Sliced proxy geometry** - 切片代理几何体
4. **Per-sample bar rasterization** - 每样本条带光栅化
5. **Compute scattering** - 计算散射
6. **Fitted triangle mesh** - 拟合三角形网格

## 技术细节

### 约束条件
- 每个地面采样点保留两个实数间隔
- 交互帧率渲染
- 反映局部地形破坏（无需重新加载关卡）

### 评估基准
- CPU 光线投射（与源数据对比）
- 手绘多层地形数据（Vangers 1998）

### 实现
- 统一的 native WebGPU / WebGPU API
- 标准 WGSL 着色器

## 实验结论

- **贪婪 TIN（三角不规则网络）** 在所有测试设备上具有最低平均帧时间
- Fit 成本由第二层决定而非地面起伏
- 可编辑网格保留 319 MiB GPU 几何 + 535 MiB CPU 三角化数据
- 不同方法在俯视时效果相近，但**眼高水平时差异显著**：
  - 点散射丢失覆盖
  - 切片产生条带
  - 简化网格可能漏掉墙壁

## 实用性评估

- **创新性**：⭐⭐⭐ 系统性方法对比
- **实用性**：⭐⭐⭐⭐⭐ WebGPU 地形渲染实践指南
- **实现难度**：中

## 相关工作

- Terrain LOD (Level of Detail)
- Ray Marching
- Height Field Rendering
- WebGPU / WGSL

## 备注

- 29 pages，投稿 Journal of Computer Graphics Techniques
- 发布引擎、测试框架和单命令测量协议
