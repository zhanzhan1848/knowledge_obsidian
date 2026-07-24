---
type: paper
created: 2026-07-24
updated: 2026-07-24
tags: [velocity-gradient, neural-network, compressible-flow, turbulence-modeling, non-equilibrium]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2607.21152
---

# A physics-assisted deep neural network-based closure framework for velocity gradient dynamics in compressible flows with vibrational non-equilibrium

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A physics-assisted deep neural network-based closure framework for velocity gradient dynamics in compressible flows with vibrational non-equilibrium |
| **作者** | Deep Shikha, Sawan S Sinha |
| **发表** | arXiv 2026-07-23 |
| **链接** | [原文](https://arxiv.org/abs/2607.21152) |
| **DOI** | 10.48550/arXiv.2607.21152 |
| **代码** | - |

---

## 核心贡献

> 提出H-EHEE模型，结合现象学和深度神经网络闭包来模拟可压缩湍流中速度梯度的演化

1. 现象学闭包 + 神经网络闭包的混合框架
2. TGF (热力学梯度场) 张量的系统性闭包
3. 振动非平衡效应的数据驱动闭包

---

## 技术方案

### 核心思想

在速度梯度演化方程中，TGF张量是主要的未闭项，包含压力Hessian张量 ρH 和 baroclinic 张量 B。框架对两者都进行闭包建模。

### 关键技术

| 技术 | 说明 |
|------|------|
| 深度神经网络 | B张量（无粘机制）的闭包学习 |
| 现象学模型 | H张量的已有闭包框架 |
| 振动非平衡效应 | 数据驱动闭包 |
| DNS验证 | 跨湍流马赫数范围评估 |

---

## 核心公式

TGF张量：
```
TGF = ρH + B
```
其中：
- ρH: 压力Hessian张量
- B: Baroclinic张量

H-EHEE模型结合了现象学和神经网络表示

---

## 实验结论

- H-EHEE模型与DNS统计结果高度一致
- 在高可压缩流动区域优于现有模型
- 适用于跨湍流马赫数范围

---

## 实现建议

- **实现难度**: 较高（需深度学习 + 湍流建模基础）
- **预期性能**: DNS级别精度，计算成本更低
- **适用场景**: 高超声速流动、发动机内流

---

## 相关概念

- [[速度梯度动力学]]
- [[湍流闭包模型]]
- [[可压缩湍流]]
- [[振动非平衡]]
- [[深度学习湍流建模]]
