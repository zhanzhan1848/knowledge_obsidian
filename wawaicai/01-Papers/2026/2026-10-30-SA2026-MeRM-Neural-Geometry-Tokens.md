---
type: paper
created: 2026-10-30
updated: 2026-10-30
source: SIGGRAPH Asia 2026 (Technical Papers) / ACM TOG
arxiv: null
journal: ACM Transactions on Graphics (SIGGRAPH Asia 2026 Conference Proceedings)
published: 2026-12-01 (会议: 2026-12-01~04, 吉隆坡 KLCC)
status: accepted
tags: [geometry, mesh-reconstruction, feed-forward, multi-view-transformer, geometric-token, depth-normal-mask, sparse-view, surface-reconstruction]
domain: geometry
agent: wawaicai
recommendation: 推荐（把「多视图 Transformer 的中间 token」当作几何预聚合器，是很漂亮的想法）
---

# MeRM: Large Mesh Reconstruction Model via Neural Geometry Tokens

> 📌 **今日最具「AI for Geometry」方法论价值的一篇**：诊断出前馈式网格重建的真正瓶颈是 **2D 视觉输入与 3D 曲面目标之间的结构性错配（structural misalignment）**，并用一个巧妙的办法解决：**让预训练多视图 Transformer 的中间 token 充当「几何预聚合器」**。

## 基本信息

| 项 | 内容 |
|----|------|
| **标题** | MeRM: Large Mesh Reconstruction Model via Neural Geometry Tokens |
| **作者** | Kai Ye, Haoru Wang, Zhongyu Shi (北京大学), Ding Liang, Yan-Pei Cao (VAST AI), Wenzheng Chen (北京大学) |
| **发表** | SIGGRAPH Asia 2026 Technical Papers（ACM TOG 特刊） |
| **论文页** | [sa2026.conference-schedule.org/presentation/?id=papers_2513](https://sa2026.conference-schedule.org/presentation/?id=papers_2513) |

## 技术概述

### 问题：稀疏视角下的几何歧义

从**稀疏 RGB 图像**做**高保真表面重建**是重大挑战：

> **经典的基于优化的方法**在**对极约束不足（insufficient epipolar constraints）**时通常**无法解决几何歧义**。

近期的**前馈方法**（直接回归点云或 3D 高斯）进展显著，但：

> 把这类范式**扩展到显式表面重建**通常会得到**次优的几何质量**。

### 诊断：结构性错配才是瓶颈

> 我们把前馈式表面重建的主要障碍识别为 **2D 视觉输入与 3D 曲面目标之间的固有结构性错配**，这造成了一个**学习瓶颈**并导致性能退化。

**这个诊断非常有价值**。它说的是：不是「网络不够大」「数据不够多」，而是**任务形式本身有错配**：

- 网络的输入是**2D 图像**（每个视角一个 2D 特征图）
- 输出是**3D 曲面**（显式网格）
- 2D→3D 的跨越需要**多视角的几何一致性推理**，而普通的多视图 Transformer **默认只做特征聚合，不做几何推理**

### 解法：Neural Geometry Token（NGT）

> 我们的关键洞察是：**一个预训练来预测稠密深度图、法向图和掩码的多视图 Transformer 的中间 token，可以充当一个强大的几何预聚合器**，从而弥合这个 2D-3D 结构性错配。

这个想法非常巧妙：

```
多视图图像
    ↓
预训练的多视图 Transformer（预测深度/法向/掩码）
    ↓
【中间 token】 ← NGT：已经携带了稠密几何信息
    ↓
MeRM 主体
    ↓
显式网格
```

**为什么中间 token 就够？**

因为一个被训练去预测**深度图 + 法向图 + 掩码**的 Transformer，其内部 token **必然已经编码了密集的逐像素几何信息**（否则它无法预测这些）。这个几何信息通常在下游任务里被浪费掉了 —— NGT 只是**把它取出来用**。

**训练与推理效率**：论文强调「**保持出色的训练与推理效率**」。

### 结果

> 在多个实验中，MeRM **显著超过既有的前馈方法**，甚至**在稠密视角下超过了 state-of-the-art 的基于优化的方法**，尽管它**只使用稀疏输入**。

> 💡 **「稀疏输入超越稠密输入的优化方法」是一个很强的声明** —— 优化方法（SDF 优化、Poisson、DSR 类）在稠密视角下通常是 SOTA。

## 复杂度分析

- **前馈**：一次网络前向 ⇒ **O(1)** 相对输入数量（无逐场景优化）—— 这是相对优化方法的**根本优势**
- **训练**：一个大模型（"large-scale"）—— 摘要未给参数量
- **推理**：论文强调效率，但未给数字

## 实现难度与数值稳定性

- **算法复杂度**：**中高**。需要一个**多视图 Transformer 预训练**（深度/法向/掩码预测），再从其中间层抽 token 喂给 MeRM。**预训练是最大的工程成本**。
- **数值稳定性**：**中**。前馈无迭代优化，稳定性好（训练稳定即可）。主要风险是**预训练模型的质量**上限。
- **依赖项**：PyTorch；预训练的多视图 Transformer 需自行训练或复用（论文提到 VGGT / Pixel3DMM 在 UVFaceFusion 中被使用，说明这类组件在本领域已有生态）。

## 实验结论

- **基线**：前馈重建方法；SOTA 基于优化的方法
- **结果**：
  - **显著超过**既有前馈方法
  - **在稠密视角下超过 SOTA 优化方法**（而自身只用稀疏输入）
  - 训练与推理效率保持优秀

## 局限性

- **依赖预训练模型的泛化性** —— NGT 的质量直接由预训练的多视图 Transformer 决定。
- **「结构性错配」是诊断而非消除** —— NGT 是在**缓解**错配，不是消除。
- **显式网格的分辨率**如何确定（固定？由网络预测？）摘要未说明。
- 摘要未给出**具体数字**（只说"significantly outperforms"）。
- **数据集**未在摘要中列出。

## 相关工作

- [[2026-10-30-SA2026-ADELE-Adaptive-Delaunay-Mesh-Native-Reconstruction]] — 同为「直接产出网格」
- [[2026-10-30-SA2026-RBF-Your-SDF-RBF-Interpolation-SDF]] — 隐式 → 显式
- [[2026-10-30-SA2026-UVFaceFusion-UV-Space-Neural-Fusion]] — 多视图 + UV 空间融合
- [[2026-10-29-arXiv-2610.37485-AMOR-Operator-Learning-Arbitrary-Meshes]] — 本库已有

## 实现建议

- **实现难度**：**中高**
- **预期性能**：前馈推理，远快于逐场景优化
- **适用场景**：
  - **稀疏视角的快速重建**（消费级相机、AR 扫描）
  - **需要实时/批量重建**的场景
  - **与优化方法互补**：可用前馈做初始化，再优化精修
- **对团队的直接价值**：**中高**。「**把别的任务的中间表征拿来复用**」是一个高性价比的思路 —— 我们如果有已经训练好的多视图/深度/法向模型，它们的中间特征可以零成本地尝试接入几何任务。

## 可直接抄的工程结论

1. **诊断要落到「结构性错配」这一层**，而不是「网络不够大」。本文的价值在于把问题定位到任务形式上。
2. **被训练去预测几何量的模型，其内部表征必然携带几何信息** —— 这是「免费的几何先验」来源。
3. **前馈与优化不是二选一** —— 前馈做初始化、优化做精修，是最实用的组合。

---

*来源：SIGGRAPH Asia 2026 官方会议日程（sa2026.conference-schedule.org）技术论文摘要 · 检索时间：2026-10-30 14:06~14:20 UTC*
