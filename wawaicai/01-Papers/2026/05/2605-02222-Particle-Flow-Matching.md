---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, generative-model, particle-system, surface-normal, ShapeNet]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.02222
---

# Orbit-Space Particle Flow Matching

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Generative Modeling with Orbit-Space Particle Flow Matching |
| **作者** | Jinjin He et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.02222) |

---

## 核心贡献

> 提出 OGPP，粒子原生流匹配框架，用于粒子系统的生成建模

1. Orbit-space 规范化：概率路径终端点的规范表示
2. 粒子索引嵌入：角色专业化
3. 几何概率路径：弧长感知终端速度，同时生成法向量

---

## 技术方案

### 核心思想

两个洞察：
1. 粒子按置换对称性定义，匿名索引膨胀 per-index 目标方差
2. 粒子存在于物理空间，终端速度有物理意义，可编码几何属性（如表面法向量）

三个关键组件：
1. Orbit-space 规范化
2. 粒子索引嵌入
3. 弧长感知几何概率路径

### 关键技术

| 技术 | 说明 |
|------|------|
| Orbit Space | 置换不变表示 |
| 粒子流匹配 | 生成模型 |
| 表面法向量 | 作为副产物生成 |

---

## 实验结论

- **最小曲面基准**: 单步推理误差降低两个数量级
- **ShapeNet**: 5x 少步数达到 SOTA
- **单形状编码**: 法向量和重建与 6D 生成器竞争

---

## 局限性

- 依赖于粒子表示的质量
- 对极端复杂形状可能需要更多步

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 粒子系统生成、形状建模、表面重建

---

## 相关工作

- [[Generative Models]]
- [[Particle Systems]]
- [[Surface Reconstruction]]
