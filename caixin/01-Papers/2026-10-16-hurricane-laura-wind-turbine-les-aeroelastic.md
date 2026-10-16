---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, LES, turbulence, wind-energy, aeroelastic, hurricane]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2610.21694
arXiv: 2610.21694
---

# Hurricane Laura-induced loads on wind turbines -- Part I: High-fidelity modeling and sensitivity to turbulent inflow conditions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hurricane Laura-induced loads on wind turbines -- Part I: High-fidelity modeling and sensitivity to turbulent inflow conditions |
| **作者** | Miguel Sanchez-Gomez, Lucas Carmo, Matthew Churchfield, Jason Jonkman, Walter Musial |
| **发表** | arXiv (physics.flu-dyn, physics.ao-ph), submitted to J. Wind Eng. Ind. Aerodyn., 2026-10-15 |
| **链接** | [arXiv:2610.21694](https://arxiv.org/abs/2610.21694) |
| **DOI** | 10.48550/arXiv.2610.21694 (DataCite pending) |
| **代码** | — |

---

## 核心贡献

> 提出一种 LES → aeroelastic 耦合框架用于飓风环境下风机载荷评估，定量揭示了入口湍流分辨率对气动弹性响应的决定性影响。

1. 在 10–55 m 三种网格分辨率上对飓风 Laura (2020) 进行大涡模拟（LES）
2. 将 LES 输出作为气动弹性模拟的入口条件驱动风机响应
3. 揭示网格分辨率对平均风场与湍流结构的显著差异
4. 强调高分辨率入口数据对极端风载荷预测的必要性

---

## 技术方案

### 核心思想

两阶段耦合：阶段 1 使用 LES 给出非平稳湍流入口边界条件；阶段 2 将 LES 数据作为虚拟风机位置的入口驱动气动弹性求解。系统比较三种网格分辨率下平均流场、湍流结构与气动弹性响应的差异，量化网格对极端载荷预测的影响。

### 关键技术

| 技术 | 说明 |
|------|------|
| **大涡模拟 (LES)** | 模拟热带气旋尺度边界层极端风场 |
| **网格分辨率敏感性** | Δx = 55.55 m (粗) / 25 m (中) / 10 m (细) |
| **气动弹性耦合** | LES 输出 → aeroelastic 求解器 (OpenFAST 类) |
| **极端风载荷分析** | 评估怠速 (idling) 风机的动态响应 |

---

## 公式

```math
D_{v50}/d_0 \sim We^{-0.31}\,(L/d_0)^{-0.21} \quad\text{(联合拟合, 喷雾)}
```
（参考另一论文，飓风论文未涉及此具体标度律）

```math
\Delta x \in \{55.55\,\text{m},\,25\,\text{m},\,10\,\text{m}\}
```

---

## 实验结论

- **数据集**: Hurricane Laura (2020) 重建 LES 流场 + 虚拟风机位置气动弹性响应
- **基线**: 三种网格分辨率相互对比
- **结果**:
  - 网格越细，平均风与湍流结构差异越显著
  - 不同 Δx 直接导致气动弹性行为显著不同
  - 论证了极端风环境需要高分辨率入口数据

---

## 局限性

- 仅仿真怠速风机，未覆盖运行状态
- 仅 Part I，关注风机单点位置响应（Part II 将对比不同位置）
- 单一飓风事件，气候普适性有限

---

## 相关工作

- [[2026-10-16-phononic-subsurface-vortex-shedding-fsi]]
- [[2026-10-16-leading-edge-flat-plate-aerodynamics]]

---

## 实现建议

- **实现难度**: ⚠️ 高（需要 LES + aeroelastic 全栈，且飓风尺度计算开销极大）
- **预期性能**: 网格敏感性结论可直接迁移到风机抗台风设计规范
- **适用场景**: 风电行业抗台风设计标准、IEC 61400-1 极端风工况评估、台风/飓风区风电场选址
