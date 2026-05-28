---
title: Taming Optimization Variance in Compact Neural Shading Networks
authors: Benedikt Bitterli et al. (NVIDIA)
date: 2026
source: SIGGRAPH Conference Track 2026
url: https://research.nvidia.com/labs/rtr/publication/bitterli2026taming/
tags: [rendering, neural-shading, PBR, SIGGRAPH2026]
status: unread
---

# Taming Optimization Variance in Compact Neural Shading Networks

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Taming Optimization Variance in Compact Neural Shading Networks |
| 作者 | Benedikt Bitterli et al. (NVIDIA) |
| 来源 | SIGGRAPH Conference Track 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://research.nvidia.com/labs/rtr/publication/bitterli2026taming/) |

## 核心贡献
1. **多实例训练**: 使用网络 ensemble 进行训练，剪枝表现差的实例，动态调整训练 batch 以保持 wall-clock 时间
2. **方差控制算法**: 有效探索权重空间，显著提高获得高性能模型的概率
3. **优化方案全面改进**: 重访损失函数、激活函数、输入参数化选择

## 技术方案
- 针对小型神经着色网络的高优化方差问题
- 训练时探索权重空间而非只优化单一实例
- 适用于学习神经着色中的反射函数（高动态范围目标）

## 实验结论
- 在神经着色任务中达到更稳定、更快的训练收敛
- 产生的模型性能显著优于单实例训练的 baseline

## 可行性分析
- 实现难度：中（主要是训练策略改进）
- 性能预期：提升实时神经着色质量与训练稳定性
- 适用场景：实时神经外观模型、NVIDIA 实时渲染

## 相关工作
- [[Neural Appearance Models]] [[MesoGAN]] [[Real-Time Neural Appearance]]