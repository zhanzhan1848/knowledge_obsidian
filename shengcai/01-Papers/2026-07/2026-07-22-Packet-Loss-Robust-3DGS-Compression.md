---
title: Packet-Loss Robust 3D Gaussian Compression via Atomic Packaging and GNN-based Error Concealment
authors: Yuxuan Tao
date: 2026-07-20
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.17916
pdf: https://arxiv.org/pdf/2607.17916
tags: [rendering, 3DGS, compression, network-streaming, GNN, error-concealment]
status: unread
---

# Packet-Loss Robust 3D Gaussian Compression via Atomic Packaging and GNN-based Error Concealment

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Packet-Loss Robust 3D Gaussian Compression |
| 作者 | Yuxuan Tao |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.17916) |
| PDF | [下载](https://arxiv.org/pdf/2607.17916) |

## 核心贡献
1. **Atomic Packaging**: 锚点级原子封装，联合封装每个锚点的所有属性，将损坏属性失败转换为干净的缺失锚点擦除
2. **Stratified Random Grouping**: 分层随机分组，分散packet丢失到空间域，避免大面积连续空洞
3. **CARI (Context-Aware Residual Interpolation)**: 基于哈希网格先验预测和邻居残差构建鲁棒基线
4. **GNN Refinement**: 轻量级两层图神经网络，通过交叉注意力细化高频属性残差

## 技术方案
**Encoder端**:
- 锚点级原子封装
- 分层随机分组

**Decoder端**:
- 上下文感知残差插值 (CARI)
- GNN细化高频残差
- 属性级置信度控制

## 实验结论
- 20%随机packet丢失下测试（BungeeNeRF, Mip-NeRF 360, Tanks and Temples）
- 相比无 concealment 传输显著改善
- 相对无损 HAC++ 参考，PSNR下降约3 dB

## 局限性
- 专注于packet loss场景
- GNN可能增加计算复杂度

## 可行性分析
- 实现难度：中
- 性能预期：对网络波动鲁棒
- 适用场景：网络流式传输3DGS

## 相关工作
- [[3D Gaussian Splatting]]
- [[HAC++]]
- [[GNN]]

## 笔记
解决了3DGS网络传输中packet丢失的问题，对实时远程渲染有重要意义。
