---
type: paper
created: 2026-10-24
updated: 2026-10-24
tags: [paper, water-rendering, caustics, refraction, ultrasound, digital-twin, interactive-display]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2505.16397
---

# Dynamic Caustics by Ultrasonically Modulated Liquid Surface

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic Caustics by Ultrasonically Modulated Liquid Surface |
| **arXiv ID** | 2505.16397v1 |
| **作者** | Koki Nagakura, Tatsuki Fushimi, Ayaka Tsutsui, Yoichi Ochiai |
| **发表** | arXiv cs.GR / cs.HC 2025-05-22；已发表于 **Scientific Reports**（DOI: 10.1038/s41598-025-16190-3） |
| **链接** | [原文](https://arxiv.org/abs/2505.16397) |
| **机构** | University of Electro-Communications / Sony CSL 等 |
| **渲染类别** | **表面渲染（焦散）+ 折射介质 + 交互装置** |

---

## 核心贡献

> 用**相位阵列换能器（Phased Array Transducer, PAT）超声调制液面**，把"液体表面作为折射介质生成动态焦散"从纯仿真推进到**真实物理系统实现**，并用 **Digital Twin 框架**闭环优化。

1. **超声驱动液面**：用 PAT 直接操纵液体表面形状，从而动态生成焦散图案。
2. **双优化全息场（dual-optimised holographic fields）**：为 PAT 优化两个全息场，实现对液面形态的精确控制。
3. **Digital Twin 闭环**：迭代反馈 + 精化，提升焦散图案的准确性与质量。
4. **首次把"液体表面作折射介质"这一概念在实践中完整实现**（此前仅存在于仿真中）。
5. **实时可扩展**：可生成高频连续动画与复杂焦散图案。

---

## 技术方案

### 核心思想

焦散（caustics）是光线在**曲率变化**的折射界面（如起伏水面）上聚焦形成的亮斑集合。生成动态焦散的常规途径有两类：

| 途径 | 局限 |
|------|------|
| 纯仿真（数值求解液面） | 无法真实闭环控制；与物理系统脱节 |
| 固态刻纹曲面 | 图案固定，缺乏实时可适应性 |

本工作的第三条路：**用超声直接"雕刻"液体表面** —— 把液体表面本身变成可编程的折射介质。

```
PAT 全息场 → 超声换能器 → 液体表面形变 → 光线折射 → 动态焦散
                    ↑                                    │
                    └────── Digital Twin 反馈优化 ←──────┘
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Phased Array Transducer (PAT)** | 相控阵超声换能器，多束超声叠加聚焦 → 定点施加压力扰动 |
| **Dual-optimised Holographic Fields** | 为 PAT 优化的全息场，精确指定多焦点位置/形态 |
| **Digital Twin Framework** | 仿真-实测对比的迭代反馈与参数精化 |
| **Liquid Surface as Refractive Medium** | 以液面为折射界面计算焦散 |
| **Ultrasonic Surface Modulation** | 超声压力场在液面上形成驻波/可控起伏 |

---

## 公式

**焦散条件**：出射光线方向对入射角不再是一一映射，Jacobian 退化为零处产生焦点：

```math
\left\| \frac{\partial \mathbf{r}_{\text{out}}}{\partial \mathbf{r}_{\text{in}}} \right\| = 0
\quad \Rightarrow \quad \text{caustic (焦散)}
```

其中出射方向由 Snell 定律经曲面法向 $\mathbf{n}(\mathbf{x})$ 决定：

```math
\mathbf{r}_{\text{out}} = \eta\, \mathbf{r}_{\text{in}} + \left(\sqrt{1 - \eta^2 (1 - (\mathbf{r}_{\text{in}}\cdot\mathbf{n})^2)} - \eta\, (\mathbf{r}_{\text{in}}\cdot\mathbf{n})\right)\mathbf{n}
```

**声场与液面位移**：超声在液面产生的位移近似正比于声压的包络：

```math
\zeta(\mathbf{x}) \propto \sum_{k=1}^{K} A_k\, \left| \mathrm{Bessel}\!\left( k_k |\mathbf{x} - \mathbf{f}_k | \right) \right|
```

其中 $\mathbf{f}_k$ 为第 $k$ 个超声焦点，$k_k$ 为波数。

**Digital Twin 闭环**：以实测焦散图案与仿真预测的差异为反馈：

```math
\mathcal{L} = \sum_{p \in \mathcal{P}} \left\| I_{\text{sim}}(\mathbf{p}; \boldsymbol{\theta}) - I_{\text{meas}}(\mathbf{p}) \right\|^2,
\qquad
\boldsymbol{\theta}^* = \arg\min_{\boldsymbol{\theta}} \mathcal{L}
```

$\boldsymbol{\theta}$ 为 Digital Twin 的状态/控制参数。

---

## 实验结论

- **系统**: PAT + 液槽 + 投影光路 + Digital Twin 控制器
- **结果**:
  - 成功生成**连续动态动画**与**复杂高频焦散图案**
  - Digital Twin 迭代反馈显著提升图案准确性与质量
  - 相比固态刻纹曲面：**实时可适应性 + 可扩展性**明显占优
- **对比**: 固态曲面方法（对比度与分辨率更高，但无动态适应性）

---

## 局限性

- **对比度与分辨率低于固态曲面方法**（论文明确承认）。
- **系统硬件依赖强**：PAT 换能器 + 超声驱动电路 + 液槽，**不可移植到软件渲染管线**。
- 液面响应有**带宽上限**，高频图案受限于超声换能器阵列规模。
- 摘要未给出定量图案质量指标。

---

## 相关工作

- [[Tessellation-Free-Displaced-Surfaces-Water-Caustics]] — 2026-10-16 收录，数值法水焦散
- [[Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]] — 海浪波动力学
- [[Real-Time-Hybrid-Ocean-WP-FFT]] — FFT 海面
- [[Caustics]] / [[Snell-Law]] / [[Refraction]]
- [[Digital-Twin]]

---

## 实现建议

- **实现难度**：🔴 极高（需硬件：PAT 换能器 + 超声驱动 + 伺服控制）
- **预期性能**：实时（物理系统本身即实时）
- **适用场景**：交互式显示装置、艺术装置、教育演示

### 🌱 豆苗评注

**这是一篇"硬件装置论文"，但它对软件渲染有一个被低估的启发：焦散的"驱动源"可以脱离数值模拟。**

我们通常认为焦散是"给定液面形状 → 前向计算焦散"的过程，即**液面是输入，焦散是输出**。这篇论文反过来做了：**把焦散图案当作目标，用物理手段（超声）去实时塑造液面使之匹配** —— 这是一个**逆向控制**范式。

这个思路可以迁移到纯软件层面：**给定目标焦散图案，逆向求解液面**。数值上就是一次优化（类似本库已有的 [[SmokeSVD-Single-View-Smoke-Reconstruction]] 的逆向思路），但换成了"给定目标光学输出 → 逆向求解流体表面形状"。这在**艺术化场景制作**里价值很高：美术只描述"我想要这样的水底光斑"，求解器负责找出该让水面怎么动。

Digital Twin 的闭环结构也值得记住 —— 它明确区分了**"物理系统的真实状态"与"仿真预测的状态"**，并用实测差异驱动修正。在纯渲染领域，对应的就是**用最终渲染图反推流体状态参数**（比如反推液面的高程场），这正是可微渲染/可微模拟的前沿方向。

---

## 🩸 可行性分析：目标焦散驱动的逆向液面求解

## 渲染方法
- 类型：表面渲染（折射 + 焦散）
- 技术：给定目标焦散图案，逆向优化液面高程场（可微光追/梯度下降）

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（物理正确的折射焦散）
- 风格化支持：⭐⭐⭐⭐（目标图案可任意设计）

## 性能预期
- 帧率：离线求解（秒~分钟级）；运行时纯前向焦散计算可实时
- GPU 需求：中高（可微渲染 pass 多遍）
- 内存占用：中高

## 实现建议
- 着色器复杂度：高
- 管线要求：可微光追 + 液面高度场参数化 + 梯度优化
- 推荐度：⚠️（离线资产制作可用，实时不可行）
