---
tags: [渲染, 3DGS, 可靠性, 容错, 2026]
date: [[2026-06-25]]
status: 待读
---

# Single-Event Upsets in 3D Gaussian Splatting Rendering

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Baris Basaran |
| 发表 | arXiv cs.GR (2026) |
| 链接 | [arXiv:2606.21791](https://arxiv.org/abs/2606.21791) |
| 数据集 | [HuggingFace](https://huggingface.co/datasets/Lightcap/seu-3dgs) |

## 核心贡献
1. 首次系统研究 3DGS 渲染中的单事件翻转 (SEU) 影响
2. 构建 GPU-resident 并行故障注入引擎，应用超过 380 万次受控单比特翻转
3. 提出 **Support Guard** 防御机制

## 技术方案

### 研究方法
- 跨 4 个场景、6 个字段、所有比特位置、3 种数值格式 (fp32, fp16, bf16) 的系统故障注入
- 5.3 GPU 小时计算

### 关键发现
1. 大多数翻转因高冗余而对图像无感知影响
2. 少数高阶比特（特别是对数尺度的符号位）可将单个原语扩大到覆盖高达 **75.7%** 的帧
3. 基于 IEEE-754 布局和流水线激活的闭合形式扰动边界可预测此每比特排序

### Support Guard
- 对每个图元参数钳位到训练期间观察到的坐标框
- 每帧开销仅 76 微秒
- 在 768,000 次受保护翻转后，最坏腐败足迹限制在 **11.68%**

## 实验结论
- 在 20,000 次同时翻转累积剂量下，无保护渲染器降解到 10.6 dB，而保护渲染器保持在 21.8 dB

## 标签
#3DGS #Reliability #FaultTolerance #GPUComputing

## 相关笔记
