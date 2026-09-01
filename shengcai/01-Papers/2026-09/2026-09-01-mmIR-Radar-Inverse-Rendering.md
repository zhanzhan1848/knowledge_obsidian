---
title: Frequency-Space Inverse Rendering for 3D Millimeter-Wave Radar ADC Synthesis
authors: Unknown (pending)
date: 2026-08-29
source: arXiv (ECCV 2026)
url: https://arxiv.org/abs/2608.28913
pdf: https://arxiv.org/pdf/2608.28913
tags: [rendering, inverse-rendering, radar, differentiable-rendering, FMCW, physics-based]
status: unread
---

# Frequency-Space Inverse Rendering for 3D Millimeter-Wave Radar ADC Synthesis

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Frequency-Space Inverse Rendering for 3D Millimeter-Wave Radar ADC Synthesis |
| 来源 | arXiv (ECCV 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.28913) |
| PDF | [下载](https://arxiv.org/pdf/2608.28913) |
| 项目页 | https://mmwave-inverse-rendering.github.io/ |

## 核心贡献
1. 提出 mmIR：开源可微分 FMCW 雷达逆渲染器
2. 使用 LiDAR 衍生的网格作为几何支架，通过端到端自动微分优化物理材质和天线模式
3. 实现多跳传播、偏振和自由空间衍射的相位相干 MIMO 前向模型
4. 从稀疏虚拟孔径合成高分辨率 3D 雷达数据

## 技术方案

### 问题背景
高分辨率 3D 雷达数据稀缺。商品毫米波传感器使用小天线阵列，限制角分辨率在几度；现有数据集只提供 2D 距离-方位图或稀疏点云而非原始 ADC 信号。硬件扩展昂贵，合成孔径扫描在舰队规模上不切实际，而学习式合成方法受限于其旨在解决的数据短缺问题。

### 核心方法
1. **物理基础前向模型**: 可微分 FMCW 雷达渲染器，将物理参数拟合到真实采集数据
2. **LiDAR 辅助逆渲染**: 使用 LiDAR 衍生的网格作为几何支架
3. **端到端优化**: 通过自动微分优化 ITU 物理材质、顶点法线、天线波束模式
4. **多跳传播与偏振**: 包含多次反弹、偏振和自由空间衍射的相位相干 MIMO 前向模型

### 关键公式 (待补充)
- FMCW 雷达信号模型
- MIMO 前向传播模型
- ITU 物理材质 BRDF

## 实验结论
- 在 7 个户外和 6 个室内 ColoRadar 场景中，range-azimuth map 达到 0.914 平均 Pearson 相关系数（对比 Sionna-RT 的 0.307）
- 级联成像雷达训练的场景可迁移到同位置单芯片雷达，无需重新训练（0.554 相关系数）
- 密集虚拟阵列（100x100 单元）产生单帧 3D 占据图，经 LiDAR 验证

## 局限性
- 依赖于 LiDAR 衍生的初始几何
- 雷达分辨率限制几何直接恢复

## 可行性分析
- 实现难度：高（涉及雷达物理、可微分渲染）
- 性能预期：物理精度高，计算成本中等
- 适用场景：自动驾驶感知、雷达数据增强、传感器仿真

## 相关工作
- Differentiable Rendering
- Inverse Rendering
- mmWave Radar
- Neural Radiance Fields

## 笔记
- ECCV 2026 论文
- 开源项目: https://mmwave-inverse-rendering.github.io/
- 技术路线：将逆渲染技术应用于雷达传感领域，与传统图形渲染不同但方法论相关
