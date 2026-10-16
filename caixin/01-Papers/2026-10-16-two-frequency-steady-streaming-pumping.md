---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, steady-streaming, asymptotic-analysis, microfluidic, low-Re]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2610.20784
arXiv: 2610.20784
---

# Pumping by Two-frequency Steady Streaming: Impact of Amplitude Ratio and Phase

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Pumping by Two-frequency Steady Streaming: Impact of Amplitude Ratio and Phase |
| **作者** | Hyun S. Lee, Becca Thomases, William D. Ristenpart, Robert D. Guy |
| **发表** | arXiv (physics.flu-dyn), 2026-10-15 |
| **链接** | [arXiv:2610.20784](https://arxiv.org/abs/2610.20784) |
| **DOI** | 10.48550/arXiv.2610.20784 |
| **代码** | — |
| **关联** | 续作：Lee et al., J. Fluid Mech. 1038, A34 (2026) |

---

## 核心贡献

> 给出双频振荡圆柱驱动稳态流（steady streaming）净力的解析公式，关联振幅比 β、相位差 φ 与 Reynolds 数 Re，并证明环形域的净力可作为开放通道泵送流量的有效代理量。

1. 把环形域的双频渐近展开化简为一系列一维 BVP 高效求解
2. 推导出净力的闭式表达式（频率比 2 情形）
3. 在矩形通道中作直接数值验证：净通量 ∝ 环形域净力
4. 为 microfluidic lab-on-a-chip 提供双频流体泵的设计规则

---

## 技术方案

### 核心思想

对环形域（环形）中以两频率振荡的圆柱问题作小振幅渐近展开，将非局部三维算子降维为沿一维坐标的系列边界值问题（BVP），数值高效求解。频率比 2 情形给出净力的简洁闭式解；通道数值仿真验证该净力可作为开放系统净泵送流量的代理。

### 关键技术

| 技术 | 说明 |
|------|------|
| **小振幅渐近展开** | 三阶及以上的稳态流生成 |
| **维数降阶** | 环形域 → 1D BVP 系列 |
| **双频振动** | 振幅比 β、相位差 φ |
| **DNS 验证** | 矩形通道双频振荡圆柱直接数值 |

---

## 公式

频率比 2 时净力：
```math
F_{\text{net}} \propto \cos\!\bigl(\phi - \phi^*(\text{Re})\bigr)\,\dfrac{\beta}{(1+\beta^2)^{3/2}}
```

其中：
- β：振幅比
- φ：相位差
- Re：Reynolds 数
- φ*(Re)：产生最大力的最优相位（Reynolds 依赖）

---

## 实验结论

- **数据集**: 数值实验（环形 BVP + 矩形通道 DNS）
- **基线**: 单频振荡产生的对称四极型稳态流
- **结果**:
  - 净力大小在 β/(1+β²)^{3/2} 处被解析表达
  - 矩形通道净通量与环形净力全程线性相关
  - 双频振动可作为高效定向流体泵机制

---

## 局限性

- 频率比仅考虑 2，其它比率需进一步分析
- 小振幅假设，实际 microfluidic 振幅可能跨多尺度
- 环形域模型对开放系统几何近似的局限

---

## 相关工作

- Lee et al., J. Fluid Mech. 1038, A34 (2026)（作者前期工作）
- 经典稳态流理论：Riley (1966, 2001) 系列

---

## 实现建议

- **实现难度**: ✅ 低-中（解析闭式解 + BVP 数值求解）
- **预期性能**: 直接给出 microfluidic 泵的相位/振幅调参规则
- **适用场景**: Lab-on-a-chip 流体泵、无活动部件微流控、声流体驱动、颗粒/液滴操纵
