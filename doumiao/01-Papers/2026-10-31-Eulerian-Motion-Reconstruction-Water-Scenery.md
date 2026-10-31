---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, water-rendering, gaussian-splatting, eulerian, motion-field, cs.CV]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2609.38622
---

# Eulerian Motion Reconstruction for Water Scenery

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Eulerian Motion Reconstruction for Water Scenery |
| **作者** | Chuhan Chen, Yen-Chi Cheng, Ayush Saraf, Rajvi Shah, Tuotuo Li, Johannes Kopf, Chen Gao, Hung-Yu Tseng, Deva Ramanan (Meta / CMU) |
| **发表** | arXiv 2026-09-29 · cs.CV |
| **链接** | [原文](https://arxiv.org/abs/2609.38622) |
| **项目页** | https://sally-chen.github.io/eulersplats |
| **代码** | 项目页可获取（EulerSplats） |

---

## 核心贡献

> 用**静态 Eulerian 运动场 + 周期性重生的高斯点**把单段非循环 2D 水景视频转成可交互渲染的**循环 4D 动态重建**，解决了以往"2D 视频纹理"方案无法从新视角交互渲染的固有限制。

1. **3D 化的 Eulerian 运动场**：把运动表示为一个 3D 静态 Eulerian 场，通过渲染损失端到端监督，使运动场本身成为可从任意视角查询的 3D 场（而非 2D 纹理流的平移）。
2. **周期性重生（cyclically reborn）机制**：高斯点在固定时间周期内被循环重建，使静态 Eulerian 场天然产生**无缝循环**动画，无需显式的循环约束。
3. **非周期残差项**：真实水景含随机与非周期成分，额外引入一个非周期、时变残差项来捕捉相对静态 Eulerian 场的偏离，兼顾"循环骨架"与"随机细节"。

---

## 技术方案

### 核心思想

传统水面视频方法（2D video texture）只能在原视角播放。本方法将问题转化为 **4D 动态重建**：

```
静态 3D Eulerian 运动场  E(x) : R^3 → R^3
        ↓ 输运（advect）
规范高斯点集  G(t)  ← 每 T 周期重生一次
        ↓ 叠加
非周期时变残差  R(t)
        ↓
4D 动态重建 → 任意视角循环渲染
```

关键洞察：**"循环"不是靠损失函数硬约束出来的，而是由"运动场静态 + 粒子周期性重生"的结构性保证**。这比在损失里加循环惩罚项更鲁棒，也更省算力。

### 关键技术

| 技术 | 说明 |
|------|------|
| **静态 Eulerian 运动场** | 单一 3D 场对所有时间步生效 → 运动场参数量与时间无关，长序列不膨胀 |
| **周期性重生高斯** | 规范点集按固定周期重置，把"非循环"内容塞进重生的点里 |
| **时变残差** | 捕捉湍流细节、飞沫、随机扰动等不可循环成分 |
| **渲染损失直接监督** | 无需 3D 标注、无需多视角采集，损失即渲染损失 |

---

## 公式

运动场对点的输运（示意）：

```math
\mathbf{x}(t+\Delta t) = \mathbf{x}(t) + \Delta t \cdot E(\mathbf{x}(t))
```

周期性重生的规范点调制：

```math
G(t) = G_{\text{canonical}} \cdot \phi(t \bmod T)
```

渲染损失（端到端）：

```math
\mathcal{L} = \sum_{t} \left\| I(\pi, \mathbf{C}(t)) - I_{\text{obs}}(t) \right\|^2
```

---

## 实验结论

- **任务**：从**单段非循环 2D 水景视频**重建循环 4D 动态场景，支持新视角交互渲染。
- **基线**：此前的 2D 视频纹理方法（无法新视角）以及 3D 水景重建方法。
- **结果**：定量与定性均优于先前工作，实现"照片级"水景动画。

---

## 局限性

- 依赖至少能提供**初始视角的视频**，无法从静态图像恢复运动（时间维度信息缺失）。
- 静态 Eulerian 场无法表达**时变流场**（如潮汐、风的渐变），必须靠残差项兜底，残差承担过多时循环性会被破坏。
- 重建的仍是**视觉外观**而非物理一致的流场，不保证流体动力学正确性。

---

## 相关工作

- [[2026-10-13-Make-It-Flow-Water-3DGS]] — 同样在 3DGS 场景中做水流动画（点云驱动水）
- [[2026-10-20-FluidGen-Physics-Aware-Fluid-Video]] — 物理感知的流体视频生成（生成方向，本文是重建方向）
- [[2026-10-30-MG-CD-MPM-Continuum-Damage-Viscoplastic]] — MPM 本构层，可用于给残差项提供物理先验

---

## 实现建议

- **实现难度**：中（3DGS 训练框架 + 运动场场网络，主流 3DGS 代码库可直接改）
- **预期性能**：离线训练（数小时量级），推理实时（3DGS 光栅化）
- **适用场景**：**游戏/影视水面循环动画资产**、VFX 水景循环背景、需要新视角的水面场景
- **落地价值**：⭐⭐⭐⭐⭐ — 把"2D 视频纹理"这一 VFX 行业长期方案直接升级为可交互 3D，实用性极高
- **可扩展方向**：
  1. 用物理求解器替代静态运动场（Eulerian 场 → 真实速度场），残差项缩小
  2. 运动场的时变建模（分解为低频时变 + 高频静态）
  3. 迁移到烟雾/火焰：Eulerian 场 + 周期重生同样适用
