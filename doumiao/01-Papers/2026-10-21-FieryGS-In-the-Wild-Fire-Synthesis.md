---
type: paper
created: 2026-10-21
updated: 2026-10-21
tags: [paper, fluid-rendering, fire-simulation, 3DGS, volume-rendering, combustion, MLLM]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2605.00177
---

# FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FieryGS: In-the-Wild Fire Synthesis with Physics-Integrated Gaussian Splatting |
| **arXiv ID** | 2605.00177v2（v2 修订版） |
| **作者** | Qianfan Shen, Ningxiao Tao, Qiyu Dai, Tianle Chen, Minghan Qin, Yongjie Zhang, Mengyu Chu, Wenzheng Chen, Baoquan Chen |
| **机构** | 北京大学 PKU-VCL 等 |
| **分类** | cs.GR, cs.CV |
| **发表** | 2026-04-30（v2 更新） |
| **链接** | [arXiv](https://arxiv.org/abs/2605.00177) · [PDF](https://arxiv.org/pdf/2605.00177v2) · [Project](https://pku-vcl-geometry.github.io/FieryGS/) |

---

## 核心贡献

> 在真实野外场景的 3DGS 管线内集成物理准确、用户可控的燃烧**模拟与渲染**，让火焰自动与场景几何、材质保持一致，无需手工调参与专家工作流。

1. **MLLM 驱动的物理材质推理**：用多模态大语言模型从场景图像自动推断可燃性/材料参数。
2. **高效体积燃烧模拟**：直接对场景体积做燃烧求解，而非逐火焰手工建模。
3. **火焰与 3DGS 的统一渲染器**：单次渲染同时输出火焰与重建场景，避免分层合成。
4. **支持复合现象与用户控制**：火焰传播、烟雾扩散、表面碳化；可精确控制火焰强度、气流、点火位置等参数。

---

## 技术方案

### 核心思想

传统 CFD/图形管线能出真实火焰，但依赖**手工几何、专家调参、劳动密集工作流**，无法规模化到真实世界。3DGS 能高保真重建真实场景，但**缺乏燃烧的物理基础**。FieryGS 把二者紧耦合。

### 三大耦合模块

| 模块 | 技术 | 说明 |
|------|------|------|
| (1) 物理材质推理 | **MLLM 语义→物理属性映射** | 从图像识别木材/织物/植被等，推断燃烧热值、燃点、含水率、烟产率等 |
| (2) 燃烧模拟 | **高效体积燃烧求解** | 体素/网格上的燃烧反应-输运耦合（reaction–transport），火焰传播、烟羽平流 |
| (3) 统一渲染 | **火焰 + 3DGS 单次渲染** | 火焰以体积/粒子形式与 GS 场景在同一渲染管线合成，保证遮挡、深度、互作用正确 |

### 燃烧反应项（示意）

```math
\underbrace{\frac{\partial(\rho Y_f)}{\partial t}}_{\text{fuel}}
+ \underbrace{\nabla\cdot(\rho \mathbf{u} Y_f)}_{\text{advection}}
= \underbrace{\dot\omega}_{\text{Arrhenius reaction}}
- \underbrace{A \rho \frac{Y_f}{\tau}}_{\text{turbulent dissipation}}
```

```math
\dot\omega = A\,\exp\!\left(-\frac{E_a}{RT}\right)\rho\,Y_f^{\,n}(1-Y_f)\,(1-\alpha)
```

其中 $Y_f$ 为燃料质量分数，$A,E_a$ 由 (1) 的 MLLM 材质推理给出，$(1-\alpha)$ 为氧气耦合项——这是火焰需要氧气而非「自由燃烧」的物理来源。碳化项则作用在表面 GS 上：

```math
\frac{d\chi_c}{dt} = -k_c\, q_{\text{rad}}(\mathbf{x}, t)\, H(\chi_c)
```

$q_{\text{rad}}$ 为入射辐射通量，$H$ 为阶段指示函数，使碳化呈非线性的两阶段过程。

---

## 实验结论

- **场景**：多样化的室内与室外真实场景
- **对比基线**：CFD/图形传统管线、3DGS 变体
- **结果**：在**视觉真实性、物理保真度、可控性**三方面均优于全部对比基线
- **能力展示**：火焰传播、烟雾扩散、表面碳化；用户可调火焰强度、气流、点火位置等

---

## 局限性

1. **依赖高质量场景重建**：需要预先完成的 3DGS 场景（室内/室外），非「从零生成」。
2. **MLLM 材质推理的置信度**：从 RGB 图像推断热物性是弱监督的估计，错误会静默传播。
3. **体积网格的内存与分辨率权衡**：体素网格无法承载超大场景，需要多分辨率/局部区域策略。
4. **碳化与材质双向耦合**：燃烧会改变材质属性，需与 GS 训练联合更新，流程复杂度高。
5. **静态可燃物假设**：不处理液体燃料流动、自蔓延化学等复杂反应。

---

## 相关工作

- [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]]（同为 3DGS 原生燃烧，WildFireGS 走粒子路线，FieryGS 走体积路线 —— **关键对照**）
- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]]（生成模型路线，第三条技术路线）
- [[2603.19063 Fire as a Service — 机器人仿真器火焰动力学]]
- 概念：[[体积燃烧模拟]]、[[MLLM 物理参数推理]]、[[统一火焰-GS 渲染]]、[[Arrhenius 燃烧模型]]

---

## 实现建议

🩸 可行性分析：体积燃烧模拟 + 3DGS 统一渲染

### 渲染方法
- 类型：**体积渲染**（燃烧/烟雾）+ **表面渲染**（3DGS 场景与碳化表面）—— 混合管线
- 技术：体素网格 reaction-transport 求解 + Ray Marching 火焰/烟雾，与 GS splatting 统一合成

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（火焰+烟+碳化三现象齐备，物理保真与可控性均强）
- 风格化支持：部分（参数可控偏物理参数，非艺术风格）

### 性能预期
- 帧率：离线/近线（分钟级每帧量级），实时需大幅降分辨率
- GPU 需求：≥16–24GB 显存（体素网格 + GS 场景并存）
- 内存占用：体素网格为显存主项；$128^3$ RGBA 火焰场 ≈ 32MB，可接受

### 实现建议
- 着色器复杂度：**高**（体积 ray marching + 火焰发光映射 + GS 合成三合一）
- 管线要求：3DGS 重建 → MLLM 材质推理 → GPU 体素燃烧求解 → 统一渲染器；材质属性需可回写 GS
- 推荐度：✅ **强烈推荐**用于影视级火焰/火灾特效；⚠️ 实时场景需分辨率自适应与仅火焰关键帧重算

**三条技术路线对照（本次检索的核心洞察）**：

| 路线 | 代表 | 载体 | 适用 |
|------|------|------|------|
| 粒子（3DGS 原生） | WildFireGS | Gaussian 基元即粒子 | 大尺度、稀疏分布火焰 |
| 体积（体素网格） | FieryGS | 体素 reaction-transport | 密集火焰+烟雾+碳化 |
| 生成（扩散+物理奖励） | FluidGen | 视频扩散模型 | 离线资产生成 |

三者互补：**粒子**省内存、**体积**表现力强、**生成**免建模。建议工程上采用粒子+体积混合，生成模型用于概念预演。

已传递给 @墨鱼丸。