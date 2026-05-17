---
title: "Pixal3D: Pixel-Aligned 3D Generation from Images"
authors: Tencent ARC Lab, Tsinghua University
date: 2026-05-09
source: SIGGRAPH 2026 (arXiv:2605.10922)
url: https://arxiv.org/abs/2605.10922
pdf: https://arxiv.org/pdf/2605.10922
tags: [rendering, 3D-generation, PBR, pixel-aligned, SIGGRAPH-2026, 2026]
status: unread
---

# Pixal3D: Pixel-Aligned 3D Generation from Images

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Pixal3D: Pixel-Aligned 3D Generation from Images |
| 作者 | Tencent ARC Lab, Tsinghua University |
| 来源 | SIGGRAPH 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.10922) |
| PDF | [下载](https://arxiv.org/pdf/2605.10922) |
| 项目页 | https://ldyang694.github.io/projects/pixal3d/ |

## 核心贡献
1. 提出**像素对齐的3D生成范式**，直接在输入视图坐标系中生成3D，替代在规范空间生成
2. 引入**像素反向投影条件化**(pixel back-projection conditioning)机制，将多尺度2D图像特征显式提升到3D特征体素
3. 建立无歧义的直接像素到3D对应关系
4. 达到接近重建级别的保真度，同时具有生成式多样性
5. 自然扩展到多视图生成和物体分离场景合成

## 技术方案

### 核心问题
大多数3D原生生成器在规范空间中合成形状，通过注意力注入图像线索，导致像素到3D的关联模糊。

### 像素反向投影条件化
将多尺度图像特征通过校准反向投影显式提升到3D特征体素，使每个3D点精确知道它来自哪个像素。

### 三部分架构
1. **像素对齐结构化潜在表示学习**：VAE压缩像素对齐稀疏SDF为高效稀疏潜在
2. **基于图像反向投影的条件化器**：替代松散注意力，实现显式像素到3D对应
3. **两阶段生成和解码**：粗粒度阶段生成结构化潜在，精细阶段重建几何和纹理

### 输出
- GLB格式
- PBR纹理
- 可用于渲染的3D资产

## 实验结论
- 接近重建级保真度
- 详细的几何和PBR纹理
- 支持单视图和多视图生成
- 支持物体分离的3D场景合成

## 可行性分析
- 实现难度：**中**（有开源代码和Hugging Face demo）
- 性能预期：生成式方法，有开源实现
- 适用场景：游戏资产创建、虚拟角色、电商三维建模、工业设计

## 相关工作
- TRELLIS.2 (backbone)
- Direct3D-S2 (原版实现)
- 3D生成模型对比

## 标签
#3D生成 #像素对齐 #PBR材质 #SIGGRAPH2026 #神经渲染 #腾讯