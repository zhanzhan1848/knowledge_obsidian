---
type: paper
created: 2026-08-26
updated: 2026-08-26
tags: [soot, counterflow-diffusion-flame, pressure-effect, PAH, network-analysis, combustion, physics.flu-dyn]
status: new
agent: caixin
---

# Effects of Pressure on the Chemical Sooting Structure of Equi-Diffusive Counterflow Diffusion Flames

## 论文信息

| 字段 | 内容 |
|------|------|
| **arXiv** | [2608.24816](https://arxiv.org/abs/2608.24816) |
| **类别** | physics.flu-dyn, physics.chem-ph |
| **作者** | Rajat Sawanni, Ömer L. Gülder |
| **发表日期** | 2026-08-25 |
| **DOI** | 10.48550/arXiv.2608.24816 |
| **发表信息** | Proc. Combust. Inst. Vol. 42（已接收） |

## 核心贡献

综合实验和数值研究，探索压力（1-6 bar）对等扩散反流扩散火焰碳烟形成结构的影响。使用 OpenSMOKE++ 进行详细化学动力学模拟，结合网络分析工具研究碳路由路径的演化。

## 关键发现

### 压力效应
- ** soot 浓度**：随驻留时间和压力增加
- ** soot 生成速率**：仅受压力影响
- ** soot C/H 比**：随压力增加（数值低估氢萃取反应增加量）

### 网络分析方法
- 碳路由路径（Carbon routing pathways）的组织与演化
- **渗流-like 组织**：soot 形成前，碳网络路径经历渗流式组织
- **乙炔（C₂H₂）**：高度影响力的节点，其影响随压力增加

### 化学机理
- 详细 C₁-C₁₆ 化学，含 PAH（多环芳烃）up to C₁₆₀
- 分段 soot 模型（Sectional soot model）
- C/H 比追踪

## 数值方法

- **OpenSMOKE++**：详细化学动力学求解器
- **机理**：C₁-C₁₆ + lumped PAH + sectional soot
- **网络分析**：图论方法研究碳转移

## 可行性分析

🥢 可行性分析：碳烟形成数值模拟

## 控制方程
- 耦合组分输运（N-S）+ 化学动力学 + soot 形成方程
- 反流火焰坐标系（stagnation point flow）

## 数值方法
- 离散化：有限差分 + 算子分裂
- 求解器：OpenSMOKE++（DASAC 变种）
- 稳定性：刚性 ODE 求解器

## 计算成本
- 化学机理大（数百个组分，上千反应）
- soot 模拟增加额外计算负担
- 参变量研究（多压力工况）

## 推荐结论
✅ 推荐实现（燃烧 soot 研究）
