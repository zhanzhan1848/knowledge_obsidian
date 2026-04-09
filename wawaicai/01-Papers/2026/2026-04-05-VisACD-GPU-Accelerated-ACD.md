---
tags: [网格处理, 凸分解, GPU加速, 碰撞检测, 网格简化]
---

# VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition

## 论文信息

| 属性 | 值 |
|------|-----|
| arXiv | [2604.04244](https://arxiv.org/abs/2604.04244) |
| 分类 | cs.GR, cs.CG |
| 提交时间 | 2026-04-05 |
| 作者 | Egor Fokin 等 |

## 核心方法

### 问题背景
物理仿真中的碰撞检测需要在精度与效率间权衡：
- 原始网格：精度高，计算昂贵
- 基础图元（包围盒等）：效率高，精度差
- ACD（近似凸分解）：平衡两者，但传统方法需大量凸块且对输入方向敏感

### 核心创新
**VisACD**：基于可见性信息的旋转等变、交-free ACD 算法，GPU 加速。

### 关键特性

1. **Visibility-based**：利用可见性信息引导凸块生成，减少不必要的分解
2. **Rotation-equivariant**：输出与输入旋转方向无关，保证一致性
3. **Intersection-free**：保证凸块之间不相交
4. **GPU-accelerated**：并行计算，适合大规模网格

### vs 传统 ACD
| 方法 | 凸块数量 | 方向敏感性 | 效率 |
|------|---------|-----------|------|
| 传统 V-HACD | 多 | 敏感 | 中 |
| **VisACD** | **少** | **不敏感** | **高** |

## 开源实现

| 库 | 关联函数 |
|----|---------|
| libigl | `convex_decomposition`（需扩展支持 VisACD 思路）|
| CGAL | `convex_hull_3`, `decompose` |
| VHACD | 传统 ACD 参考 |

## 可行性评估

✅ **推荐实现**

### 推荐理由
1. GPU 并行化友好，适合工程集成
2. 碰撞检测预处理管线直接可用
3. 旋转等变性保证了算法的稳定性
4. 减少凸块数量意味着更快的碰撞查询

### 实现注意事项
- 需要 CUDA/OpenCL 实现 GPU 路径
- 可见性计算的几何核心可复用 libigl
- 与 PhysX/Havok 等游戏引擎碰撞系统兼容

## 相关笔记

- [[2026-04-09-DAILY-SUMMARY]] — 每日摘要
