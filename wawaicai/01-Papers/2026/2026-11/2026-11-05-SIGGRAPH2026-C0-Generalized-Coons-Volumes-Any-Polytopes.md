---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 对偶轮廓, Coons体, 多面体, 体积参数化, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3799902.3811087
---

# C⁰ Generalized Coons Volumes over Arbitrary Polyhedra

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | C⁰ Generalized Coons Volumes over Arbitrary Polyhedra |
| **作者** | Kaikai Qin, Zeqi Ge, Péter Salvi, Chenhao Ying, Huibiao Wen, Kepeng Xu, Shiqing Xin, Chongyang Deng (南科大 / 中科院 / 牛津) |
| **发表** | SIGGRAPH 2026 Conference Papers, pp. 1-10 |
| **链接** | [ACM DL](https://doi.org/10.1145/3799902.3811087) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_464&sess=sess126) |
| **DOI** | 10.1145/3799902.3811087 |
| **会话** | Tuesday, 21 July 2026 · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 把 **Coons 体（Coons volumes）**推广到**任意多面体（arbitrary polyhedra）**上，并保持 **C⁰ 连续性** —— 传统 Coons 体定义在张成的（patchwork）参数域上，难以处理任意多面体拓扑。

1. **广义 Coons 体**：从参数域 patch ⟹ **任意多面体**
2. **C⁰ 连续性保证**：分块之间连续
3. **任意多面体拓扑支持**：非参数域、非可展/可测量的复杂形体
4. **顶点/边/面混合场**：Coons 标量场的混合（blend）形式

---

## 技术方案

### 核心思想

```
经典 Coons 体（在张成域 S 上）：
   S(x,y) = C_x(u,v) + C_y(u,v) - C_0(u,v)
        ↓ 三个边界曲面 + 一个角点
        ↓ 局限于可参数化的四边域
        ↓
广义版本（任意多面体）：
   把"域"换成多面体表面本身，
   各面片上的场用顶点值/边曲线/面内部结构混合
        ↓
   ⟹ 任意多面体拓扑 + C⁰ 连续
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **广义 Coons 混合** | 顶点、边、面的多级混合 |
| **C⁰ 连续构造** | 分块边界处保证连续 |
| **任意多面体支撑** | 不需要域可参数化 |
| **边界条件指定** | 顶点位置 + 边界曲线可控 |

---

## 算法复杂度

- **时间复杂度**：$O(n)$（n = 控制元素数）
- **空间复杂度**：$O(n)$
- **可实现为**：三角/四边形网格上的直接顶点位置求值，或更高阶（样条）版本

---

## 实现难度

- **算法复杂度**：**中** — Coons 混合的数学不复杂，难在"任意多面体"上的推广细节
- **数值稳定性**：**高** — 线性混合，无迭代
- **依赖项**：libigl；样条库（自建或 Eigen）；可直接在三角网格上实现顶点级版本

---

## 实验结论

- 在任意多面体上构造广义 Coons 体
- C⁰ 连续性成立
- 可指定顶点与边界曲线

---

## 局限性

- C⁰ 意味着**导数不连续** ⟹ 曲率不连续，光顺性受限
- 顶点位置 + 边界曲线的控制较粗（无法表达内部曲率意图）

---

## 可行性评估

✅ **推荐实现（建模工具价值高，难度低）**

### 推荐理由
1. **实现难度低、工具价值高**：一个"广义 Coons 体"可以在 CAD 建模中直接作为曲面/体的构造器
2. **与本库主线契合**：
   - [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] — 参数曲面表示（几何侧）
   - [[2026-11-05-SIGGRAPH2026-Flatten-the-Complex-BRep-kCell-Particles]] — B-Rep 表示（拓扑侧）
   - ⟹ 本文提供**连接二者的体（volume）构造**
3. **任意多面体拓扑**是实用需求（不是所有形体都能参数化）

### 实现建议
- **优先级**：**中**
- **实施路径**：
  1. 先实现**顶点级**版本（每个多面体顶点由 Coons 混合得到位置）⟹ 半天内可出原型，验证 C⁰ 连续
  2. 再实现**边界曲线指定**版本
  3. 若需 C¹/C²：参考 [[2026-11-05-SIGGRAPH2026-Constant-Mean-Curvature-Surfaces-Discrete-Harmonic-Maps]] 的调和映射思路（用 Dirichlet 能量做光滑化）
- **验收指标**：连续性测试（相邻面片公共边两侧导数跳变）、边界条件满足度

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] — **互补**：曲面表示
- [[2026-11-05-SIGGRAPH2026-Flatten-the-Complex-BRep-kCell-Particles]] — **互补**：B-Rep 表示
- [[2026-11-05-SIGGRAPH2026-Constant-Mean-Curvature-Surfaces-Discrete-Harmonic-Maps]] — **相关**：调和映射光滑化
- [[Coons Patch]]
- [[Transfinite Interpolation]]

---

**推荐度**：⭐⭐⭐⭐
