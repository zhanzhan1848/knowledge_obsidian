---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, CAD-reconstruction, B-rep, hierarchical-decomposition, CAD-DSL, point-cloud-context, part-decomposition, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1997&sess=sess112
venue: SIGGRAPH Asia 2026
year: 2026
---

# CADRec: Reconstructing a CAD Sequence Recursively with Localized Geometric Contexts

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CADRec: Reconstructing a CAD Sequence Recursively with Localized Geometric Contexts |
| **作者** | Haoxuan Song, Bingchen Yang, Jun Xiao, Haiyong Jiang（**中国科学院大学** · **南洋理工大学 NTU**） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-02 · `papers_1997` / `sess112` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1997&sess=sess112) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 提出**递归式 CAD 序列重建**框架：把输入形状**递归分解为空间局部化的零件**，为每个零件重建**局部的 CADQuery 程序**（基于**层级 CAD DSL**），再映射回全局坐标系组合 ⟹ 把「全局 CAD 重建」化归为**一系列更简单的局部零件预测问题**。

1. **识别 LLM-based 重建方法的两个局限**（本文的立论基础）：
   - **扁平、冗长的脚本表示** ⟹ 阻碍泛化，且**未利用代码片段复用（snippet reuse）**
   - **一次性 / 迭代式几何上下文编码** ⟹ **缺乏定位几何上下文的结构线索**（structural clues）

2. **层级 CAD DSL**：递归地把形状分解为**空间局部化的零件**；在层级**每个节点**上，模型决定：
   - **继续拆分**为子零件，或
   - **停止**并合成叶级 CAD 脚本

3. **局部程序 ⟹ 全局组合**：生成的局部程序映射回**全局坐标系**，组合成最终 CAD 模型。

4. **结构保持的降复杂度**：层级化把全局重建变成**一串更简单的局部零件预测问题**，**降低几何复杂度同时保留设计的结构组织**。

5. **局部点云上下文编码 + MLLM 解码器**：用**局部化点云上下文**作为几何条件，MLLM 解码器同时预测**分解决策**与**CAD 程序**。

6. **几何感知目标（geometry-aware objectives）**：鼓励**一致的零件分解**与**空间有依据的预测**。

---

## 技术方案

### 核心思想

```
扁平序列（已有 LLM 方法）：
  [script line 1..N]  ← 长、不可复用、上下文无结构

CADRec（本文）：
  Shape
   └─ node (判断: split? )
       ├─ yes → children [node1, node2, ...]
       │           每个 child 再判断 split?，直至 leaf
       │           leaf → 生成局部 CADQuery 程序
       └─ no  → 当前节点即为 leaf，生成局部程序
  局部程序 → 映射到全局坐标 → 组合
```

关键洞察：**「递归分解 + 局部程序」同时解决三个问题**：降低单步预测难度、启用代码片段复用、提供上下文定位的结构线索。

### 关键技术

| 技术 | 说明 |
|------|------|
| **层级 CAD DSL** | 递归分解结构，节点为零件 |
| **分解决策 / 程序合成二分** | 每节点二选一：split 或 stop-and-emit |
| **局部化点云上下文** | 局部几何条件，替代全局上下文 |
| **MLLM 解码器** | 联合预测分解决策 + CAD 程序 |
| **全局坐标重映射** | 局部程序 ⟹ 装配回全局 |
| **几何感知训练目标** | 一致的零件分解 + 空间有依据的预测 |

### 公式

```math
% 层级递归：每个节点 n 的决策
d_n ∈ {SPLIT, STOP}
  SPLIT: n → {n_1, ..., n_k}
  STOP:  n → CADQuery_program(p_n)   % 局部坐标

% 全局装配
f_global = ⋃_{leaves ℓ} T_ℓ(f_ℓ)   % T_ℓ = 局部→全局坐标变换

% 训练目标
L = L_CAD + λ_dec·L_decision + λ_geo·L_geo_aware
%    ↑ 程序正确性   ↑ 分解决策     ↑ 几何感知（一致性 + 空间依据）
```

---

## 实验结论

- **数据集**：标准 CAD 重建基准
- **基线**：LLM-based CAD 重建方法（一次性 / 迭代式几何上下文编码）
- **结果**：
  - 降低几何复杂度、提升泛化
  - 保留设计结构组织
  - 局部程序复用（snippet reuse）成为可能
  - 标准 CAD 重建基准上有效（论文称 "standard CAD reco[nstruction]" 基准上验证）

---

## 局限性

- **依赖层级分解的正确性**：若首次分解错误，后续全部受累 ⟹ 分解决策是单点风险
- **叶级零件的切分准则**依赖点云上下文质量（遮挡/薄壁处弱）
- **MLLM 解码**引入大模型推理成本（相对 10-29 的 CAD-WAM「几何条件化动作生成 + next-state 预测」思路，CADRec 走的是**递归分解**路线，二者可对读）
- **坐标映射误差累积**
- **无开源实现**

---

## 与本库已有内容的关系

- **[[CADKnitter]]**（本轮同收录，**同一 session sess112**）⟹ **强烈建议成对阅读**：
  - CADKnitter：**生成**互补装配零件（向前）
  - CADRec：**逆向**分解重建（向后）
  - 共同点：**两者都把「装配级 CAD」拆成「零件级子问题」** ⟹ **「层级分解」正在成为装配级 CAD 的通用范式**
- 与 **[[SemEllipsoid]]**（11-02）同属「**把组合约束换成结构化子问题**」主线
- arXiv 侧对照：[[CAD-WAM]]（世界模型式动作生成 + next-state 预测）、[[Composable CAD]]（sketch-to-CAD 程序合成）、[[CRAFT]]（纠错式多智能体）

---

## 实现建议

- **实现难度**：**高**（需层级 DSL 设计 + MLLM 微调 + 局部-全局坐标机制 + CAD 几何验证）
- **适用场景**：
  - **逆向工程**：从点云/扫描恢复可编辑 CAD
  - **CAD 数据集构建**：自动标注（把扫描件转成 CAD 脚本 + 零件层级）
  - **参数化 CAD 迁移**：把旧格式模型转为脚本化模型
- **落地建议**：
  1. **降级方案（推荐先做）**：放弃学习式分解，改用**几何启发式分割**（平面/圆柱/圆锥等基元检测）⟹ 规则化分解 + 局部拟合 ⟹ 不需要 MLLM，也能拿到「层级分解」的核心收益
  2. 评测直接用 **CAD Bench v3**（cadbench.ai，固定 FreeCAD 环境 + 程序化验证器）⟹ 与 arXiv [[Parametric CAD Bench v3]] 对齐
  3. 若上学习式路线，**优先攻克分解决策的鲁棒性**（这是全文的单点风险）
- **开源参考**：
  - **CadQuery**（论文直接采用其程序格式）· **FreeCAD**（验证环境）
  - **CAD Bench v3**：https://cadbench.ai/ · 验证器 https://github.com/gNucleus-AI/freecad-validator
  - 点云上下文：libigl / Open3D 邻域查询
  - 基元拟合：CGAL `CGAL::Polygon_mesh_processing::fit_triangle` 等

---

## 相关工作

- [[2026-11-04-SA2026-CADKnitter-Compositional-CAD-Generation-Text-Geometry]]
- [[2026-11-02-arXiv-2610.42145-SemEllipsoid-Semantic-Aware-Shape-Abstraction]]
- [[层级分解]]
- [[CAD重建]]

---

## 主题线索

> **「层级分解」跨方法论复用**：本轮 CADRec（CAD 重建）与 [[2026-11-02-SA2026-Field-Optimization-Hybrid-Process-Planning]]（AM 工艺规划，把组合问题换成连续场）、[[SemEllipsoid]]（ILP 标签分配）共同指向：
> **把「一个巨大的组合问题」换成「一堆结构化的局部子问题」**。
> ⟹ 本库方法论主线可以更新为三条：
> 1. **表示替换**（换表示使约束良态）— Extremum Sum / PSM / Representation-Aware
> 2. **局部闭式构造**（绕开全局优化）— TORO / Ortho-arc
> 3. **层级分解**（组合问题 → 结构化子问题）— CADRec / SemEllipsoid / Field Optimization
