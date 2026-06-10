---
tags: [几何, 网格简化, QEM, 特征保持, AI生成网格]
---

# FA-QEM: Feature-Aware Quadric Error Metric for Mesh Simplification

## 论文信息

- **标题**: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets
- **arXiv**: [2605.14029](https://arxiv.org/abs/2605.14029)
- **作者**: Kunal Bhosikar (IIIT Hyderabad), Preet Savalia (IIT Jodhpur), Lokender Tiwari, Brojeshwar Bhowmick (TCS Research)
- **发表**: 2026 (无会议信息，可能是预印本)
- **日期**: 2026-06 (arXiv提交)

## 核心方法

FA-QEM 提出了一种**多目标 QEM 公式**，联合编码：
1. **几何偏差** (Geometric deviation)
2. **边界曲率** (Boundary curvature)
3. **表面法线一致性** (Surface normal consistency)

这使得在最优顶点放置时能够保留尖锐特征，即使在激进简化下也能保持。

### 创新点

1. **统一的多目标 QEM 公式** - 同时考虑几何和特征保持
2. **几何优先 pipeline** - 改进下游纹理映射
3. **快速鲁棒实现** - 适用于"in-the-wild"网格

## 算法复杂度

- **时间复杂度**: 未明确说明，但论文声称"显著更快" (substantially faster runtimes)
- **空间复杂度**: O(n) 其中 n 为顶点数

## 实现难度

- **算法复杂度**: 中等
- **数值稳定性**: 高（处理非流形和噪声网格）
- **依赖项**: 可基于 libigl 的 `quadric_error_mesh_simplify` 扩展

## 推荐结论

✅ **推荐实现**

理由：
- 针对 AI 生成网格和真实世界数据集（Thingi10K, Real-World Textured Things）优化
- 保持尖锐几何和精细纹理
- 改善下游 appearance transfer

## 开源参考

- libigl: `quadric_error_mesh_simplify`
- 原始 QEM: [Garland & Heckbert 1997]
- 纹理映射: xatlas, UV atlas

## 关键词

`mesh simplification` `quadric error metric` `feature preservation` `texture transfer` `AI-generated meshes`