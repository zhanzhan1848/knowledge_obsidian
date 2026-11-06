---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 拓扑简化, 持久同调, Persistent Homology, 网格简化, 连通分量, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811384
---

# Persistence-guided Prescribed Topological Simplification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Persistence-guided Prescribed Topological Simplification |
| **作者** | Linxuan Rong, Tao Ju (Washington University in St. Louis) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-16 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811384) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_1427&sess=sess129) |
| **DOI** | 10.1145/3811384 |
| **代码** | ✅ [github.com/peter-rong/Prescribed-topological-simplification](https://github.com/peter-rong/Prescribed-topological-simplification) |
| **会话** | Thursday, 23 July 2026 4:25pm PDT, Room 403 B · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 与"要么删光所有拓扑特征、要么只能间接控制目标拓扑"的现有方法不同，本文**精确保持用户指定的各类拓扑特征数量**（连通分量、手柄、孔洞），同时**使几何变化最小**。

1. **精确保持（exactly preserving）**：目标拓扑由用户**逐类指定数量**（components / handles / voids），方法**精确命中**，而非近似
2. **持久同调（persistence）引导**：用持久同调的 filtration 决定**哪些拓扑特征该被保留、哪些该被删除** —— 按持久性排序，保留最"显著"的
3. **最小几何变化**：在满足拓扑约束的前提下最小化几何改变量
4. **TopoMinCut 求解器**：核心步骤是**最小割（min-cut）**
5. **两种模式**：支持**立方体网格（cubical）**与**四面体网格（tet）**两种输入

---

## 技术方案

### 核心思想

```
① Filtration（过滤）：对标量场做持久同调分析
        ↓
   产生持久对（birth, death）序列，按持久性排序
        ↓
② 按目标计数选择要保留的拓扑特征
        ↓
③ TopoMinCut：最小割步骤 —— 精确切断指定的特征
        ↓
④ 输出几何改变量最小的简化结果
```

关键洞察：**持久性（persistence）给出拓扑特征的天然优先级** —— 显著性高的特征自然落在持久对的长端，用户指定"保留 2 个手柄"时，保留的就是最持久的 2 个。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Persistent homology** | 标量场的 filtration，产生拓扑特征的持久对 |
| **Persistence ranking** | 按持久性对特征排序，实现"该留谁"的决策 |
| **TopoMinCut（min-cut）** | 精确切断指定拓扑特征的求解步骤 —— 本方法的核心算子 |
| **Boundary matrix** | PHAT 库计算的边界矩阵（库内已 vendor） |
| **Cubical / Tet 双模式** | 同一流水线支持规则体素网格与非结构四面体网格 |
| **Eigen 结构** | 边界矩阵与 alphas 以 Eigen 结构在进程内传递，不 spawn 外部进程 |

---

## 算法复杂度

- **时间复杂度**：filtration（持久同调）+ 最小割；标量场上的 PHAT 计算约 $O(n^2)$ worst case，实际用降维技巧
- **空间复杂度**：$O(n)$ 级别（PHAT 边界矩阵）
- **几何最小化**：在拓扑约束下的二次优化

---

## 实现难度

- **算法复杂度**：**中** — 持久同调理论门槛高，但有成熟库（PHAT）
- **数值稳定性**：**高** — 拓扑操作本质是离散/组合的
- **依赖项**：C++17、CMake ≥ 3.10、**Boost.Graph**、Eigen（已 vendor）、PHAT（已 vendor）
- **平台**：Windows / macOS 已测试；Linux 原则上可用但可能需小改
- ⚠️ **输入要求**：需要**标量场**（MRC 体数据，或 Gmsh .msh + per-vertex alpha 文件）

---

## 实验结论

- 精确命中用户指定的 (components, handles, voids) 计数
- 几何改变量最小
- 两种网格模式均验证

---

## 局限性

- 需要标量场作为输入 —— 纯几何网格需先定义标量（如 SDF 或距离场）
- "最小几何变化"与"精确保持拓扑"之间的权衡可能需要调参
- 持久同调在**高维/大规模**上的计算成本上升较快

---

## 可行性评估

✅ **推荐实现（代码已开源，可直接跑）**

### 推荐理由
1. **代码完整开源**，含 PHAT / Eigen vendoring，构建路径清晰
2. **问题定义干净**："精确保持拓扑计数 + 最小几何变化" 是一个非常可用的 API
3. **与本库既有工作互补**：可作为通用后处理步骤叠加在任何网格处理 pipeline 之后

### 实现建议
- **优先级**：**高**（有代码 + 通用性强 + 组合性好）
- **集成点**：任何生成 mesh 的流程末尾作为"拓扑清理"步骤
- **实施建议**：
  1. 输入准备：若有 mesh 先算 SDF 作为标量场
  2. 先跑 cubical 模式验证（最简单），再试 tet 模式
  3. CLI 参数：`--cavitySkip` / `--handleSkip` / `--componentSkip` 控制各类特征跳过数
- **组合策略**：与 [[2026-11-05-SIGGRAPH2026-Global-Discrete-Optimization-Quad-Dominant-Mesh-Reduction]] 串联 —— 先用 ILP 保边流做几何化简，再用本文保拓扑特征

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Global-Discrete-Optimization-Quad-Dominant-Mesh-Reduction]] — **互补**：几何化简（ILP 保边流）
- [[2026-11-05-SIGGRAPH2026-Surface-Reconstruction-Unoriented-Points-Greens-3rd-Identity]] — 同 session 相邻
- [[2026-11-05-SIGGRAPH2026-Explicit-Flows-Implicit-Surfaces]] — 同 session 相邻
- [[Topological Simplification]]
- [[Persistent Homology]]
- [[Reeb Graph]]

---

**推荐度**：⭐⭐⭐⭐☆
