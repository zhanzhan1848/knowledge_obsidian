---
type: paper
created: 2026-05-10
updated: 2026-05-10
tags: [particle-system, generative-model, flow-matching, fluid-simulation]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2605.02222
---

# Orbit-Space Particle Flow Matching for Generative Modeling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Generative Modeling with Orbit-Space Particle Flow Matching |
| **作者** | Jinjin He et al. |
| **发表** | arXiv cs.GR (2026-05-04) |
| **链接** | [原文](https://arxiv.org/abs/2605.02222) |
| **DOI** | 10.48550/arXiv.2605.02222 |
| **代码** | 待查 |

---

## 核心贡献

粒子系统生成模型的核心创新，解决粒子系统生成中的置换对称性问题

1. **Orbit-Space Canonicalization**: 将概率路径终端点在轨道空间中进行规范化，解决粒子匿名索引导致的方差膨胀问题
2. **Particle Index Embeddings**: 粒子索引嵌入实现角色专门化
3. **Geometric Probability Paths**: 几何概率路径结合弧长感知终端速度，同时生成表面法线

---

## 技术方案

### 核心思想

粒子系统具有置换对称性——粒子的定义与索引无关。传统方法对粒子进行匿名索引，导致每个索引的目标方差膨胀，生成曲线难以学习。OGPP 通过轨道空间规范化解决了这个问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| Orbit-Space Canonicalization | 在轨道空间中对终端点进行规范化处理 |
| Particle Index Embeddings | 为每个粒子分配可学习的索引嵌入 |
| Arc-length-aware Terminal Velocities | 弧长感知的终端速度，同时生成法线 |

---

## 实验结论

- **最小曲面基准**: 单步推理误差降低最多两个数量级
- **ShapeNet**: 与 SOTA 持平，步数减少 5 倍
- **飞机 EMD**: 与 DiT-3D 可比，参数少 26 倍，步数少 5 倍

---

## 相关工作

- [[Particle System]]
- [[Flow Matching]]
- [[生成模型]]

---

## 实现建议

- **实现难度**: 中 (需要理解轨道空间概念)
- **预期性能**: 单步高质量生成
- **适用场景**: 粒子系统生成、流体粒子模拟、散射介质渲染