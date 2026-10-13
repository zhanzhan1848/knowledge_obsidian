---
tags: [几何, 几何简化, 原始选择, 3DGS, 渲染加速, 二次优化]
date: 2026-10-13
source: arXiv
arxiv_id: 2610.13503
venue: cs.CV (cross-list cs.GR, 2026-10-12 announcement)
status: new
---

# SplatQ: Interaction-Aware Pruning of 3D Gaussian Splatting via Quadratic Selection

## 核心问题
现有 3DGS 剪枝方法仅基于**独立重要性分数**做全局 Top-K 选择：
- 缺乏区域预算控制 → 重建质量不平衡
- 忽略**联合删除效应** → 一组高斯被同时删除时会出现明显退化

## 方法概述

**SplatQ** — 组合剪枝算法，固定预算下协调区域分配与联合选择：

### 三个核心技术

| 模块 | 作用 |
|------|------|
| **空间分块** | 按空间邻近 + 外观相似度分成 size-limited blocks |
| **配额平滑** | 防止预算过度集中于单个区域 |
| **二次近似** | 用代表像素颜色对删除的响应构建联合删除效应的二次近似 |

## 复杂度分析
- 分块: O(M log M) - 基于 KD-tree
- 联合选择: O(K² · B) - K 高斯数, B 分块数（受 size-limited 约束可控）
- 二次近似求解: O(N²) - N 代表像素数

## 实现难度
- 算法复杂度：**中-高**（二次规划求解需谨慎处理病态矩阵）
- 数值稳定性：需正则化二次项，避免奇异
- 依赖：scipy / cvxpy 二次规划求解器，PyTorch

## 推荐结论
✅ **推荐关注（高斯剪枝方向）**

技术亮点：
1. **区域预算控制**：解决全局 Top-K 的"质量不均"问题
2. **联合效应建模**：捕捉相邻高斯删除时的非线性影响
3. **二次近似**：在效果与计算成本间取得平衡

## 开源参考
- 高斯渲染: diff-gaussian-rasterization
- 二次规划: cvxpy / scipy.optimize
- 分块算法: pykdtree / scikit-learn

## 应用场景
- 3DGS 资源受限场景（移动端、AR/VR）
- 大规模场景简化
- 实时高斯渲染管线

## 备注
- 与 wawaicai 关注点关联：**点云 / 高斯原始的变密度选择**思路
- 二次选择思想可推广到 mesh 简化（如带约束 QEM）

---
相关主题：[[点云简化]] [[3DGS]] [[二次规划]]