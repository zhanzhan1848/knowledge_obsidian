---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 四边形网格, 四主导网格, 网格化简, ILP, 整数规划, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3799902.3811043
---

# Global Discrete Optimization for Quad-Dominant Mesh Reduction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Global Discrete Optimization for Quad-Dominant Mesh Reduction |
| **作者** | Yuzhe Luo (浙大 CAD&CG 国家重点实验室 / LIGHTSPEED), Jingchen Gao (杭电), Zherong Pan (Meta), Kui Wu (LIGHTSPEED), Xuebo Ji (港大), Xiaogang Jin (浙大), Xifeng Gao (LIGHTSPEED) |
| **发表** | SIGGRAPH 2026 Conference Papers, pp. 1-11 |
| **链接** | [ACM DL](https://doi.org/10.1145/3799902.3811043) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_180&sess=sess185) |
| **DOI** | 10.1145/3799902.3811043 |
| **会话** | Thursday, 23 July 2026 9:20am PDT, Room 403 B · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 把四主导网格（quad-dominant mesh）化简的**边选择**建模为**整数线性规划（ILP）**，配合**部分 poly-chord 分割**与**曲率感知约束**，比现有贪心方法更好地保持边流（edge flows）的干净性与四边形拓扑。

1. **全局优化框架**：摒弃贪心式局部决策，用**全局 ILP** 统一决定哪些边被保留/删除
2. **部分 poly-chord 分割**（partial poly-chord segmentation）：显式处理四边形网格中非平面四边形的分解问题
3. **曲率感知约束**：把几何特征（曲率）作为约束纳入 ILP，避免化简丢失关键特征
4. **面向生产管线**：目标是**游戏与动画制作**中实际使用的四主导网格

---

## 技术方案

### 核心思想

$$\text{化简} = \text{选择保留的边集合 } E' \subseteq E$$

经典贪心法逐边独立决策 → 局部最优、全局不协调。本文的 ILP 形式化：

```
minimize   Σ_{e ∈ E'}  cost(e)          // 化简代价（面数减少 / 误差）
subject to 曲率约束（关键区域边必保留）
           quad 拓扑约束（保持四边形主导比例）
           poly-chord 分割约束（非平面四边形合法分解）
           E' ⊆ E  （整数变量 = 0/1）
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **整数线性规划（ILP）** | 边选择的全局 0-1 优化，避免贪心的局部性 |
| **部分 poly-chord 分割** | 四边形网格化简必须处理非平面四边形的三角化/拆分 —— 这是四主导网格特有的难点 |
| **曲率感知约束** | 用曲率识别几何特征边，约束其保留 |
| **边流（edge flow）保持** | 目标是保持网格线方向的连贯性 —— 四主导网格质量的核心指标 |

---

## 算法复杂度

- **时间复杂度**：ILP 求解（NP-hard），实际依赖现代 MILP 求解器（分支定界）；化简本身 $O(E)$
- **空间复杂度**：约束矩阵规模 $O(|E| + |F|)$，ILP 变量数 $= |E|$
- ⚠️ **注意**：全局优化的时间随网格规模增长较快，可能需要**层级/多分辨率策略**

---

## 实现难度

- **算法复杂度**：**中高** — ILP 建模本身不难，难在约束设计使得解可行且不超时
- **数值稳定性**：**高** — ILP 是离散问题，无数值漂移问题
- **依赖项**：MILP 求解器（Gurobi / CBC / HiGHS / OR-Tools）；四主导网格表示（可直接用 libigl 的 `Eigen::MatrixXi` quad 边表）
- **落地场景**：游戏资产化简管线、动画绑定前的减面

---

## 实验结论

- 相比现有**贪心方法**，更好地保持了**干净的边流**与**四边形拓扑**
- 定位于游戏 / 动画生产环境

---

## 局限性

- ILP 的规模限制：大网格上可能不可扩展，需要配合贪心 warm-start 或分块策略
- 曲率约束的阈值选取依赖场景

---

## 可行性评估

⚠️ **谨慎评估（工程价值高但有规模瓶颈）**

### 推荐理由
1. **直接对应生产需求**：游戏/动画的四主导网格化简是明确的痛点
2. **全局优化思想正确**：比贪心更可靠，是本轮"全局 vs 贪心"主题的代表
3. **可直接接 libigl**：四边形网格在 libigl 中有原生支持

### 实现建议
- **优先级**：**中**
- **实现路径**：先用 libigl 加载 quad mesh → 构造 ILP（HiGHS 开源求解器，避免 Gurobi 商业许可）→ 在 10k~50k 边规模上测可解性
- **备选方案**：若 ILP 不可扩展，考虑**多分辨率 ILP**（先在粗网格上解，再细化为 warm-start 逐层细化）
- **与主线呼应**：可参考本库 [[2026-11-05-SIGGRAPH2026-Persistence-guided-Topological-Simplification]] —— 后者用持久同调引导拓扑简化，二者可以组合（ILP 保边流 + 持久同调保拓扑特征）

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Persistence-guided-Topological-Simplification]] — **互补**：后者保拓扑特征数，本文保边流
- [[2026-11-05-SIGGRAPH2026-Quad-Dominant-Mesh-Reduction-ILP]] — 同族方法
- [[2026-11-05-SIGGRAPH2026-Proxy-Point-Normal-Orientation-MegaNorm]] — 同 session 相邻
- [[Quad Meshing]]
- [[Mesh Simplification]]
- [[libigl]]

---

**推荐度**：⭐⭐⭐
