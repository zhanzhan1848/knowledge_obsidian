---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, vortex-shedding, flat-plate, low-Re, CFD, 2D-simulation]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2610.21564
arXiv: 2610.21564
---

# Effect of leading edge geometry on aerodynamic performance of a flat plate

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Effect of leading edge geometry on aerodynamic performance of a flat plate |
| **作者** | Intesaaf Ashraf, Hamid Hassan Khan, Majid Hassan Khan |
| **发表** | arXiv (physics.flu-dyn), 2026-10-15 |
| **链接** | [arXiv:2610.21564](https://arxiv.org/abs/2610.21564) |
| **DOI** | 10.48550/arXiv.2610.21564 |
| **代码** | — |

---

## 核心贡献

> 低 Re (Re=1000) 下平板前缘半球曲率突出影响涡脱落起始、脱落频率与气动力的系统研究，为低 Re 微型飞行/航行器几何选择提供设计依据。

1. 在 Re=1000 下二维 CFD 比较带前缘曲率 vs 简单平板
2. 系统扫描 0°–25° 攻角下的涡脱落起始和脱落频率
3. 量化前缘曲率对升/阻力系数时间响应（多频）的影响
4. 给出"几何-攻角-滑翔比"快速参考以辅助低 Re 飞行器设计

---

## 技术方案

### 核心思想

二维数值模拟，考虑两种平板几何（简单平板与前缘半球曲率），在 Re=1000 下跨 0°–25° 攻角扫描。重点观察涡脱落阈值、脱落频率、瞬态气动力系数，对比几何诱导的差异。

### 关键技术

| 技术 | 说明 |
|------|------|
| **2D 非定常 Navier-Stokes** | 平板低 Re 流动分离模拟 |
| **前缘几何参数化** | 简单平板 vs 半球曲率 |
| **攻角扫描** | α ∈ [0°, 25°] |
| **瞬态气动力系数** | Cl(t)、Cd(t) 多频特征分析 |

---

## 公式

```math
\mathrm{Re} = 1000
```

```math
\alpha \in [0^\circ,\,25^\circ]
```

无量纲数
```math
\mathrm{Re} = \frac{\rho\,U\,c}{\mu}
```

---

## 实验结论

- **数据集**: 自有数值仿真，无外部实验数据集
- **基线**: 简单平板几何
- **结果**:
  - 前缘曲率 → 涡量区更厚
  - 带曲率平板在 α=5° 即开始脱落；简单平板延迟
  - 高攻角时气动力系数出现多频分量
  - 简单平板在中攻角 (5°,10°,15°) 滑翔比更好；α=0° 时带曲率板为 1

---

## 局限性

- 纯 2D 仿真，未捕捉展向三维效应
- 单 Re=1000，未扫描雷诺数敏感性
- 简化几何（仅半球曲率），工程实际前缘形状更复杂

---

## 相关工作

- [[2026-10-16-phononic-subsurface-vortex-shedding-fsi]]
- [[2026-10-16-hurricane-laura-wind-turbine-les-aeroelastic]]

---

## 实现建议

- **实现难度**: ✅ 低（标准 2D Navier-Stokes 模拟，OpenFOAM/IBAMR 即可）
- **预期性能**: 可快速验证低 Re 微飞行器（MAV/水下航行器）前缘几何选择的定性结论
- **适用场景**: 低 Re 微飞行器/水下航行器前缘几何设计、钝体非定常气动力教学案例
