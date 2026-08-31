---
title: ABCD - Alpha-Composited Block Coordinate Descent: Constant-VRAM Training for Large Radiance Fields
authors: (see paper)
date: 2026-08-27
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.27735
pdf: https://arxiv/pdf/2608.27735
tags: [rendering, paper, 2026, 3DGS, radiance field, VRAM, training, out-of-core]
status: unread
---

# ABCD: Alpha-Composited Block Coordinate Descent - Constant-VRAM Training for Large Radiance Fields

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | ABCD: Alpha-Composited Block Coordinate Descent: Constant-VRAM Training for Large Radiance Fields |
| 作者 | (见论文) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.27735) |
| PDF | [下载](https://arxiv.org/pdf/2608.27735) |

## 核心贡献
1. 提出 ABCD（Alpha-Composited Block Coordinate Descent），一种用于 alpha-composited 辐射场的核外（out-of-core）训练框架，实例化为 3D Gaussian Splatting
2. 将训练重新表述为空间分区的块坐标下降：同一时间仅一个分块参数激活，其余冻结
3. 利用 alpha blending 的结合性，将非激活区域预渲染并折叠为前景/背景 RGBA 图像
4. **峰值 VRAM 与场景规模无关**（固定分块大小和图像分辨率），实现 O(1) VRAM vs 传统 O(N)

## 技术方案
**块坐标下降框架：**
- 将场景空间划分为多个 block
- 每次仅激活一个 block 的参数进行训练
- 利用 alpha 混合的结合律：$[\alpha_1 \cdot c_1, \alpha_1] \otimes [\alpha_2 \cdot c_2, \alpha_2] = [\alpha_1 \alpha_2 (c_1 + (1-\alpha_1)c_2), \alpha_1 \alpha_2]$
- 非激活 block 预渲染为前景/背景 RGBA 图像，大幅减少显存占用

**VRAM 分析：**
- 传统 3DGS：VRAM ∝ 场景规模（Gauss 数量）
- ABCD：VRAM = O(1)，与总场景规模无关

## 实验结论
- 重建质量接近原始 3DGS，PSNR 下降 < 5%
- 消融 ABCD 的 alpha compositing 组件后，PSNR 下降约 40%
- 有限显存 GPU 也能训练超大场景

## 局限性
- 分块策略可能影响边界区域质量
- 需要对分块大小和分区方式进行合理设计

## 可行性分析
- 实现难度：中（块坐标下降框架设计有创意，实现相对直接）
- 性能预期：VRAM 显著降低，质量损失 < 5%，实用价值高
- 适用场景：大场景 3DGS 训练、有限显存 GPU、云计算环境

## 相关工作
- 3D Gaussian Splatting (3DGS)
- Radiance Fields
- Out-of-core training
- 神经渲染 VRAM 优化

## 笔记
ABCD 解决了 3DGS 训练的大场景 VRAM 瓶颈，是重要的实用贡献。
