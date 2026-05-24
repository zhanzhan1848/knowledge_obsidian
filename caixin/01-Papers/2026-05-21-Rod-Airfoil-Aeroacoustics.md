---
type: paper
created: 2026-05-21
updated: 2026-05-24
tags: [aeroacoustics, vortex-sound, PIV, rod-airfoil, landing-gear-noise]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2605.22546v1
---

# Perpendicular rod-airfoil aeroacoustics: experiments and modelling of interaction noise

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Perpendicular rod-airfoil aeroacoustics: experiments and modelling of interaction noise |
| **作者** | Marios I. Spiropoulos, Filipe R. Amaral, Florent Margnat, Vincent Valeau, Peter Jordan |
| **发表** | arXiv (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2605.22546v1) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 研究正交杆-翼型气动声学问题，通过同步声学和立体时间分辨PIV测量揭示三维圆柱-尾流与翼型相互作用的声振问题。

1. **简化模型**: 用垂直圆柱+NACA-0012翼型模拟起落架-襟翼相互作用
2. **同步测量**: 声学 + 立体 TR-PIV 同步测量
3. **三维特性**: 实验数据揭示问题的本质三维特性
4. **声振频率**: 最大声压级在 $St \equiv fd/U = 0.38$ (圆柱阻力波动频率)
5. **Powell-Howe 涡声理论**: 结合 NACA-0012 声学紧致 Green 函数进行气动声学建模

---

## 技术方案

### 实验配置

- 圆柱位于翼型上游，轴线正交
- 同时采集声场和三维速度场

### 声源建模

| 方法 | 说明 |
|------|------|
| Powell-Howe vortex-sound theory | 涡声理论 |
| NACA-0012 acoustically compact Green function | 翼型声学紧致 Green 函数 |
| Linearised source-term | 线性化源项 |
| Fourier modes in cylinder span direction | 圆柱跨度方向傅里叶模态 |

### 关键发现

1. 最大声压级在 $St = 0.38$ 附近
2. 声学与圆柱跨度方向脉动速度的线性相干性最大
3. 三维圆柱-尾流是测量声场的来源

---

## 相关工作

- [[aeroacoustics]]
- [[vortex-sound]]
- [[PIV-measurement]]

---

## 实现建议

- **实现难度**: N/A (实验+理论)
- **适用场景**: 飞机起落架噪声、风机噪声、气动声学建模

---

## 备注

- 与飞机着陆阶段噪声控制相关