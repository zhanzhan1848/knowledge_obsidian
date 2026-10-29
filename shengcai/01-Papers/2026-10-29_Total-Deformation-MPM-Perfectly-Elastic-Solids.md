---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, 渲染, 物理仿真, MPM, 弹性固体, 大变形, RWTH, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.36945
---

# Total Deformation-based MPM for Perfectly Elastic Solid Simulation with Strong Deformations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Total Deformation-based MPM for Perfectly Elastic Solid Simulation with Strong Deformations |
| **作者** | Timna Böttcher, Rick Ridder, Jan Bender（RWTH Aachen University, Visual Computing Institute） |
| **发表** | arXiv 2026-10-27（cs.GR，primary），Preprint |
| **链接** | [原文](https://arxiv.org/abs/2610.36945) |
| **DOI** | [10.48550/arXiv.2610.36945](https://doi.org/10.48550/arXiv.2610.36945) |
| **代码** | — |

---

## 核心贡献

> MPM 有一个众所周知的致命缺陷：**数值断裂（numerical fracture）**——即使弹性模型中完全没有塑性，本该完全弹性的物体会在大变形下碎成几块。本文提出一种 MPM 求解器，**用"总变形"（total deformation）** 从粒子位置与**固定参考网格**直接反算形变梯度，从而既**无断裂**，又保留了 MPM 在**当前网格上计算弹性力**（因而可自然使用标准网格碰撞处理）这一关键优势。

1. **同时使用两张网格**（这是全文的架构核心）：
   - **参考网格 G⁰**：唯一对应每个物体，编码**未变形构型下的材质连通性** → 用于计算总变形，天然无断裂；
   - **当前网格 Gⁿ**：全局坐标，编码**当前碰撞信息** → 用于计算弹性力，因而兼容标准 MPM 碰撞处理。
   - 对比：传统 MPM 只用 Gⁿ；TLMPM 只用 G⁰（因而碰撞必须用专门技术投影）。
2. **不依赖速度梯度更新形变梯度**：形变直接由**粒子位置 + 固定参考网格**算出，不使用 `F^{n+1} = F^n + Δt ∇v^{n+1} F^n` 这类更新式。这带来一个关键自由：
   - **允许直接操纵粒子位置**（把粒子推出边界、覆盖粒子轨迹），因为形变梯度计算能从新位置中提取全部所需信息；
   - 使**零能量模式（zero-energy / hourglass modes）抑制**成为可能（该类伪影通常出现在粒子级，需要直接修正粒子位置——而传统 MPM / TLMPM 都不允许，因为会破坏形变更新）；
   - 允许**粒子级碰撞处理**与基于粒子的动画。
3. **不要求网格速度场精确匹配粒子运动** → 上述粒子级自由度得以成立。
4. **自由于数值塑性**：可高效模拟含接触的、大变形的复杂弹性场景。

---

## 技术方案

### 核心思想

**问题定位**：

| 方法 | 形变来源 | 弹性力计算位置 | 数值断裂 | 碰撞处理 | 零能量模式抑制 |
|------|-----------|---------------|---------|---------|--------------|
| 传统 MPM | 速度梯度更新 | 当前网格 Gⁿ | ❌ 有 | ✅ 网格级（自然） | ❌ 不允许动粒子位置 |
| TLMPM | 速度梯度更新 | 参考网格 G⁰ | ✅ 无 | ❌ 需专门投影技术 | ❌ 极难 |
| **本文** | **位置 + 固定参考网格** | **当前网格 Gⁿ** | ✅ 无 | ✅ 网格级（自然） | ✅ 允许 |

**核心洞见**：断裂的根源在于 MPM 的形变梯度更新式基于**速度梯度**，在大变形下会失真。FEM 类方法（直接从点位置与参考构型算形变）没有这个问题，但失去了 MPM 的接触与多材料耦合能力。**本文把"形变来源"与"力计算位置"解耦**：形变用参考网格（无断裂、保留连通性），力用当前网格（碰撞自然）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **P2G 传递（APIC）** | 质量与速度转移到当前网格：`m_i^n = Σ_p m_p w_ip^n`；`v_i^n = Σ_p m_p (v_p^n + B_p^n (D_p^n)^{-1}(x_i^n − x_p^n)) w_ip^n / m_i^n` |
| **G2P 传递** | `v_p^{n+1} = Σ_i v_i^{n+1} w_ip^n`；`B_p^{n+1} = Σ_i v_i^{n+1}(x_i^n − x_p^n)^T w_ip^n` |
| **网格弹性力** | 能量 `U^n = Σ_p V_p^0 Ψ(F_p^n)`；节点力 `f_i^n = −∂U/∂x_i = −Σ_p V_p^0 P_p^n (F_p^n)^T ∇w_ip^n`，`P = ∂Ψ/∂F`（第一 Piola-Kirchhoff 应力） |
| **网格速度更新** | `v_i^{n+1} = v_i^n + Δt f_i^n / m_i^n`，再施加边界条件 |
| **网格级碰撞处理** | 预测位置 `x̃_i = x_i^n + Δt v_i^{n+1}`；若与边界重叠且速度指向物体，用局部法线去除法向相对速度，切向按摩擦系数 `α_f` 调整：`v^{n+1} = v_tan − min{α_f‖v_nor‖, ‖v_tan‖}·v_tan/‖v_tan‖` |
| **总变形计算（本文核心）** | 形变梯度**直接**由粒子当前位置与**固定参考网格**反算，**不使用** `F^{n+1} = F^n + Δt ∇v^{n+1} F^n`；因为不依赖速度梯度，粒子位置可被自由修正（推出边界、覆盖轨迹）而形变信息仍然自洽 |
| **零能量模式抑制** | 因为允许粒子级位置修正，hourglass 模式可在粒子级被直接校正（传统 MPM / TLMPM 因形变更新式依赖速度梯度而无法这样做） |

---

## 公式

```math
// ===== 传统 MPM（本文对照）=====

// P2G (APIC)
m_i^n=\sum_p m_p w_{ip}^n,\qquad
\mathbf{v}_i^n=\frac{\sum_p m_p\left(\mathbf{v}_p^n+\mathbf{B}_p^n(\mathbf{D}_p^n)^{-1}(\mathbf{x}_i^n-\mathbf{x}_p^n)\right)w_{ip}^n}{m_i^n}

// G2P
\mathbf{v}_p^{n+1}=\sum_i \mathbf{v}_i^{n+1}w_{ip}^n,\qquad
\mathbf{B}_p^{n+1}=\sum_i \mathbf{v}_i^{n+1}\left(\mathbf{x}_i^n-\mathbf{x}_p^n\right)^T w_{ip}^n

// 弹性势能与网格力
\mathcal{U}^n=\sum_p V_p^0\,\Psi(\mathbf{F}_p^n)
\mathbf{f}_i^n=-\frac{\partial\mathcal{U}^n}{\partial\mathbf{x}_i}
=-\sum_p V_p^0\,\underbrace{\frac{\partial\Psi(\mathbf{F}_p^n)}{\partial\mathbf{F}_p^n}}_{\mathbf{P}_p^n\text{（第一 Piola-Kirchhoff）}}
(\mathbf{F}_p^n)^T\nabla w_{ip}^n

// 网格速度更新
\mathbf{v}_i^{n+1}=\mathbf{v}_i^n+\Delta t\,\frac{\mathbf{f}_i^n}{m_i^n}

// 形变梯度的【速度梯度更新式】—— 断裂与零能量模式问题的根源
\mathbf{F}_p^{n+1}=\mathbf{F}_p^n+\Delta t\,\nabla\mathbf{v}_p^{n+1}\,\mathbf{F}_p^n
\Delta t\,\nabla\mathbf{v}_p^{n+1}=\Delta t\sum_i\mathbf{v}_i^{n+1}(\nabla w_{ip}^n)^T

// 网格级碰撞（法向去除 + 切向摩擦）
\mathbf{v}_i^{\text{nor}}=\big((\mathbf{v}_i^{n+1})^T\mathbf{n}_b\big)\mathbf{n}_b,\qquad
\mathbf{v}_i^{\text{tan}}=\mathbf{v}_i^{n+1}-\mathbf{v}_i^{\text{nor}}
\mathbf{v}_i^{n+1}=\mathbf{v}_i^{\text{tan}}
-\min\{\alpha_f\|\mathbf{v}_i^{\text{nor}}\|,\ \|\mathbf{v}_i^{\text{tan}}\|\}\frac{\mathbf{v}_i^{\text{tan}}}{\|\mathbf{v}_i^{\text{tan}}\|}
```

---

## 代码片段

```cpp
// 概念伪码：本文方法的每步顺序（对比传统 MPM）
void step(const State& s, State& next) {
    // 1) P2G：把质量/动量传到【当前网格 G^n】
    p2g_APIC(s.particles, s.currentGrid, s.mass, s.velGrid);

    // 2) 形变梯度：本文核心 —— 直接由【粒子位置 + 固定参考网格 G^0】算 total deformation
    //    注意：不用 F^{n+1} = F^n + Δt ∇v F^n，因此不依赖速度梯度
    for (Particle& p : s.particles)
        p.F = computeTotalDeformation(p.x_current, p.referenceGrid, p.x0);

    // 3) 弹性力在【当前网格 G^n】上计算（碰撞天然可用）
    computeElasticForces(s.particles, s.currentGrid, s.fGrid);   // f_i = -Σ V^0 P (F)^T ∇w

    // 4) 网格速度更新 + 边界条件
    integrateGridVelocity(s.currentGrid, s.fGrid, dt);

    // 5) 网格级碰撞处理（摩擦 α_f）
    resolveGridCollisions(s.currentGrid, colliders, friction);

    // 6) G2P：速度回到粒子
    g2p_APIC(s.currentGrid, s.particles, next.particles);

    // 7) 【本文特有】粒子级自由：可直接推出边界 / 覆盖轨迹 / 抑制零能量模式
    //    因为 F 由位置反算，这里的位置修改不会破坏形变一致性
    for (Particle& p : next.particles) {
        p.x = pushOutOfColliders(p.x, colliders);     // 粒子级碰撞（传统 MPM 禁止）
        suppressZeroEnergyModes(p);                   // hourglass 模式粒子级修正
    }
}
```

---

## 实验结论

- **论文定位**: RWTH Aachen VCI 出品（Jan Bender 组），MPM 求解器方法学论文（Preprint）。
- **核心论点（定性）**:
  - **完全弹性固体可以承受极大变形并恢复原状**，而传统 MPM 因数值断裂无法可靠模拟（物体会碎成多块）。
  - 本文方法**记住了连通性**（reference grid G⁰ 提供材质连通性信息），因此能在**无断裂**的前提下模拟完全弹性固体。
  - 可**自然纳入接触处理**，能高效模拟含接触的复杂弹性大变形场景。
  - 相比 TLMPM：TLMPM 因参考网格节点与当前（全局）坐标无直接对应，接触必须用专门技术投影；本文保留 MPM 的网格碰撞优势。
- **技术定位**: 本文不引入任何辅助网络/场（与 neural deformation field 类方法相反），强调**几何与数值方法的纯粹改进**。

---

## 局限性

1. **每物体一张参考网格**：内存开销随物体数增长；参考网格与当前网格需同步维护。
2. **"总形变"的数值稳定性**：从位置反算形变梯度在极端大变形/近退化构型下的行为需要仔细处理（论文未在此展开）。
3. **需要粒子级位置修正的实现细节**：允许直接改粒子位置意味着需要重新计算形变梯度，这部分开销与设计复杂度未量化。
4. **Preprint 状态**：实验对比表与定量指标在摘要中未给出；需要读全文实验章节。
5. **仅覆盖完全弹性固体**：塑性/流体/多材料耦合场景不在范围内（尽管 MPM 的这一优势被保留）。

---

## 相关工作

- **MPM 谱系**: Sulsky et al. (1994/1995/1996)、Stomakhin et al. (2013, 2014)、Klár et al. (2016)、Daviet & Bertails-Descoubes (2016)、Jiang et al. (2016 tutorial)
- **APIC / PolyPIC / MLS-MPM**: Jiang et al. (2015, 2017)、Fu et al. (2017)、Hu et al. (2018) — 大幅降低 cell-crossing 不稳定性但仍断裂
- **TLMPM (Total Lagrangian MPM)**: de Vaucorbeil et al. (2020a) — 无断裂但丢失自然碰撞处理
- **MPM 综述**: de Vaucorbeil et al. (2020b)
- **数值断裂**: Brackbill (1988)、Bardenhagen & Kober (2004)、Homel et al. (2016)
- **FEM / 零能量模式抑制**: Sifakis & Barbic (2012) — 直接从点位置与参考构型算形变
- **渲染域关联**: 物理仿真是渲染管线中「运动/流体/布料」的上游；本文属**仿真侧**，与生菜主域（渲染）相邻。相关：[[2026-10-29_Reusable-Transport-Skeletons-WoS-Interactive-PDE]]（同为 cs.GR 蒙特卡洛/数值方法方向）

---

## 实现建议

- **实现难度**: **高**（研究级数值方法）。需要同时维护参考网格与当前网格、重写形变梯度更新路径、处理粒子级位置修正与形变的一致性。
- **预期性能**: 与标准 MPM 同量级（多一张参考网格 + 形变反算开销）；具体数据待查论文实验章节。
- **适用场景**:
  - **完全弹性大变形 + 接触**：橡胶、软体、生物组织、跌落碰撞、挤压
  - 需要**无断裂**的软体动画（FEM 太慢、MPM 会碎）
  - 与渲染管线衔接：稳定的形变场 → 更可靠的动态几何/运动模糊
- **落地建议（给墨鱼丸 / 鲜毛肚 / 鸭血）**:
  1. **关键设计模式值得记住**："**形变来源**与**力计算位置**解耦"是一个可迁移的架构思想——本质上与渲染里的"**几何表示**与**着色/光照计算位置**分离"是同构的。
  2. 若团队已有 MPM 实现，最小改动路径：**保留现有 G2P/P2G 与网格力计算**，仅把 `F` 的更新从速度梯度式改为"位置反算"，并额外维护一张参考网格。
  3. **注意"允许直接改粒子位置"这个副作用**——它是零能量模式抑制与粒子级碰撞的前提，但也意味着必须保证形变梯度能自洽地从新位置反算出来，否则会出现"改了位置但形变信息滞后"的不一致。
  4. 这是**仿真侧**工作，与生菜主域（渲染）仅在"动态内容 → 渲染"的下游衔接。若要评估投入产出，建议交给**鲜毛肚 / 鸭血（流体渲染）**或仿真方向的 agent 进一步评估。
