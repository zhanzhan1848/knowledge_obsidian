---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, physics-based-animation, neural-skinning, self-supervised, reduced-dynamics, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.26067
---

# PhysSkin++: Real-Time and Generalizable Physics-Based Animation via Self-Supervised Neural Skinning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PhysSkin++: Real-Time and Generalizable Physics-Based Animation via Self-Supervised Neural Skinning |
| **作者** | Yuanhang Lei, Baofei Liu, Xingxuan Li, Tao Cheng, Zixuan Wang, Boming Zhao, Yujun Shen, Siyuan Huang et al. (浙大 ZJU3DV) |
| **发表** | arXiv preprint (cs.CV / cs.GR), 2026-10-19 |
| **链接** | [原文](https://arxiv.org/abs/2610.26067) |
| **DOI** | - |
| **代码** | 项目页 https://zju3dv.github.io/PhysSkin_plus/ |

---

## 核心贡献

> PhysSkin++ — 物理信息自监督神经蒙皮：从静态几何学习连续神经蒙皮场，构造紧凑形变子空间，实现跨形状泛化的实时物理动画。

1. **神经蒙皮场自编码器** — 预测形状相关的形变子空间，**无需逐物体训练网络**。
2. **物理信息自监督学习** — 无需仿真轨迹：结合蒙皮场归一化与**冲突感知梯度修正**，在物理与正交约束下稳定联合优化。
3. **互补弹性响应** — 对指定 rig 动画，引入自监督互补性目标学习互补弹性响应，且运行时不强制互补约束。
4. **多表示绑定** — 直接绑定到 mesh、点云与 3D Gaussians。

---

## 技术方案

### 核心思想

在多样 3D 形状与不同空间离散化上泛化实时物理动画是核心难点。PhysSkin++ 的思路：

- 从**静态几何**学习**连续神经蒙皮场** → 构造紧凑形变子空间
- 关键难点是**没有仿真轨迹标注**。做法是物理信息自监督：
  - 蒙皮场归一化：消除形状差异导致的尺度/旋转歧义
  - 冲突感知梯度修正：当物理约束与正交约束梯度方向冲突时，修正而非简单相加
- 学到的表示支撑高效**降阶动力学**（reduced dynamics），带用户控制与接触交互

### 关键技术

| 技术 | 说明 |
|------|------|
| Neural Skinning Fields Autoencoder | 形状相关的形变子空间，无需逐物体训练 |
| 蒙皮场归一化 | 消除尺度/旋转歧义 |
| 冲突感知梯度修正 | 物理与正交约束冲突时的稳定化技巧 |
| 降阶动力学 | 紧凑子空间上的实时模拟 |
| 自监督互补性目标 | 学习互补弹性响应，运行时零约束开销 |
| 多表示绑定 | mesh / point cloud / 3D Gaussians |

---

## 公式

```math
// 冲突感知梯度修正（概念式）
\mathbf{g} = \mathbf{g}_{\text{phys}} + \mathbf{g}_{\text{orth}}
\mathbf{g}_{\text{corrected}} = \mathbf{g} - \max\!\big(0,\ \langle \mathbf{g}_{\text{phys}}, \mathbf{g}_{\text{orth}} \rangle\big)\,
                              \frac{\mathbf{g}_{\text{orth}}}{\lVert \mathbf{g}_{\text{orth}} \rVert^2} \cdot \lambda
// 降阶动力学
\mathbf{M}\ddot{\mathbf{q}} + \mathbf{C}(\mathbf{q})\dot{\mathbf{q}} + \mathbf{K}(\mathbf{q}) = \mathbf{f}_{\text{ext}},\quad \mathbf{q}\in\mathbb{R}^{n}\ll N
```

---

## 代码片段

```cpp
// 概念伪代码：PhysSkin++ 降阶求解循环
auto subspace = skinning_ae.encode(static_geometry);   // 跨形状泛化，无需逐物体训练
for (step = 0; step < n_steps; ++step) {
    Eigen::VectorXd q = reduced_dynamics.step(subspace, external_force, dt);
    Eigen::VectorXd X = subspace.decode(q);             // 形变后的顶点/高斯位置
    apply_deformation(renderable, X);
}
```

---

## 实验结论

- **任务**: 跨形状泛化的实时物理动画
- **基线**: 需逐物体仿真训练的物理动画方法
- **结果**:
  - 蒙皮场跨形状泛化
  - 实时降阶模拟
  - 可控、碰撞感知、rig 互补动画
  - 可直接绑定 mesh / 点云 / 3D Gaussians

---

## 局限性

- 自监督训练引入的不确定性，物理精度弱于有监督仿真
- 降阶子空间的保真度受限于训练形状分布
- 接触交互的鲁棒性依赖训练覆盖

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **冲突感知梯度修正**是处理多约束联合优化的实用技巧，可推广到任何"物理约束 + 正交/光滑约束"场景
- 关联：[[2026-03-25-PhysSkin-Neural-Skinning]]、[[2026-10-31_LingGS-Gaussian-SLAM-Explicit-Geometric-Tracking]]

---

## 实现建议

- **实现难度**: 高（自监督训练稳定性 + 降阶动力学求解器）
- **预期性能**: 实时（降阶）；质量取决于训练覆盖
- **适用场景**: 角色动画、可变形资产驱动、实时物理特效
- **优先级**: 中
