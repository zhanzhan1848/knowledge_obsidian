---
type: paper
created: 2026-04-09
updated: 2026-04-09
tags: [paper, neural-operators, surrogate-model, turbulence, kolmogorov-flow, scientific-ml]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2604.06881
---

# MENO: MeanFlow-Enhanced Neural Operators for Dynamical Systems

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MeanFlow-Enhanced Neural Operators for Dynamical Systems |
| **作者** | Tianyue Yang et al. |
| **发表** | arXiv 2026-04-08 |
| **链接** | [原文](https://arxiv.org/abs/2604.06881) / [PDF](https://arxiv.org/pdf/2604.06881) |
| **DOI** | 10.48550/arXiv.2604.06881 |
| **代码** | (待查) |

---

## 核心贡献

> 解决 Fourier 神经算子高频截断问题，以极低推理开销恢复多尺度特征

1. **MENO** — MeanFlow-Enhanced Neural Operators 框架
2. 利用改进的 MeanFlow 方法，同时恢复小尺度细节和大尺度动力学
3. 在 256×256 分辨率下，PSD 精度提升 2 倍，推理速度比 DDIM 快 12 倍

---

## 技术方案

### 问题背景

Fourier 神经算子（如 FNO）固有地在频谱空间截断高频分量：
- 低分辨率训练数据 → 高分辨率预测时小尺度结构丢失
- 扩散增强方法（DDIM）虽可恢复多尺度特征，但推理开销大

### 核心方法

- **MeanFlow 增强**: 利用改进的 MeanFlow 方法作为后处理，增强神经算子输出
- **无需扩散**: 避免 diffusion-based 方法的迭代推理开销
- **分辨率无关**: 支持低训练分辨率 → 高测试分辨率的外推

### 测试系统

| 系统 | 分辨率 | 特点 |
|------|--------|------|
| 相场动力学 | 256×256 | 多尺度界面演化 |
| 2D Kolmogorov 流 | 256×256 | 湍流/NS 方程 |
| 主动物质动力学 | 256×256 | 复杂流变行为 |

---

## 关键结果

- **PSD 精度**: 比 baseline 提升 2 倍
- **推理速度**: 比 SOTA DDIM 快 12 倍
- **物理逼真度**: 统计准确性和物理保真度均优于 baseline

---

## 局限性

- 针对 Fourier 框架设计，不直接适用于其他神经算子架构
- MeanFlow 参数需调优

---

## 相关工作

- [[Fourier Neural Operator]] — FNO 基础框架
- [[DeepONets]] — 深度算子网络
- [[Kolmogorov flow]] — 湍流基准问题
- [[Surrogate modeling]] — 代理模型

---

## 实现建议

- **实现难度**: ⭐⭐⭐ 中等
- **适用场景**: 实时 CFD 预测、湍流模拟加速、不确定性量化
- **关键优势**: 高效（12×加速）+ 高精度（2× PSD 提升）

---

*📅 收集日期: 2026-04-09 | 来源: arXiv cs.LG + physics.flu-dyn*
