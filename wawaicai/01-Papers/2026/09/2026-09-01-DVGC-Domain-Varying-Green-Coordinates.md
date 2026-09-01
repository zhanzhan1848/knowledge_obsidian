---
tags: [几何, 网格变形, cage-deformation, SIGGRAPH-Asia-2026]
date: 2026-08-31
---

# Domain-Varying Green's Functions for Cage-based Deformation

## 论文信息

| 字段 | 内容 |
|------|------|
| arXiv | [2608.31003](https://arxiv.org/abs/2608.31003) |
| DOI | 10.1145/3829340.3842236 |
| 会议 | SIGGRAPH Asia 2026 |
| 作者 | Dong Xiao |
| 提交 | 2026-08-31 |

## 核心方法

提出 **Domain-Varying Green Coordinates (DVGC)**，用域变化的 Green 函数统一 Harmonic Coordinates (HC) 和 Green Coordinates (GC) 两种经典 cage-based 变形方法。

**关键洞察**: 
- 当 Green 函数域 Θ 从 cage 区域 Ω 扩展到整个 ℝ² 时，变形效应从 HC 连续过渡到 GC
- 这提供了近二十年来首次统一两种技术的理论框架

## 算法流程

1. 定义域变化的 Green 函数 G_Θ(x, y)
2. 当 Θ = Ω（cage 区域）→ Harmonic Coordinates
3. 当 Θ = ℝ² → Green Coordinates
4. 中间域 Θ → DVGC，产生连续变化的变形效果

## 技术细节

### 闭式解
- **圆盘域**: 存在解析表达式，2D 简化 cage 无需数值积分
- **矩形域**: 半解析表达式，无需有限元离散

### 控制空间
- 提供比传统 HC 更一致于 cage 的控制
- 同时比 GC 更保形（shape-preserving）
- 用户可通过改变 Green 函数域获得不同变形效果

## 创新点

1. **首个统一框架**: 近 20 年来首次统一 HC 和 GC
2. **新控制空间**: 域变化的 Green 函数产生连续变形效果
3. **解析/半解析计算**: 避免数值积分和有限元

## 几何分类

- 类别: 网格变形 (Mesh Deformation)
- 子类: Cage-based Deformation
- 关联: Harmonic Coordinates, Green Coordinates, Shape Editing

## 开源参考

- libigl: 可参考 `harmonic_coordinates` 和相关 cage 变形函数
- 论文代码: 待发布

## 可行性评估

| 指标 | 评分 |
|------|------|
| 算法复杂度 | 中 |
| 数值稳定性 | 高（闭式解） |
| 实现难度 | 中 |
| 工程价值 | 高 |

**推荐度**: ✅ 推荐实现

## 关联笔记

[[网格变形]]
[[Cage-based Deformation]]
[[SIGGRAPH2026]]

---

*🥬 Wawaicai | 2026-09-01*
