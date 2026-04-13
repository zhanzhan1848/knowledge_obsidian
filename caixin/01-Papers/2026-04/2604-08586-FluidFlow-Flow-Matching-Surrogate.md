# FluidFlow: A Flow-Matching Generative Model for Fluid Dynamics Surrogates on Unstructured Meshes

**arXiv:** [2604.08586](https://arxiv.org/abs/2604.08586)
**Subject:** cs.LG, cs.AI, physics.flu-dyn (cross-list)
**Date:** 2026-04-10
**Author:** (multiple, ML + CFD cross-disciplinary)

---

## 核心创新点

- **框架：** 条件流匹配 (Conditional Flow Matching) — 扩散模型的新替代方案
- **任务：** 学习从噪声分布到数据分布的确定性传输映射
- **关键优势：** 直接在结构化和非结构化网格上操作，无需网格插值预处理
- 保持几何保真度

## 神经网络架构

| 架构 | 特点 | 验证场景 |
|------|------|---------|
| U-Net | 经典CNN结构 | 小规模问题 |
| DiT (Diffusion Transformer) | 可扩展 | 大规模非结构化数据集 |

- 以物理意义参数为条件（攻角、雷诺数等）

## Benchmark验证

### 问题1：翼型边界压力系数预测
- 不同工况下的压力系数 $C_p$ 预测
- 条件：物理参数（攻角等）

### 问题2：全三维飞机几何
- 大规模非结构化网格
- 预测压力系数和摩擦系数

## 核心结论

- **FluidFlow 优于强MLP基线**，误差指标显著更低
- DiT架构在大型非结构化数据集上可扩展且高精度
- 流匹配生成模型为CFD代理建模提供有效框架

## 技术对比

| 方法 | 优点 | 缺点 |
|------|------|------|
| 传统CFD | 高保真 | 计算昂贵 |
| 标准DL | 快 | 需要结构化网格/插值 |
| FluidFlow (ours) | 非结构化原生、精度高 | 训练成本 |

## 关键公式/概念

- 流匹配损失：$\mathcal{L} = \mathbb{E}[||v_t - \nabla \log p_t(x_t|x,y)||^2]$
- 条件流匹配：传输映射条件化于物理参数 $y$

## 🔗 URL
- PDF: https://arxiv.org/pdf/2604.08586
- HTML: https://arxiv.org/html/2604.08586v1

## 标签
#CFD #surrogate-model #generative-model #flow-matching #deep-learning #unstructured-mesh #U-Net #transformer
