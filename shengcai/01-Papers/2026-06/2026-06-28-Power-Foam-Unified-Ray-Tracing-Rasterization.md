---
tags: [渲染, 可微渲染, 光线追踪, 光栅化, 泡沫表示, 统一管线, 2026]
date: [[2026-06-28]]
status: 待深入分析
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 基本信息

| 标题 | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
|------|------------------------------------------------------------------------------------|
| 作者 | Daniel Rebain, Dor Verbin, Kwang Moo Yi, Anish Prabhu, Andrea Tagliasacchi |
| 机构 | Simon Fraser University, UBC, Google DeepMind, University of Toronto |
| 链接 | [arXiv:2604.24994](https://arxiv.org/abs/2604.24994) |
| 发表 | arXiv cs.GR (2026-04-27) |

## 核心贡献

1. **有界幂图(Bounded Power Diagrams)** - 继承泡沫光线追踪效率的同时支持高效光栅化
2. **有界单元** - 避免传统泡沫的无界单元问题，支持tile级剔除
3. **定向表面建模** - 显式建模内部/外部界面，解耦几何与外观
4. **可微纹理解耦** - 几何和外观独立建模

## 技术方案

### 问题背景
- **光栅化**: 高效但难以处理复杂光线传输
- **泡沫光线追踪**: 常数时间光线遍历，但单元无界/过大，tile光栅化效率低
- **目标**: 统一两者优势

### 核心方法

#### 1. 有界幂图
```
Voronoi泡沫 → 有界幂图（α-complex对偶）
    ↓
可控半径参数调节单元范围
    ↓
空间局部化 → 高效tile光栅化
```

#### 2. 定向点表示
- 显式分区单元为内部/外部区域
- 直接表示表面而非隐式界面

#### 3. 可微纹理
- 纹理直接嵌入表面
- 几何与外观解耦，减少单元预算需求

### 性能特点

| 特性 | 说明 |
|------|------|
| 光线追踪 | 保持常数时间复杂度 |
| 光栅化 | 可与3DGS竞争的帧率 |
| 可微性 | 支持梯度优化 |

## 实现难度

- **算法复杂度**: 高
- **代码工作量**: 高（需实现幂图划分、定向点建模）
- **依赖项**: 泡沫表示、可微渲染框架

## 适用场景

- 需要同时支持快速预览（光栅化）和高质量输出（光线追踪）的应用
- 可微渲染场景（逆渲染、神经渲染）
- 统一渲染管线设计

## 推荐度

⭐⭐⭐⭐⭐ (5/5) - 统一渲染范式的重要工作

## 相关工作

- Radiant Foam (Google)
- 3D Gaussian Splatting (3DGS)
- 可微渲染 (Differentiable Rendering)

## 链接

- [arXiv](https://arxiv.org/abs/2604.24994)
