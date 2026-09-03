---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [Turbulence, Compressible-Flow, Skin-Friction, Boundary-Layer, DNS]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.02650
---

# Mapping-based exact-integral formulation of skin-friction transformations for zero-pressure-gradient compressible turbulent boundary layers

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mapping-based exact-integral formulation of skin-friction transformations for zero-pressure-gradient compressible turbulent boundary layers |
| **作者** | (见原文) |
| **发表** | arXiv 2026-09-03, Physics of Fluids |
| **链接** | [原文](https://arxiv.org/abs/2609.02650) |
| **arXiv ID** | 2609.02650 |

---

## 核心贡献

> 将可压缩湍流边界层表面摩擦变换置于基于映射的精确积分基础上

1. **精确积分形式**: 将 Van Driest 理论重新表述为有限 Re 精确积分形式
2. **VIPL 变换**: 提出改进变换，预测误差 < 11%，平均误差 3.07%
3. **误差分析**: 量化了经典 vD I 和 vD II 变换在有限 Re 下的局限性

---

## 技术方案

### 核心思想

传统可压缩边界层表面摩擦预测通过将 $C_f$ 和 $Re_\\theta$ 映射到"不可压缩"对应量来实现。本工作从规定的平均速度和壁面法向坐标映射出发推导变换因子，建立了严格的数学基础。

### 关键技术

| 技术 | 说明 |
|------|------|
| Van Driest 变换 | 经典可压缩边界层表面摩擦映射方法 |
| VIPL 变换 | 改进的变换形式，精度最高 |
| DNS 数据库 | 大量直接数值模拟数据验证 |

---

## 公式

覆盖范围: $0.30 \\leq M_\\infty \\leq 13.64$, $-0.55 \\leq \\varTheta \\leq 2.85$

预测误差 < 11%, 平均误差 3.07%

---

## 实验结论

- **验证数据**: 大量 DNS 数据库
- **覆盖参数**: Mach 数 0.30-13.64, 温度比 -0.55 到 2.85
- **结果**: VIPL 变换性能最佳

---

## 相关工作

- [[Van Driest Theory]] - 可压缩边界层理论
- [[Turbulent Boundary Layer]] - 湍流边界层
- [[Skin Friction]] - 表面摩擦系数

---

## 实现建议

- **实现难度**: 中（理论推导为主）
- **适用场景**: 高超声速飞行器边界层预测
