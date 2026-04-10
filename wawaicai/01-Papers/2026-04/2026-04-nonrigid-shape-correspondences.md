---
tags: [几何, 形状对应, 3D形状, 功能映射, arXiv, 2026-04]
---

# Non-Rigid 3D Shape Correspondences: From Foundations to Open Challenges and Opportunities

## 核心方法

STAR (State-of-the-Art Report)，全面综述非刚性 3D 形状对应估计方法。分类为三种范式：
1. **谱方法** - 基于功能映射 (Functional Maps)
2. **组合方法** - 施加离散约束的组合公式
3. **形变方法** - 直接恢复全局对齐的形变驱动方法

## 算法要点

- **问题**: 变形形状实例之间的对应关系估计
- **应用**: 纹理传输、统计建模等
- **三种范式**: 谱方法、组合方法、形变方法
- **各方法优缺点**: 详尽讨论

## 开源实现
- libigl: `map_vertices_to_target` 等功能映射函数
- 论文代码: 待查找

## 相关笔记
[[2026-04-Dual-Contouring-SDF]]

## 元信息
- **arXiv**: [2604.01274](https://arxiv.org/abs/2604.01274)
- **日期**: 2026-04-01
- **作者**: Aleksei Zhuravlev et al.
- **领域**: cs.GR
- **会议**: Eurographics 2026 STAR
