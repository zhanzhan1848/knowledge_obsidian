---
type: paper
created: 2026-06-19
updated: 2026-06-19
tags: [paper, skeleton, point-cloud, tubular-structures, Delaunay, MST, geometry-processing]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2606.19949
---

# Semi-Automatic Correction of 3D Tubular Structure Skeletons via Component-Wise MST and Filtered Delaunay Triangulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Semi-Automatic Correction of 3D Tubular Structure Skeletons via Component-Wise MST and Filtered Delaunay Triangulation |
| **作者** | Chuan Li et al. (Shanghai Jiao Tong University, Télécom Paris, Sorbonne Université, etc.) |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.19949) |
| **代码** | [GitHub](https://github.com/yangruoxuan0516/ParcoursRecherche) |

---

## 核心贡献

> 针对管状结构（如血管、根系、神经）骨架提取中的两类典型错误（交叉连接和断裂），提出一种半自动校正方法

1. **最小用户输入**：仅需指定源点和目标点，自动推断连接路径
2. **组件级 MST 传播**：利用最小生成树进行稳定的局部传播
3. **过滤 3D Delaunay 边图**：用于桥接间隙和处理歧义连接

---

## 技术方案

### 核心思想

给定用户选择的源点和目标点，算法通过以下步骤重建管状结构的骨架连接：
1. 构建组件级最小生成树 (MST) 进行局部传播
2. 构建过滤的 3D Delaunay 边图用于间隙桥接
3. 使用综合评分（方向连续性、空间邻近性、组件一致性、目标导向进度）对候选步骤排序

### 关键技术

| 技术 | 说明 |
|------|------|
| Minimum Spanning Tree (MST) | 稳定局部传播，处理分支结构 |
| 3D Delaunay Triangulation | 空间划分，间隙桥接 |
| Kelvinlet Basis Functions | 变形建模（参考） |
| Libigl | 实现库，交互查看器 |

---

## 实验结论

- **数据集**: Brain vessel MRA 数据 (20 名健康志愿者)
- **性能**: ~60k 原始点，~8k 骨架点，实时交互响应
- **精度**: 主观验证，定性结果展示

---

## 局限性

- 目前验证是定性的
- 高度歧义的连接需要额外指导

---

## 相关工作

- Skeletonization (Lee et al. 1994, ITK, scikit-image)
- Power Crust (Amenta 2001)
- Mean Curvature Skeletons (Tagliasacchi 2012)
- SkeletonLab (BARBIERI 2016)

---

## 实现建议

- **实现难度**: 中等
- **依赖项**: Libigl, scikit-image (skeletonize_3d)
- **适用场景**: 医学图像骨架校正、植物根系分析、神经连接组学
