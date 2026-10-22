---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, 渲染, 光线追踪, 位移贴图, 几何查询, 焦散, 重要性采样, 2026, arXiv]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.21584
arxiv_id: 2610.21584
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Queries on Tessellation-Free Displaced Surfaces |
| **作者** | Bing Xu; Yang Zhou; Brian Budge |
| **发表** | arXiv preprint (cs.GR) 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.21584) |
| **PDF** | https://arxiv.org/pdf/2610.21584 (46 MB，超大，图集很重) |
| **HTML** | 不可用（arXiv 无 HTML 版本） |
| **DOI** | 10.48550/arXiv.2610.21584 |
| **代码** | 未在摘要中给出 |

---

## 核心贡献

> 用一阶纹理空间层级结构，在**不做预镶嵌（pre-tessellation）**的前提下，直接支持位移贴图表面的光线追踪 + 表面采样 + 镜面流形搜索 + 最近点查询——补齐了此前 tessellation-free 光追只能做"求交"的短板。

1. **提出一阶纹理空间层级（first-order texture-space hierarchy）**：每个节点存储**局部仿射高度平面 + 保守残差界**，保留标量 min–max 界丢弃的空间高度变化信息。
2. **一套表示解耦多种几何查询**：平面+残差 → 包围体（enclosure）用于求交与距离搜索；平面的高度与斜率 → 面积估计用于采样；额外的斜率界 → 镜面光路搜索。
3. **面向查询定制的遍历、剪枝与采样算法**，在**焦散渲染（caustics）**、**位移发光面采样**、**表面 PDE 求解器**三个场景验证，同时保持高效光追。

---

## 技术方案

### 核心思想

位移贴图（displacement map）把精细几何编码进紧凑纹理，简化了表面制作，但传统做法必须先**预镶嵌（pre-tessellate）**成密集三角网格，内存开销极大。近年来的 tessellation-free 方法允许直接光追，但只解决了**求交（intersection）**这一个查询。

问题所在：支持更广的几何查询需要三样东西，而**标量高度区间（scalar height interval）无法全部提供**：
- **表面包围体（surface enclosures）** → 求交 + 距离搜索
- **面积估计（area estimates）** → 表面采样
- **法线/斜率界（normal bounds）** → 镜面流形搜索

论文的洞察：把"标量 min–max 界"升级为**一阶（仿射平面 + 残差）表示**，就能从同一个数据结构导出全部三类所需量。

### 关键技术

| 技术 | 说明 |
|------|------|
| **一阶层级节点** | 每节点存局部仿射高度平面 $h(\mathbf{u}) \approx a_0 + a_1 u + a_2 v$ 与保守残差界 $\epsilon$，即 $h(\mathbf{u}) \in [h_{aff}(\mathbf{u}) - \epsilon,\ h_{aff}(\mathbf{u}) + \epsilon]$。相比纯标量 $[h_{min}, h_{max}]$，保留了**空间梯度信息**。 |
| **表面包围体** | 仿射平面给出"倾斜面"，残差界给出"厚度带"，二者合成一个保守的**倾斜薄壳（slab-like enclosure）**，比轴对齐的标量包围盒紧致得多 → 更强的求交/距离剪枝。 |
| **面积估计** | 由平面高度与斜率 $(\partial h/\partial u, \partial h/\partial v)$ 解析地积分出曲面片元面积 $\int \sqrt{1 + |\nabla h|^2}\,dA$ → 用于无偏表面采样。 |
| **斜率界（slope bounds）** | 额外维护法线斜率的范围 → 用于镜面（specular）光路搜索，即经典的 **specular manifold / manifold walking** 类查询。 |
| **查询定制遍历** | 针对求交、距离、采样、镜面搜索分别设计遍历顺序与剪枝准则，而非一套通用遍历。 |

### 与相关工作的关系

- 已有 **tessellation-free 光追**（只做 ray-surface intersection）。
- 传统 **pre-tessellation** 路径：密集网格 → 内存爆炸。
- 本文补齐了 **surface sampling / specular manifold search / closest-point** 这三类此前"less explored"的查询。

---

## 公式

核心是节点级的一阶高度表示与保守残差界。记节点在纹理空间的参数域为 $D$，节点内的一阶（仿射）泰勒展开为

```math
h_{aff}(\mathbf{u}) = a_0 + a_1 u_1 + a_2 u_2,\qquad \mathbf{u}=(u_1,u_2)\in D
```

并对整节点取保守残差界 $\epsilon \ge 0$：

```math
\forall\,\mathbf{u}\in D:\quad
\bigl|\,h(\mathbf{u}) - h_{aff}(\mathbf{u})\,\bigr| \le \epsilon
```

于是节点内的**表面包围体**（倾斜薄壳）为

```math
\mathcal{E}_D = \bigl\{\, \mathbf{p} \;:\;
        h_{aff}(\mathbf{u}) - \epsilon \;\le\; h(\mathbf{u}) \;\le\; h_{aff}(\mathbf{u}) + \epsilon \,\bigr\}
```

**面积估计**：曲面片元 $dA$ 相对参数域的拉伸因子为 $\sqrt{1+|\nabla h|^2}$，在仿射近似下 $\nabla h = (a_1, a_2)$ 为常数，故

```math
A(D) \;\approx\; \mathrm{area}(D)\cdot\sqrt{1 + a_1^2 + a_2^2}
```

这正是表面采样所需的面积权重。

**误差下界（第 4.2 节思路）**：单元（cell）内的最大测地误差出现在由 4 个角点构成的 Delaunay 四面体的**外接球心**处，该球心是四角点在 $S^3$ 上的 4D 叉积（差分向量的零空间）归一化后的结果；最大外接半径即该单元的最大测地误差。$\binom{8}{4}=70$ 个候选四面体中只保留非退化、外接球为空且球心落在单元域内的。

---

## 实验结论

> ⚠️ 论文未提供 HTML 全文且 PDF 达 46 MB（超出工具 10 MB 上限），以下结论来自摘要与作者声明，**具体数值待人工查阅 PDF 确认**。

- **对比对象**：预镶嵌（pre-tessellation）方案 vs 各类查询专用（query-specific）基线。
- **内存**：相对预镶嵌有明显节省（摘要称 "memory savings over pre-tessellation"，**未给出具体倍数**）。
- **性能**：相对查询专用基线有性能提升，同时保持高效光追（**具体加速比待查**）。
- **应用场景**：焦散渲染、位移发光面采样、表面 PDE 求解器。

---

## 局限性

- **一阶近似的紧致性上限**：仿射平面 + 单个标量残差界仍是"一阶"模型，对高度场曲率剧烈变化（高频位移）的区域包围体仍偏松，剪枝效率下降。
- **预计算成本**：层级建立需要对每个节点求解最优仿射平面并求保守残差界，属于离线阶段开销。
- **依赖位移贴图的 UV 参数化**：直接在纹理空间构建层级，对 UV 断裂/seam 区域与非一致参数化需额外处理。
- **未验证的面**：论文摘要未说明是否支持动态/动画位移贴图、是否支持 GPU 实时光追（vs 仅离线/科学计算）。

---

## 相关工作

- Tessellation-free ray tracing（本文所扩展的直接光追工作）
- [[2026-10-15-SUPRA-TEX-PBR-Texture-Generation]]
- [[Displacement-Mapping]]（概念笔记，待建）
- [[Specular-Manifold-Search]]（概念笔记，待建）

---

## 实现建议

- **实现难度**：**高**。需要从零实现纹理空间层级构建（仿射拟合 + 残差界求解）、四类查询的定制遍历与剪枝，以及数值稳定性处理（边界单元只有半个宽，需特殊处理）。
- **预期性能**：内存显著低于预镶嵌方案（位移贴图场景数量级优势可期）；速度介于朴素光追与预镶嵌 BVH 之间。**具体数字必须实测**。
- **适用场景**：
  - 高分辨率位移贴图资产（毛发细节、地形、织物微几何）的离线渲染
  - 焦散（caustics）路径追踪中需要在位移面/位移发光体上采样与搜索
  - 表面 PDE 求解器（几何处理与物理模拟的耦合）
  - 内存受限的大规模场景（避免为细节付出网格代价）
- **对 @墨鱼丸 的建议**：**优先实现"仿射平面 + 残差界"的层级表示与求交遍历**作为最小可行版本，先验证包围体紧致性收益；面积估计与镜面搜索可作为第二阶段增量。该表示与经典 displacement map 的切线空间求交数学天然衔接，实现风险可控。
- **优先级**：**中**。属于渲染基础设施型工作，收益明确但不炫目；适合作为渲染器的一层可选加速结构接入。