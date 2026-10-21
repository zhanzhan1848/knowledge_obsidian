---
type: paper
created: 2026-10-21
updated: 2026-10-21
tags: [paper, fluid-rendering, fire-simulation, 3DGS, particle-system, combustion, wildfire, digital-twin]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2608.11100
---

# WildFireGS: Physics-Based Wildfire Simulation in Large-Scale Semantics-Enriched Gaussian Splatting Forest Scenes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | WildFireGS: Physics-Based Wildfire Simulation in Large-Scale Semantics-Enriched Gaussian Splatting Forest Scenes |
| **arXiv ID** | 2608.11100v1 |
| **作者** | Nienke Driessen, Joris Rijsdijk, Sören Pirk, Wojtek Palubicki, Dominik L. Michels, Michael Weinmann |
| **机构** | NVIDIA / UC San Diego / 相关研究机构（作者组合与 SIGGRAPH Asia 2026 页面列出的 UCSD + NVIDIA 一致） |
| **分类** | cs.GR |
| **发表** | 2026-08-11（近期，与 [[2026-10-19-FluidGen]] 属同一研究脉络） |
| **链接** | [arXiv](https://arxiv.org/abs/2608.11100) · [PDF](https://arxiv.org/pdf/2608.11100v1) |

---

## 核心贡献

> 在大规模、语义增强的 3D Gaussian Splatting 森林重建上**原生**运行基于粒子的燃烧模拟，无需转换为显式网格或体积网格——打通「学习式场景重建」与「环境物理模拟」。

1. **语义与材质属性增强的高斯**：给 Gaussian primitive 附加**植被类型**与**燃料特性（fuel characteristics）**语义，使可燃性成为场景的原生属性。
2. **原生粒子燃烧模型**：点火（ignition）、热传递（heat transfer）、燃烧（combustion）、火焰传播（flame propagation）全部直接在 Gaussian 表示上求解。
3. **模块化的雨致冷却机制**：以**能量汇（energy-sink）**过程建模降雨灭火，模块可插拔。
4. **现实环境数字孪生路径**：直接在真实航拍影像重建的场景上做物理仿真，而非只在合成/理想化森林中。

---

## 技术方案

### 核心思想

现有基于物理的野火模型（显式模拟燃烧、热传递、燃料动力学）虽然真实度高，但**受限于合成环境**：需要完整且理想化的森林结构知识，无法应用于航拍影像捕获的真实环境。

WildFireGS 的关键洞察是：3DGS 已经能提供高质量、大尺度的真实场景重建，缺的只是**物理属性**。因此不去改造高斯表示（不做 mesh/volumetric 转换），而是**把语义与燃料属性「长」在高斯上**，让粒子燃烧模型直接在 3DGS 基元上运行。

### 关键技术

| 技术 | 说明 |
|------|------|
| 语义增强 Gaussian | 每个高斯附加植被类别 + 燃料参数（可燃性、含水量、热值、燃烧速率系数） |
| 3DGS 原生粒子系统 | 火焰/热辐射粒子即为高斯基元本身，省去 mesh↔grid 转换与重建误差 |
| 燃料消耗模型 | 燃烧消耗有限燃料 → 影响持续时间与传播强度（fuel depletion） |
| 热传递 | 粒子间/辐射热传导，驱动温度场演化 |
| 风场耦合 | 传播速率随风速变化（迎风/背风坡不对称） |
| 地形坡度耦合 | 上坡燃烧更快（slope-dependent spread），符合真实野火行为 |
| 能量汇冷却模块 | 降雨作为能量汇项注入能量方程，实现 firebreak / containment |
| 火带（firebreak）实验 | 通过预设隔离带验证可控性与消防规划可用性 |

### 能量方程与传播模型（示意）

```math
\underbrace{\rho c_p \frac{\partial T}{\partial t}}_{\text{sensible heat}}
= \underbrace{\nabla\cdot(k\nabla T)}_{\text{conduction}}
+ \underbrace{\dot{q}_{\text{ign}}}_{\text{ignition}}
+ \underbrace{\dot{q}_{\text{comb}}}_{\text{combustion}}
- \underbrace{\dot{q}_{\text{loss}}}_{\text{radiative + convective}}
- \underbrace{\dot{q}_{\text{rain}}}_{\text{energy sink}}
```

火焰传播条件（坡度-风致偏置，示意）：

```math
R_{\text{spread}} = R_0
\underbrace{\exp\!\big(\alpha\,\mathbf{w}\cdot\hat{\mathbf{n}}\big)}_{\text{wind alignment}}
\underbrace{\exp(\beta\,\sin\theta_{\text{slope}})}_{\text{slope bias}}
\underbrace{\big(1 - f_{\text{burned}}\big)}_{\text{fuel availability}}
```

含水率 $f_{\text{moist}}$ 直接调制 $R_0$，是雨致冷却生效的物理通道。

---

## 实验结论

- **数据集**：合成场景 + 真实航拍森林重建（大尺度、语义标注的 3DGS 场景）
- **验证的行为学指标**：
  - 传播速率随**植被密度**缩放
  - 随**风速**增大而加快
  - 随**地形坡度**变化（上坡更快）
- **应用验证**：
  - novel firebreak 实验（人为隔离带阻断传播）
  - 生物量损失估计（biomass loss estimation）
  - 雨致冷却/灭火模块的模块化演示
- **结论**：在合成与真实航拍场景上均产生**物理自洽**的野火行为

---

## 局限性

1. **仅火焰传播，未覆盖完整燃烧产物**：未显式模拟烟羽、灰烬沉降与粒径分布，因此不能直接产出影视级烟雾体积效果。
2. **高斯表示的物理近似粗糙**：Gaussian 是各向异性椭球，用其体积做热容/燃料量计算存在几何误差；大规模场景下逐粒子邻域查询开销高。
3. **依赖语义标注质量**：燃料特性来自语义分割/材质估计，分类错误直接传播为物理错误。
4. **实时性未在摘要中承诺**：面向数字孪生/风险评估，离线或近线（分钟～小时级）更合理。
5. **风场为输入而非模拟**：使用外部风场，未做复杂地形绕流求解。

---

## 相关工作

- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]]
- [[2026-04-30-FieryGS-In-the-Wild-Fire-Synthesis]]（同一脉络：3DGS + 燃烧模拟，室内外可控火焰）
- [[2603.19063 Fire as a Service — 机器人仿真器火焰动力学]]
- [[2607.22956 3DGS for Scientific Particle Data Compression and Rendering]]
- [[2606.21753 Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats]]
- 概念：[[3DGS 原生粒子系统]]、[[体积燃烧模拟]]、[[燃料消耗模型]]、[[环境数字孪生]]

---

## 实现建议

🩸 可行性分析：3DGS 原生粒子燃烧模拟

### 渲染方法
- 类型：**粒子渲染**（Gaussian splatting 作为粒子载体）+ 隐式温度场
- 技术：3DGS 基元即火焰粒子；沿用成熟 splatting 光栅化器（alpha blending / OIT）

### 视觉质量
- 逼真度：⭐⭐⭐⭐（火焰行为物理可信；烟羽表现待补）
- 风格化支持：部分（火焰参数可调，非艺术风格控制）

### 性能预期
- 帧率：模拟步为分钟～小时级（面向数字孪生）；若限制粒子数并降低空间分辨率，实时可行性存在但需工程优化
- GPU 需求：需 ≥24GB 显存（大尺度 3DGS 森林重建本身占内存）
- 内存占用：大尺度森林 GS 表示数十 GB 级；燃烧属性数组另需每高斯数十 float

### 实现建议
- 着色器复杂度：**中**（在 splatting shader 内插入温度/燃料/烟灰度调制）
- 管线要求：3DGS 重建（含语义）→ 属性扩展 → GPU 粒子求解 → 扩展 splatting 渲染器；邻域查询需空间哈希/网格加速
- 推荐度：✅ **强烈推荐**——把「渲染图元」与「模拟粒子」统一的设计极大简化管线，是粒子渲染领域值得复用的架构决策

**架构洞见（可迁移）**：让渲染表示直接承载模拟状态，避免了「模拟网格 → 渲染表示」的转换层，这在多物理场（流体+燃烧+粒子输运）统一仿真中价值极高。液体/烟雾场景亦可借鉴（SPH 粒子直接 splat）。

已传递给 @墨鱼丸。