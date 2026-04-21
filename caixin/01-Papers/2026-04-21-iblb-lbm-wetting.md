# On the Hydrodynamic Behaviour of the Immersed Boundary -- Lattice Boltzmann Method for Wetting Problems

- **arXiv**: [2604.17463](https://arxiv.org/abs/2604.17463)
- **作者**: Elisa Bellantoni, Fabio Guglietta, Andreas Demou, Francesca Pelusi, Kiwon Um, Mihalis Nicolaou, Mathieu Desbrun, Mauro Sbragaglia, Nikos Savva
- **分类**: physics.flu-dyn, physics.comp-ph
- **发表**: 2026-04-20 (v1)
- **链接**: [PDF](https://arxiv.org/pdf/2604.17463)

---

## 研究背景

IBLB (Immersed Boundary - Lattice Boltzmann) 方法用于湿润动力学模拟，包含润湿势 (wetting potential) 捕捉非理想液滴界面与固体边界的相互作用。

### 模型特点
- **润湿势**: 防止接触线附近曲率的突变
- **薄液膜形成**: 液滴与固体不直接接触，在接触线下方形成薄 film

---

## 验证策略

与两种水动力学求解器对比：
1. **边界元法 (BEM)**: 解析解，适合低 Re 液滴变形
2. **体积分数法 (VOF)**: 界面追踪标准方法

### 研究目标
- 检查 IBLB 水动力学行为
- 阐明湿润应用中的有效性极限
- 探索接触线模型的特性

---

## 关键发现

### 潜在问题
- 薄液膜形成可能**损害该区域的水动力学一致性**
- VOF 和 BEM 对比显示定量差异

### 接触线模型
- IBLB 接触线模型的行为需要细致评估
- 润湿势的引入带来额外的建模复杂度

---

## 核心结论

- IBLB 方法在湿润动力学建模中有创新性
- 但薄液膜区域的水动力学一致性存疑
- 需要进一步验证和基准测试

---

## 可行性分析

🥢 **可行性分析：IBLB 方法湿润模拟**

## 控制方程
- LBM: $f_i(\mathbf{x} + \mathbf{c}_i \Delta t, t + \Delta t) = f_i(\mathbf{x}, t) + \Omega_i$
- IB: $\mathbf{F} = \int \mathbf{f}(\mathbf{s}) \delta(\mathbf{x} - \mathbf{X}(\mathbf{s})) d\mathbf{s}$
- 润湿势: $V_w(\phi)$

## 数值方法
- 离散化: D3Q19 或 D2Q9 格子
- IB 插值: 规则/散乱点
- 稳定性: Ma < 0.3, Kn 相关

## 计算成本
- 中等 (相比 DNS)
- 适合多相流界面问题

## 推荐结论
⚠️ 谨慎 — 需进一步验证薄液膜区水动力学一致性

*标签*: #LBM #immersed-boundary #wetting #multiphase-flow #contact-line #CFD