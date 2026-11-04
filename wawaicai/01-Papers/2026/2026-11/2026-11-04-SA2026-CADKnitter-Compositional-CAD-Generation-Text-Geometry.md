---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, CAD-generation, B-rep, compositional-design, assembly-constraints, diffusion-model, part-compatibility, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1732&sess=sess112
venue: SIGGRAPH Asia 2026
year: 2026
---

# CADKnitter: Compositional CAD Generation from Text and Geometry Guidance

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CADKnitter: Compositional CAD Generation from Text and Geometry Guidance |
| **作者** | Tri Le, Khang Nguyen, Baoru Huang, Tung D. Ta, Anh Nguyen（**FPT Corporation** Quantum AI & Cyber Security Institute · MBZUAI 机器人系） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-02 · `papers_1732` / `sess112` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1732&sess=sess112) |
| **代码 / 数据** | 论文声明 **代码与数据集将公开** |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 面向**多零件装配**的 CAD 生成：给定一个已有 CAD 模型 + 文本设计意图，生成**互补的配合零件**，同时满足**几何约束**（与已有模型几何兼容）与**语义约束**（符合设计文本意图）。并发布 **KnitCAD** 数据集（**310,000+ CAD 模型**，含文本提示与装配元数据）。

1. **组合式（compositional）CAD 生成框架**：不再做「单零件生成」，而是生成**与已有零件互补装配**的新零件。

2. **双约束建模**：
   - **几何约束**：新零件必须与给定 CAD 模型的**几何**兼容（几何引导线索）
   - **语义约束**：新零件必须符合**设计文本提示**（语义线索）
   - 两者**同时**注入扩散采样过程。

3. **几何引导线索（geometric-guiding cues）**：用几何线索**引导扩散采样（steer diffusion sampling）** ⟹ 而非仅靠文本条件。

4. **KnitCAD 数据集**：**>310,000** CAD 模型样本 + 文本提示 + **装配元数据**（提供语义与几何约束）⟹ 填补「多零件装配数据」空白。

5. **实验显著超越 SOTA 基线**（作者声明「by a clear margin」）。

---

## 技术方案

### 核心思想

```
单零件生成：  文本 → CAD                        （已有工作）
组合式生成：   (已有 CAD, 文本) → 互补 CAD         （本文）
                ↑                ↑
                几何约束         语义约束
                ↓                ↓
             引导扩散采样（双线索同时注入）
```

关键在于**几何约束不是后置检查，而是采样过程中的引导信号** ⟹ 与 11-02 [[SemEllipsoid]]（语义一致性作为硬约束）、[[Ortho-arc]]（拓扑内生于构造）同属「**约束内生化**」主线。

### 关键技术

| 技术 | 说明 |
|------|------|
| **几何引导线索** | 从已有 CAD 提取，注入扩散采样 |
| **双约束引导** | 几何兼容 + 文本语义，采样期同时生效 |
| **组合式装配生成** | 生成可与已有件装配的互补件 |
| **KnitCAD 数据集** | 310k+ 样本，含文本 + 装配元数据 |
| **扩散采样引导** | 非仅文本条件，而是多线索引导去噪 |

### 公式

```math
% 条件扩散（示意）
ε_θ(x_t, c_geo, c_text, t)

% 引导：几何 + 语义双线索在采样期注入
% (实现细节论文未完全公开，标准 classifier-free guidance 变体)

% 约束满足目标：
%  几何：compat(f_new, f_exist) ≈ 0     (装配兼容)
%  语义：match(f_new, prompt) ≈ 1
```

---

## 实验结论

- **数据集**：**KnitCAD**（自建，310k+ 样本）
- **基线**：单零件 CAD 生成 SOTA、组合式方法
- **结果**：**显著超越现有 SOTA**（"outperforms other state-of-the-art baselines by a clear margin"）
- 代码与数据集将公开

---

## 局限性

- **多零件装配**的复杂度：多件同时装配的约束满足比两件互补难得多
- **依赖已有 CAD 模型**：需要输入件存在且质量合格
- **装配元数据**的获取成本高（论文未说明标注方法与规模细节）
- 语义约束的落地依赖**文本提示质量**
- **代码/数据尚未公开**（截至收录时）
- 未讨论**下游可制造性**（壁厚、公差）⟹ 与 [[Field Optimization for Hybrid AM]]（11-02）关注点不同

---

## 与本库已有内容的关系

- **[[CADRec]]**（本轮同时收录，papers_1997）：**同一个 sess112**（同一 session！）⟹ 主题相邻，适合对读
  - CADKnitter：**生成**互补零件（向前）
  - CADRec：**逆向**分解并重建 CAD 序列（向后）
  - ⟹ **两者合起来覆盖了「装配级 CAD」的正反两面** ⟹ 建议成对阅读并对比其「层级分解」思想
- **11-02 [[Validity-Assured-Regeneration]]**（参数化实体有效性）⟹ 同属「**保证生成结果几何有效**」主线
- **arXiv [[CAD-WAM]]**（2610.39306，10-29）、[[Composable CAD]]**（2611.01165，10-31）、[[CRAFT]]**（2611.00076）⟹ CAD 生成是当前 arXiv cs.GR 的**热点子领域**，本轮 + arXiv 侧共 5+ 篇

---

## 实现建议

- **实现难度**：**高**（需 B-rep CAD 建模、装配约束求解、扩散引导实现；工程量大）
- **适用场景**：
  - **CAD 变体设计**：给定主件 + 「加一个把手」⟹ 自动生成把手
  - **参数化补全**：装配体中缺失的配套件
  - **设计复用**：从零件库检索 + 适配生成
- **落地建议**：
  1. **优先使用 KnitCAD 数据集**（若公开）做**几何引导模块的消融**——验证「几何线索」相对「纯文本条件」的增益
  2. 工程上更现实的路线：先用**检索 + 参数化适配**（而非生成），评估收益上限
  3. 关注**装配兼容性验证器**的构建（这是不管用生成还是检索都需要的组件）
- **开源参考**：
  - CAD 内核：OpenCASCADE (`OCCT`)、CadQuery（Python）、FreeCAD（论文 arXiv 2611.02659 的 CAD Bench v3 即固定 FreeCAD 环境）
  - 数据集：[[2026-11-04-arXiv-2611.00721-Representation-Aware-Closed-Surface-Parameterization]] 相关 → **CAD Bench v3**（cadbench.ai）可作评测参考
  - 几何距离：libigl / CGAL 的最近距离查询

---

## 相关工作

- [[2026-11-04-SA2026-CADRec-Recursive-CAD-Sequence-Reconstruction]]
- [[2026-11-02-arXiv-2610.42145-SemEllipsoid-Semantic-Aware-Shape-Abstraction]]
- [[CAD生成]]
- [[装配约束]]

---

## 主题线索

> **CAD 生成在本轮成为 arXiv cs.GR + SA2026 的双线热点**（本轮收录 CADKnitter + CADRec，arXiv 侧近期还有 CAD-WAM、Composable CAD、CRAFT、Parametric CAD Bench v3）。
> ⟹ **值得为「CAD / B-rep 生成」建立独立子目录与 MOC**，本库目前把 CAD 相关论文散落在各处。
