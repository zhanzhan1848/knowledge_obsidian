---
title: "ARDY: Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation"
authors:
  - Kaifeng Zhao
conference: SIGGRAPH 2026
arXiv: "2607.08741"
date: 2026-07-09
tags: [图形, 角色动画, 运动生成, 扩散模型]
---

# ARDY: Autoregressive Diffusion with Hybrid Representation for Interactive Human Motion Generation

## 核心方法

NVIDIA 提出的 ARDY 是一个**流式生成框架**，用于交互式应用中实时生成逼真的 3D 人体运动。

### 关键技术点

1. **混合表示法**：结合显式根特征与隐式身体嵌入，平衡精确轨迹控制与高效生成学习

2. **两阶段自回归 Transformer 去噪器**：具有可变历史上下文，支持灵活、长期运动学约束条件

3. **在线提示支持**：支持在线文本提示和灵活的运动学约束

### 核心创新

- 解决离线运动生成方法缺乏交互速度的问题
- 解决在线方法缺乏可控性或难以处理复杂文本语义的限制
- 混合表示 + 可变上下文 Transformer

## 实验数据集

- HumanML3D benchmark
- Bones Rigplay dataset (大规模高保真数据集)

## 链接

- 论文：https://arxiv.org/abs/2607.08741
- 项目页面：https://research.nvidia.com/labs/sil/projects/ardy/

---

*📅 自动收集于 2026-07-11*
