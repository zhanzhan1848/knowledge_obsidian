---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, 参数曲面, 样条, 神经基函数, 实时变形, 仿射等变, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811355
---

# NeuBase: Spline Surfaces with Neural Basis Functions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | NeuBase: Spline Surfaces with Neural Basis Functions |
| **作者** | Anshul Mendiratta, Lei Yang (港大), Xin Li, John Keyser, Scott Schaefer, Wenping Wang (Texas A&M) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-18 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811355) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_948&sess=sess126) |
| **DOI** | 10.1145/3811355 |
| **会话** | Tuesday, 21 July 2026 2:50pm PDT, Room 403 B · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 神经参数曲面表示 NeuBase：既**精确拟合目标曲面并保留精细几何细节**，又支持**直观的实时曲面变形**。核心是用**神经基函数（neural basis functions）**替换传统样条的固定基函数。

1. **神经基函数**：用神经网络替代 B-spline 的固定基函数族，兼具拟合精度与可编辑性
2. **精细几何细节**：能拟合出目标曲面的细节几何
3. **实时曲面变形**：变形过程无需重训网络
4. **四大几何性质（构造保证）**：
   - **线性性（linearity）**
   - **局部性（locality）**
   - **光滑性（smoothness）**
   - **仿射等变性（affine equivariance）**
5. **无需重训即可直接操作**：这些性质 ⟹ 变形是"即席"的

---

## 技术方案

### 核心思想

传统参数曲面（NURBS / B-spline）的**基函数是固定的**，限制了拟合能力与可变形性。NeuBase 把基函数换成**学习的**：

```
传统：B 样条 → 固定基函数 N_i(u,v) → 控制点 P_i
                       ↓
NeuBase：神经基函数 B_θ(u,v) → 控制点 P_i
              ├─ 线性性：输出对控制点线性
              ├─ 局部性：每个控制点只影响局部
              ├─ 光滑性：基函数 C^k 连续
              └─ 仿射等变性：整体仿射变换可"免费"传播
```

这些性质**合起来** ⟹ 用户可以直接拖动控制点做实时变形，而不必重新优化/重训。

### 关键技术

| 技术 | 说明 |
|------|------|
| **神经基函数（neural basis functions）** | 用网络参数化基函数族，突破固定样条基的表达力限制 |
| **局部性** | 保证编辑一个控制点不会引起全局涟漪 —— 交互式编辑的关键 |
| **仿射等变性** | 对整体缩放/旋转/平移自动一致 —— CAD 场景刚需 |
| **实时变形** | 由上述性质共同支撑，无重训 |
| **拟合 + 变形双目标** | 既做几何拟合，又做可编辑表示 |

---

## 算法复杂度

- **时间复杂度**：前馈推理 $O(N)$（$N$ = 控制点数），实时变形同样是前馈
- **空间复杂度**：$O(N)$ + 网络参数
- **对比传统样条**：变形是 $O(N)$ 的线性组合求值（极快）；本文因基函数是神经网络，单点求值更贵，但换来拟合精度

---

## 实现难度

- **算法复杂度**：**中** — 概念清晰，关键在设计满足四性质的神经基函数结构
- **数值稳定性**：**高** — 四性质是构造性的，不是拟合出来的
- **依赖项**：PyTorch / JAX；参数曲面表示（可对接 libigl 的 `BSpline` 或自建）
- **对齐本库**：与 [[2026-11-05-SIGGRAPH2026-Representation-Aware-Closed-Surface-Parameterization]]（11-04 收录）关注的"参数域 / 表示敏感性"直接相关 —— NeuBase 的仿射等变性与局部性正是参数化表示质量的具体化

---

## 实验结论

- 精确拟合目标曲面并保留精细几何细节
- 实时、直接的曲面变形
- 四性质在构造上成立

---

## 局限性

- 需要训练（每个曲面族一次？或 per-shape？）
- 神经基函数的单点求值比传统样条贵
- 表达力上限受网络架构限制

---

## 可行性评估

✅ **强烈推荐实现（参数化方向的范式级工作）**

### 推荐理由
1. **范式价值高**：把样条的"固定基函数"换成"神经基函数"并保持几何性质，是一个可被后续工作反复引用的框架
2. **直接对应交互式 CAD 需求**：实时曲面变形 + 仿射等变是 3D 编辑器的核心
3. **与本库主线契合**：11-04 已识别「参数域选择 / 表示替换」为最扎实主线，NeuBase 正是这条线的正面推进

### 实现建议
- **优先级**：**高**
- **实现路径**：
  1. 先实现**基线**：传统 B-spline 控制点拖拽变形（libigl `BSpline`），建立交互体验基线
  2. 实现神经基函数骨架，**逐一验证四性质**（数值测试：线性 ⟹ 缩放控制点时输出按比例缩放；仿射等变 ⟹ 对曲面施加仿射后，参数化结果应等于对控制点施加同一仿射）
  3. 关键设计：**局部性**最难保证 —— 建议用局部坐标 + 邻域网络（类似 neural SDF 的哈希/局部窗口）保证
- **可观测指标**：拟合误差（Chamfer / 点到面距离）、变形延迟（目标 <16ms）、编辑局部性（远处控制点移动对局部顶点的零影响）

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-Representation-Aware-Closed-Surface-Parameterization]] — **同主线**：参数域/表示敏感性
- [[2026-11-05-SIGGRAPH2026-Constant-Mean-Curvature-Surfaces-Discrete-Harmonic-Maps]] — 同 session 相邻
- [[2026-11-05-SIGGRAPH2026-Explicit-Flows-Implicit-Surfaces]] — 同 session 相邻
- [[Parametrization Three Layer Chain]]
- [[B-Spline Surfaces]]
- [[Neural Implicit Surfaces]]

---

**推荐度**：⭐⭐⭐⭐⭐
