---
type: paper
created: 2026-04-14
updated: 2026-04-14
tags: [paper, 3d-asset-generation, skeleton, skinning, flow-matching, animatable]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.08746
---

# AniGen: Unified S^3 Fields for Animatable 3D Asset Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Unified S^3 Fields for Animatable 3D Asset Generation |
| **作者** | Yi-Hua Huang et al. |
| **发表** | arXiv cs.GR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.08746) |
| **主页** | [AniGen Web](https://yihua7.github.io/AniGen-web/) |

---

## 核心贡献

> 统一框架，从单张图像直接生成可动画 3D 资产（配备关节骨架和蒙皮权重）

1. 将形状、骨架和蒙皮表示为在共享空间域上定义的互一致的 S^3 场
2. 置信度衰减骨架场，明确处理 Voronoi 边界的几何歧义
3. 双皮肤特征场，将蒙皮权重与特定关节数解耦
4. 两阶段 flow-matching 管道：先合成稀疏结构骨架，再生成密集几何和关节

---

## 技术方案

### 核心思想

近期 3D 生成模型可以从图像合成视觉上可信的形状，但结果通常是静态的。事后自动绑定方法脆弱且常产生与生成几何拓扑不一致的骨架。AniGen 将形状、骨架和蒙皮统一表示为 S^3 场，直接从单张图像生成可动画资产。

### 关键创新

| 创新 | 说明 |
|------|------|
| S^3 场 (Shape, Skeleton, Skin) | 互一致的联合表示 |
| 置信度衰减骨架场 | 处理 Voronoi 边界歧义 |
| 双皮肤特征场 | 与关节数解耦，支持任意复杂度 |
| 两阶段 flow-matching | 先生成稀疏结构，再生成密集几何 |

---

## 实验结论

- **数据集**: 多种类别（动物、人形、机械）
- **质量**: 在骨架有效性和动画质量上显著优于基线
- **泛化**: 有效泛化到野外图像

---

## 实现建议

- **实现难度**: 高 (flow-matching + 多场联合学习)
- **适用场景**: 游戏资产创建、动画制作、虚拟现实

---

## 相关工作

- [[3D Asset Generation]]
- [[Skeleton Extraction]]
- [[Skinning Weights]]
- [[Flow Matching]]