---
type: paper
created: 2026-04-13
updated: 2026-04-13
tags: [paper, 3D-generation, animation, skeleton, skinning, flow-matching, arxiv, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.08746
---

# AniGen: Unified S³ Fields for Animatable 3D Asset Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AniGen: Unified S³ Fields for Animatable 3D Asset Generation |
| **作者** | Yi-Hua Huang, Zi-Xin Zou, Yuting He, Chirui Chang, Cheng-Feng Pu, Ziyi Yang, Yuan-Chen Guo, Yan-Pei Cao, Xiaojuan Qi |
| **发表** | arXiv cs.GR, 2026-04-09 |
| **链接** | [原文](https://arxiv.org/abs/2604.08746) |
| **DOI** | 10.48550/arXiv.2604.08746 |
| **代码** | https://yihua7.github.io/AniGen-web/ |

---

## 核心贡献

> 从单张图像生成可动画的3D资产（包含几何、骨架和蒙皮权重）

1. **统一生成框架**：将形状、骨架、蒙皮统一表示为S³ Fields，在共享空间域中联合生成
2. **置信度衰减骨架场**：处理Voronoi边界处骨型预测的几何歧义
3. **双蒙皮场**：将蒙皮权重与特定关节数解耦，支持任意复杂度rig的生成

---

## 技术方案

### 核心思想

将3D形状、骨架和蒙皮表示为在共享空间域上定义的 mutually consistent S³ Fields (Shape, Skeleton, Skin)，通过两阶段flow-matching pipeline生成。

### 关键技术

| 技术 | 说明 |
|------|------|
| S³ Fields | 统一表示形状、骨架、蒙皮的连续场 |
| Confidence-Decaying Skeleton Field | 处理骨架预测的歧义性 |
| Dual Skin Feature Field | 支持任意关节数的蒙皮预测 |
| Two-Stage Flow-Matching | 先生成稀疏结构scaffold，再生成密集几何 |
| SkinAE | 预训练的蒙皮自编码器 |

### 方法流程

1. **编码阶段**：使用结构化潜在自编码器将S³ Fields压缩为稀疏潜在码
2. **生成阶段**：给定条件图像，稀疏结构flow模型预测voxel scaffolds
3. **解码阶段**：解码器同时输出几何和rigging信息

---

## 公式

### VSD (Variational Score Distillation) 梯度

```math
∇L_VSD = E[ω(t)(ε^φ(z_t; y, t) - ε^LoRA(z_t; y, t, c)) ∂x/∂θ]
```

### 置信度衰减骨架场

在Voronoi边界区域显式降权，聚焦高确定性区域。

---

## 实验结论

- **数据集**: 动物、人形、机械等多类别
- **基线**: TRELLIS + UniRig/Anymate/Puppeteer/RigAnything
- **结果**: 在rig有效性和动画质量上显著优于sequential baselines

---

## 局限性

- 依赖于预训练的3D生成模型质量
- 对极端姿态的泛化能力有限

---

## 相关工作

- [[TRELLIS]] - 高质量3D生成
- [[GaussianDreamer]] - 3DGS文本生成
- [[DreamFusion]] - SDS优化

---

## 实现建议

- **实现难度**: 中高（需要flow-matching、3DGS相关经验）
- **预期性能**: 可生成高质量可动画资产
- **适用场景**: 游戏资产生成、虚拟现实、 embodied AI

---

## 标签

#3D生成 #动画 #骨架 #蒙皮 #渲染 #flow-matching #2026
