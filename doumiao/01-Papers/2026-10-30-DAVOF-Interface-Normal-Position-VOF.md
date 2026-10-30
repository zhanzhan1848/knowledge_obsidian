---
type: paper
created: 2026-10-30
updated: 2026-10-30
tags: [paper, fluid-rendering, free-surface, vof, interface-reconstruction, numerics, compact]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.38863
arxiv_id: 2610.38863
---

# Dual Area-Volume-of-Fluid (DAVOF): co-advecting volume and face-area fractions for a closed-form, cell-local interface normal and position on unstructured meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dual Area-Volume-of-Fluid (DAVOF): co-advecting volume and face-area fractions for a closed-form, cell-local interface normal and position on unstructured meshes |
| **作者** | Tomislav Marić (TU Delft / LEIA) |
| **arXiv** | [2610.38863](https://arxiv.org/abs/2610.38863) |
| **分类** | physics.comp-ph (primary); math.NA; physics.flu-dyn |
| **发表** | 2026-10-28 20:36 UTC |
| **篇幅** | 45 页，9 图，18 表 |
| **代码** | [tmaric/TwoPhaseFlow (branch davof)](https://github.com/tmaric/TwoPhaseFlow) · [leia-openfoam/leia (branch development)](https://github.com/leia-openfoam/leia) |

---

## 核心贡献

> 在几何 VOF 中首次实现了**单元内闭合形式（closed-form）的自由液面法向与位置重建**，且不需要邻居信息或迭代。

1. **面积-体积双输运**：与每个单元的体积分数同步地，额外输运每个面（face）的润湿面积分数——这是本方法的核心新增自由度。
2. **法向的闭式恢复**：通过对该单元**自身各面**的一次求和即可得到界面法向（无需邻域 stencil）。
3. **位置的闭式恢复**：通过散度定理作用于液体子体积，再由第二个恒等式得到平面位置。
4. **精度与稳定性**：在六面体、扰动六面体与多面体网格上两个恒等式均为**精确解**；球面/椭球面上法向误差与面分数同阶、位置误差为二阶；由一圈恢复法向拟合的二次曲面可给出收敛曲率（而参考模型在同情形下无曲率可用）。
5. **长时稳定性**：配合平面裁剪 + 环法向输运，球体可**有界、守恒**地推过 3.3 个直径。

---

## 技术方案

### 核心思想

经典几何 VOF（PLIC / MO 法）在**非结构化网格**上的致命弱点是：界面方向必须从**邻居单元的体积分数 stencil** 推断。在不规则单元上以及存在细丝（wisps）时该推断退化，而退化出的曲率又反过来驱动毛细流的**寄生电流（parasitic currents）**。

DAVOF 的思路是：**把几何量提升到面上**。既然体积分数是单元量、且已是 VOF 的一等公民，那么"每个面被液体润湿的比例"理应与体积分数一致地被输运。输运完面积分数与体积分数之后，两个量合在一起就足以在**单元内部**闭合地恢复出界面平面——法向来自一次求和，位置来自散度定理，无需任何邻居访问。

### 关键技术

| 技术 | 说明 |
|------|------|
| **面润湿分数（face fraction）** | 与单元体积分数同阶输运的新增自由度，刻画界面对单元各面的切割比例 |
| **单元内闭合形式法向** | `n` 由该单元自身各面的一次求和得到（而非邻域 stencil），对平面界面在六面体/扰动六面体/多面体上精确 |
| **散度定理定位置** | 对液体子体积应用散度定理得到第二个恒等式，闭式求出平面在单元内的位置（对所有状态与网格为二阶） |
| **环法向 + 二次曲面拟合** | 用单元的一圈（ring）恢复法向拟合二次曲面，得到**收敛的曲率**——参考模型（PLIC/plicRDF）在此情形下无曲率 |
| **plicRDF 对标** | 与同作者的 plicRDF 界面重构在位置误差与形状误差上做对比；DAVOF 误差水平与 plicRDF 相当，但稳定性显著更好 |

---

## 实验结论

- **数据集 / 算例**：球体、椭球体在非结构化网格上的输运；分辨率阶梯 N = 32 → 128。
- **基线**：几何 VOF 的 plicRDF 界面重构；isoAdvector 界面平流（drop deformation 算例中）。
- **结果**：
  - 球体推过 **3.3 个直径**仍**有界且守恒**。
  - 精确法向输运时面分数误差约 **2.8 / 周期**；使用环二次曲面法向时约 **2.1 / 周期**。
  - 输运法向的精度阶**等于喂给它的法向的精度阶**——作者明确指出"输运二阶法向"是后续研究目标（本文是方法基础文档）。

---

## 局限性

- 精度上限受限于**被输运的法向本身的精度阶**（当前闭环未提升阶数）。
- 45 页的基础性文档，作者自述"further development of the method is documented on this basis"，即方法尚在演进中。
- 主要面向**两相流 VOF 数值**，未涉及任何渲染/着色/可视化目标。

---

## 与流体渲染的关系 ⭐⭐⭐⭐⭐

这是本批次**与渲染最直接相关**的论文，虽然它本身是数值方法论文：

1. **界面法向/位置 = 渲染的输入契约**：屏幕空间流体渲染（SSR）、自由液面着色、折射/反射法线、菲涅尔项，全部依赖可靠的液面法向与位置。DAVOF 提供的"闭式、单元内、无需邻居"的法向，在**非结构化网格**（VFX 常用的 tet/prism 网格）上正是渲染管线最难获得的信息。
2. **寄生电流的消除 = 视觉质量的提升**：毛细流的寄生电流在渲染中表现为**液面出现"爬行"的细密伪影/网格化条纹**（spurious currents → shimmering interface artifacts）。DAVOF 抑制寄生电流，等价于直接改善自由液面的着色稳定性。
3. **保守性 = 体积守恒**：球体推过 3.3 直径仍有界守恒，意味着**液体体积不增减**，渲染中的水体不会"凭空消失/膨胀"。
4. **可落地性**：作者同时维护了 OpenFOAM 分支（leia），说明该方法已进入**工业级 CFD 代码库**的工程语境，具备直接移植到生产渲染管线（如 Houdini FLIP / Mantaflow / 自研求解器）的潜力。

---

## 实现建议

- **实现难度**：🔴 高（需改造 VOF 求解器的输运项：额外面分数场的守恒输运 + 多项式界面的平面拟合）
- **预期性能**：面分数场增加一个标量场的显存与带宽开销；单次法向恢复为**单元内 O(1)** 闭式计算，相比邻域 stencil 的 gather **更省带宽**，有望抵消额外场成本
- **适用场景**：
  - ✅ **非结构化网格**上的实时自由液面（VFX、游戏）
  - ✅ 毛细流/小尺度液滴（寄生电流最敏感的尺度）
  - ⚠️ 规则笛卡尔网格上收益较小（PLIC 已足够精确且邻居 stencil 便宜）

---

## 相关工作

- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]] — 任意拓扑曲面点涡方法
- [[2026-10-24-Dynamic-Caustics-Ultrasonic-Liquid-Surface]] — 动态焦散（依赖液面几何）
- [[2026-10-16-Tessellation-Free-Displaced-Surfaces-Water-Caustics]] — 无细分位移面焦散

---

**搜索来源**: arXiv cs.GR / physics.comp-ph / physics.flu-dyn（2026-10-28 提交，24h 窗口内）
**检索日期**: 2026-10-30
**已传递给**: @墨鱼丸
