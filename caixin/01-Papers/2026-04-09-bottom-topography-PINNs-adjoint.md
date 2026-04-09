---
type: paper
created: 2026-04-09
updated: 2026-04-09
tags: [paper, shallow-water, PINNs, adjoint-method, inverse-problem, topography-estimation]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2604.07075
---

# Estimating bottom topography in shallow water flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Estimating bottom topography in shallow water flows |
| **作者** | Lucas Pancotto, Patricio Clark Di Leoni |
| **发表** | arXiv 2026-04-08 |
| **链接** | [原文](https://arxiv.org/abs/2604.07075) / [PDF](https://arxiv.org/pdf/2604.07075) |
| **DOI** | 10.48550/arXiv.2604.07075 |

---

## 核心贡献

> 仅利用水面变形测量数据，通过 PINNs 和伴随状态方法两种方法估计浅水流动地形

1. **两种方法对比**: PINNs vs. Adjoint State Method
2. **稀疏数据**: 仅需水面变形测量，无需全速度场
3. **1D/2D 验证**: 两种方法均可成功重建底部地形和水面速度

---

## 方法论

### 方法 1: PINNs (Physics-Informed Neural Networks)

- 将 Navier-Stokes/浅水方程作为损失函数正则项
- 神经网络同时学习速度场和地形
- 可处理噪声和稀疏测量

### 方法 2: Adjoint State Method (伴随状态法)

- 将地形作为待优化参数
- 通过伴随方程高效计算梯度
- 适合大规模优化问题

---

## 控制方程

浅水方程：

```math
\begin{aligned}
\frac{\partial h}{\partial t} + \frac{\partial (hu)}{\partial x} &= 0 \\
\frac{\partial (hu)}{\partial t} + \frac{\partial}{\partial x}\left(hu^2 + \frac{g h^2}{2}\right) &= -gh \frac{\partial b}{\partial x}
\end{aligned}
```

其中 $b(x)$ 为底部地形，$h$ 为水深。

---

## 实验结果

| 测试 | PINNs | Adjoint |
|------|-------|---------|
| 1D 重建 | ✅ 成功 | ✅ 成功 |
| 2D 重建 | ✅ 成功 | ✅ 成功 |
| 抗噪性 | ✅ 鲁棒 | ✅ 鲁棒 |
| 稀疏数据 | ✅ 鲁棒 | ✅ 鲁棒 |

---

## 相关工作

- [[PINNs]] — Physics-Informed Neural Networks
- [[Shallow water equations]] — 浅水方程
- [[Adjoint method]] — 伴随方法
- [[Inverse problems]] — 逆问题

---

## 实现建议

- **实现难度**: ⭐⭐⭐ 中等
- **适用场景**: 河道测量、海洋地形反演、卫星测高数据利用

---

*📅 收集日期: 2026-04-09 | 来源: arXiv physics.flu-dyn*
