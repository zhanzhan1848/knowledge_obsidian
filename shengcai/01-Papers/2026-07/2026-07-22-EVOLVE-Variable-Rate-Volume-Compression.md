---
title: Efficient Learned Volume Compression with Variable-Rate Encoding on a Cross-Domain Database
authors: Kaiyuan Tang
date: 2026-07-20
source: IEEE VIS 2026 / TVCG
url: https://arxiv.org/abs/2607.18187
pdf: https://arxiv.org/pdf/2607.18187
tags: [rendering, volume-rendering, compression, neural-network, scientific-visualization]
status: unread
---

# Efficient Learned Volume Compression with Variable-Rate Encoding

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Efficient Learned Volume Compression with Variable-Rate Encoding |
| 作者 | Kaiyuan Tang |
| 来源 | IEEE Transactions on Visualization and Computer Graphics |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.18187) |
| PDF | [下载](https://arxiv.org/pdf/2607.18187) |

## 核心贡献
1. **EVOLVE**: AE-based体数据压缩框架，支持高压缩比离线压缩
2. **大规模跨域数据库**: 6,376个体数据，来自21种科学模拟，通过感知哈希策划
3. **可变比率编码**: 可学习增益机制+三阶段训练策略，单模型支持连续压缩比调节
4. **速度提升**: 比INR-based方法快数量级

## 技术方案
**数据库**: 6,376 volumes, 21科学模拟域，感知哈希确保多样性

**AE设计**:
- macro-和micro-designs
- 改进表达能力和压缩能力

**可变比率编码**:
- 可学习增益机制
- 三阶段训练策略
- 推理时连续压缩比调节

## 实验结论
- 相比传统压缩器更高压缩比下保持重建质量
- 压缩速度比INR-based方法快数量级
- 泛化到未见过的科学模拟数据集

## 局限性
- 针对科学模拟体数据
- 可能不适用于其他类型数据

## 可行性分析
- 实现难度：中
- 性能预期：高压缩比+快速解压
- 适用场景：科学可视化、体渲染数据传输

## 相关工作
- [[Volume Rendering]]
- [[Neural Compression]]

## 笔记
体数据压缩对大规模科学模拟的可视化和渲染有重要意义。
