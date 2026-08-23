---
type: paper
created: 2026-08-23
updated: 2026-08-23
tags: [compressible-flow, potential-flow, cylinder, shock-wave, wake-patterns]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.19246
---

# Modeling the Compressible Flow Field of an Impulsively Started Circular Cylinder with Refined Potential Flow Theory

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Modeling the Compressible Flow Field of an Impulsively Started Circular Cylinder with Refined Potential Flow Theory |
| **作者** | T. O. Amoloye, L. T. Oladimeji, M. A. Hayajnh, O. A. Olayemi |
| **发表** | Physics of Fluids 38 (8): 086108, Aug 2026 (arXiv:2608.19246) |
| **链接** | [原文](https://arxiv.org/abs/2608.19246) |
| **DOI** | 10.1063/5.0332888 |
| **代码** | - |

---

## 核心贡献

> 提出解析模型预测高速流体绕圆柱流动，同时捕捉尾流模式、湍流和激波，计算量远低于完整模拟

1. **解析势流模型**: 改进的势流理论模型预测可压缩流动
2. **捕捉多物理现象**: 同时捕捉尾流模式、湍流和激波
3. **计算效率**: 相比完整 CFD 模拟计算成本极低
4. **发表**: 已发表于 Physics of Fluids

---

## 技术方案

### 核心思想

改进的势流理论（refined potential flow theory）用于可压缩流动：

- 基于势流假设（无粘、无旋）但引入可压缩修正
- 捕捉激波形成和传播
- 预测尾流结构和湍流特征

### 数值方法

| 技术 | 说明 |
|------|------|
| 势流理论 | 速度势满足 Laplace/Poisson 方程 |
| 可压缩修正 | 基于 Mach 数和密度变化的修正项 |
| 激波捕捉 | 通过解析公式或弱解方法处理激波 |

### 应用场景

圆柱绕流（突然启动），高马赫数（可压缩流动）

---

## 主要结论

- 模型能捕捉尾流模式的空间演化
- 激波位置和强度预测与完整模拟一致
- 计算效率显著提升（解析公式为主）

---

## 局限性

- 势流假设忽略粘性效应
- 不适用于高 Re 数下的完全湍流
- 激波-边界层相互作用无法捕捉

---

## 实现建议

- **实现难度**: 中（解析公式为主）
- **预期性能**: 高速圆柱绕流的快速预测
- **适用场景**: 弹道学、高超声速钝体绕流、工程初步设计

---

## 相关工作

- [[势流理论]]
- [[可压缩流动]]
- [[激波捕捉]]
- [[圆柱绕流]]

---

## 摘要

本文提出新的解析模型，预测高速流体绕圆柱的流动，同时捕捉尾流模式、湍流和激波，计算量远低于完整模拟。该模型基于改进的势流理论，已发表于 Physics of Fluids (2026)。
