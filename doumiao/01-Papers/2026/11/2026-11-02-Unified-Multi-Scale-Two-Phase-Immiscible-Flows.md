---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, siggraph-asia-2026, two-phase-flow, eulerian-lagrangian, SPH]
status: processed
domain: 流体渲染
agent: doumiao
source: https://alexey.stomakhin.com/research/unifluids.html
---

# A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows |
| **作者** | Joel Wretborn, Alexey Stomakhin, Christopher Batty |
| **发表** | ACM Transactions on Graphics (SIGGRAPH Asia 2026) — 会议 2026-12-01~04, 吉隆坡 |
| **链接** | [项目页](https://alexey.stomakhin.com/research/unifluids.html) / [Physics-Based Animation 综述](https://www.physicsbasedanimation.com/2026/09/17/a-unified-multi-scale-method-for-simulating-two-phase-immiscible-flows/) |
| **DOI** | 待 ACM DL 收录 |
| **代码** | 暂未公开（Stomakhin 组惯例为后续开源） |
| **关联人物** | Joel Wretborn (Embark)、Alexey Stomakhin (NVIDIA)、Christopher Batty (U. Waterloo) |

---

## 核心贡献

> 用「共享欧拉网格 + 拉格朗日材质点相分数」的混合两流体框架，统一了分层流（网格可解析）与弥散流（亚网格）两种流态，避免了外挂次级求解器。

1. **两流体混合公式 + 拉格朗日相分数**：相分数（volume fraction）不再用纯网格场表达，而是由拉格朗日材质点携带，天然处理相界面拓扑变化与合并/分裂。
2. **闭合模型适配**：将已有的相间力交换闭合模型（drift-flux / 湍流弥散等）重新推导并适配到该混合离散框架上，使分层→弥散的过渡平滑连续。
3. **体积耦合力的联合压力投影**：体积相间耦合力（drag、lift、turbulent dispersion 等）在**同一次压力投影**中联合积分，形成强耦合（strongly coupled）格式，因此在大时间步长与高动态场景下依然稳定。
4. **多尺度演示**：单一模拟内覆盖巨大跨度——瀑布、水轰炸机、水下气泡、间歇泉、拍岸海浪。

---

## 技术方案

### 核心思想

传统两相流方法面临的核心矛盾：

- **网格法（Eulerian）**：相界面靠 advected phase field / level set 表示，但高密度比 + 大尺度比（瀑布、深水气泡）下界面极易破碎、弥散。
- **粒子法（Lagrangian / SPH）**：界面锐利，但大尺度自由表面 + 极高密度比时粒子数爆炸，且薄片状相变（如水幕）难以维持。
- **混合方案**：本文采用"欧拉网格承载速度/压力 + 拉格朗日材质点承载相分数"的组合，两相共享同一套网格动力学。

关键在于**闭合模型的桥接**：当相是**分层**的（stratified，一相在另一相之上/之下，界面被网格解析），需要界面压力/表面张力/波作用力模型；��**弥散**的（dispersed，如水中气泡群，界面尺度小于网格），需要 drag-based 的相间动量交换模型。传统做法是两套求解器并行或切换，本文在同一格式内让两者平滑过渡。

### 关键技术

| 技术 | 说明 |
|------|------|
| Two-fluid mixture formulation | 两相速度分开求解但共享总压力场，密度加权混合出单相形式 |
| Lagrangian material points | 相分数用材质点（类似 FLIP/PIC 的粒子）携带，界面拓扑变化免处理 |
| Drift-flux / interfacial closure models | 适配到混合框架的相间动量交换闭合模型（分层↔弥散统一） |
| Joint pressure projection | 体积耦合力与压力一起投影 → 强耦合、大步长稳定 |
| Sub-grid dispersed regime | 亚网格尺度的弥散相用涡扩散/阻力系数处理，不需加密 |

### 关键公式（概念性表述）

相间体积耦合力的典型形式（drift-flux 闭合）：

```math
F_{drag} = C_D \, \frac{\rho_1 \rho_2}{\rho_1 + \rho_2} \, |u_2 - u_1| \, (u_2 - u_1) \, V_{interf}
```

其中 $C_D$ 为阻力系数（分层时趋于界面波模型，弥散时趋于常数），$V_{interf}$ 为界面/弥散体积量。压力投影中该力与压力梯度同时进入，保证强耦合。

（详细推导见 TOG 正式版）

---

## 实验结论

- **场景**: 巨型瀑布、水轰炸机投放、水下气泡群、间歇泉（geyser）、碎浪拍岸
- **对比基线**: 纯网格两相流（VOF/level set）、纯 SPH 两相流、FLIP 类混合方法
- **结果**: 在**单一模拟**内同时呈现分层大尺度与弥散小尺度；相对纯 SPH 在密度比 1000:1 以上仍稳定；无需为不同尺度切换求解器
- **定性结论**: 消除了「小气泡需要上亿粒子 / 大瀑布需要巨型网格」的尺度两难

---

## 局限性

- 双流体 formulation 相比单流体（VOF）计算量翻倍，网格分辨率受限
- 相分数的拉格朗日表示在极端拉伸（薄片破碎）下仍会有粒子数不足问题
- 强耦合投影对时间步长有下限要求，不能任意放大 dt
- 论文侧重模拟方法本身，**渲染与材质（折射、散射、泡沫）的处理未深入**

---

## 相关工作

- [[2608.25203-hamiltonian-wave-coupling]]
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]]
- [[2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup]]
- [[2025-03-29_Journey-into-SPH-Simulation]]
- [[2025-03-29_Fluid-Implicit-Particle-Simulation-CPU-GPU]]

---

## 实现建议

- **实现难度**: 🔴 高 — 需要完整的混合两流体离散 + 闭合模型重推导 + 强耦合投影求解器
- **预期性能**: 网格级（Eulerian），显存与算力消耗约单流体两倍；可在 GPU 上做（论文组背景为 NVIDIA）
- **适用场景**: 高质量离线/近实时水体（影视、虚拟拍摄、交互式展示），**不适合**移动端或游戏实时
- **可迁移点**: 「分层↔弥散统一闭合模型」的思想可直接用于 **泡沫/飞溅与主体液体的耦合**，以及 **烟火（烟+火星）混合介质** 模拟

## 我的评估

🩸 **可行性分析：高密度比两相流模拟**

- **渲染方法**: 表面（free-surface）+ 粒子（相分数材质点）混合
- **技术**: Two-fluid mixture on shared Eulerian grid + Lagrangian phase fraction + joint pressure projection

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（界面锐利 + 尺度跨度大）
- 风格化支持：否（物理优先）

### 性能预期
- 帧率：离线渲染 / 数十秒至数分钟级模拟
- GPU 需求：中高（强耦合投影 + 材质点双数据结构）
- 内存占用：中高（网格场 × 相数 + 粒子数）

### 实现建议
- 着色器复杂度：低（渲染端简单，难点在求解器）
- 管线要求：显式流体求解器 + 粒子-网格混合数据结构
- 推荐度：✅ 强烈推荐关注（SIGGRAPH Asia 2026 流体模拟代表作）

已传递给 @墨鱼丸。
