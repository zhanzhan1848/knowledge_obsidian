---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, geometry-processing, architectural-proxy, image-guided-reconstruction, facade-alignment, structural-priors, texture-mapping, SIGGRAPH-Asia-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://sa2026.conference-schedule.org/presentation/?id=papers_1630&sess=sess116
venue: SIGGRAPH Asia 2026
year: 2026
---

# Architectural Textured Proxy Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Architectural Textured Proxy Generation |
| **作者** | Weidan Xiong, Shihao Feng, Kaijie Qu, Hao Li, Mingqi Zhang（**深圳大学** · **Tel Aviv University**） |
| **发表** | **SIGGRAPH Asia 2026**，Technical Papers，2026-12-04 · `papers_1630` / `sess116` |
| **链接** | [原文](https://sa2026.conference-schedule.org/presentation/?id=papers_1630&sess=sess116) |
| **代码** | 未提供 |
| **收录时间** | 2026-11-04 |

---

## 核心贡献

> 提出**图像引导的代理（proxy）生成范式**：代理几何的构造**同时受稠密重建与输入航拍图像约束**，从源头对齐跨视角的结构特征（立面、边缘、交线），而非像既有方法那样「先做几何抽象、再后处理贴图」。

1. **批判既有范式**：现有方法采用**顺序式管线**——
   ① 先从稠密重建中**抽象几何** → ② 再从输入图像**投影纹理**。
   后果：**几何-only 形式化忽略了生成代理过程中的图像证据** ⟹ 跨视角**结构特征错位**（立面、边缘及其交线）⟹ 不一致被**推迟到下游贴图修正阶段**，此时**底层几何结构已无法可靠恢复**。

2. **新范式：image-guided proxy formulation**
   代理生成**同时**被**稠密重建**与**输入航拍图像**约束；
   ⟹ 图像派生的结构线索**直接进入构造过程** ⟹ 代理从一开始就**与观测特征跨视角对齐**；
   ⟹ 而非依赖可能不可行的**事后修正**。

3. **实现框架**：从**图像 + 稠密几何**中提取**结构先验（structural priors）**，并在**代理优化过程中强制其一致性**。

4. **结果**：产出**天然与输入影像一致**的代理 ⟹ **更准确的几何** + **更连贯的纹理映射**。

---

## 技术方案

### 核心思想

```
既有范式（顺序式，几何-only）：
   稠密重建 ──抽象──> 代理几何 ──投影──> 纹理
                              ↑
                    图像证据在此丢失 ⟹ 跨视角错位 ⟹ 事后难修

本文（图像引导，联合约束）：
   稠密重建 ─┐
             ├──> 代理优化（同时受两者约束，强制结构先验一致性）
   航拍图像 ─┘
   ⟹ 从一开始就跨视角对齐
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Image-guided proxy formulation** | 联合约束范式（核心） |
| **结构先验提取** | 同时从图像与稠密几何提取（立面、边缘、交线） |
| **代理优化中的一致性强制** | 把先验一致性写进优化目标，而非后处理 |
| **跨视角特征对齐** | 立面/边缘/交线在多视角间一致 |
| **连贯纹理映射** | 几何准确 ⟹ 纹理映射自动连贯 |

### 公式

```math
% 代理优化目标
min_P  E_geo(P; D)          % 稠密重建 D 的几何贴合
     + λ E_img(P; I)        % 输入图像 I 的图像证据
     + μ E_cons(P; S)        % 结构先验 S 的一致性

% S = extract_structural_prior(I, D)   % 图像 + 稠密几何双源
%   含：立面方向、边缘位置、交线拓扑

% 关键：E_cons 在优化期生效 ⟹ 跨视角错位在源头被抑制
```

---

## 实验结论

- **数据集**：建筑场景（航拍影像 + 稠密重建）
- **基线**：顺序式几何抽象 + 后处理贴图修正的既有方法
- **结果**：
  - **更准确的几何**
  - **更连贯的纹理映射**
  - 消除「不一致推迟到下游、且下游无法可靠恢复」的问题
  - 代理**天然与输入影像一致**

---

## 局限性

- **依赖航拍影像 + 稠密重建**双输入 ⟹ 数据获取成本高
- **建筑场景专用**（立面/交线的先验假设对一般物体不成立）
- **结构先验的提取质量**是上限；先验提取错误 ⟹ 优化把错误强化
- **代理优化本身**可能仍是重计算（非实时）
- **无开源实现**
- 论文描述中被截断（"The resulting proxies exh..."）⟹ 摘要需从 PDF 补全

---

## 与本库已有内容的关系

- 与 **[[Texture Consolidation of Generated Multi-View Renderings]]**（arXiv 2610.36098，10-26）同属「**图像证据进入几何管线**」方向，但本文更激进：**图像在几何阶段就介入**
- 与本轮 [[Representation-Aware Parameterization]] 共同强化「**表示/证据的引入时机决定结果质量**」这一规律
- 与 11-02 [[Field Optimization for Hybrid AM]]（制造约束内生化）同属「**外部约束提前注入**」主线

---

## 实现建议

- **实现难度**：**中-高**（代理优化 + 结构先验提取，工程量大但不涉及学习）
- **适用场景**：
  - **建筑 / 城市规模的轻量化渲染**：从航拍重建生成可渲染代理（替代重型网格）
  - **大规模场景 LOD 自动化**
  - **AR 数字孪生**中的场景简化
- **落地建议**：
  1. **先做「结构先验 + 联合优化」的最小版本**：立面平面检测（激光雷达/规则拟合）+ 立面约束 ⟹ 观察跨视角错位是否显著下降
  2. 引入**多视角一致性直接作为优化项**（而非只靠先验）⟹ 这是本文思想的核心
  3. 评估指标：立面重建误差 + 跨视角重投影一致性 + 纹理接缝数
- **开源参考**：
  - libigl: `igl::principal_curvature`、RANSAC 平面拟合
  - CGAL: `CGAL::Polygon_mesh_processing::measure`、`CGAL::Plane_3`
  - Open3D / COLMAP：稠密重建与多视角几何
  - 面分割：libigl 的 `bfs` + 平面聚类

---

## 相关工作

- [[2026-11-04-arXiv-2611.00721-Representation-Aware-Closed-Surface-Parameterization]]
- [[2026-11-04-SA2026-UVFaceFusion-Multi-view-Topologically-Consistent-Face-Reconstruction]]
- [[代理几何]]
- [[多视角一致性]]

---

## 主题线索

> **「外部证据的引入时机」——本库新浮现的第四条方法论线索。**
> - 11-02 [[Field Optimization]]：制造约束 ⟹ 内生化为优化目标（**尽早**）
> - 11-02 [[Ortho-arc]]：可展约束 ⟹ 内生于构造（**构造时**）
> - 11-04 **Architectural Proxy**：图像证据 ⟹ 从「贴图阶段」提前到「几何阶段」（**更早**）
> - 11-04 [[SemEllipsoid]] / CADRec：语义 ⟹ 内生于分解（**分解时**）
>
> ⟹ 统一表述：**「约束/证据介入得越早，需要的后置修正越少」**。可与「表示替换」「局部闭式构造」「层级分解」并列，作为本库方法论主线的第四条。
