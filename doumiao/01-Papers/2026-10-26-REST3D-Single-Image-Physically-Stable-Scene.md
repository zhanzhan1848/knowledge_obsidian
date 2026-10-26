---
type: paper
title: "REST3D: Reconstructing Physically Stable 3D Scenes from a Single Image"
date: 2026-10-26
agent: doumiao
domain: fluid-rendering
category: [surface-rendering]
tags: [single-image-3d-reconstruction, physical-stability, scene-tree, agentic-AI, physics-constrained-optimization, real2sim, VR]
venue: SIGGRAPH Asia 2026
doi: null
arxiv: 2605.30338
status: completed
---

# REST3D — 从单张图像重建物理稳定的 3D 场景

## 📌 基本信息

| 项目 | 值 |
|------|---|
| **作者** | Xiaoxuan Ma, Jiashun Wang, Nicolás Ugrinovic, Yehonathan Litman, Kris Kitani （均为 Carnegie Mellon University） |
| **会议** | SIGGRAPH Asia 2026 |
| **arXiv** | [2605.30338](https://arxiv.org/abs/2605.30338) （v1 2026-05-28, v2 2026-08-18）· cs.CV |
| **项目页** | https://shirleymaxx.github.io/REST3D/ |
| **代码** | https://github.com/ShirleyMaxx/REST3D ✅ **已开源** |
| **交互 Demo** | 项目页内嵌（Isaac Gym 物理仿真 + VR 交互） |

> **收录理由**：本库已收录多篇"从真实世界重建流体"的论文（SplashSplat、Make-It-Flow 等），但那些都聚焦**流体本身**的重构。REST3D 补的是**另一个环节**：重建出的**静态场景**在物理上是否稳定（不悬空、不穿模）。这是"从图像到可仿真资产"管线中**最容易被忽略、却最致命的一环** —— 一个穿模的场景在后续流体仿真中会直接爆炸。

---

## 🎯 核心问题

从单张 RGB 图像重建 3D 场景，可以把随手拍的照片变成**可用于仿真的数字资产**（沉浸式交互、内容创作）。但存在两类失败：

### 1. 单图重建方法：几何合理但物理不一致

现有的单图 3D 重建方法**无法捕捉场景的物理结构**，产生的结果**几何上看似合理但物理上不一致**，具体表现为：

- **物体悬空**（floating）
- **物体穿模**（penetration）

这两种错误会**导致物理仿真中的不稳定行为**。

### 2. 图像条件场景生成方法：物理合理但视觉不准

图像条件的场景生成方法改善了物理合理性，但**依赖强场景先验（strong scene priors）**，产生的结果虽然物理上说得通，**却与输入图像不匹配**（物体排布偏离图像）。

> **本文定位**：在"视觉一致"与"物理稳定"之间取得平衡。

---

## 🔬 方法

### 1. 智能体式物理场景理解（Agentic Physical Scene Understanding）

论文的第一项贡献：构建一个**场景树（scene-tree）表示**，从**重力支撑（gravity-support）视角**捕捉：

- 各物体的**物理状态**（physical states）
- 物体**之间的相互关系**（inter-object relationships）

这个场景树为后续重建提供了**结构先验（structural prior）**。

### 2. 初始化 + 场景树引导对齐

利用场景树结构：
- 用 **image-to-3D 模型**初始化场景
- 进行**场景树引导的对齐**（scene-tree-guided alignment）

### 3. 物理约束优化

在保持与输入图像**视觉一致**的前提下，通过**物理约束优化（physics-constrained optimization）**解决物理违规（悬空、穿模）。

---

## 📊 结果

- 在**合成与真实数据集**上**显著降低物理误差**并**提升仿真稳定性**，同时保持**强重建质量**
- 与 SOTA 单图 3D 重建方法对比：**DigitalCousins、Gen3DSR、SceneGen、SAM3D**
- 重建场景在 **Isaac Gym** 物理仿真中**快速稳定下来**（simulation-ready）
- 基线方法因**物体互相穿模**，在物理仿真器中施加重力后**物体爆炸式分离并变得不稳定**
- **VR 人-物交互**：实现了一套交互式 VR 系统，从单张图像重建沉浸式、物理上可靠的 3D 场景，使用户能通过**手部交互**自然地与稳定虚拟物体互动（Meta Quest Pro 录制，3× 速度回放）

---

## 🩸 可行性分析：单图物理稳定重建

### 渲染方法
- **类型**：表面渲染（重建质量层）
- **技术**：智能体式场景理解（场景树 + 重力支撑推理）+ image-to-3D 初始化 + 场景树引导对齐 + 物理约束优化

### 视觉质量
- **逼真度**：⭐⭐⭐⭐（保持强重建质量的同时大幅提升物理正确性）
- **风格化支持**：不适用

### 性能预期
- **帧率**：离线重建（非实时）
- **GPU 需求**：Isaac Gym 物理仿真需 GPU；重建依赖 image-to-3D 模型
- **内存占用**：重建完整场景 + 物理仿真状态

### 实现建议
- **着色器复杂度**：不适用
- **管线要求**：image-to-3D 模型 + 物理仿真器（Isaac Gym）+ 优化求解器
- **推荐度**：✅ **推荐（作为管线补充）** —— 若在构建"从真实照片到可仿真资产"的管线，REST3D 的**场景树 + 物理约束精化**是解决悬空/穿模的系统性方案，且**代码已开源**

### 对本库算法 Agent 的落地建议
1. **本库已有的流体重建论文（SplashSplat、Make-It-Flow 等）产出的是"流体几何"，但流体是"动态"的，静态场景的穿模/悬空问题同样会让流体仿真的边界条件出错** → 可考虑用 REST3D 的场景树思路为流体重建做**空间关系的物理合理性先验**
2. **"重力支撑视角"的场景树**是一个通用且易实现的抽象（谁支撑谁），可作为**任意单图重建后处理的结构约束**
3. **Isaac Gym 作为验证平台**值得复用 —— 重建质量的"物理稳定性"可以自动化度量（施加重力后是否爆炸式分离）

---

## 🔗 关联笔记

- [[SplashSplat-Multi-View-Liquid-Reconstruction]] — 真实多视角液体重建
- [[Make-It-Flow-Water-Animation-3DGS]] — 3DGS 水流动画
- [[REST3D-Single-Image-Physically-Stable-Scene]] — 本笔记

## 📚 参考文献（论文关键引用）

- Kerbl, B. et al. 2023. *3D Gaussian Splatting for Real-Time Radiance Field Rendering*.
- Saxena, A. et al. 2025. *SAM 3D*（对比方法）
- Yang, X. et al.（Gen3DSR，对比方法）
- Liu, Q. et al.（SceneGen，对比方法）
- Makoviychuk, M. et al. 2021. *Isaac Gym*（物理仿真平台）
- Batty, C. et al.（物理约束优化相关工作）
