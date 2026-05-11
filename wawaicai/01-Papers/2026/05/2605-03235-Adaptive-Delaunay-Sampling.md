---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, mesh-generation, occupancy-function, marching-tetrahedra, delaunay, siggraph2026]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.03235
---

# Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding |
| **作者** | Suzuran Takikawa et al. |
| **发表** | ACM SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.03235) |

---

## 核心贡献

> 提出 Adaptive Delaunay Sampling (ADS) 方法，通过渐进式Delaunay四面体化实现 occupancy function 的随机采样和网格曲面重建

1. 使用渐进式 Delaunay 四面体化作为采样和曲面构建的脚手架
2. 仅需先前方法十分之一数量的函数评估即可达到同等精度
3. 结合 marching tetrahedra 和法向量估计进行高质量曲面重建

---

## 技术方案

### 核心思想

1. 从初始粗 Delaunay 脚手架开始
2. 迭代细化"跨越边缘"（两端点位于表面两侧的边缘）
3. 使用 Delaunay 准则将新顶点加入脚手架
4. 使用 marching tetrahedra 构建网格曲面

### 关键技术

| 技术 | 说明 |
|------|------|
| Delaunay 四面体化 | 作为采样和曲面化的统一框架 |
| 跨越边缘细化 | 逐步接近隐式表面 |
| Marching Tetrahedra | 从采样点生成网格 |
| 法向量估计 | 密集采样高频特征和曲率区域 |

---

## 实验结论

- **数据集**: 150个不同分辨率的输入
- **基线**: 现有随机采样和曲面重建方法
- **结果**: 精度/函数评估数量权衡显著改善

---

## 局限性

- 高度复杂拓扑可能需要更多迭代
- 依赖 occupancy function 的质量

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 隐式表面采样、网格重建、3D打印

---

## 相关工作

- [[Implicit Surface Reconstruction]]
- [[Mesh Generation]]
- [[Delaunay Triangulation]]
