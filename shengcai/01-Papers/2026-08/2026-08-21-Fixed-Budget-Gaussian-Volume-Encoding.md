---
title: Fixed-Budget Gaussian Volume Encoding with Structure-Aware Allocation
authors: (see paper)
date: 2026-08-14
source: arXiv
url: https://arxiv.org/abs/2608.14112
pdf: https://arxiv.org/pdf/2608.14112
tags: [rendering, volume-rendering, Gaussian-encoding, scientific-visualization, compression]
status: unread
---

# Fixed-Budget Gaussian Volume Encoding with Structure-Aware Allocation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Fixed-Budget Gaussian Volume Encoding with Structure-Aware Allocation |
| 作者 | (需查看论文) |
| 来源 | arXiv cs.CV/cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.14112) |
| PDF | [下载](https://arxiv.org/pdf/2608.14112) |

## 核心贡献
1. 在固定预算下将标量场编码为各向异性Gaussian基元
2. 从局部场结构分析分配完整基元集（位置、方向、形状）
3. 无需稀释、剪枝或数量变化直接针对标量场细化

## 技术方案
**背景**: 科学模拟产生的标量体数据速度快于存储和传输速度，原位缩减必须仅使用有限的模拟资源。

**方法**:
- 将标量场编码为各向异性Gaussian基元
- 从局部场结构（位置、方向、形状）分析分配完整基元集
- 然后直接针对标量场细化，无需稀释、剪枝或数量变化

**性能**:
- 截断感知场评估减少编码时间达51倍
- 140万Gauss基元在单桌面GPU上最多4分钟编码10亿体素
- 降低迭代细化在1分钟内完成

## 实验结论
- 五个数据集测试，压缩有用配置达15.0-38.7 dB PSNR
- 压缩比从2.2倍到超过40000倍
- 单个紧凑模型支持所有后续可视化状态变换

## 局限性
- 针对标量场
- 需要预分析场结构

## 可行性分析
- 实现难度：中-高
- 性能预期：优秀的压缩率和视觉质量
- 适用场景：科学数据可视化、体渲染压缩

## 相关工作
- Volume rendering
- Gaussian encoding
- Scientific visualization

## 笔记
**实用价值**: 对科学可视化中的体数据压缩和渲染有重要意义。基元保留标量属性而非 baked appearance，支持后续可视化参数调整。
