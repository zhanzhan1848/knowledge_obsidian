---
title: "Physics-Shaped, Not Physical: Auditing Physics-Guided Underwater Image Restoration"
date: 2026-10-15
tags: [underwater, water-rendering, physics-informed, audit, cs.CV, cs.GR, methodology]
arxiv: 2610.19763
agent: doumiao (🌱)
relevance: ⭐⭐⭐⭐ (水下物理先验审计 — 流体渲染方向的方法论警钟)
---

# 📄 Physics-Shaped, Not Physical: Auditing Physics-Guided Underwater Image Restoration

## 基本信息

- **arXiv**: [2610.19763](https://arxiv.org/abs/2610.19763v1)
- **日期**: 2026-10-14 (cs.CV)
- **作者**: Mochamad Rizal Fauzan, Irgi Surya
- **分类**: cs.CV（cross-list 可能性：cs.GR）
- **关键词**: underwater imaging, physics-guided networks, Jaffe-McGlamery model, transmissivity, backscatter, negative result
- **代码/数据**: 未提及

## 核心创新

> **首篇对"物理先验水下网络"进行受控审计的方法论文**：揭示所谓的"物理"模块只是 **physics-shaped inductive bias**，与真实的物理建模并不等价

### 4 组受控实验设计

1. **完整数据 (800 图像)**：物理模块相比纯数据驱动 **零样本增益 ≤ 0.16 dB**，**3.4× FLOPs**
2. **少数据 (80 图像)**：物理模块确实帮助 (+0.65 ~ +1.48 dB)，但**校正后不单独显著**
3. **预测物理量物理性测试**：预测的 transmission 对 Sea-thru 测距的 Pearson r **不超过对照组**，甚至弱于 dark-channel prior。Beer-Lambert fit 仅解释 **0.4%** 方差
4. **跨数据集退化严重度**：物理模块的增益**符号反转**（UIEB 正增益但 AUIED3K 负增益）

### 主要结论

- Physics-guided 网络 **不是真执行物理**，而是 **inductive bias**
- 大数据量时冗余，小数据量时有帮助（但并非显著）
- 跨数据集的物理先验**泛化失败**

## 与流体（水下）渲染的关系

> **本论文是流体渲染领域的方法论警钟**

### 直接相关性

#### 1. 物理先验审计范式可推广到流体渲染
- 水下成像 / 烟雾渲染 / 体积介质渲染普遍使用"物理先验网络"：
  - **PolUR** (2026-10-13)：偏振 + RGB 多模态水下恢复
  - **RefracGS** (2026-04-08)：折射物理先验水表面
  - **WildFireGS** (2026-08-13)：火焰多模态物理
  - **WildSmoke** (2025-09-14)：物理约束烟雾重建
- 本论文的 4 组实验协议应作为后续流体渲染论文的**标配基线**

#### 2. 数据效率维度的发现
- **少数据时（80 图像）**：物理先验提供增益
- **大数据时（800 图像）**：物理先验沦为冗余
- **流体启示**：稀薄烟雾、深海水流等采集困难的场景 → 物理先验必要设计；通用数据集足够时 → 先验可有可无

#### 3. 对照实验设计的警钟
- 任何"物理先验"模型都应报告**参数量 + FLOPs 对照组**
- 否则"涨点"可能只是算力代价换来的回归

#### 4. 负面结果的价值
- 科学共同体极少发表负面结果，本论文具示范意义
- 流体渲染社区应建立 **"negative result track"** 来正视本领域的虚假物理声明

## 核心方法

### 受审模型
- **PhysGuide-Net**：代表性水下物理引导网络

### 评估协议
- **5-seed 消融**：5 个随机种子训练，结果取均值
- **零样本评估**：UIEB 训练 → LSUI/AUIED3K 完整集评估
- **物理量测试**：将预测的 transmission map 与 Sea-thru 实测 range map 做 Pearson 相关
- **数据效率曲线**：800 / 80 / 8 多训练规模

### 关键实验指标

| 训练规模 | UIEB 增益 | AUIED3K 增益 | 统计显著性 |
|----------|-----------|--------------|------------|
| 800 图像 | ≤ 0.16 dB | ≤ 0.16 dB | 95% CI 包含 0 |
| 80 图像  | +0.65 dB  | +1.48 dB     | 校正后不显著 |

## 创新点

- **方法论创新**：可复用的物理先验审计框架（4 组实验）
- **重要负面结果**：少见的 negative result 发表案例
- **跨学科连接**：对所有 "physics-informed" 领域的论文都是重要警示
- **可推广性**：可扩展到其他物理先验网络（fire/smoke/Navier-Stokes/PDE 求解器）

## 局限性

- 仅针对 PhysGuide-Net 一种架构审计
- 仅在水下成像（cs.CV）领域，可能不直接推广到 3D 重建场景
- 物理先验的某些形式（如硬约束、显式求解器）可能不在审计范围

## 与现有知识库的链接

- [[2026-10-14-PolUR-Underwater-Image-Restoration]] — PolUR 是物理先验正面例
- [[2025-09-14-wildsmoke-3d-smoke-from-single-video]] — WildSmoke 物理约束烟雾
- [[2026-04-08-RefracGS-Refractive-Water-Surfaces]] — RefracGS 折射物理先验
- [[2026-04-19_NeuVolEx-Volume-Exploration-INR]] — INR 体积场
- [[2026-07-19-Volumetric-Inverse-Rendering-Neural-Radiative-Transfer]] — 神经辐射传递
- [[2026-08-13-WildFireGS-Wildfire-Simulation-Gaussian-Splatting]] — WildFireGS

## 资源

- arXiv: https://arxiv.org/abs/2610.19763
- 无 GitHub

## 推荐度

✅✅ **强推荐** — 流体渲染方向的方法论标准论文；所有声称物理先验有效的工作都应引用

*由豆苗自动收录于 2026-10-15 14:13 UTC*
