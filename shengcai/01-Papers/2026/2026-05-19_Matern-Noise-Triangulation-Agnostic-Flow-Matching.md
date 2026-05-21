---
title: "Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes"
authors: Tianshu Kuai
date: 2026-05-19
source: arXiv cs.GR (SIGGRAPH 2026 / ACM TOG)
url: https://arxiv.org/abs/2605.19305
pdf: https://arxiv.org/pdf/2605.19305
tags: [rendering, mesh-processing, flow-matching, machine-learning]
status: unread
---

# Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Matérn Noise for Triangulation-Agnostic Flow Matching on Meshes |
| 作者 | Tianshu Kuai |
| 来源 | arXiv cs.GR (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.19305) |
| PDF | [下载](https://arxiv.org/pdf/2605.19305) |

## 核心贡献
1. 提出 triangulation-agnostic 的噪声分布定义，通过谱（Spectrum）数学表征
2. 证明 Matérn 过程的离散化具有 triangulation-agnostic 特性
3. 将 flow matching 适配到 mesh-based triangulation-agnostic 设置

## 技术方案
- **问题**: 现有方法在三角形网格上生成信号时依赖特定三角化
- **解决**: Matérn 过程作为噪声分布，triangulation-agnostic
- **方法**: 结合 PoissonNet 作为去噪器
- **应用**: 采样弹性静止状态、生成人形姿态

## 实验结论
- 在超过 100 万三角形的网格上产生高质量结果
- 在质量和多样性上显著超越 SOTA

## 局限性
- 计算成本较高
- 需要预训练的 PoissonNet 去噪器

## 可行性分析
- 实现难度：中（基于已有 flow matching 和 PoissonNet）
- 性能预期：高质量mesh信号生成
- 适用场景：角色动画、物理模拟、网格生成

## 相关工作
- Flow Matching on meshes
- PoissonNet

## 笔记
Project page: https://matern-fm.github.io/
该工作为 mesh 上信号生成提供了理论和方法论基础。