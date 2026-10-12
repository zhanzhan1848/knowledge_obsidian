---
type: paper
created: 2026-10-12
updated: 2026-10-12
tags: [paper, 3DGS, real-time-rendering, animation, cinemagraph, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.13860
---

# Make It Flow: Animating Water in 3D Gaussian Splatting Scenes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Make It Flow: Animating Water in 3D Gaussian Splatting Scenes |
| **作者** | Kjell Keune, Florian Hahlbohm, Jannis Möller, Susana Castillo, Martin Eisemann (+1) |
| **发表** | arXiv cs.GR 2026-10-09 |
| **链接** | [原文](https://arxiv.org/abs/2610.13860) |
| **DOI** | - |
| **代码** | 未提及 |

---

## 核心贡献

> 无需动态捕获或物理仿真，从单张参考图像 / 模型渲染估计 2D 光学流，提升到 3D Eulerian motion field，对 3DGS primitives 应用形变，生成无缝循环的水体动画。

1. **2D→3D 流场提升** — 从单视图/模型渲染估计光流，提升为全局一致的 3D Eulerian 速度场
2. **Cinemagraph 启发算法** — 在 Gaussian primitives 上施加形变场，保持时序无缝循环
3. **保留实时性** — 动画后仍可在场景中自由视点导航

---

## 技术方案

### 核心思想

3DGS 默认假设静态场景。真实场景中水、烟等高频动态在 casual capture（无密集多视图、无高速采集）下不可解。作者绕开物理仿真与多视图动态捕获：

1. 从 2D 图像/单帧推断光流
2. 用数学约束（保持 3D 一致性）提升到 3D 速度场
3. 直接形变 Gaussian primitives（位置 + 朝向）

### 关键技术

| 技术 | 说明 |
|------|------|
| **2D Optical Flow 估计** | 从参考图像或 3DGS model rendering 推断 |
| **3D Eulerian Lift** | 提升 2D 流为 3D 一致速度场（Eulerian 描述，固定网格上的速度） |
| **Cinemagraph Loop** | Fourier 周期保证 + 边界无缝融合 |
| **Gaussian Deformation** | 把 3D 速度场作为位移场应用到 Gaussian 中心 + 朝向 |

### 与其他动态 3DGS 方法对比

- **vs Dynamic 3DGS (多视图动态捕获)**：无需多视图，避免密集采集
- **vs 4DGS (完整 4D 表示)**：仅修改 primitives，无需新增时间维 latent
- **vs Eulerian fluid methods**：不限于流体，可处理高频水流特定效果

---

## 公式

```math
\mathbf{v}(\mathbf{x}, t) : \mathbb{R}^3 \times \mathbb{R} \to \mathbb{R}^3
```

3D Eulerian velocity field: 固定 3D 空间点 x 在时间 t 的速度。

```math
\mathbf{x}'(t) = \mathbf{x} + \int_0^t \mathbf{v}(\mathbf{x}, s) \, ds
```

形变后 Gaussian 中心位置（advection）。

```math
\mathbf{v}(\mathbf{x}, t) = \mathbf{v}(\mathbf{x}, t + T) \quad \text{(looping constraint)}
```

无缝循环约束：速度场的时间周期性。

---

## 实验结论

- **数据集**: 新采集的 "in-the-wild waterfall scenes" 数据集
- **基线**: prior dynamic Gaussian splatting + 3D cinemagraph generation
- **结果**:
  - 视觉质量与计算效率均优于 baseline
  - 保持实时渲染性能
  - 保留 free-viewpoint navigation

---

## 局限性

- 仅针对水体动画，泛化到其他流体（烟、火焰）待验证
- Eulerian lift 在遮挡区域可能产生不一致
- Cinemagraph loop 周期需要手工选择 / 自动检测
- 未提供代码

---

## 可行性评估（内部视角）

| 维度 | 评分 | 说明 |
|------|------|------|
| 创新性 | ⭐⭐⭐⭐ | 跨 2D→3D 提升 + 实时 Gaussian 形变的优雅组合 |
| 实用性 | ⭐⭐⭐⭐⭐ | 静态 3DGS 资产一键"活起来"，极其实用 |
| 实现难度 | 中 | 涉及光流、3D 提升、Gaussian 形变三个模块 |
| 推荐度 | ⭐⭐⭐⭐⭐ | 强烈推荐 |

### 推荐结论
✅ **强烈推荐实现** — 解决了一个高频痛点（静态 3DGS 资产动态化），且与现有 3DGS pipeline 兼容性极高。

### 行动建议
传递给 @墨鱼丸 (moyuwan)：
1. 优先复现 3D Eulerian lift 部分（核心数学）
2. Cinemagraph loop 算法值得独立研究（Fourier 周期保证）
3. 期待作者开源代码 → 密切关注

原始链接: https://arxiv.org/abs/2610.13860
