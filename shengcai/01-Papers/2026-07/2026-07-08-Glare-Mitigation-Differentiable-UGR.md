---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [rendering, global-illumination, differentiable-rendering, glare, inverse-design]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.04796
---

# Glare Mitigation using a Differentiable Unified Glare Rating

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Glare Mitigation using a Differentiable Unified Glare Rating |
| **作者** | Linas Beresna et al. |
| **发表** | Eurographics Symposium on Rendering (EGSR) 2026, Symposium Track |
| **链接** | [原文](https://arxiv.org/abs/2607.04796) |
| **DOI** | https://doi.org/10.2312/sr.20261013 |

---

## 核心贡献

> 将离散的 CIE Unified Glare Rating (UGR) 转化为连续可微分的代理函数，实现基于梯度的眩光优化

1. 提出连续可微分的 UGR 代理函数，解决传统离散阈值与梯度优化不兼容的问题
2. 引入可微分光学散射通道，模拟人眼点扩散函数 (PSF) 来解决低采样密度下的优化不稳定性
3. 用可调 sigmoid 边界函数替代离散 UGR 阶跃函数，使梯度能平滑传播

---

## 技术方案

### 核心思想

传统 UGR 依赖严格的二元阈值，无法与基于梯度的逆渲染兼容。本文提出：
- 将离散 UGR 转化为连续可微分代理
- 通过模拟人眼 PSF 的光学散射通道修复破损的评估掩码
- 使用 sigmoid 边界函数替代阶跃函数

### 关键技术

| 技术 | 说明 |
|------|------|
| Differentiable UGR | 连续可微分的眩光评估函数 |
| Point Spread Function | 模拟人眼光学特性 |
| Sigmoid Boundary | 平滑梯度传播 |
| Inverse Rendering | 物理逆设计优化 |

---

## 实验结论

- **应用域**: 建筑、汽车眩光优化
- **优化目标**: 表面微几何粗糙化、折射率优化、发光器遮罩
- **结果**: 在复杂全局光照环境中实现视觉舒适度的物理基础优化

---

## 局限性

- 需要 Monte Carlo 采样，低采样密度下有噪声问题
- 依赖于 PSF 模型的准确性

---

## 实现建议

- **实现难度**: 中等（需理解 UGR 标准和光学散射）
- **适用场景**: 建筑照明设计、汽车内饰、自动驾驶视觉系统
