---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, smoke-rendering, volume-rendering, stylization, NCA, neural, real-time]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2502.09631v1
---

# Volumetric Temporal Texture Synthesis for Smoke Stylization using Neural Cellular Automata

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Volumetric Temporal Texture Synthesis for Smoke Stylization using Neural Cellular Automata |
| **arXiv ID** | 2502.09631v1 |
| **作者** | Dongqing Wang, Ehsan Pajouheshgar, Yitao Xu, Tong Zhang, Sabine Süsstrunk |
| **发表** | arXiv cs.GR 2025-02-05（eess.IV / cs.GR） |
| **链接** | [原文](https://arxiv.org/abs/2502.09631v1) |
| **机构** | EPFL（Swiss Federal Institute of Technology Lausanne） |
| **渲染类别** | **体积渲染（风格化）** |

---

## 核心贡献

> 提出 Volumetric Neural Cellular Automata (VNCA)，实时合成多视角一致、帧间时序连贯的 3D 体积风格化烟雾纹理，**用一个数量级以上**的训练速度提升替代显式流体平流建模。

1. **VNCA 模型**：合成含颜色与密度风格化的 3D 纹理体，在 Eulerian 框架下动态对齐烟雾模拟的复杂运动模式。
2. **以自涌现的细胞自动机运动替代显式平流**：取代传统风格化所需的显式流体 advection 建模与帧间平滑项。
3. **实时（real-time）多视角一致风格化**，训练时间降低超过一个数量级；亦可扩展到 mesh 风格化。

---

## 技术方案

### 核心思想

3D 体积烟雾风格化的两大难点：

1. **时序一致性（temporal coherence）**：风格化后的烟雾在相邻模拟帧之间不能闪烁
2. **计算/时间开销**：需在合理时间与算力内完成

传统做法：显式建模平流 + 帧间平滑项。
**VNCA 的做法**：让神经元胞自动机的**自涌现运动**自然承载时序连贯性，无需显式平流与平滑正则。

```text
传统： [模拟平流模型] + [帧间平滑正则]  →  训练昂贵
VNCA： [神经元胞自动机自涌现运动]        →  训练省一个数量级
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Volumetric NCA (VNCA)** | 在 3D 体素网格上迭代更新的神经元胞自动机 |
| **Eulerian 对齐** | 在 Eulerian 框架下将纹理体与烟雾模拟的运动对齐 |
| **自涌现平流** | 用 NCA 内部运动替代显式平流建模 |
| **多视角一致合成** | 实时生成多视角一致的风格化结果 |
| **颜色 + 密度双通道风格化** | 同时风格化 color 与 density |

---

## 公式

神经元胞自动机迭代（示意）：

```math
s_{t+1} = \text{NCA}_\theta(s_t, x), \quad s_t \in \mathbb{R}^{H \times W \times D \times (C_{rgb} + C_{\text{dens}})}
```

NCA 自涌现运动隐式承载时序连贯性：

```math
\frac{\partial s}{\partial t} \approx \text{NCA}_\theta(s), \quad \text{替代显式 advection term}
```

---

## 实验结论

- **训练时间**: 相比传统显式平流 + 平滑项，**降低超过一个数量级**（>10×）
- **结果**: 实时（real-time）多视角一致风格化，帧间时序连贯
- **通用性**: 除烟雾模拟外，也可用于 **mesh 风格化**
- **机构**: EPFL Süsstrunk 组（图像处理权威组）

---

## 局限性

- 风格化质量受参考风格图限制；对高度细节化写实风格迁移效果需验证。
- NCA 迭代推理开销在极高分辨率体数据上可能显著上升。
- 摘要未给出与具体基线的定量对比。

---

## 相关工作

- [[Neural-Smoke-Stylization-Color-Transfer]] — 传统风格迁移
- [[SmokeSVD-Single-View-Smoke-Reconstruction]] — 扩散模型烟雾重建
- [[FluidGen-Physics-Aware-Fluid-Video]] — 物理感知流体视频生成
- [[Neural-Cellular-Automata]] — NCA 基础
- [[Volume-Rendering]] — 体积渲染基础

---

## 实现建议

- **实现难度**: 🟡 中（需 NCA + 体积纹理 + 对齐机制）
- **预期性能**: 实时推理；训练提速 10×+
- **适用场景**: 艺术化/风格化烟雾、火焰体积渲染；游戏/影视特效的快速风格预览

### 🌱 豆苗评注

**"用自涌现运动替代显式平流"是一个漂亮且反直觉的简化**——传统直觉会认为平流必须显式建模，但 NCA 的自组织动力学天然携带时序连贯性。这提示我们：在风格化/后处理这类"不要求物理精确"的场景，可以大胆用学习到的动力学**替代**物理算子，代价可控而收益巨大。对做快速特效预览的团队价值很高。