---
title: Compact Representation of Mipmapped SVBRDFs via Shared Gaussians
authors: (arXiv pending)
date: 2026-07-31
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.27943
pdf: https://arxiv.org/pdf/2607.27943
tags: [rendering, PBR, SVBRDF, material compression, gaussian, 2026]
status: unread
---

# Compact Representation of Mipmapped SVBRDFs via Shared Gaussians (GTC)

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Compact Representation of Mipmapped SVBRDFs via Shared Gaussians |
| 作者 | (arXiv  pending) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.27943) |
| PDF | [下载](https://arxiv.org/pdf/2607.27943) |

## 核心贡献
1. 提出 **Gaussian Texture Compression (GTC)**：基于 2D 高斯的 mipmapped SVBRDF 纹理压缩方法
2. 观察到 SVBRDF 数据存在双重冗余：跨 mip 级别冗余 + 跨材质 map 冗余
3. 2D Gaussian 的核心优势：空间 footprint（支持）与携带值（变化量）自然分离
4. 在压缩质量和内存使用上优于 ASTC（业界标准 GPU 纹理压缩格式）
5. 支持随机访问、非神经解码，适合实时渲染

## 技术方案

### 问题背景
SVBRDF 是 PBR 材质表示的核心，但高分辨率、多通道、mipmapped 纹理栈造成巨大存储负担。

### 现有方法缺陷
| 方法 | 优点 | 缺点 |
|------|------|------|
| 块压缩 | 随机访问、硬件友好 | 仅利用局部块内冗余 |
| 图像编码 | 率失真性能强 | 不适合实时纹理访问 |
| 神经纹理压缩 | 压缩率高 | 解码需神经推理，额外开销 |

### GTC 核心思想
```
2D Gaussian 特性：
- 每个 Gaussian 显式分离：
  - Spatial footprint（空间范围）→ 共享
  - Per-level / per-map values（每个级别/材质图的值）→ 变化

跨 Mip 级别共享：同一空间支持被复用
跨材质 Map 共享：只有 map 特定信息不同
```

### 渐进优化管线
1. 训练阶段：渐进式优化高斯参数
2. 共享 footprint + 独立 values
3. 支持灵活率失真权衡

## 实验结论
- GTC 重建质量 **高于** ASTC
- 内存使用 **低于** ASTC
- 随机访问解码，**无需神经推理**
- 适合实时渲染移动端

## 局限性
- 需要预训练优化管线
- 对极端非静态材质的压缩效果待验证
- 尚无硬件原生支持，需要软件解码

## 可行性分析
- 实现难度：**中**（基于 Gaussian 优化，有参考实现路径）
- 性能预期：软件解码性能需实测，目标是接近 ASTC 实时性能
- 适用场景：游戏纹理压缩、实时 PBR 渲染、移动端图形

## 相关工作
- ASTC (Adaptive Scalable Texture Compression)
- SVBRDF 表示与压缩
- Gaussian Splatting in Graphics

## 笔记
GTC 解决了 PBR 材质压缩的核心痛点——mipmap 和多通道纹理的空间冗余。其创新点在于利用 2D Gaussian 的「footprint vs value」结构特性自然建模双重冗余。超越 ASTC 且支持非神经解码意味着可在现有游戏引擎中直接部署。这对游戏开发和移动端实时渲染有直接实用价值。
