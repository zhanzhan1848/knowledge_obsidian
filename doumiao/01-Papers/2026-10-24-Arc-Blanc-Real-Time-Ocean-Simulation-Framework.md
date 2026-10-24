---
type: paper
created: 2026-10-24
updated: 2026-10-24
tags: [paper, ocean-rendering, water-rendering, real-time, free-surface, solid-coupling, simulation-framework, GPU]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2503.03326
---

# Arc Blanc: A Real-Time Ocean Simulation Framework

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Arc Blanc: a real time ocean simulation framework |
| **arXiv ID** | 2503.03326v2 |
| **作者** | David Algis, Bérenger Bramas, Emmanuelle Darles, Lilian Aveneau |
| **发表** | arXiv cs.GR 2025-03-05（v2 修订） |
| **链接** | [原文](https://arxiv.org/abs/2503.03326) |
| **机构** | 法系工程师学校（ENSTA）图形学团队 |
| **渲染类别** | **表面渲染（海面）+ 实时模拟框架** |

---

## 核心贡献

> 一篇**工程向**论文：把文献中零散描述的海洋模拟组件**完整地拼装成一个实时框架**，并明确说明各组件之间如何相互衔接 —— 此前这一层系统性说明是缺失的。

1. **完整实时海洋框架**：自由液面 + 固液耦合（solid-fluid coupling）的全套组件与交互关系。
2. **填补文献空白**：海洋模拟的"积木"（building blocks）各自都有文献，但**如何互联**缺乏清晰说明。
3. **两项物理真实度改进**：
   - **任意深度的实时海水速度计算**（real-time velocity of ocean fluids at any depth）
   - **固液耦合算法输入的实时计算**（computing the input of the solid-to-fluid coupling algorithm）
4. **充分利用 GPU + CPU 多线程**：在保持实时性的同时最大化硬件利用率。

---

## 技术方案

### 核心思想

已有 SOTA 工具（商业级海面模拟器）虽然能做到实时，但在大场景下常需**牺牲物理真实度**。Arc Blanc 的定位是：

> 把"可实时"与"足够真实"之间的权衡，从工程黑箱变成**公开、可理解、可复现的框架**。

它不是提出某个新算法，而是**做架构整合 + 两处针对性改进**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Free-surface Ocean Solver** | 自由液面海洋求解器（含波浪谱/FFT 等谱要素） |
| **Solid-Fluid Coupling** | 固体与流体的双向耦合（浮体/船体入水） |
| **Depth-resolved Velocity** | 改进 1：可实时求得**任意深度**的海洋流体速度（而非仅表面） |
| **Coupling Input Computation** | 改进 2：实时计算固液耦合算法所需的输入项 |
| **GPU + CPU Multithreading** | GPU 承担并行计算，CPU 承担调度/数据组织 |

---

## 公式

自由液面海洋模拟通常由**波谱叠加**驱动（FFT 逆变换得到自由面高程 $\eta$ 与速度势 $\psi$）：

```math
\eta(\mathbf{x}, t) = \sum_{\mathbf{k}} \hat{\eta}(\mathbf{k}, t)\, e^{i\mathbf{k}\cdot\mathbf{x}},
\qquad
\psi(\mathbf{x}, t) = \sum_{\mathbf{k}} \hat{\psi}(\mathbf{k}, t)\, e^{i\mathbf{k}\cdot\mathbf{x}}
```

改进 1 的"任意深度速度"由色散关系从势函数向下传播（深水色散近似）：

```math
\omega(\mathbf{k}) = \sqrt{g|\mathbf{k}|\,\tanh(|\mathbf{k}| h)},
\qquad
u_z(\mathbf{x}, z, t) = -\,\nabla \psi(\mathbf{x},t)\, e^{|\mathbf{k}| z}
```

> 注：以上为该类框架的标准形式，论文具体离散化请以原文为准。

---

## 实验结论

- **场景**: 大尺度海面场景 + 含浮体（固体）的耦合场景
- **结果**:
  - 在 GPU/CPU 多线程充分利用下达到**实时**
  - 相比现有工具，在大场景下**物理真实度更高**（因其不依赖过度简化）
  - 改进 1/2 提升了耦合精度与深度方向的速度可用性

---

## 局限性

- **工程整合型**论文，方法论新意有限；主要贡献是知识整理与公开实现。
- 摘要未给出明确的 FPS 数字、网格规模或与具体商业工具的定量对比表。
- 未涉及**泡沫/飞溅/破碎浪（whitecaps）**等渲染层细节 —— 停在几何与速度场层面。

---

## 相关工作

- [[Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]] — 2D 非线性色散波模型 + 3D 求解器双向耦合，互补路线
- [[Real-Time-Hybrid-Ocean-WP-FFT]] — 2025-10 收录的实时海面混合框架
- [[Vortex-Particle-Flow-Maps]] — 粒子/涡量路线的代表
- [[Fast-Subspace-Fluid-Simulation-DMD]] — 降阶模型路线
- [[FFT-Ocean-Simulation]]

---

## 实现建议

- **实现难度**：🔴 高（需自行拼装 FFT 海面 + 固液耦合 + 深度速度）
- **预期性能**：实时（依赖 GPU 网格分辨率）
- **适用场景**：海洋工程可视化、大场景海面、需要固液耦合的浮体模拟

### 🌱 豆苗评注

**这篇的价值在于"系统论"而非"点状创新"**。流体渲染领域长期存在一个尴尬：每个组件（FFT 谱波、SPH、固液耦合、体积阴影）都有成熟文献，但**没有人把它们串成一条完整可运行的管线并公开说明接口**。Arc Blanc 正好是这条"接口说明书"。

对我更直接的启发是**改进 1（任意深度速度）**：目前大多数实时海面渲染只取表面速度场，一旦要表现**水下气泡上升轨迹、悬浮颗粒随流漂移、体积浑浊的深度衰减**，就需要深度方向的速度分布——这是一个在国内团队较少被重视但物理上必需的量。值得把它的深度衰减形式抽出来，做成一个可复用的**深度速度剖面着色器函数**。

---

## 🩸 可行性分析：深度剖面速度驱动的水下悬浮介质渲染

## 渲染方法
- 类型：体积渲染（参与介质）
- 技术：海面 FFT 波场提供深度方向速度剖面，驱动悬浮颗粒/气泡的平流

## 视觉质量
- 逼真度：⭐⭐⭐⭐（颗粒随流漂移是水下真实感的关键）
- 风格化支持：是

## 性能预期
- 帧率：60fps（中等粒子数）
- GPU 需求：低（速度剖面预计算为查表）
- 内存占用：低

## 实现建议
- 着色器复杂度：低
- 管线要求：波场速度 → 深度剖面 LUT → 粒子平流
- 推荐度：✅
