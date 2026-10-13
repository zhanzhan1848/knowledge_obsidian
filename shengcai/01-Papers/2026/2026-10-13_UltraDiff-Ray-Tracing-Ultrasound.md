---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, ray-tracing, differentiable-rendering, mitsuba, siggraph-asia, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.07941
---

# Differentiable Ray Tracing in Ultrasound for Shape Optimization (UltraDiff)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Differentiable Ray Tracing in Ultrasound for Shape Optimization |
| **作者** | Felix Duelmer et al. |
| **发表** | SIGGRAPH Asia 2026 Technical Communications |
| **链接** | [原文](https://arxiv.org/abs/2610.07941) |
| **DOI** | 10.1145/3829339.3847840 |
| **代码** | - |

---

## 核心贡献

> UltraDiff — 可微超声波光线追踪，把医学超声成像形式化为路径空间积分，扩展 differentiable rendering 至声学成像模态。

1. **路径空间积分形式化** — 超声成像以 transducer-tissue 旅行时为门控的 path-space integral。
2. **蒙特卡洛前向 + 梯度估计** — 对场景参数同时估计前向模型与梯度。
3. **基于 Mitsuba 3** — 在 Mitsuba 3 上实现，桥接 differentiable path tracing 与声学成像。

---

## 技术方案

### 核心思想

> 物理可微渲染已对光传输起作用，但医学超声图像形成类似 transient rendering：回波按飞行时间分桶而非投影到像平面。UltraDiff 用 path-space integral + Monte Carlo 估计实现 analysis-by-synthesis，从 B-mode 图像反推 SDF 几何。

### 关键技术

| 技术 | 说明 |
|------|------|
| Path-space integral | 旅行时门控的路径积分 |
| MC forward + adjoint | 同时估计前向 + 梯度 |
| Analysis-by-synthesis | 无监督匹配 B-mode 图像 |
| Mitsuba 3 集成 | 复用 differentiable path tracing 基础设施 |
| SDF 优化 | 从球体出发优化至匹配测量的脊柱表面 |

---

## 公式

```math
I(x, t) = \int_{\mathcal{P}} f(\mathbf{x}, t - \tau(\mathbf{x})) \, d\mu(\mathbf{x})

\tau(\mathbf{x}) = \frac{2 \lVert \mathbf{x} - \mathbf{x}_{\text{trans}} \rVert}{c_{\text{sound}}}
```

---

## 代码片段

```cpp
// 在 Mitsuba 3 上的 UltraDiff
mitsuba::PathSpaceIntegrator ultrasound_integrator(
    transducer_pos, c_sound);
auto gradients = ultrasound_integrator.forward_and_adjoint(bmode_image);
sdf.optimize(gradients);  // 无监督 SDF 优化
```

---

## 实验结论

- **任务**: 椎体几何反演
- **数据**: 模拟 B-mode sweeps + 真实脊柱 phantom 机器人采集
- **基线**: 依赖预分割图像的 SOTA 方法
- **结果**:
  - 无监督地从 B-mode 图像恢复椎体表面
  - 几何精度与 SOTA 相当
  - 首次把 differentiable path tracing 扩展到声学成像

---

## 局限性

- 4 页 TC，简化声学模型（未建模组织散射各向异性）
- 真实测量仅在简单脊柱 phantom 上验证
- 速度远未达实时（多用于离线反演）

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 不同iable path tracing 的跨域应用案例
- 显示光与声波 path tracing 的深度联系，可作为渲染团队拓宽视野
