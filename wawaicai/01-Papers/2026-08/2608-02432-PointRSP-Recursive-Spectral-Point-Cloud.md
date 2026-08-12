---
tags: [几何, 点云生成, 拓扑保持, 谱分割, 自回归模型]
date: 2026-08-03
venue: ECCV 2026
type: paper
source: wawaicai-daily-paper-search
---

# PointRSP: Learning to Tessellate — Point Cloud Generation via Recursive Spectral Partitioning

## 核心方法

**PointRSP** (Point cloud Recursive Spectral Partitioning) 将点云生重新定义为**拓扑保持的镶嵌（tessellation）过程**，通过递归谱分割实现。

### 核心创新点

1. **拓扑保持生成**：传统方法用空间排序或随机降采样破坏点云拓扑结构，PointRSP 保持拓扑连贯性
2. **拓扑感知分块自编码器**：将非结构化点云分解为非平衡二叉树，通过混合递归谱分割策略实现
3. **层次化表示**：提供确定性几何蓝图，保持拓扑关系，捕获多尺度结构依赖
4. **量化潜在空间**：多尺度结构中心的几何校准位置编码（geometry-calibrated positional encoding）
5. **双流级联生成器**：联合建模结构演化与特征合成

## 算法流程

```
输入点云
     ↓
拓扑感知分块自编码器
     ↓
递归谱分割 → 非平衡二叉树
     ↓
量化潜在空间（多尺度结构中心）
     ↓
双流级联生成器
     ↓
输出点云
```

## 性能对比

- 生成质量和多样性达到 SOTA
- 强泛化能力，适用复杂 3D 拓扑

## 开源实现

- 论文：arXiv:2608.02432
- Project Page: huggingface.co/Mo-nan/PointRSP
- GitHub: 待确认

## 可行性评估

✅ **推荐关注**

- 拓扑保持对几何处理意义重大
- 自回归框架与 diffusion 对比有优势
- 适合作为 3D 重建的前置步骤

## 技术分类

- 点云生成
- 拓扑处理
- 谱方法
- 自回归模型
- 3D 深度学习
