---
type: paper
created: 2026-08-31
updated: 2026-08-31
tags: [droplet, lubrication, scaling-law, inclination-angle, Landau-Levich]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2608.28203
---

# Inclination-Induced Crossover in the Velocity Scaling of Lubrication-Mediated Droplet Motion

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inclination-Induced Crossover in the Velocity Scaling of Lubrication-Mediated Droplet Motion |
| **作者** | Haruka Hitomi, Ko Okumura |
| **发表** | arXiv 2026-08-28 / 8 pages, 4 figures |
| **链接** | [原文](https://arxiv.org/abs/2608.28203) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.28203 |
| **Subjects** | physics.flu-dyn, cond-mat.soft |

---

## 核心贡献

> 实验发现润滑介导的液滴滑移运动中，速度-尺寸标度律指数随倾角连续变化（从 3/2 到 9/4），揭示了倾角作为关键控制参数的润滑耗散机制转变。

1. **倾角诱导标度跨越**：小倾角 → v ∝ R^(3/2)；大倾角 → v ∝ R^(9/4)
2. **准球→薄煎饼标度**：Landau-Levich-Derjaguin 液膜 + 动态弯月面耗散
3. **形态-动力学解耦**：标度变化早于宏观形状演化
4. **倾角作为控制参数**：倾角决定主导润滑耗散机制

---

## 技术方案

### 实验体系

| 参数 | 说明 |
|------|------|
| 液滴 | 水滴在倾斜面（浸于粘性油） |
| 倾角范围 | 小倾角 → 大倾角 |
| 测量量 | 速度 v, 宽度, 高度 |
| 液滴半径 | 广范围 R |

### 理论模型

| 机制 | 速度标度 |
|------|------|
| 准球状 (Quasi-spherical) | v ∝ R^(3/2) |
| 薄煎饼 (Pancake) | v ∝ R^(9/4) |

---

## 核心发现

1. **连续标度跨越**：倾角增大 → 指数从 3/2 连续过渡到 9/4
2. **标度演变先于形态**：速度标度变化显著早于宏观形状的"煎饼化"
3. **润滑耗散机制**：弯月面下方局部润滑层主导耗散，非整体形状
4. **实测 vs 简单模型**：宏观尺寸与煎饼极限差距大时，速度标度已趋近煎饼律

---

## 局限性

- 实验仅覆盖黏性油环境（低雷诺数蠕动流）
- 倾角大时动态弯月面测量困难

---

## 实现建议

- **实现难度**：实验（无需计算）
- **预期应用**：涂层流、微流控、表面浸润工程
- **适用场景**：液滴传输、润滑系统、自清洁表面

---

## 相关工作

- [[Lubrication Theory]]
- [[Landau-Levich-Derjaguin]]
- [[Droplet Spreading]]
