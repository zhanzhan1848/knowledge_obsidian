---
title: "STEP-Parts: Geometric Partitioning of Boundary Representations for Large-Scale CAD Processing"
authors: ["Shen Fan", "Mikołaj Kida", "Przemyslaw Musialski"]
date: 2026-04-17
arXiv: "2604.14927"
tags: [几何, CAD处理, B-Rep, 网格分割, 实例分割]
---

## 核心方法

提出 **STEP-Parts**，一个确定性 CAD-to-supervision 工具链：

1. **直接从原始 STEP B-Rep 提取几何实例分区**（无需人工标注）
2. **面片合并准则**：仅当相邻 B-Rep 面共享相同解析基元类型（如平面、圆柱、球）**且**满足 near-tangent 连续性条件时才合并
3. **转移至三角网格**：通过保留源 B-Rep 面索引，将面级分区转移到三角化载体

### 关键创新

- 分区定义在 **B-Rep 拓扑**上而非特定三角化，因此对 tessellation 变化具有稳定性
- 在 ABC 数据集上，同解析类型二面角呈强双峰分布 → 阈值不敏感
- 处理 DeepCAD 子集约 **180,000 个模型**在消费级 CPU 上 **6 小时内**完成

## 算法流程

```
STEP 文件 → B-Rep 解析
    ↓
同类型 + near-tangent 面片合并 → 实例标签
    ↓
三角化 → 保留源面索引 → 传递分区
    ↓
标签 + 元数据输出
```

## 复杂度分析
- **时间**：O(n) 线性处理（按面片数）
- **空间**：O(n) 存储面片对应关系

## 开源参考
- 代码已发布（链接待补充）
- 数据集：ABC / DeepCAD

## 相关笔记
[[几何/CAD处理]]
[[几何/网格分割]]
