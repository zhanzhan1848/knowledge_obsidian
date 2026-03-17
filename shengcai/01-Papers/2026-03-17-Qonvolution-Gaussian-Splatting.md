---
title: Towards High-Fidelity Gaussian Splatting with Queried-Convolution Neural Networks
authors: Abhinav Kumar, Tristan Aumentado-Armstrong, Lazar Valkov, et al.
date: 2026-03-15
source: arXiv
url: https://arxiv.org/abs/2512.12898
pdf: https://arxiv.org/pdf/2512.12898
tags: [rendering, paper, 2026, gaussian-splatting, neural-network, novel-view-synthesis, super-resolution]
status: unread
priority: high
---

# Towards High-Fidelity Gaussian Splatting with Queried-Convolution Neural Networks

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Towards High-Fidelity Gaussian Splatting with Queried-Convolution Neural Networks |
| 作者 | Abhinav Kumar, Tristan Aumentado-Armstrong, Lazar Valkov, Gopal Sharma, Alex Levinshtein, Radek Grzeszczuk, Suren Kumar |
| 来源 | arXiv (cs.CV, cs.GR, cs.LG) |
| 年份 | 2025/2026 |
| 链接 | [原文](https://arxiv.org/abs/2512.12898) |
| PDF | [下载](https://arxiv.org/pdf/2512.12898) |
| 项目页 | [Qonvolution](https://abhi1kumar.github.io/qonvolution/) |
| 页数 | 38 pages, 8 figures |

## 核心贡献
1. **Queried-Convolutions (Qonvolutions)**: 利用卷积的邻域特性，将低保真信号与查询卷积输出残差
2. **理论基础**: 查询（如坐标）和邻域对学习高保真信号都很重要
3. **超越 Zip-NeRF**: 在真实场景的图像保真度上超越当前最强的辐射场模型

## 技术方案
- **问题**: 3D Gaussian Splatting 重建质量仍落后于 Zip-NeRF 等辐射场模型
- **方法**: Qonvolution 神经网络 (QNNs) + Gaussian Splatting
- **创新**: 将卷积操作与查询机制结合，从邻域信息恢复高频细节

### 应用场景
- 1D 回归
- 2D 回归
- 2D 超分辨率
- Novel View Synthesis (NVS)

## 公式
```math
# Qonvolution（推测）
Output = Conv(LowFidelity, Query) → Residual
HighFidelity = LowFidelity + Residual

# 关键：利用邻域特性恢复高频信息
```

## 实验结论
- 在真实场景 NVS 上达到 SOTA
- 图像保真度超越 Zip-NeRF
- 同时提升回归和超分辨率任务性能

## 局限性
- 增加了神经网络推理开销
- 需要训练 QNN 模块

## 可行性分析
- **实现难度**: 中（基于现有 3DGS + 神经网络）
- **性能预期**: 高质量重建，可能增加推理时间
- **适用场景**: 高质量 Novel View Synthesis、照片级重建

## 推荐结论
✅ **强烈推荐实现**

**理由**:
- 直接解决 3DGS 的主要弱点（重建质量）
- 超越当前 SOTA（Zip-NeRF）
- 有项目页面和代码（预计）

## 行动建议
- 传递给 @墨鱼丸 评估 Qonvolution 实现
- 查看项目页面获取代码
- 考虑与现有 3DGS 渲染管线集成

## 相关工作
- [[3D Gaussian Splatting]]
- [[Zip-NeRF]]
- [[Neural Radiance Fields]]
- [[Super Resolution]]

## 笔记
- 有独立项目页面
- 38 页详细论文
- 可能是 NVIDIA 研究成果（作者包括 Radek Grzeszczuk）
- 适用于多种任务，通用性强
