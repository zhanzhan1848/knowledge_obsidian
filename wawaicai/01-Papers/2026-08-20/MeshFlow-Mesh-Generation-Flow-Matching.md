---
title: "MeshFlow: Mesh Generation with Equivariant Flow Matching"
authors: ["Qi Sun", "Kiyohiro Nakayama", "Jing Yan", "Qixing Huang", "Alexander Rush", "Leonidas Guibas", "Gordon Wetzstein", "Jing Liao", "Guandao Yang"]
date: 2026-07
tags: [几何, 网格生成, Flow Matching, 等变网络, 生成模型, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #1165"
---

# MeshFlow: Mesh Generation with Equivariant Flow Matching

## 核心方法

本文提出**基于等变Flow Matching的网格生成方法**。

### 核心创新点

1. **Flow Matching**: 使用扩散概率流的网格生成
2. **等变网络**: 保证几何变换下的不变性/协变性
3. **高质量网格**: 生成具有正确拓扑的网格
4. **端到端**: 无需多阶段后处理

### 技术框架

```
噪声网格 → Flow Matching → 细粒度网格 → 等变特征
```

## 应用场景

- 3D内容生成
- 自动建模
- 数据增强
- 几何深度学习

## 开源实现

- 几何深度学习: `Equivariant Point Network`
- 网格处理: libigl

## 几何相关性

✅ **高相关**: 网格生成前沿研究
- 生成模型
- 网格处理
- 深度学习

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 高 |
| 数值稳定性 | ⭐⭐ 一般 |
| 实现难度 | ⭐⭐⭐ 高 |
| 生成质量 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐关注**

Flow Matching是生成模型的新方向，网格生成具有重要应用价值。

## 相关笔记
[[2026-08-20-Nexus-Native-Mesh-Generation-Diffusion]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
