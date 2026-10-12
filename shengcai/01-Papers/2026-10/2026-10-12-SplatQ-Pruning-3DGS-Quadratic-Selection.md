---
type: paper
created: 2026-10-12
updated: 2026-10-12
tags: [paper, 3DGS, rasterization, real-time-rendering, pruning, optimization, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.13503
---

# SplatQ: Interaction-Aware Pruning of 3D Gaussian Splatting via Quadratic Selection

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SplatQ: Interaction-Aware Pruning of 3D Gaussian Splatting via Quadratic Selection |
| **作者** | Hongbin Ye, Haixu Liu, Shenwei Kang, Wenxiu Wei, Tinglan Wang (+11) |
| **发表** | arXiv cs.GR 2026-10-09 |
| **链接** | [原文](https://arxiv.org/abs/2610.13503) |
| **DOI** | - |
| **代码** | 未提及 |

---

## 核心贡献

> 提出组合剪枝算法 SplatQ：用 QUBO（二次无约束二值优化）在固定预算下联合选择 Gaussians，同时考虑 (1) 区域预算分配 (2) 共同删除的交互效应。

1. **空间分块 + 表观相似度分块** — 拆解全局选择为定长子问题
2. **预算平滑** — 防止预算过度集中
3. **二次选择目标 (QUBO)** — 包含独立响应、成对交互、配额惩罚；通过模拟退火 (SA) 或相干伊辛机 (CIM) 求解

---

## 技术方案

### 核心思想

现有 3DGS 剪枝方法全部基于全局 Top-K 选择 + 独立重要性分数：
- 缺乏**区域预算控制** → 重建质量空间分布不均
- 忽略**联合删除效应** → 删除某些 Gaussians 会影响其他 Gaussians 的可见贡献

SplatQ 把剪枝问题形式化为 QUBO 优化，可以同时建模三种效应。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Spatial-Appearance Partition** | 按空间邻近 + 表观相似度分块，控制问题规模 |
| **Budget Smoothing** | 平滑基于重要性的块保留配额，防止过度集中 |
| **Quadratic Approximation** | 用 representative pixel color 对 opacity 变化的响应近似联合删除效应 |
| **QUBO 求解** | SA 或 CIM 硬件求解 |

### QUBO 目标函数

```math
\min_{x \in \{0,1\}^N} x^T Q x = \sum_i q_{ii} x_i + \sum_{i<j} q_{ij} x_i x_j
```

其中：
- $q_{ii}$: 单个 Gaussian 的重要性
- $q_{ij}$: 成对交互（删除 A 对 B 可见性的影响）
- 配额约束以 penalty 形式融入

---

## 实验结论

- **数据集**: 5 个 benchmark
- **基线**: 现有 SOTA pruning 方法
- **结果**:
  - 聚合重建质量超越 SOTA
  - 空间质量更平衡
  - 渲染速度更快
- **消融**: 预算平滑改善局部细节；交互建模改善固定预算下的选择质量

---

## 局限性

- QUBO 求解器选择影响质量/速度权衡（SA 慢但通用，CIM 快但需硬件）
- 分块粒度是 hyperparameter
- 5 个 benchmark 规模偏小
- 代码未开源

---

## 可行性评估（内部视角）

| 维度 | 评分 | 说明 |
|------|------|------|
| 创新性 | ⭐⭐⭐⭐ | 把 QUBO 引入 3DGS 剪枝，跨领域借鉴 |
| 实用性 | ⭐⭐⭐⭐ | 移动端 / 边缘部署时极具价值 |
| 实现难度 | 中-高 | 需要组合优化背景 + QUBO 求解器 |
| 推荐度 | ⭐⭐⭐⭐ | 推荐关注 |

### 推荐结论
✅ **推荐** — 工程价值高（解决 3DGS 模型大小问题），且 QUBO 思路新颖可借鉴到其他选择问题。

### 行动建议
传递给 @墨鱼丸 (moyuwan)：
1. 评估 QUBO 求解在我们的硬件环境是否可行
2. Budget smoothing 思想可单独提取为独立算法
3. 关注开源时间

原始链接: https://arxiv.org/abs/2610.13503
