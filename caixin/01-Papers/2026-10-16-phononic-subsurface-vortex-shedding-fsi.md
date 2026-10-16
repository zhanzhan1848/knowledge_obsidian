---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, FSI, vortex-shedding, immersed-boundary, bluff-body, flow-control]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2610.22044
arXiv: 2610.22044
---

# Interaction of Sustained Vortex Shedding with a Phononic Subsurface: Effect of Positioning and Resonant Characteristics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Interaction of Sustained Vortex Shedding with a Phononic Subsurface: Effect of Positioning and Resonant Characteristics |
| **作者** | Sangwon Park, Vinod Ramakrishnan, Arturo Machado Burgos, Andres Goza, Kathryn H. Matlack |
| **发表** | arXiv (physics.flu-dyn), 2026-10-15 |
| **链接** | [arXiv:2610.22044](https://arxiv.org/abs/2610.22044) |
| **DOI** | 10.48550/arXiv.2610.22044 |
| **代码** | — |

---

## 核心贡献

> 首次研究声子材料 (PM) 地下结构与钝体稳态涡脱落的强耦合非线性 FSI，证明 PM 的弦向位置可作为流动被动控制的"可调旋钮"。

1. 提出接地双原子链模型作为 PM 地下结构 (PSub) 的高保真表示
2. 联合扫描弦向位置与共振位移增长率两个控制参数
3. 揭示了 4 类不同的 FSI 极限环响应机制
4. 实现最优配置下升力振荡振幅减 30%+、阻力振荡减 50%+，且平均载荷变化 < 0.5%

---

## 技术方案

### 核心思想

使用浸没边界法 (IBM) 模拟平板全分离流的稳态涡脱落，将 PSub 建模为接地双原子链驱动平板上一段柔性区。固定雷诺数不变，沿流向改变 PSub 位置，并改变 PSub 共振位移增长率（前置工作中识别出的关键参数），系统绘制 FSI 极限环流型。

### 关键技术

| 技术 | 说明 |
|------|------|
| **高保真浸没边界法 (IBM)** | 流体求解器，处理柔性段与流体耦合 |
| **声子材料地下 (PSub) 模型** | 接地双原子链离散描述波动带隙/共振 |
| **PSub 离散化位置扫描** | 沿弦向 4 种响应机制分类 |
| **位移振幅包络** | 控制瞬态→极限环的响应路径 |

---

## 公式

```math
F_{\text{net}} \propto \cos(\phi - \phi^*(\text{Re}))\,\beta/(1+\beta^2)^{3/2} \quad\text{(参考相关两频振动论文)}
```

升力/阻力振荡衰减量：
- 升力振荡振幅 ↓ > 30%
- 阻力振荡振幅 ↓ > 50%
- 平均升/阻力变化 < 0.5%

---

## 实验结论

- **数据集**: 高保真 IBM 数值实验，无外部数据集
- **基线**: 无 PSub 的平板全分离流
- **结果**:
  - 弦向位置决定极限环 FSI 动力学，分为 4 个不同响应区（从大幅放大到强衰减）
  - 一组最优配置同时降低升/阻力振荡并基本保持均值
  - 位移包络主要调节瞬态收敛速度

---

## 局限性

- 单个钝体形状（平板），未推广至其他形状
- 雷诺数未明确扫描范围
- 二维仿真，3D 效应未捕捉

---

## 相关工作

- [[2026-10-16-hurricane-laura-wind-turbine-les-aeroelastic]]
- [[2026-10-16-leading-edge-flat-plate-aerodynamics]]
- 参考：同作者前期 latent vortex shedding + PSub 工作

---

## 实现建议

- **实现难度**: ⚠️ 中-高（需要可处理弹性体耦合的 IBM 求解器）
- **预期性能**: 最有价值的工程结论——钝体振动的被动控制策略
- **适用场景**: 钝体减振（建筑、桥梁、电线、航空机翼颤振抑制）、声子超材料流固耦合应用
