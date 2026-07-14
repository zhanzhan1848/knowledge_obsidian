---
type: paper
created: 2026-07-14
updated: 2026-07-14
tags: [paper, spherical-parameterization, shape-generative-model, consistent-mapping, ECCV-2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.00492
---

# GenSP: Consistent Spherical Parameterization via Learning Shape Generative Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GenSP: Consistent Spherical Parameterization via Learning Shape Generative Models |
| **作者** | Sai Karthikey Pentapati, Shashank Gupta et al. |
| **发表** | ECCV 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.00492) |

---

## 核心贡献

> 通过学习形状生成模型，为 genus-0 形状集合预测从单位球面到各形状的连续映射，实现跨形状的一致性球面参数化

1. **神经生成模型框架**：将球面参数化问题重新表述为连续映射学习问题，从单位球面映射到数据集形状
2. **连续神经形变模型**：避免网格离散化伪影，从球面坐标和潜在形状码预测表面点
3. **中间形变空间**：在球面和输入形状之间引入中间形变，桥接异构形状集合
4. **对应传播**：沿潜在空间生成树的映射进行可靠初始对应估计

---

## 技术方案

### 核心思想

传统球面参数化对每个形状独立优化，导致跨形状参数不一致。GenSP 学习一个神经生成模型，预测从单位球面到整个形状集合的连续映射，使相似形状共享一致的参数化。

### 关键创新

| 技术 | 说明 |
|------|------|
| 连续神经形变模型 | 不依赖网格拓扑，避免离散化误差 |
| 中间形变插值 | 球面↔形状的中间形态，改进异构形状学习 |
| 潜在空间生成树 | 传播初始对应关系，保证跨形状一致性 |
| 形变场预测 | 球面坐标 + 形状码 → 3D 表面点 |

### 算法复杂度

- 时间复杂度：O(N) 推理（N 为形状数量）
- 预训练需要构建生成树：O(N²) 成对比较后建树

---

## 实验结论

- **数据集**: ShapeNet
- **基线**: 最先进球面参数化方法
- **结果**: 几何失真显著降低，跨形状一致性大幅提升

---

## 局限性

- 限于 genus-0 形状（球面拓扑）
- 需要预训练形状集合，对单形状泛化能力有限

---

## 相关工作

- [[Functional Map]] - 函数映射表示
- [[Spherical Parameterization]] - 传统球面参数化

---

## 实现建议

- **实现难度**: 中高（需神经生成模型 + 几何处理基础）
- **适用场景**: 形状集合分析、跨形状对应、形状插值

---

## 可行性分析 🥢

| 维度 | 评估 |
|------|------|
| 算法创新 | ⭐⭐⭐⭐ 参数化问题的生成模型视角新颖 |
| 实现难度 | 中高（生成模型 + 几何优化） |
| 数值稳定性 | 良好（神经表示天然平滑） |
| **推荐度** | ⭐⭐⭐⭐ 推荐，对参数化领域有重要贡献 |
