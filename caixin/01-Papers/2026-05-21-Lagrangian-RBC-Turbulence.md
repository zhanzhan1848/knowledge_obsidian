---
type: paper
created: 2026-05-21
updated: 2026-05-24
tags: [turbulence, RBC, Lagrangian-analysis, DNS, Q-R-invariant, Rayleigh-Benard]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2605.22326v1
---

# Lagrangian single-particle, multi-particle and topological analyses in turbulent Rayleigh-Bénard convection

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Lagrangian single-particle, multi-particle and topological analyses in turbulent Rayleigh-Bénard convection |
| **作者** | Matti Ettel, Roshan J. Samuel, Michael Chertkov, Jörg Schumacher |
| **发表** | arXiv (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2605.22326v1) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> 通过三维直接数值模拟 (DNS) 在拉格朗日框架下研究湍流瑞利-贝纳德对流，发现极端间歇性拉格朗日热输运和新型涡旋拓扑特征。

1. **拉格朗日框架 DNS**: 首次在拉格朗日框架下对 $10^5 \leq Ra \leq 10^{10}$ 全范围进行三维 DNS
2. **极端间歇性**: 单个拉格朗日粒子可携带高达全局欧拉平均 500 倍的对流热通量
3. **$Q$-$R$ 拓扑分析**: 发现 $Q>0, R<0$ 象限中沙尘暴-like 对流涡旋的独特拓扑足迹
4. **Pair dispersion 标度**: 发现 $t^5$ 和 $t^3$ 两种标度机制，而非标准的 Richardson 标度

---

## 技术方案

### 核心思想

在拉格朗日参考系下研究瑞利-贝纳德湍流对流输运，通过粒子加速度、拉格朗日热输运、$Q$-$R$ 不变量、粒子对分散等方法综合分析。

### 模拟参数

| 参数 | 范围 |
|------|------|
| Rayleigh 数 $Ra$ | $10^5 \leq Ra \leq 10^{10}$ |
| Prandtl 数 $Pr$ | $0.7$ |
| 纵横比 $L:L:H$ | $4:4:1$ |

### 分析方法

| 方法 | 说明 |
|------|------|
| Particle Accelerations | 积分时间步计算粒子加速度 |
| Lagrangian Heat Transfer | 拉格朗日热输运分析 |
| $Q$-$R$ Invariant Topology | 速度梯度不变量拓扑分析 |
| Lagrangian Pair Dispersion | 粒子对分散分析 |
| Scale-dependent Eddy Viscosity | 尺度相关涡粘性 |
| PCA of Dense Particle Clouds | 稠密粒子云主成分分析 |

### 关键发现

1. **Heisenberg-Yaglom 行为的恢复**: 粒子加速度统计与间歇性修正一致
2. **极端热输运间歇性**: 单粒子可携带高达 500× 平均热通量
3. **涡旋拓扑足迹**: $Q>0, R<0$ 区域对应涡拉伸、羽流分离和强局部热输运
4. **分散标度**: 羽流驱动快速喷射产生 $t^5$ 标度，随后是持续的 Richardson-like $t^3$ 标度

---

## 相关工作

- [[turbulence-convection]]
- [[Lagrangian-turbulence]]
- [[DNS-RBC]]

---

## 实现建议

- **实现难度**: 高 (需要谱元法 DNS 和拉格朗日追踪)
- **预期性能**: 大规模并行计算资源
- **适用场景**: 热对流研究、湍流燃烧、大气边界层

---

## 备注

- 33 页，11 图，3 表
- 可为湍流对流建模提供拉格朗日视角诊断工具