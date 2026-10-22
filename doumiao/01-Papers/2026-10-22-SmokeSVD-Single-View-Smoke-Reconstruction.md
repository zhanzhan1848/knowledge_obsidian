---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, smoke-rendering, reconstruction, diffusion, novel-view-synthesis, single-view]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2507.12156v3
---

# SmokeSVD: Smoke Reconstruction from A Single View via Progressive Novel View Synthesis and Refinement with Diffusion Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SmokeSVD: Smoke Reconstruction from A Single View via Progressive Novel View Synthesis and Refinement with Diffusion Models |
| **arXiv ID** | 2507.12156v3 |
| **作者** | Chen Li, Shanshan Dong, Sheng Qiu, Jianmin Han, Yibo Zhao, Zan Gao, Taku Komura, Kemeng Huang |
| **发表** | arXiv cs.GR 2025-07-16（v3 更新 2026-04-12） |
| **链接** | [原文](https://arxiv.org/abs/2507.12156v3) |
| **机构** | Zhejiang University, University of Tokyo 等 |
| **渲染类别** | **体积渲染 + 生成模型** |

---

## 核心贡献

> 用扩散模型的生成先验 + 物理引导的一致性优化，从**单个视频**渐进式重建动态烟雾，绕开单视图重建的病态性。

1. **物理引导的侧视图合成器（side-view synthesizer）**：基于扩散模型、显式引入**速度场约束**，逐帧生成时空一致的侧视图图像。
2. **渐进多阶段精化**：通过逐级增加视点数量来渲染与增强新视角图像，进而重建 3D 密度场。
3. **物理 + 生成混合范式**：扩散模型提供先验解病态性，速度场保证物理合理性。

---

## 技术方案

### 核心思想

从稀疏视点重建动态流体的核心困难是**3D 信息严重不足**导致重建病态（ill-posed）。既有方法（可微渲染、NVS）常因病态条件下的耗时优化而受限。

SmokeSVD 的策略：

```text
单视图视频
   ↓
物理引导侧视图合成器（扩散模型 + 速度场约束，逐帧时空一致）
   ↓ 生成候选侧视图
渐进多阶段 NVS（视点数逐级增加：1 → 2 → ... → N）
   ↓ 每级渲染 + 增强
3D 密度场重建
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **物理引导侧视图合成** | 扩散模型逐帧生成侧视图，显式注入速度场约束 |
| **速度场约束** | 保证生成侧视图符合流动物理（而非仅视觉合理） |
| **渐进 NVS** | 视点数逐级增加，逐级精化，避免一次性病态优化 |
| **3D 密度场重建** | 从多视角增强图像重建密度场 |
| **时空一致性** | 逐帧生成保证时序连贯 |

---

## 公式

（示意）扩散模型采样 + 物理引导：

```math
x_{t-1} \sim p_\theta(x_{t-1} \mid x_t, \, \mathcal{C}_{\text{vel}})
```

其中 $\mathcal{C}_{\text{vel}}$ 为速度场一致性约束，$x$ 为侧视图图像，$\theta$ 为扩散模型参数。

---

## 实验结论

- **输入**: 单视图视频（single video）
- **结果**: 高效重建动态烟雾；渐进式策略显著优于病态条件下的直接优化
- **基线**: 现有单视图/稀疏视图烟雾重建方法

---

## 局限性

- 依赖速度场约束的正确性；若速度场估计不准，生成会漂移。
- 扩散模型推理成本较高，逐帧生成对长视频可能较慢。
- 从单视图重建烟雾本质仍有欠约束，复杂遮挡场景精度受限。

---

## 相关工作

- [[FluidGen-Physics-Aware-Fluid-Video]] — 物理感知流体视频生成（同期范式）
- [[Volumetric-Temporal-Texture-Smoke-Stylization-NCA]] — 烟雾风格化
- [[Smoke-Reconstruction-Survey]] — 烟雾重建综述
- [[Diffusion-Model-Video-Generation]]

---

## 实现建议

- **实现难度**: 🔴 高（扩散模型 + 速度场估计 + 渐进优化管线）
- **预期性能**: 中等（推理有 diffusion 开销）
- **适用场景**: 从单视频素材快速获取可编辑的 3D 烟雾；影视/游戏素材重建

### 🌱 豆苗评注

与 [[FluidGen]] 同属**"物理引导的生成模型"**范式，但目标不同：FluidGen 做**生成**，SmokeSVD 做**重建**。SmokeSVD 的"速度场约束进扩散模型"是关键一招——纯扩散模型会生成视觉合理但物理错误的烟雾，注入速度场后生成结果才具备可编辑性。这与 [[FluidGen]] 的 motion-guided post-training 思路互相印证：**物理信号必须注入生成过程，而非事后过滤**。