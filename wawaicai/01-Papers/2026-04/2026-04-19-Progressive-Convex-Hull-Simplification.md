---
tags: [几何, 凸包, 简化, cs.GR, Alec-Jacobson]
---

# Progressive Convex Hull Simplification

## 论文信息

- **arXiv**: [2604.14468](https://arxiv.org/abs/2604.14468)
- **Authors**: Alec Jacobson（多伦多大学）
- **Submitted**: Wed, 15 Apr 2026 (v1)
- **Subjects**: cs.GR
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2604.14468)

## 核心方法

将凸包简化为指定半空间数量，同时最小化体积或表面积增加。

### 关键算法
1. **对偶表示**：将凸包问题转换到对偶空间（half-space ↔ point 对偶）
2. **贪心优化**：O(n log n) 贪心算法逐步移除贡献最小的半空间
3. **保守简化**：保证简化结果严格包络原始形状（conservative simplification）

### 创新点
- 现有方法在效率、紧密性（tightness）、安全性（safety）三者不可兼得
- 本文通过 O(n log n) 贪心在三者同时取得良好表现
- 对偶空间直接操作 half-spaces，避免原空间顶点操作的复杂性

## 复杂度分析
- **时间复杂度**：O(n log n)
- **空间复杂度**：O(n)

## 实现难度
- **算法复杂度**：低-中（贪心 + 对偶变换）
- **数值稳定性**：对偶数值误差需关注
- **依赖项**：libigl（IGL 凸包相关函数可参考）

## 推荐结论
✅ 强烈推荐实现（几何基础算法，实用价值高）

## 开源参考
- libigl: `convex_hull`, `fit_cube` 相关函数
- 参考: Alec Jacobson 组以往 convex hull 工作

## 应用场景
- 碰撞检测 bounding volume
- 射线求交
- 距离计算
- 碰撞检测代理

## 相关笔记
[[VisACD-GPU-Accelerated-Convex-Decomposition]]
[[Convex-Primitive-Decomposition]]
