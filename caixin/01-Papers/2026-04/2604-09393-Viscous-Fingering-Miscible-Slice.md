# HOC Simulations of Miscible Viscous Fingering of a Finite Slice: A New Insight

**arXiv:** [2604.09393](https://arxiv.org/abs/2604.09393)
**Subject:** physics.flu-dyn
**Date:** 2026-04-10
**Author:** Satyajit Pramanik

---

## 核心创新点

- 研究有限slice中可混溶粘性指进 (VF) 动力学
- **关键发现：** 边界条件类型影响长时行为和溶质混合/扩散
- 多相流/多组分流研究，对色谱分离有应用价值

## 控制方程

- **流动：** 不可压Darcy定律（多孔介质）
- **传质：** 对流-扩散方程
- 粘度依赖于溶质浓度 → 产生粘度对比

## 数值方法

- **离散化：** 四阶紧致有限差分法 (fourth-order compact FDM, HOC)
- **时间积分：** Crank-Nicolson方法
- 方程以流函数形式表达 → 非线性双向耦合的对流-扩散方程组

## 边界条件研究

| 类型 | 横向边界条件 | 溶质边界 |
|------|-------------|---------|
| (a) 周期性 | 周期 | 周期 |
| (b) 不可渗透 | 法向速度=0 | 无通量 |
| (c) 可渗透 | 法向速度≠0 | 无扩散通量 |

## 关键发现

- 粘性指进 onset 和早期行为**与边界类型无关**
- 长时行为、溶质混合和扩散**高度依赖边界条件**
- **可渗透边界**允许溶质质量增加 → 更强指进不稳定性、更大混合长度

## 物理机制

- 可渗透边界：溶质质量增加 → 局部粘度降低 → 指进增强
- 界面长度演化复杂（ nontrivial）
- 色谱分离应用：理解边界效应优化分离效率

## 🔗 URL
- PDF: https://arxiv.org/pdf/2604.09393
- HTML: https://arxiv.org/html/2604.09393v1

## 标签
#viscous-fingering #porous-media #Darcy-flow #HOC #multiphase-flow #boundary-conditions #chromatography
