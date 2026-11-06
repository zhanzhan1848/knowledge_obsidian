---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 常数平均曲率, CMC, 调和映射, Gauss映射, 离散微分几何, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811370
---

# Constant Mean Curvature Surfaces from Discrete Harmonic Maps

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Constant Mean Curvature Surfaces from Discrete Harmonic Maps |
| **作者** | Yousuf Soliman (Side Effects Software), Peter Schröder (Caltech), Ulrich Pinkall (TU Berlin) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-16 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811370) · [项目页](https://www.yousufsoliman.com/projects/constant-mean-curvature-from-discrete-harmonic-maps.html) |
| **DOI** | 10.1145/3811370 |

---

## 核心贡献

> 常数平均曲率（CMC）曲面的 Gauss 映射是调和的 —— 本文把这个经典观察直接离散化，只需**离散 Dirichlet 能量最小化 + 一次 Poisson 求解**，即可得到精确镜像光滑理论的离散 CMC 曲面。

1. **经典观察的离散化**：光滑理论中 CMC 曲面的 **Gauss 映射是调和映射**。本文把它变为可计算的离散构造。
2. **极简构造**：**只需要离散 Dirichlet 能量最小化 + 一次 Poisson 求解**，无迭代优化、无机器学习。
3. **离散共轭（discrete conjugation）**：给出**离散常数高斯曲率**曲面的对应构造。
4. **C⁰ 连续性保证**：CMC 曲面的 **unit offset** 是**离散 CMC 曲面**且带**共形参数化**（conformal parameterization）。
5. **新离散能量**：提出**球值映射（sphere-valued maps）在对偶网格上的 Möbius-不变 Dirichlet 能量离散化**，由**离散 Willmore 能量**导出；**比基于逆余切权重（inverse cotangent weights）的标准形式更鲁棒**。
6. **边界控制**：对边界切平面提供**直接控制**；天然处理闭曲面与周期（periodic）例子。

---

## 技术方案

### 核心思想

$$\text{CMC 曲面} \iff \text{Gauss 映射 } g \text{ 是调和映射}$$

于是 CMC 离散化可分解为：

```
① 构造球值调和映射 g（离散 Dirichlet 能量最小化）
        ↓
② 反解曲面位置（Poisson 求解）
        ↓
③ 得到离散 CMC 曲面
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **离散 Dirichlet 能量最小化** | 在对偶网格上做球值调和映射的变分求解 |
| **Poisson 求解** | 由调和映射恢复曲面几何位置（第二个变分步骤） |
| **离散共轭** | 给出离散常数**高斯**曲率曲面的平行构造 |
| **Möbius-不变 Dirichlet 能量** | 源自**离散 Willmore 能量**，避免逆余切权重在退化三角上的病态 |
| **C⁰ unit offset** | CMC 的单位偏移仍是离散 CMC 且保持共形参数化 |
| **Willmore 能量** | 球值映射的标准能量，提供鲁棒性保证 |

---

## 算法复杂度

- **时间复杂度**：两次变分求解（Dirichlet 能量最小化 + Poisson 求解），$O(N \log N)$（稀疏线性求解）
- **空间复杂度**：$O(N)$
- **无需迭代优化**：比基于优化的 CMC 构造（如变分曲面演化）更直接

---

## 实现难度

- **算法复杂度**：**中** — 数学概念精妙（调和映射 + Willmore 能量），但实现上是两个标准变分步骤
- **数值稳定性**：**高** — 新的 Möbius-不变能量形式专门针对逆余切权重的病态问题设计
- **依赖项**：稀疏线性求解器（Eigen / SuiteSparse / PETSc）；离散外微积分工具
- **对偶网格要求**：需要三角网格的对偶构造

---

## 实验结论

- 在**自由边界（free-boundary）**、**对称**、**周期**三类 CMC 曲面上验证
- 构造精确镜像光滑理论（而非近似）
- 对边界切平面提供直接控制

---

## 局限性

- 离散 Willmore 能量需要较好的初始猜测
- 边界条件的处理需针对具体应用定制

---

## 可行性评估

✅ **强烈推荐实现（理论最扎实）**

### 推荐理由
1. **数学优雅性最高**：本轮 20 篇中理论深度最强的一篇 —— 一个经典观察 + 两个标准变分步骤
2. **可复现性强**：无学习、无大规模数据依赖
3. **下游应用明确**：CMC 曲面在流体（最小曲面）、建筑（自由形态）、成形加工中应用广泛

### 实现建议
- **优先级**：**中高**（理论价值极高，但应用面比 PAT 窄）
- **实现路径**：先在规则三角网格上实现球值调和映射的离散 Dirichlet 能量最小化，验证 CMC 性质（数值检查 $H$ 的方差）
- **交叉价值**：与 [[2026-11-05-arXiv-2611.00227-Piecewise-CMC-Segmentation-Fluidic-Shaping]] 直接相关 —— 后者用 CMC 曲面做 3D 打印的流体成形分段，说明 CMC 离散化在**制造**方向有实际落地

---

## 相关工作

- [[2026-11-05-arXiv-2611.00227-Piecewise-CMC-Segmentation-Fluidic-Shaping]] — **直接下游应用**：用离散 CMC 做流体成形分段
- [[2026-11-05-SIGGRAPH2026-Surface-Power-Diagrams-Knit-Singularity-Placement]] — 同一 session 相邻论文，同样用曲面几何指导制造
- [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] — 参数曲面表示
- [[Discrete Differential Geometry]]
- [[Harmonic Maps]]
- [[Willmore Energy]]

---

**推荐度**：⭐⭐⭐⭐☆
