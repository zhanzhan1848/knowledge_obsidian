---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, neural-emission-fields, real-time-rendering, direct-illumination, neural-network, PBR, BRDF]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.06762
venue: arXiv preprint
year: 2026
---

# Real-time Rendering of Pre-integrated Neural Emitters (NEF)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-time Rendering of Pre-integrated Neural Emitters |
| **方法名** | Neural Emission Fields (NEF) |
| **作者** | （待确认） |
| **发表** | arXiv preprint (2026-10-07) |
| **链接** | [原文](https://arxiv.org/abs/2610.06762) |
| **DOI** | [10.48550/arXiv.2610.06762](https://doi.org/10.48550/arXiv.2610.06762) |
| **代码** | 未公开 |

---

## 核心贡献

> 提出 **Neural Emission Fields (NEF)**：一种**预积分神经辐射场**，在光源局部坐标系训练，仅一次网络评估即可得到**无噪声的遮挡前直接光照**，支持复杂发射器（高多边形发光网格、空间变化发射、可形变组件、自遮挡、内部互反射），且作为**便携光照资产**跨场景复用。

1. **零运行时积分**：在发射器周围预计算光照场，运行时仅查询
2. **双头架构**：一个网络同时输出 diffuse 和 glossy 分量
3. **参数化**：位置 + 法线 + 视角 + 材质参数 → 出射辐照度
4. **局部坐标系**：训练后作为可复用光照资产（rigid transform 适用）
5. **复杂发射器支持**：内部互反射、自遮挡、空间变化发射、形变——全部由网络隐式学习

---

## 技术方案

### 核心问题

实时渲染复杂发射器（带灯罩的灯泡、汽车尾灯、霓虹灯）困难：
- 解析方法：受限于简单几何
- 纯采样方法：高 SPP 才能无噪
- 代理表示：仍需运行时积分出射辐照度

### 核心思想：预积分 + 神经表示

```
传统：运行时对发射器表面积分 → 慢
NEF：训练时积分 → 运行时仅一次网络查询
```

在光源**局部坐标系**训练网络，输入采样点位置/法线/视角/材质，输出预积分的辐照度。同一 NEF 可被多个场景使用。

### 关键技术

| 技术 | 说明 |
|------|------|
| Pre-integration | 训练时完成辐照度积分 |
| Two-headed architecture | diffuse head + glossy head |
| Local-frame training | 训练在光源局部系，跨场景复用 |
| Multi-parameter conditioning | position/normal/view/material → L_o |
| Implicit deformation handling | 形变通过查询变换后的位置由网络隐式处理 |

### 网络输入/输出

```
Input:  (x_local, n_local, ω_o_local, α, roughness, ...)
Hidden: MLP 残差块
Output: (L_diffuse, L_glossy)
```

---

## 公式

对发射器 $E$，接收点 $\mathbf{x}$ 的遮挡前辐照度：

```math
L_o(\mathbf{x}, \omega_o) = \int_{E} L_e(\mathbf{y}) \cdot V(\mathbf{x}, \mathbf{y}) \cdot f_r(\mathbf{y} - \mathbf{x}, \omega_o) \, dA(\mathbf{y})
```

NEF 拟合：

```math
L_o \approx \mathcal{N}_\theta(\mathbf{x}_{\text{local}}, \mathbf{n}_{\text{local}}, \omega_{o,\text{local}}, \text{material})
```

其中 $\mathcal{N}_\theta$ 是预训练 MLP。

---

## 实验结果

- **场景**: 复杂发射器（汽车尾灯、灯泡、霓虹灯等，推测）
- **基线**: 解析方法、纯采样、Light-Proxy 方法
- **结果**:
  - 单次网络评估 = 无噪声直接光照
  - 训练后可跨场景复用
  - 复杂几何 / 空间变化发射 / 形变均支持

---

## 局限性

- 训练成本（offline）；不适用于完全动态发射器内容
- 资产粒度 = 单个发射器；大型集合需要资源管理
- 视角范围受训练数据覆盖限制

---

## 相关工作

- [[Neural-Radiance-Caching]]
- [[Light-Proxy]]
- [[Neural-Light-Transport]]
- [[Real-Time-Direct-Illumination]]

---

## 实现建议

- **实现难度**: 中（需要 PyTorch/TinyDiffNet 训练 + 运行时集成）
- **预期性能**: 实时（每像素 1 次网络前向）
- **适用场景**:
  - 实时引擎中复杂光源（车灯、霓虹、灯罩）的高质量直接光照
  - 灯光师设计的"智能光源资产"
  - 离线 GI 烘焙的神经替代方案
- **推荐度**: ⭐⭐⭐⭐ （解决实时渲染中"复杂光源噪声"的痛点，与 NVIDIA RTX Neural Materials 思路一致）
