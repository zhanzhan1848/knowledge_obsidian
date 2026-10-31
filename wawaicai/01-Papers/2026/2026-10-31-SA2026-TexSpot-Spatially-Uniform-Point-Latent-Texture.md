---
type: paper
created: 2026-10-31
updated: 2026-10-31
source: SIGGRAPH Asia 2026 (Technical Papers)
sa2026_id: papers_1208
venue: SIGGRAPH Asia 2026 Conference Papers (ACM TOG)
status: accepted
authors: 摘要未列全（SA2026 报道：香港中文大学(深圳) / ByteDance Games）
tags: [几何, 3D纹理表示, Texlet, 扩散模型, 纹理增强, 视图一致性, 点式纹理]
domain: geometry
agent: wawaicai
recommendation: ⭐⭐ 推荐（「Texlet」纹理表示有独立价值）
---

# TexSpot: 3D Texture Enhancement With Spatially-Uniform Point Latent Representation

> 📌 **SA2026（papers_1208）**。**Texlet 纹理表示**是本文的核心贡献——一个介于 UV 与点之间的中间表示。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | TexSpot: 3D Texture Enhancement With Spatially-Uniform Point Latent Representation |
| **发表** | **SIGGRAPH Asia 2026**（ACM TOG） |
| **代码** | 据 SA2026 报道：**准备中**（截至 2026-10-27） |
| **相关工作** | UltraTex（SA2026, papers_2019）—— 见本库另一笔记 |

---

## 技术概述

### 问题：现有 3D 纹理表示各有硬伤

| 表示 | 优点 | 硬伤 |
|------|------|------|
| **UV 贴图** | 紧凑、2D 工具链友好 | **展开时失真（distortion）**；分辨率受限 |
| **点式 3D 纹理** | 无 UV、无失真 | **纹理保真度与几何密度紧耦合** ⟹ **限制了高分辨率纹理生成** |

> 核心矛盾：**无失真** ⟹ 需要密集采样 ⟹ 成本高；**紧凑** ⟹ 需要 UV ⟹ 有失真。

**更上层的挑战**：当前主流**多视图扩散**管线存在**固有的视图不一致性（view-inconsistency）**。

### 核心思想：Texlet —— 介于 UV 与点之间的第三种表示 ⭐

> **「Texlet：一种把点式 3D 纹理的**几何表达力**与 UV 式的**紧凑性**合并起来的新 3D 纹理表示。」**

**每个 Texlet 的工作方式**：

```
局部纹理块（local texture patch）
   ↓ 2D 编码器（2D encoder）
latent 向量
   ↓ 3D 编码器（3D encoder）—— 融入全局形状上下文
Texlet latent（携带全局形状信息）
```

**解码（级联 3D→2D 解码器）**：
$$\text{Texlet latent} \xrightarrow{\text{级联 3D→2D 解码器}} \text{高质量纹理块}$$

> 关键：3D 编码器把**全局形状上下文**注入 ⟹ 每个局部的纹理块**知道自己属于物体的哪个部分** ⟹ 这正是解决视图不一致的关键。

### 训练与应用

- 训练一个**以 Texlet 为条件的扩散 Transformer（diffusion transformer）**，用来**精化并增强**多视图扩散方法产出的纹理
- 效果：**显著提升视觉保真度、几何一致性、鲁棒性**，优于现有 SOTA 3D 纹理生成/增强方法

---

## 复杂度分析

| 阶段 | 复杂度 | 说明 |
|------|--------|------|
| Texlet 编码 | 2D 编码器 + 3D 编码器（每个 Texlet 一次） | O(N_texlet) |
| 级联 3D→2D 解码 | 逐 Texlet 解码 + 2D 融合 | O(N_texlet × patch) |
| 扩散精化 | 扩散步数 × Texlet 集合 | 主要成本 |

**空间**：「空间均匀（spatially-uniform）」点布局 ⟹ **Texlet 数量与几何密度解耦** ⟹ 这是相对点式纹理的关键改进（点式纹理必须跟随几何密度）。

---

## 数值稳定性

### ✅ 优势
- ✅ **空间均匀采样** ⟹ 纹理分辨率**不再受几何密度限制** ⟹ 稀疏几何也能有高分辨率纹理 ⟹ **直接解决点式纹理的核心缺陷**
- ✅ **3D 编码器注入全局形状上下文** ⟹ 每个纹理块与几何对齐 ⟹ **视图一致性有结构保证**，而非靠后处理
- ✅ **级联解码**（3D→2D）⟹ 保留了 3D 上下文的同时利用 2D CNN 的高效纹理建模能力

### ⚠️ 风险点
- ⚠️ **「空间均匀」与「贴附表面」是一对矛盾**：点均匀分布在 3D 空间中 ⟹ 物体的**不同表面区域获得的 Texlet 密度不同** ⟹ 需定义「表面均匀」（用曲率/面积加权？）⟹ 论文摘要未展开
- ⚠️ **无 UV ⟹ 无法直接产出传统纹理贴图** ⟹ 与 DCC 工具链（Blender/Substance/Marmoset）的兼容性是实际问题
- ⚠️ **需要几何作为载体** ⟹ 几何精度差 ⟹ 纹理也会差 ⟹ **继承了上游重建的误差**
- ⚠️ **扩散精化阶段仍可能引入视图不一致**（若精化目标包含多视图一致性损失，则需额外的一致性度量）
- ⚠️ **级联解码器**的复杂度/内存开销未在摘要中给出

---

## 推荐结论

✅ **推荐（Texlet 表示值得单独跟踪）**

### 理由
1. **「Texlet」是一次表示层的巧思**：把 UV 的紧凑与点的无失真**合并**，且用**空间均匀**打破了「纹理分辨率 ⟷ 几何密度」的耦合
2. **解决视图不一致性有结构性思路**：把全局形状上下文注入每个局部纹理块 ⟹ 这是比「多视图一致性损失」更本质的做法
3. **与 UltraTex 形成互补**：
   - **UltraTex**：解决**多视图扩散在高分辨率下算不动**（Background Token Dropping + Block-Sparse Attention）
   - **TexSpot**：解决**多视图扩散的纹理不一致 + 表示分辨率受限**
   - ⟹ **一个治「效率」，一个治「一致性 + 表示」**
4. **对几何处理的启发**：
   - 「表面均匀采样」这个概念可用于**纹理、几何属性场、材质 ID 传播**等所有需要「在曲面上均匀布置标量场」的场景
   - 这与我库中的 [[2026-10-30-SA2026-MeRM-Neural-Geometry-Tokens]]（几何 token）属同一思路谱系

### 局限
- **无 UV** ⟹ 与现有纹理管线兼容性差
- **依赖上游几何质量**
- 代码尚未公开 ⟹ 短期无法验证

---

## 相关工作脉络

| 方向 | 代表 | 与本文关系 |
|------|------|-----------|
| 3D 纹理表示 | UV 贴图 / 点式纹理（3DGS 系）/ PointTex | **本文的出发点** |
| 3D 纹理生成 | **UltraTex**（SA2026） | **互补**：效率 vs 一致性 |
| 3D 纹理生成 | TexSpot（本文）/ GLOSS（SA2026）/ Texture Consolidation（arXiv 2610.36098） | 同赛道 |
| 纹理增强 | 各类 texture refinement / inpainting | 上游任务 |
| 扩散 Transformer | DiT 系 | 骨干 |
| 纹理基元 | Texel / Texlet / 神经纹理 | 表示谱系 |
| 点云纹理 | 各类 point-based texture | 直接对照 |

---

## 相关笔记

- [[2026-10-30-arXiv-2610.39306-CAD-WAM-Next-State-Supervision]]
- [[2026-10-28-2610-36098-Texture-Consolidation-Multi-View-Renderings]]
- [[2026-10-30-SA2026-MeRM-Neural-Geometry-Tokens]]

相关主题：[[几何处理]] [[3D纹理生成]] [[纹理表示]] [[点云纹理]] [[扩散模型]] [[视图一致性]] [[表面采样]]
