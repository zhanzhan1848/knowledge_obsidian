---
type: paper
created: 2026-07-15
updated: 2026-07-15
tags: [paper, mesh-generation, flow-matching, equivariant, SIGGRAPH2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2606.23489
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | MeshFlow: Mesh Generation with Equivariant Flow Matching |
| **作者** | Qi Sun et al. |
| **发表** | SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.23489) |
| **DOI** | 10.48550/arXiv.2606.23489 |
| **代码** | https://qiisun.github.io/MeshFlow/ |

---

## 核心贡献

> 使用等变最优传输流匹配模型直接生成三角形Soup网格，避免序列化长自回归序列，实现18倍推理加速

1. **等变最优传输流匹配**：提出尊重三角形Soup关键对称性的方法——面的任意排列和每个面内顶点的排列
2. **Diffusion Transformer改进**：对Diffusion Transformer架构进行简单而有效的修改，保持所需等变性的同时建模速度场
3. **最优传输训练目标**：消除违反对称性的监督信号，改善收敛性
4. **推理加速**：比SOTA自回归网格生成器快约18倍

---

## 技术方案

### 核心思想

MeshFlow学习直接生成三角形Mesh作为三角形Soup，避免将Mesh序列化为长自回归序列。采用等变最优传输流匹配模型，尊重三角形Soup的关键对称性：
- 面的任意排列不变性
- 每个面内顶点的排列不变性

### 关键技术

| 技术 | 说明 |
|------|------|
| 等变最优传输流匹配 | 保持面/顶点排列对称性的生成模型 |
| Diffusion Transformer | 可扩展的网络架构建模速度场 |
| 三角形Soup表示 | 避免网格序列化，直接生成面集合 |
| 最优传输目标 | 消除违反对称性的梯度 |

---

## 实验结论

- **生成质量**：与SOTA自回归网格生成器相当
- **推理速度**：约18倍加速
- **项目主页**：https://qiisun.github.io/MeshFlow/

---

## 局限性

- 主要针对静态网格生成
- 依赖预定义的拓扑结构

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 生成质量与AR方法相当，速度显著提升
- **适用场景**: 游戏资产生成、CAD模型快速原型、批量网格生产
- **参考库**: libigl (mesh I/O), Open3D (点云处理)

---

## 相关工作

- [[MeshVAE+Flow-based Diffusion Transformer (CVPR2026)]]
- [[自回归网格生成器]]
