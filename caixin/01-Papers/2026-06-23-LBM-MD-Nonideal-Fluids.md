---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [LBM, lattice-boltzmann, molecular-dynamics, multiphase, nonideal-fluid]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2606.22048
---

# Molecular Dynamics Perspectives on Nonideal Fluid Models for the Lattice Boltzmann Method

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Molecular Dynamics Perspectives on Nonideal Fluid Models for the Lattice Boltzmann Method |
| **arXiv ID** | 2606.22048 |
| **领域** | physics.flu-dyn, physics.comp-ph |
| **链接** | [原文](https://arxiv.org/abs/2606.22048) \| [PDF](https://arxiv.org/pdf/2606.22048) |

---

## 核心贡献

> 首次系统性地将分子动力学（MD）模拟与介观格子玻尔兹曼（LBM）公式进行对比验证，为非理想流体LBM模型提供第一性原理基准。

1. **MD → LBM 映射**: 将受限流体的MD模拟映射到介观框架，直接对比 LBM 公式
2. **力 formulations 对比**: 通过分析分布函数的矩，识别出能一致重现微观统计和宏观力平衡的力 formulation
3. **混合模型优势**: 伪势 (pseudopotential) + 自由能方法的混合 formulation 提供最一致的描述

---

## 技术方案

### 方法论

```
MD simulation → map to mesoscopic framework → compare with LBM
     ↓
analyze distribution function moments
     ↓
identify force formulations
```

### 关键发现

- 纯 pseudopotential LBM: 微观统计一致性较差
- 纯 free-energy LBM: 宏观力平衡难以满足
- **混合 formulation**: pseudopotential + free-energy → 两者兼顾

### 验证指标

| 指标 | 说明 |
|------|------|
| 分布函数矩 | 速度、动量、能量 |
| 宏观力平衡 | Navier-Stokes 一致性 |
| 界面张力 | 多相流动关键参数 |

---

## 对 LBM 的意义

1. **非理想流体**（液液相变、润湿、多相流）的 LBM 模型选择有了 MD 基准
2. **多相流模拟**: 混合模型可更准确地处理界面动力学
3. **LBM 参数标定**: MD 数据可作为 LBM 参数物理约束

---

## 推荐结论

✅ **推荐实现 — 中优先级**

**理由**:
- 为 LBM 多相流模型提供分子级验证依据
- 混合 formulation 是未来 LBM 非理想流体建模的推荐方向
- 与 SPH、连续介质方法互补

**适用场景**: 液滴碰撞、界面流动、毛细作用、多孔介质渗流

---

## 相关工作

- [[2026-06-23-Conservative-DG-LTS-Low-Mach-Flows|DG LTS Low-Mach]] (另一类CFD方法)
- [[2026-06-23-Elastic-Turbulence-Viscoelastic-Porous|Elastic Turbulence]] (多相流/复杂流体)
