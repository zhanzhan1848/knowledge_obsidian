---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [sediment-transport, turbulence-modulation, bedform, Shields-number, DNS]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04648
---

# Erodible Bed Turbulence Modulation Driven by Transition Between Longitudinal and Transverse Bedforms

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Erodible bed turbulence modulation driven by transition between longitudinal and transverse bedforms at varying Shields numbers |
| **作者** | Yinghaonan Lei |
| **发表** | arXiv 2026-08-05 |
| **链接** | [原文](https://arxiv.org/abs/2608.04648) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04649 |
| **代码** | - |

---

## 核心贡献

> 揭示 Shields 数驱动的纵向-横向沙波转变过程中近壁湍流的非单调调制机制

1. **粒子解析 DNS**：实现颗粒解析的直接数值模拟
2. **床形转变**：纵向脊→横向沙波的 Shields 数诱导转变
3. **湍流非单调调制**：低 Shields 数增强湍流，高 Shields 数抑制湍流
4. **POD 分析**：床面 POD 显示从单峰主导到高阶模态重分布的转变

---

## 技术方案

### 研究方法

- **PR-DNS**（Particle-Resolved Direct Numerical Simulation）
- **Shields 数变化**：控制颗粒输运强度
- **POD 分析**：床面形态分解

### 关键现象

| Shields 数 | 床形 | 湍流效应 |
|------------|------|---------|
| 低 | 纵向脊 + form-induced streaks | 增强 TKE，形成次峰 |
| 高 | 颗粒跃移（saltation）增强 | 破坏结构，抑制湍流 |

### 物理机制

- **纵向脊**：产生 form-induced streaks，形成预乘能谱次峰
- **盐跃作用**：打断近壁结构，抑制 TKE
- **POD 重分布**：从单主导模态转向高阶模态

---

## 核心公式

Shields 数定义：

$$\theta = \frac{\tau_b}{(\rho_s - \rho)gD}$$

其中 $\tau_b$ 为床面剪切应力，$\rho_s$ 为颗粒密度

---

## 实验结论

- **TKE 变化**：低 Shields 数增强，高 Shields 数抑制，呈非单调关系
- **能谱分析**：纵向结构在 Premultiplied energy spectra 中产生次峰
- **床形-湍流耦合**：直接关联床形演化与湍流调制

---

## 局限性

- 均匀颗粒，未考虑非均匀粒径分布
- 二维分析为主

---

## 实现建议

- **实现难度**: ★★★★☆
- **预期性能**: 适合河流、海岸泥沙输运研究
- **适用场景**: 河床演变、海岸侵蚀、沉积物运输模型
