---
type: paper
created: 2026-05-19
updated: 2026-05-24
tags: [LES, spray-evaporation, super-resolution, deep-learning, SGS-modeling]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2605.19732v1
---

# Large-eddy simulation of moderately dense evaporating sprays with particle-informed super-resolution

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Large-eddy simulation of moderately dense evaporating sprays with particle-informed super-resolution |
| **作者** | Ruyue Cheng, Ali Shamooni, Andreas Kronenburg, Jan Wilhelm Gärtner, Thorsten Zirwes |
| **发表** | arXiv (Submitted to Proc. Combustion Inst.) |
| **链接** | [原文](https://arxiv.org/abs/2605.19732v1) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 提出粒子信息超分辨率 (PISR) 方法用于中等稠密喷雾的大涡模拟，通过深度学习重建高分辨率流场以提高蒸发率计算精度。

1. **PISR 方法**: Particle-Informed Super-Resolution，粒子信息超分辨率
2. **LES 雾化蒸发**: 解决粗网格下单液滴蒸发模型边界条件不准确问题
3. **a priori/a posteriori 验证**: 全面验证方法的准确性和泛化能力
4. **鲁棒泛化**: 对训练未见案例 (变空气温度、液滴直径、湍流雷诺数) 具有良好泛化性

---

## 技术方案

### 问题背景

在稠密喷雾或显著聚集的喷雾 LES 中，当网格太粗时，广泛使用的单液滴蒸发模型给出的蒸发率不准确。这对实际喷雾燃烧应用尤为重要。

### PISR 方法

通过深度学习超分辨率重建液滴间空间的局部气体场，用于修正蒸发率。

### 验证结果

- PISR-LES 接近载相直接数值模拟 (CP-DNS) 的蒸发率计算精度
- 显著减少 LES 与 CP-DNS 之间燃料质量分数场的差异

---

## 相关工作

- [[LES-SGS-models]]
- [[spray-combustion]]
- [[deep-learning-CFD]]

---

## 实现建议

- **实现难度**: 高 (需要深度学习 + CFD 耦合)
- **预期性能**: 需 GPU 加速
- **适用场景**: 喷雾燃烧发动机、燃气轮机燃烧室

---

## 备注

- 预印本发表于燃烧研究所论文集 (第42卷)