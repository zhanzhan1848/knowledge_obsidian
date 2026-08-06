---
type: paper
created: 2026-08-06
updated: 2026-08-06
tags: [pipe-flow, turbulence, laminar-turbulent-transition, puff, intermittency]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.04823
---

# Laminar Gaps Mirror Turbulent Puffs in Pipe Flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Laminar gaps mirror turbulent puffs in pipe flow |
| **作者** | Shai Kapon |
| **发表** | arXiv 2026-08-05 |
| **链接** | [原文](https://arxiv.org/abs/2608.04823) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.04823 |
| **代码** | - |

---

## 核心贡献

> 发现管流中介雷诺数区间湍流与层流共存的另一种形式：湍流中的层流间隙

1. 发现湍流背景中的层流间隙是独立动力学态，与 puff 形成对偶关系
2. 层流间隙由剪切依赖的自调节机制稳定
3. 间隙寿命呈指数分布，表明间隙关闭对应于混沌鞍点的逃逸
4. 层流间隙在 Re ~ 2900 处失稳消失，可解释为均匀湍流 onset 点

---

## 技术方案

### 研究方法

- **DNS 模拟**：Re = 2400, 2450, 2500, 2550 的圆管流动
- **分析工具**：统计剖面、寿命分析、稳定性分析

### 关键发现

| 参数 | 发现 |
|------|------|
| Re ∈ (1750, 2300) | 湍流以局部化 traveling puff 形式存在 |
| Re ∈ (2300, 3000) | 湍流中的层流间隙（laminar gap）|
| Re ~ 2900 | 层流间隙失稳消失，均匀湍流开始 |

### 物理机制

- 层流间隙：湍流背景中的局部层流区域
- 自调节机制：剪切依赖的稳定性机制
- 指数寿命分布：混沌鞍点逃逸特征

---

## 实验结论

- **湍流结构**：层流间隙与湍流 puff 形成对偶态
- **失稳机制**：有限雷诺数下的失稳导致均匀湍流
- **物理意义**：为理解管流转捩提供新视角

---

## 局限性

- 二维分析，三维效应未充分考虑
- 特定雷诺数区间，适用范围有限

---

## 实现建议

- **实现难度**: ★★★☆☆
- **预期性能**: 适合管流转捩研究
- **适用场景**: 管道流动、工业流动中的层流-湍流转捩
