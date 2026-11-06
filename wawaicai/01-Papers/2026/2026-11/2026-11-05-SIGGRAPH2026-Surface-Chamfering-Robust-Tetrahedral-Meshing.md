---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 四面体网格化, Delaunay细化, 数值稳健性, 尖角消除, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811395
---

# Surface chamfering for robust tetrahedral meshing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Surface chamfering for robust tetrahedral meshing |
| **作者** | Lorenzo Diazzi (CNR IMATI), Daniele Panozzo (NYU), Jiacheng Dai (NYU), Marco Attene (CNR IMATI) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-15 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811395) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_1609&sess=sess122) |
| **DOI** | 10.1145/3811395 |
| **会话** | Thursday, 23 July 2026 10:55am PDT, Room 408 A · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 一种**100% 成功率**的高质量四面体网格化算法：新的输入「**倒角（chamfering）**」消除所有尖角，从根本上保证底层 Delaunay 细化的**形式收敛性**；配合**隐式 Steiner 点**与**间接几何谓词**保证全流程数值稳健性。

1. **Surface chamfering（表面倒角）**：对输入表面做预处理，**消除所有锐角（acute angles）** —— 这是保证形式收敛性的关键
2. **形式收敛性保证**：消除尖角后，底层 **Delaunay 细化（Delaunay refinement）** 的形式收敛性得以成立
3. **100% 成功率**：在测试集上**全部成功**，无失败案例
4. **隐式 Steiner 点**：新增的隐式加点机制，避免显式 Steiner 点带来的几何退化
5. **间接几何谓词（indirect geometric predicates）**：用数值稳定的方式判定几何关系，避免浮点误差导致的错误决策

---

## 技术方案

### 核心思想

```
① Surface chamfering：消除所有锐角
        ↓  （形式收敛性成立）
② Delaunay refinement（隐式 Steiner 点）
        ↓
③ 间接几何谓词做稳健判定
        ↓
④ 输出高质量四面体网格（100% 成功）
```

**关键洞察**：Delaunay 细化的形式收敛性证明**要求输入没有锐角**（锐角会破坏 circumradius 与 quality radius 的界）。绝大多数失败案例源于此 ⟹ **把鲁棒性问题转化为预处理问题**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Surface chamfering** | 倒角预处理，把锐角替换为可处理的构型 |
| **Delaunay refinement** | 经典四面体网格化框架（Ruppert / Shewchuk），本文修正其前提条件 |
| **隐式 Steiner 点** | 不直接放置 Steiner 点，而是通过构型隐式引入，避免几何退化 |
| **间接几何谓词** | 用渐近/区间式的数值稳定判定代替直接浮点比较 |
| **形式收敛性（formal convergence）** | 理论保证：质量界与终止性在消除锐角后成立 |

---

## 算法复杂度

- **时间复杂度**：Delaunay 细化为 $O(n)$ 摊还（$n$ = 输出四面体数），倒角预处理额外一遍表面处理
- **空间复杂度**：$O(n)$
- **理论保证**：质量下界 + 终止性（形式收敛性）

---

## 实现难度

- **算法复杂度**：**高** — 涉及精确算术（shewchuk 的 predicates）、形式化收敛性论证、隐式 Steiner 的处理
- **数值稳定性**：**高** — 论文的核心就是解决数值稳健性
- **依赖项**：
  - **CGAL**（3D Mesh Generation 包）：提供 `make_mesh_3D` 的 Delaunay refinement 框架
  - **Shewchuk predicates**（`exact_predicates_inexact_constructions`）
  - libigl 可用于后处理
- ⚠️ **落地关键**：CGAL 的 `make_mesh_3D` 本身对锐角输入会失败 ⟹ **chamfering 是接入关键**

---

## 实验结论

- **100% 成功率** —— 相对现有方法（对锐角输入频繁失败）是数量级提升
- 高质量四面体网格输出
- 覆盖多类输入表面

---

## 局限性

- **chamfering 会改变几何**（表面被倒角 ⟹ 与原始模型有偏差），需要控制倒角半径的误差容忍
- 复杂模型上倒角的拓扑一致性需要小心处理
- 实现门槛高（精确算术 + 形式化论证）

---

## 可行性评估

⚠️ **谨慎评估（理论价值高，工程实现重）**

### 推荐理由
1. **解决的是真问题**：四面体网格化的失败率在实际生产中是硬伤
2. **CGAL 已有框架**：不需要从零实现 Delaunay refinement，只需**补上 chamfering 前处理**
3. **理论严谨**：形式收敛性保证是同类工作中少见的

### 实现建议
- **优先级**：**中**（若业务涉及四面体网格化则升为高）
- **实现路径**：
  1. 用 CGAL `make_mesh_3D` 建立基线，统计现有方法在锐角模型上的失败率
  2. 实现 chamfering 前处理（对输入表面做 offset + 锐角检测/替换）
  3. 用 **间接几何谓词**替换直接的 in-circle 判定
  4. 逐步验证成功率提升
- **风险提示**：倒角带来的几何偏差需要与业务方确认可接受范围（可做成参数：倒角半径 vs 几何误差）

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Floating-Point-Robustness-Parametric-Surface-CCD]] — **同源问题**：浮点稳健性，同样做"benchmark + 算法"两端
- [[2026-11-05-SIGGRAPH2026-Fast-Sparse-Matrix-Permutation-Mesh-Solvers]] — 同 session 相邻
- [[2026-11-05-SIGGRAPH2026-Locality-Aware-AD-GPU-Mesh-Computations]] — 同 session 相邻
- [[Delaunay Refinement]]
- [[Tetrahedral Meshing]]
- [[CGAL]]
- [[Numerical Robustness]]

---

**推荐度**：⭐⭐⭐
