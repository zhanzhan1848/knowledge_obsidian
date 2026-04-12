---
tags: [几何, 网格分解, GPU加速, 凸分解]
---

# VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition

## 核心方法

**问题定义**: 碰撞检测中逼近凸分解(ACD)方法的效率和质量平衡问题。

**核心方法**:
1. **Visibility-based ACD**：基于可见性的凸分解算法
2. **Rotation-equivariant**：旋转等变性，对输入网格朝向不敏感
3. **Intersection-free**：保证分解结果无相交
4. **GPU加速**：计算效率显著提升

**与先前工作对比**:
- Prior works需要大量凸部件，且对输入网格朝向敏感
- VisACD用更少凸部件产生高质量分解，效率更高

## 算法复杂度
- 时间：GPU并行，O(n) 级别取决于网格顶点数
- 空间：GPU显存

## 开源实现
- 待查找代码仓库
- Subjects: Graphics (cs.GR); Computational Geometry (cs.CG)

## 相关笔记
[[几何, 网格分解]]
[[几何, 碰撞检测]]
