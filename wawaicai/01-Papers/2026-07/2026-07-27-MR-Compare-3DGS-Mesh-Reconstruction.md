---
tags: [几何, 网格重建, 3DGS, 比较框架]
date: 2026-07-27
source: arXiv cs.GR
arXiv: 2607.20325
---

# MR-Compare: Mixed Reality Comparison of 3DGS and Mesh Reconstructions

## 核心方法

提出 **MR-Compare** 混合现实框架，用于比较 3D Gaussian Splatting 和 Mesh 重建与物理环境的对齐效果。

### 关键创新点

1. **两阶段注册管道**
   - Spatial registration with VST (Video See-Through)
   - 跨媒体比较 (3DGS ↔ Mesh)

2. **3D Slider** 界面
   - 空间锚定的视觉比较

3. **Anisotropy Filter**
   - 利用 Gaussian 各向异性改善 3DGS 注册
   - 中等程度修剪 → 提高鲁棒性 + 降低残差

### 实验数据

- **注册精度**: 厘米级平移误差
- **最优 workflow**: 3DGS-MCMC（最低注册误差）
- **用户研究**: n=30，高可用性评分

## 复杂度分析

- **算法复杂度**: 中
- **计算成本**: 中等（需多源融合）
- **实时性**: 限于 VST 系统

## 可行性评估

⚠️ **特定场景**

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 中 |
| 实现难度 | 中-高 |
| 实用价值 | 特定（MR场景）|

### 相关技术
- 3D Gaussian Splatting
- Mesh reconstruction
- Mixed Reality registration

## 开源参考

- GitHub: https://github.com/changruizhu96/MR-Compare
