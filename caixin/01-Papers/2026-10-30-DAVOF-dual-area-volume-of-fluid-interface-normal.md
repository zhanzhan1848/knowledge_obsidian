---
type: paper
created: 2026-10-30
updated: 2026-10-30
tags: [paper, fluid, CFD, VOF, multiphase, interface-capturing, unstructured-mesh]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.38863
---

# Dual Area-Volume-of-Fluid (DAVOF): co-advecting volume and face-area fractions for a closed-form, cell-local interface normal and position on unstructured meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dual Area-Volume-of-Fluid (DAVOF): co-advecting volume and face-area fractions for a closed-form, cell-local interface normal and position on unstructured meshes |
| **作者** | Tomislav Marić (TU Darmstadt) |
| **发表** | arXiv:2610.38863 [physics.comp-ph, math.NA, physics.flu-dyn], 2026-10-28 |
| **链接** | [原文](https://arxiv.org/abs/2610.38863) |
| **DOI** | - |
| **代码** | https://github.com/tmaric/TwoPhaseFlow (作者 TwoPhaseFlow 库) |
| **篇幅** | 45 pages, 9 figures, 18 tables |

---

## 核心贡献

> 用"面湿润分数 (face-area fraction)"与"体积分数"双输运，**首次**在 VOF 中实现单元局部、闭式、无需邻域搜索/迭代的界面法向与位置解析恢复。

1. **双变量输运**：与每个单元的体积分数 α 一致地输运每个面的湿润面积分数 α_f，使界面几何信息成为守恒输运量而非事后重构量。
2. **闭式界面法向**：法向 = 对单元自身各面的面分数求一次和（面积加权），由液相子体积的散度定理给出；**不需要 stencil 邻域、不需要迭代**。
3. **闭式界面位置**：界面平面位置由第二次求和得到，同样是单元局部、精确的。
4. **曲率改进**：通过单环（one-ring）恢复的法向构造二次曲面（quadric）拟合，得到收敛的曲率——而对比的参考模型在同等条件下根本给不出曲率。
5. **寄生电流抑制**：基于该曲率的界面输运把球体有界、守恒地输运超过 3.3 个直径，误差处于 plicRDF 同级别。

---

## 技术方案

### 核心思想

经典几何 VOF 在非结构多面体网格上用**邻域 stencil 的体积分数**来重构界面方向。在不规则单元和"细丝 (wisp)"工况下该方法退化 → 曲率不准 → 毛细流的**寄生电流 (parasitic currents)**。DAVOF 的思路是换掉信息载体：

- 体积分数 α 描述体积占据率；
- 面分数 α_f 描述界面切割面的湿润比例；
- 由 (α, α_f) 用散度定理 + 面积加权直接**解析**还原界面的法向 n 与位置 d（无需邻域、无需迭代）。

关键恒等式对六面体、扰动六面体与任意多面体上的**平面界面严格成立**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **面-体积双输运** | 与 α 一致地推进 α_f，保持守恒性；α_f 的阶数决定法向精度（"the loop has the order of the normal it is fed"） |
| **散度定理法向恢复** | 对液相子体积积分 ∮ n·dA = ∫ α_f dA，得界面法向；单元局部闭式 |
| **第二次求和定位** | 由体积分数 + 面分数求界面平面截距 d |
| **One-ring quadric 曲率** | 用单元单环恢复的法向拟合二次曲面，得到收敛曲率（参考模型无曲率） |
| **平面裁剪输运** | 将恢复的平面用于输运，配合 ring normal / ring union 同一恒等式稳定状态、守恒输运 |
| **解析曲面重建** | 每单元一个抛物面：法向定框架，ring 曲率张量定曲率，体积分数定位置 |
| **收敛性阶** | 面分数阶 → 输运精度阶；N=32→128 网格阶梯验证 |

---

## 公式

```math
\text{法向（面积加权，单元局部）:}\quad
\mathbf{n} \propto \sum_{f \in \partial \Omega_c} \alpha_f\,\mathbf{A}_f
```

```math
\text{散度定理（液相子体积）:}\quad
\int_{\Omega_c} \mathbf{n}\,\mathrm{d}V
= \oint_{\partial \Omega_c \cap \Gamma} \mathbf{n}\,\mathrm{d}A
= \sum_{f} \alpha_f\, \mathbf{A}_f
```

```math
\text{界面位置（第二次求和）:}\quad
d = \frac{\sum_{f} \alpha_f\,(\mathbf{x}_f\cdot\mathbf{n})}
         {\sum_{f} \alpha_f\,(\mathbf{A}_f\cdot\mathbf{n})}
```

```math
\text{二次曲面曲率（one-ring）:}\quad
\mathbf{x}(\mathbf{r}) \approx \mathbf{x}_c + \mathbf{n} \tfrac{1}{2}\mathbf{r}^{\mathsf T}\mathbf{H}\mathbf{r},
\quad \mathbf{H} = \text{曲率张量}
```

---

## 代码片段

```text
# 作者开源库（含 plicRDF / isoAdvector 等对比方法）
# https://github.com/tmaric/TwoPhaseFlow

# DAVOF 输运回路（概念性伪代码）
for cell in mesh.cells:
    alpha[cell]      # 体积分数（输运量）
    alpha_face[cell] # 面湿润分数（与 alpha 一致地输运）

    # 1) 闭式法向：单元自身面求和
    n = normalize(sum(alpha_face[f] * A[f] for f in cell.faces))

    # 2) 闭式位置：第二次求和
    d = sum(alpha_face[f] * dot(x[f], n) for f in cell.faces) / \
        sum(alpha_face[f] * dot(A[f], n) for f in cell.faces)

    # 3) 曲率：one-ring quadric
    H = fit_quadric_curvature(normals_from_one_ring(cell), n)

    # 4) 解析曲面输运（抛物面）
    transport_paraboloid(alpha, n, H, d)
```

---

## 实验结论

- **数据集/算例**：球体、椭球在非结构网格上的输运；PLIC-RDF、isoAdvector 作为基准。
- **基线**：plicRDF、isoAdvector（几何 VOF 标准方法）。
- **结果**：
  - 球面/椭球上法向误差 = 面分数阶；位置误差为二阶，且对所有状态与网格一致。
  - 一次环法向构造的二次曲面给出**收敛曲率**，而参考模型**无曲率**。
  - 球体有界、守恒输运 **超过 3.3 个直径**，误差水平与 plicRDF 的位置/形状误差相当。
  - 抛物面解析输运实现：面分数阶约 2.8/周期（精确法向）、2.1（ring quadric 法向），N=32→128 网格阶梯一致。

---

## 局限性

- 当前输运回路精度**受限于所输入法向的阶数**；二阶输运法向仍是**研究目标**（作者明示）。
- 初步实现每单元一个抛物面，尚未处理复杂界面拓扑（多个面片同时存在）。
- 文档定位为"该方法进一步开发的基础文档"，属**方法论奠基**而非成熟软件。

---

## 相关工作

- [[2026-10-30-VOF-drop-breakup-rotating-cylinders-plicRDF]]
- [[plicRDF]]
- [[isoAdvector]]
- [[几何VOF界面重构]]
- [[寄生电流]]
- [[两相流界面输运]]

---

## 实现建议

- **实现难度**：🔴 高。需要修改 VOF 求解器的输运核心，引入面分数这一新的守恒场；接口裁剪、面-体积守恒性的证明性验证是主要工作量。
- **预期性能**：单步输运成本约为标准 VOF 的 1.5–2 倍（多一个面分数场 + 逐面几何运算）；换来的是**不需要邻域 stencil**（省内存/通信）与**曲率可用性**（毛细流寄生电流大幅降低）。
- **适用场景**：非结构多面体网格 + 界面张力主导（毛细、破裂、液滴）问题；网格高度畸变或存在细丝的区域优势最明显。
- **落地建议**：可先在现有 plicRDF 实现上做**旁路验证**（同一网格、同一时间步，比较恢复法向/位置与 plicRDF 的一致性），确认守恒后再切换输运回路。

已传递给 @墨鱼丸。
