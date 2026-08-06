---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [water-waves, Dysthe-equation, weakly-viscous, mean-flow-damping, phase-lag]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04473
---

# Higher-Order Extensions of Weakly Viscous Dysthe Theory and a Phase-Lag Model for Nonlinear Mean-Flow Damping

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Higher-order extensions of weakly viscous Dysthe theory and a phase-lag model for nonlinear mean-flow damping |
| **作者** | Constance Schober |
| **发表** | arXiv 2026-08-05 |
| **链接** | [原文](https://arxiv.org/abs/2608.04473) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04473 |
| **代码** | - |

---

## 核心贡献

> 将弱粘性深水波包的 Carter-Govan 多尺度分析扩展至超 Dysthe 阶，检验粘性-色散 mean-flow 阻尼机制

1. **超 Dysthe 阶修正**：推导第五阶诱导平均流修正和第一谐波可解性条件
2. **粘性机制分析**：第五阶无显式粘性项，排除 DDZ 框架中间接粘性机制
3. **相位滞后模型**：有限调整时间模型给出 $1 + i\beta_{\text{eff}}(\Omega)$ 形式的修正
4. **新阻尼机制**：当 $\Omega\tau = \mathcal{O}(\epsilon)$ 时，相位滞后修正进入第五阶

---

## 技术方案

### 控制方程

基于 Dias-Dyachenko-Zakharov (DDZ) 势流框架

### 多尺度分析

- Carter-Govan 多尺度分析扩展至超 Dysthe 阶
- 窄带深水波包

### 关键公式

相位滞后模型：

$$\beta_{\text{eff}}(\Omega) = \Omega\tau$$

当 $\Omega\tau = \mathcal{O}(\epsilon)$：

$$1 + i\beta_{\text{eff}} \text{ 在第五阶进入}$$

---

## 核心物理

- **Mean-flow 相互作用**：Dysthe 方程中的非局部相互作用
- **粘性阻尼**：粘性对平均流的直接和间接效应
- **相位滞后**：有限调整时间效应

---

## 局限性

- 理论分析为主，缺乏数值验证
- 弱粘性假设限制

---

## 实现建议

- **实现难度**: ★★★★★
- **预期性能**: 改进深水波破碎和湍流模型
- **适用场景**: 海浪模拟、海洋工程、深水波动力学研究
