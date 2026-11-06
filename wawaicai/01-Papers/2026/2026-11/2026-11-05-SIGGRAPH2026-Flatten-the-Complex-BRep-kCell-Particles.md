---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, B-Rep, CAD生成, 流匹配, k-cell粒子, 拓扑几何解耦, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2601.17733
---

# Flatten the Complex: Joint B-Rep Generation via Compositional k-Cell Particles

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Flatten the Complex: Joint B-Rep Generation via Compositional k-Cell Particles |
| **作者** | Junran Lu, Yuanqi Li, Hengji Li, Jie Guo, Yanwen Guo (南京大学 软件新技术国家重点实验室) |
| **发表** | SIGGRAPH 2026 Conference Papers, pp. 1-11 · arXiv:2601.17733 |
| **链接** | [ACM DL](https://doi.org/10.1145/3799902.3811197) · [arXiv:2601.17733](https://arxiv.org/abs/2601.17733) |
| **DOI** | 10.1145/3799902.3811197 |
| **会话** | Monday, 20 July 2026 11:15am PDT, Room 403 B · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> B-Rep 是 CAD 与制造的标准，但生成困难 —— 因为它是**异质的几何胞腔复形（geometric cell complex）**，**拓扑与几何在不同阶的胞腔（顶点/边/面）间纠缠**。本文把 B-Rep **重构为组合式的 k-cell 粒子**，用流匹配统一生成，**联合**产出拓扑与几何。

1. **范式重构**：B-Rep ⟹ **组合式 k-cell 粒子集**（解耦刚性层级）
2. **相邻胞腔共享相同潜变量**（shared latents at interfaces）⟹ 强化共享边界上的几何耦合
3. **统一各阶拓扑实体**：顶点、边、面被统一处理 ⟹ 拓扑与几何**联合生成**
4. **多模态流匹配框架**：支持无条件生成与精确条件任务（单视图重建、点云重建）
5. **自然扩展到局部 in-painting**：表示的显式性与局部性使局部修补成为自然操作
6. **可直接合成非流形结构** —— 传统级联方法难以处理

---

## 技术方案

### 核心思想

```
传统 B-Rep 生成（级联）：
   先生成顶点 → 再生成边 → 再生成面
        ↓ 问题：无法充分利用胞腔间的几何关系（邻接、共享）
             → 上下文感知弱，错误恢复差
        ↓
本文（组合式 k-cell 粒子）：
   每个拓扑实体 = 粒子的组合
   相邻胞腔在接口处共享相同潜变量
        ↓
   层级被"拍平" ⟹ 顶点/边/面统一 ⟹ 联合生成 + 全局上下文感知
```

**核心洞察**：级联架构的失败根源是**没有利用胞腔间的几何关系**。本文通过**共享接口潜变量**把这种关系直接编码进表示，从而在生成时全局可见。

### 关键技术

| 技术 | 说明 |
|------|------|
| **组合式 k-cell 粒子** | B-Rep 的新表示：拓扑实体 = 粒子组合 |
| **接口共享潜变量** | 相邻胞腔共享 ⟹ 几何耦合被显式编码 |
| **流匹配**（flow matching） | 生成框架，支持无条件 + 条件生成 |
| **联合拓扑几何生成** | 不再级联 |
| **局部 in-painting** | 表示的局部性支持直接修补 |
| **非流形合成** | 可直接生成非流形拓扑 |

---

## 算法复杂度

- **时间复杂度**：流匹配采样 $O(K \cdot N)$（$K$ = 采样步数，$N$ = 粒子数），单步前馈
- **空间复杂度**：$O(N)$
- **对比级联**：级联需 $K_1 + K_2 + K_3$ 步分阶段生成且误差累积；本文单阶段

---

## 实现难度

- **算法复杂度**：**高** — k-cell 粒子的表示设计与"接口共享潜变量"的约束实现是核心难点
- **数值稳定性**：**中高** — 生成模型的质量决定上限
- **依赖项**：PyTorch；CAD 内核（OpenCASCADE / OCCT）用于 B-Rep 导出；arXiv 已开源（需核实）
- **衔接本库**：本库 [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] 处理**曲面表示**，本文处理**B-Rep 拓扑几何**⟹ 二者可组合为完整的 CAD 表示栈

---

## 实验结论

- 高保真 CAD 模型的**联合生成**
- **精确的 3D 重建**（单视图 / 点云条件）
- **局部 in-painting**
- **有效性（validity）更优** —— 输出是**有效的** B-Rep（拓扑合法）

---

## 局限性

- 需要训练数据（B-Rep 数据集稀缺）
- 有效性保证依赖生成质量，仍需验证
- 复杂工业零件（多特征、多约束）仍是难点

---

## 可行性评估

✅ **推荐实现（范式级工作，值得长期跟踪）**

### 推荐理由
1. **解决的是本库的硬问题**：B-Rep 生成的"拓扑-几何纠缠"是 CAD 生成的核心瓶颈
2. **解耦思路可迁移**：k-cell 粒子的思想 ⟹ 也可试用于其他层级化几何表示
3. **与本轮 [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] 形成完整 CAD 表示栈**：NeuBase 管曲面，Flatten the Complex 管 B-Rep 拓扑

### 实现建议
- **优先级**：**中高**（研究价值 > 短期落地价值）
- **实施路径**：
  1. **先做表示层**：不训练模型，先实现"k-cell 粒子 ↔ 传统 B-Rep"的双向转换（这是最可复用的部分）
  2. 用 OpenCASCADE 做 B-Rep 的解析与验证
  3. 再考虑训练
- **务实提示**：**表示层的转换工具本身就有价值** —— 即使不训练，也能作为 B-Rep 处理的中间格式

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-NeuBase-Spline-Surfaces-Neural-Basis-Functions]] — **互补**：曲面表示层
- [[2026-11-05-SIGGRAPH2026-B-repLer-Language-guided-CAD-Editing]] — **同方向**：B-Rep 的语言编辑
- [[2026-11-05-SIGGRAPH2026-Explicit-Flows-Implicit-Surfaces]] — **同谱系**：流匹配 + 形状变形
- [[B-Rep]]
- [[CAD Generation]]
- [[Flow Matching]]

---

**推荐度**：⭐⭐⭐⭐
