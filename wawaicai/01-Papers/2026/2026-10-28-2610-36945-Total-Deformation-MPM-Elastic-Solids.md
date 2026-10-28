---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, geometry-processing, cs.GR, MPM, material-point-method, elastic-solid, numerical-fracture, deformation-gradient, contact-handling, XPBD]
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.36945
---

# Total Deformation-based MPM for Perfectly Elastic Solid Simulation with Strong Deformations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Total Deformation-based MPM for Perfectly Elastic Solid Simulation with Strong Deformations |
| **作者** | Timna Böttcher, Rick Ridder, Jan Bender（Technical University of Munich） |
| **发表** | arXiv preprint (cs.GR), 2026-10-27 |
| **链接** | [原文](https://arxiv.org/abs/2610.36945) |
| **DOI** | — |
| **代码** | 未见 |

---

## 核心贡献

> 提出一种**基于总形变（total deformation）**的 MPM 求解器，使**完全弹性固体**在**强变形**下**不发生数值断裂**，同时**仍能在当前（已变形）网格上计算弹性力**，因而**兼容标准 MPM 网格碰撞处理**。

1. **解决数值断裂（numerical fracture）**：典型 MPM 求解器即使不含塑性也会「物体散架」——本文在强变形下不发生数值断裂
2. **当前网格上的弹性力**：与既有做法（在**参考构型**固定网格上算力）不同 → 兼容标准碰撞处理
3. **直接由粒子位置 + 固定参考网格计算形变**：**不依赖速度梯度的累积更新**
4. **零能量模态抑制（zero-energy mode suppression）**：抵消非线性变形带来的伪影
5. **支持粒子级碰撞处理**

---

## 技术方案

### 核心思想

**数值断裂的根源**是 MPM 的形变更新方式：

```
标准 MPM：F_{n+1} = (I + dt·∇v) · F_n      ← 速度梯度累积
        → 强变形下 F 数值退化/翻转 → 能量爆炸 → 物体"断裂"
```

既有的完全弹性固体做法（在参考构型固定网格算力）避免了断裂，但**不能配合标准碰撞处理**（因为碰撞需要当前构型的网格）。

本文的解法：**「总形变」—— 从粒子位置与固定参考网格直接算形变**，绕过速度梯度的累积：

```
总形变：F = 从 参考网格 → 当前位置 的映射的雅可比
        直接由粒子当前位置 + 固定参考位置算出，不经过速度梯度累积
        ⇒ 无累积误差 ⇒ 无数值断裂
        ⇒ 但仍在【当前网格】上算弹性力 ⇒ 兼容碰撞
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **总形变梯度** | $F$ 由粒子当前位置与**固定参考网格**直接确定，不做 $F \leftarrow (I + dt\nabla v)F$ 的累积更新 |
| **当前网格弹性力** | 弹性力在**当前（已变形）网格**上计算，而非参考构型 |
| **网格碰撞处理** | 因在当前网格算力，可直接套用 MPM 框架的标准网格碰撞 |
| **粒子级碰撞处理** | 额外支持粒子级碰撞 |
| **零能量模态抑制** | 消除强非线性变形引入的零能量模态伪影 |

---

## 公式

```math
% 标准 MPM（会断裂）
%   F_{n+1} = (I + dt ∇v_{n+1}) F_n        ← 速度梯度累积，误差累积
%   P = F ∂W/∂F                            ← 弹性力（Kirchhoff 应力）

% 本文：总形变（直接由位置求形变，无累积）
%   F = ∂x / ∂X      ← 当前粒子位置 x 对参考位置 X 的雅可比
%   由 P2G 插值得到的网格位移场直接求 ∇x，从而得 F
%   （关键：不再用 F_n 递推，故无累积退化）

% 弹性力（Piola 变换）
%   P(X, F) = ∂W(F)/∂F                   ← 第二 Piola-Kirchhoff 应力
%   f_p = - (V_p / n) · P · F^T · ∇_x W   ← 粒子上的力

% 零能量模态抑制
%   数值上 F 可能退化为 rank-deficient（体积塌陷方向无刚度）
%   ⇒ 引入人为刚度项或投影，去掉近零能量模态
```

---

## 代码片段

```cpp
// 概念性伪代码：总形变 MPM 主循环
for (int step = 0; step < n_steps; ++step) {
    // ① P2G：用【当前网格】上的形变梯度计算弹性力
    grid_F.assign(0.0f);
    grid_P.assign(0.0f);
    for (const Particle& p : particles) {
        // ★ 关键：F 直接由粒子位置与固定参考网格算出，不递推
        Eigen::Matrix3d F = p.deformation_gradient;  // 由 P2G 场求得
        F = p.current_deformation;                    // 从位置直接构造

        // 第二 Piola-Kirchhoff 应力
        Eigen::Matrix3d P = elastic_Piola(F);

        // 零能量模态抑制：去掉近奇异方向的伪力
        P = suppress_zero_energy_modes(P, F);

        grid_P[cell_of(p)] += p.volume * P;
    }

    // ② 弹性力 → 网格力
    grid_force = -divergence(grid_P);   // 当前网格上的散度

    // ③ 网格碰撞处理（因为力在当前网格上算 ⇒ 可用标准 MPM 碰撞）
    apply_grid_collisions(grid, grid_force);

    // ④ G2P + 粒子级碰撞
    for (Particle& p : particles) {
        p.velocity += dt * grid_force.interpolate(p.position) / p.mass;
        p.position += dt * p.velocity;
    }
    apply_particle_collisions(particles);
}
```

---

## 实验结论

- **数据集**: 论文自建（强弹性变形 + 接触场景）
- **基线**: 标准 MPM 求解器；参考构型固定网格的完全弹性方法
- **结果**:
  - 强变形下**无数值断裂**
  - **兼容标准 MPM 网格碰撞处理**
  - 支持**粒子级碰撞**
  - 零能量模态抑制抵消非线性变形伪影
  - 可高效模拟**大变形 + 接触**的复杂弹性体场景

---

## 局限性

1. **完全弹性假设**：不含塑性 → 无法模拟塑性变形（断裂、永久凹陷）
2. **参考网格需固定**：不可变形背景需在参考构型处理
3. **零能量模态抑制引入人为刚度**：可能改变真实材料行为（尤其软材料）
4. **标准 MPM 的固有局限**：大旋转时的刚体旋转误差、压力矩阵条件数问题
5. **CPU/GPU 实现细节**：论文未提供性能数据
6. **属仿真域**：与几何处理（网格、参数化）的直接关联较弱

---

## 相关工作

- [[2026-10-27-2610-36931-Transport-Skeletons-Reusable-MontCarlo-PDE]]（同 cs.GR 的仿真论文）
- [[2026-10-21-2610-30033-RLMuscle-Muscle-Driven-Character-Animation]]（**几何多重网格 / XPBD** —— 高度相关）
- [[2026-10-27-2610-35573-WalkOnAmbientPatch-PDEs]]

---

## 实现建议

- **实现难度**: **中高**。MPM 本身成熟，但「总形变」的 $F$ 求法与零能量模态抑制需要仔细推导与实现
- **预期性能**: 与标准 MPM 同量级（P2G/G2P 各一次全场遍历）
- **适用场景**:
  - **大变形弹性体仿真**（软体、橡胶、结绳前的绳索）
  - **带接触的弹性碰撞**（角色四肢、软包装）
- **给 @墨鱼丸（算法 agent）的移植建议**：
  1. **「消除累积递推」是一个通用的数值稳定性思想**，不限于 MPM。我们的几何管线里若有类似「逐帧累积更新状态」的地方（形变梯度、速度、位移场），都值得检查：**能否改为从当前状态直接求解**？这往往能消除一整类漂移/退化 bug
  2. **零能量模态抑制的思路可迁移到线性代数层**：近奇异矩阵在几何处理里很常见（退化三角形、近共面点云），这类「人为补刚度」是稳健求解的标准手段
  3. 建议参考 [[2026-10-21-2610-30033-RLMuscle-Muscle-Driven-Character-Animation]] 的几何多重网格实现（粗四面体笼 + 重心坐标延拓 + 四面体网格 V-cycle），与本文的"当前网格算力"路线互补
