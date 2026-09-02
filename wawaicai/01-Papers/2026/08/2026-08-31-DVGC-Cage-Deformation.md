---
type: paper
created: 2026-08-31
updated: 2026-08-31
tags: [paper, cage-deformation, green-functions, shape-editing, SIGGRAPH-Asia]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.31003
---

# Domain-Varying 2D Green's Functions for Cage-based Deformation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Domain-Varying 2D Green's Functions for Cage-based Deformation |
| **作者** | Dong Xiao et al. |
| **发表** | SIGGRAPH Asia 2026 Conference Paper · Aug 31, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.31003) |
| **DOI** | 10.48550/arXiv.2608.31003 |
| **代码** | - |

---

## 核心贡献

> 提出基于域变 Green 函数的新型 cage 形变理论框架，统一了经典的调和坐标（HC）和 Green 坐标（GC），并实现从 HC 到 GC 效果的连续过渡。

1. **统一理论框架**：首次将近二十年来分离的 HC 和 GC 方法统一在域变 Green 函数视角下
2. **新控制空间**：引入 Green 函数域 Θ 作为新的控制空间，产生多样化的形变效果
3. **连续效果过渡**：当 Θ 从 cage 区域 Ω 扩展到整个 ℝ² 时，效果从 HC 连续过渡到 GC
4. **解析/半解析计算**：当 Θ 为圆盘或矩形时，DVGC 可无有限元离散的计算；圆盘情况更有 2D 单纯 cage 的闭式表达式

---

## 技术方案

### 核心思想

经典 cage 形变方法（HC 和 GC）可视为不同 Green 函数域的选择：HC 使用紧支撑基函数（仅在 cage 内部非零），GC 使用全局 Green 函数。论文提出将 Green 函数域 Θ 作为独立于 cage 包围域的控制空间。

### 关键技术

| 技术 | 说明 |
|------|------|
| 域变 Green 函数 | G_Θ(x,y)，Θ 可独立于 cage 包围域 Ω 选择 |
| Domain-Varying Green Coordinates (DVGC) | 基于 G_Θ 的新坐标系统 |
| HC → GC 连续过渡 | 当 Θ: Ω → ℝ² 时，效果平滑变化 |
| 闭式解 | 圆盘 Green 函数域下 2D 单纯 cage 有解析表达式 |

### 公式

核心框架：
```
DVGC(cage, Θ) = Σ w_i(x) · v_i

w_i(x) = G_Θ(x, c_i) / Σ G_Θ(x, c_j)
```

其中 c_i 为 cage 顶点，G_Θ 为域 Θ 上的 Green 函数。

---

## 实验结论

- **数据集**: 多种 2D 形状和 cage 配置
- **结果**: 
  - 实现了从"更贴合 cage"到"更保形"的连续效果变化
  - 圆盘和矩形 Green 函数域具有解析/半解析表达式，计算高效
  - 可处理任意形状 cage，适用范围广

---

## 局限性

- 目前仅支持 2D 问题，3D 扩展面临计算复杂性挑战
- 依赖于 cage 的质量，bad cage 仍会导致形变质量问题
- 对于非凸 cage 区域，理论分析尚不完整

---

## 相关工作

- [[调和坐标]]
- [[Green坐标]]
- [[Cage形变]]
- [[参数化]]

---

## 实现建议

- **实现难度**: 中（2D）/ 高（3D 扩展）
- **预期性能**: 闭式解情况下计算高效，适合实时应用
- **适用场景**: 2D 形状编辑、UI 动画、字符形变（与 Pacific Graphics 2026 工作结合）
