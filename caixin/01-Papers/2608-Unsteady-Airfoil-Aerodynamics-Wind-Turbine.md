---
type: paper
created: 2026-08-31
updated: 2026-08-31
tags: [aerodynamics, unsteady-airfoil, wind-turbine, BEM, lifting-line, actuator-line]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2608.28280
---

# Unsteady airfoil aerodynamics in attached flow: From unsteady thin airfoil theory to wind turbine application

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Unsteady airfoil aerodynamics in attached flow: From unsteady thin airfoil theory to wind turbine application |
| **作者** | Ang Li, Mac Gaunaa, Georg Raimund Pirrung |
| **发表** | arXiv 2026-08-28 |
| **链接** | [原文](https://arxiv.org/abs/2608.28280) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.28280 |

---

## 核心贡献

> 建立了附着流条件下非稳态气动力的完整工程模型，将经典非稳态薄翼理论系统化，实现为 BEM /  lifting-line / actuator-line 方法的可一致使用的气动力系数。

1. **完整非稳态气动力模型**：环量 + 非环量载荷，下洗速度为气动状态变量
2. **BEM/LL/AL 统一实现路径**：统一的 lift, drag, moment 系数形式
3. ** shed-wake memory 公式化**：以下洗速度而非攻角表征尾流记忆效应
4. **缺失项量化**：三维 rotor 级别验证，量化各贡献的影响

---

## 技术方案

### 核心思想

附着流条件（无分离）下，风机叶片的非稳态气动载荷 = 环量载荷 + 非环量载荷（惯性项），通过系数形式与现有工程求解器兼容。

### 关键建模选择

| 贡献 | 说明 |
|------|------|
| 环量载荷 (Circulatory) | 与历史下洗相关的尾流记忆效应 |
| 非环量载荷 (Non-circulatory) | 翼型加速度惯性项 |
| 展向投影 | 升力方向投影对功率影响最大 |
| 中弦挥舞加速项 | 消除非环量法向力（精确平衡条件） |

### 三维 rotor 验证

| 算例 | 目的 |
|------|------|
| Coned straight-blade | 方法交叉验证 + 缺失项误差量化 |
| VAWT zero-onset-flow | 理论极限验证（全贡献和 = 0） |

---

## 关键发现

- **升力方向投影**：对功率影响最大
- **中弦挥舞加速项**：遗漏 → 非环量法向力不完全消除 → 推力误差
- **尾流记忆**：以下洗速度而非攻角为气动状态变量更一致
- **VAWT 极限**：所有环量和非环量贡献完全对消 → 零扭矩（理论验证）

---

## 局限性

- 仅适用于附着流（无动态失速分离）
- 依赖 2D 翼型极曲线数据
- 非环量项的精确系数形式仍有建模选择空间

---

## 实现建议

- **实现难度**：中等（需理解非稳态翼型理论）
- **预期性能**：提升 BEM/AL 模拟精度，保留计算效率
- **适用场景**：风机设计、风机气动弹性、VAWT 和 HAWT 仿真

---

## 相关工作

- [[Blade Element Momentum]]
- [[Unsteady Thin Airfoil Theory]]
- [[Wind Turbine Aerodynamics]]
