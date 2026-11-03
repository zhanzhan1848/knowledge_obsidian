---
type: paper
created: 2026-11-03
updated: 2026-11-03
tags: [paper, fluid-rendering, turbulence, dissipation, lagrangian, eulerian, smoke, cascade]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2611.03029
---

# Contrasting Eulerian and Lagrangian organization of turbulent dissipation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Contrasting Eulerian and Lagrangian organization of turbulent dissipation |
| **作者** | Jeremie Bec, Ritwik Mukherjee, Siddhartha Mukherjee, Samriddhi Sankar Ray |
| **发表** | arXiv preprint (physics.flu-dyn) 2026-11-02 |
| **链接** | [原文](https://arxiv.org/abs/2611.03029) |
| **DOI** | 10.48550/arXiv.2611.03029 |
| **代码** | 未公布 |

---

## 核心贡献

> **推翻"经典 bridge relation"在单条轨迹层面的有效性**：Eulerian 与 Lagrangian 两个参考系下的湍流耗散组织方式**本质不同**，这是对湍流渲染"该看哪个场"的重要修正。

1. **Eulerian 框架**：粗粒化耗散呈**平方对数级联深度（squared-logarithmic cascade depth）** + **尺度依赖的乘子（scale-dependent multipliers）**。
2. **Lagrangian 框架**：沿轨迹的时间平均耗散呈**多重分形（multifractal）标度** + **近似尺度不变的时间级联**。
3. **经典 bridge 失效**：经典桥接关系在**单条轨迹层面**失败（"The classical bridge fails at the level of individual trajectories"）。
4. **但 Eulerian 乘子仍有分形组织**：其累积恰好解释了平方对数空间统计——由此引出**"物质继承（material-inheritance）"**图景：Eulerian 耗散统计反映的是**不同 Lagrangian 历史的空间装配、形变与混合**。

---

## 技术方案

### 核心思想

**背景问题**：湍流动能耗散 $\varepsilon$ 通常被认为服从**尺度不变的空间乘性级联**（scale-invariant spatial multiplicative cascade），而 Lagrangian（沿质点轨迹）统计量则通过 **bridge relations** 从 Eulerian 结果**推导**出来。

本文用**带示踪粒子的直接数值模拟（DNS with tracers）**直接测量两边，发现二者**不等价**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **示踪粒子 DNS** | 直接在 Lagrangian 框架测量，绕开 bridge 推导 |
| **粗粒化（coarse-graining）** | 定义 Eulerian 局部耗散 $\varepsilon(\mathbf{x},t)$（需 $2/3$ law 或滤波） |
| **多重分形分析** | 沿轨迹耗散的分形标度分析 |
| **物质继承图景** | 把 Eulerian 统计解释为 Lagrangian 历史的空间混合结果 |

### 两种框架的对比

| | Eulerian（空间） | Lagrangian（沿轨迹） |
|---|---|---|
| 级联深度 | **平方对数** | **近似尺度不变** |
| 乘子结构 | **尺度依赖** | **多重分形** |
| 经典 bridge | — | ❌ **失效**（单轨迹层面） |

---

## 渲染价值分析（豆苗视角）

### 🩸 可行性分析：湍流烟雾渲染该"追踪"还是"取样"

**这篇论文对"怎么让烟雾看起来对"给出了少见的、有物理依据的答案。**

### 三个具体的渲染影响

1. **"体积渲染采样 vs 粒子追踪"的分歧有了理论依据**：
   现实时最直观的湍流表现是"**一团烟被不断卷起、拉伸、撕碎**"——这是 **Lagrangian 的时间级联**（沿质点看，烟团经历**近似尺度不变**的连续碎裂，每一级尺度贡献相当能量）。而**屏幕空间逐像素积分（volume rendering）看到的是 Eulerian 场**，其空间统计是**平方对数**深度 + **尺度依赖乘子**。

   → **实操结论**：如果用 Eulerian 网格 + ray marching 渲染烟雾，**仅仅把速度场加进去不够**——需要额外引入**时间方向的卷曲记忆**（如粒子历史或涡量历史），才能重现"物质继承"的观感。反之，如果用大量粒子（Lagrangian）直接渲染，天然就更接近真实。

2. **"烟雾的细节应该在时间上还是空间上消失"？**
   本文给了明确答案：**时间上（沿轨迹）尺度不变**、**空间上非平稳**。
   → 这意味着：一个用 Eulerian 网格求解 + 屏幕空间渲染的烟雾系统，如果时间步进足够长，其空间细节会**以非平稳方式衰减**（平方对数），而不是经典级联预期的幂律。这解释了很多**实时烟雾"越跑越糊"且糊得没规律**的现象。
   → **对渲染的直接启示**：实时系统需要**显式的细节再注入机制**（curl noise 注入涡量、sub-grid 模型），因为被动依赖求解器的耗散会给出**错误的（平方对数）衰减律**。

3. **"物质继承"图景 → 多通道渲染的建议**：
   Eulerian 耗散统计 = 不同 Lagrangian 历史的**空间装配、形变、混合**。
   → 渲染上意味着：如果要表现"混合"，**单次通过一个场的 ray marching 是不够的**——需要**多历史叠加**（如多个不同起始时刻的速度场做混合/卷曲噪声叠加）。

### 实现建议

- **着色器复杂度**：中（需要速度场历史缓冲 + curl 噪声注入）
- **管线要求**：需要保留**速度场历史**（而非仅当前帧）→ 显存/带宽成本上升
- **推荐度**：⚠️ **理论参考**（不直接给出算法），但**对实时烟雾系统的"细节衰减律"诊断有高价值**

### 可落地的低成本方案

| 方案 | 做法 | 成本 |
|------|------|------|
| **涡量历史注入** | 保留最近 N 帧涡量场，按本文结论给时间级联**尺度不变**权重混合 | 中（多一张涡量 RT） |
| **多历史 curl 噪声** | 用 3~4 个不同时间偏移的速度场做加权叠加 → 模拟"不同 Lagrangian 历史的混合" | 低（复用已有速度场） |
| **粒子追踪预览** | 用 tracer 粒子离线生成"团块碎裂"序列，作为渲染参考/驱动 | 中（仅离线） |

---

## 实验结论

- **方法**：带示踪粒子的 DNS
- **结果**：
  - Eulerian 粗粒化耗散 → 平方对数级联深度 + 尺度依赖乘子
  - Lagrangian 沿轨迹时间平均耗散 → 多重分形标度 + 近尺度不变时间级联
  - 经典 bridge 在单轨迹层面**失败**
  - Eulerian 乘子的多重分形组织**累积后恰好解释**平方对数空间统计

---

## 局限性

- 纯湍流物理论文，**无渲染实验、无可视化**。
- 结论基于 **2D/3D 高雷诺数 DNS**，与实际渲染的**有限分辨率 + 数值耗散主导**情形有差距（真实渲染里求解器耗散往往**大于**物理耗散）。
- 结论对**边界条件、驱动方式**的依赖未详述。

---

## 相关工作

- [[Turbulence-Cascade]]
- [[Bridge-Relation]]
- [[Multifractal-Analysis]]
- [[2026-11-03-KSF-Chol-Kernelized-Stable-Fluids]]（同窗口，正面解决数值耗散问题）
- [[2026-11-03-Poncelet-Lattice-Green-Functions-Vortex-Tubes]]（同窗口）
- [[2026-11-02-Hamiltonian-Two-Way-Coupling-Nonlinear-Waves-3D-Flows]]
