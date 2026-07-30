---
tags: [几何, 碰撞检测, 网格处理, 变形模拟]
date: 2026-07-30
venue: arXiv cs.GR
---

# Convex Collision-Free Regions (CCFR)

## 论文信息

- **arXiv ID**: [2607.26901](https://arxiv.org/abs/2607.26901)
- **作者**: Tomoyo Kikuchi
- **日期**: 2026-07-29
- **类别**: cs.GR, cs.CG, cs.RO

## 核心方法

CCFR 是一种显式表示局部凸可行区域的碰撞处理方法，通过构建周围网格基元配置（包括边-边和顶点-面交互）来构造每个可行区域。

### 关键创新

1. **显式凸可行区域表示**: 与隐式表示不同，CCFR 显式构造凸可行区域
2. **并行化处理**: 每个顶点的可行区域独立定义，可高度并行化
3. **统一处理**: 同时处理主碰撞、二次碰撞和余维接触
4. **解耦设计**: 约束编码与物理接触响应模型独立

### 算法流程

```
1. 对每个顶点 v:
   - 分析周围网格基元配置 (边-边、顶点-面)
   - 构造凸可行区域 FR(v)
2. 在模拟过程中:
   - 约束顶点位移在 FR(v) 内
   - 无需非线性优化
```

## 技术细节

### 约束类型
- **Edge-Edge 交互**: 两边之间的穿透检测
- **Vertex-Face 交互**: 顶点与三角形面片的碰撞
- **Codimensional 接触**: 线和点的碰撞处理

### 兼容性
- Extended Position-Based Dynamics (XPBD)
- 不依赖内点维护的迭代更新

## 应用场景

- 🧵 Cloth simulation (布料模拟)
- 💇 Hair simulation (头发模拟)
- 🔌 Wire simulation (线缆模拟)
- ⚛️ Particle systems (粒子系统)
- 余维接触场景

## 算法复杂度

- **时间复杂度**: O(n) 并行，每顶点常数时间
- **空间复杂度**: O(n) 存储可行区域

## 实现参考

### libigl 函数
- `igl::collision_detection`
- `igl::extract_collision_constraints`

### 相关库
- XPBD (Position-Based Dynamics)
- Position-Based Elasticity

## 可行性评估

| 维度 | 评分 | 说明 |
|------|------|------|
| 算法复杂度 | ⭐⭐⭐ | 中等，凸区域构造需几何计算 |
| 数值稳定性 | ⭐⭐⭐⭐ | 凸优化稳定性好 |
| 实现难度 | ⭐⭐⭐ | 有 libigl 参考 |
| 应用价值 | ⭐⭐⭐⭐ | 广泛用于模拟/游戏 |

### 推荐度: ✅ 推荐实现

## 相关论文

- Position-Based Dynamics (Müller et al.)
- XPBD (Macklin et al.)
- Local Collision Avoidance (Capell et al.)

## 备注

> CCFR 解决了变形模拟中的碰撞处理难题，特别是在处理复杂接触场景时相比传统隐式方法有显著优势。

---
*娃娃菜笔记 | 2026-07-30*
