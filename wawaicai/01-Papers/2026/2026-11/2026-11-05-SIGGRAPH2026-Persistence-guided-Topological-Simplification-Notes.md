---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 归一化, 曼哈顿空间, 局部连接, 持久同调, 拓扑特征, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_1427&sess=sess129
---

# Persistence-guided Prescribed Topological Simplification（补充视角：持久同调角色）

> 本文是 [[2026-11-05-SIGGRAPH2026-Persistence-guided-Topological-Simplification]] 的主笔记。此处补充**持久同调在其中的具体角色**与**TopoMinCut 流水线的工程细节**，便于快速检索。

## 持久同调的角色

**持久同调（persistent homology）** 在此不是可选的分析工具，而是**决策机制本身**：

```
标量场 f 上的 filtration（过滤）：
   f 的水平集随阈值 t 变化 ⟹ 特征（component / handle / cavity）在 t 处诞生(birth)、
   在 t' 处死亡(death)
        ↓
   持久性 persistence = death - birth
        ↓
   长持久对 = 显著特征；短持久对 = 噪声/微小特征
        ↓
   用户说"保留 2 个手柄"⟹ 取持久性最长的 2 个对
```

**关键性质**：持久性排序给出了**拓扑特征的天然重要性排序**，这使得"保留指定数量的某类特征"变成**可解的组合选择问题**，而非连续优化。

## TopoMinCut 流水线

参考代码 `TopoMinCut/` 目录（以进程内链接方式集成，非 spawn 外部进程）：

| 组件 | 说明 |
|------|------|
| **PHAT**（vendored 于 `TopoMinCut/phat`） | 计算标量场的边界矩阵（persistent homology 核心） |
| **Eigen**（vendored 于 `TopoMinCut/dependencies`） | 边界矩阵与 alphas 以 Eigen 结构在进程内传递 |
| **Boost.Graph**（外部依赖） | min-cut 所需的图结构 |

**两种输入模式**：

| 模式 | 输入 | 场景 |
|------|------|------|
| `cubical` | MRC 体数据（标量场） | 规则体素网格 |
| `tet` | Gmsh `.msh` + per-vertex alpha 文件 | 非结构四面体网格 |

**命令行**：
```
PrescribedTopologicalSimplification cubical <input.mrc> <adjustment> [options]
PrescribedTopologicalSimplification tet <input.msh> <adjustment> [options]
```
关键选项：`--cavitySkip` / `--handleSkip` / `--componentSkip`（跳过各类特征的前 K 个，**即按持久性从高到低跳过**）。

## 平台说明

- 开发与测试：**Windows 与 macOS**
- **Linux 未充分测试**（原则上可用，可能需小幅语法/路径调整）

## 与本库其他论文的组合

- **几何侧**：[[2026-11-05-SIGGRAPH2026-Global-Discrete-Optimization-Quad-Dominant-Mesh-Reduction]]（ILP 保边流）
- **推荐串联顺序**：先做几何化简（ILP）⟹ 再做拓扑简化（本文，保特征计数）
