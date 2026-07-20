---
tags: [几何, 网格重建, 点云, Ball-Pivoting, 实时重建]
type: paper
date: 2026-07-20
source: arXiv cs.GR
---

# Real-time Free-form Manifold Mesh Reconstruction via Incremental Ball Pivoting with Integrated Hole Detection

## 论文信息

- **arXiv**: [2607.11627](https://arxiv.org/abs/2607.11627)
- **作者**: Mau Hing Yip et al.
- **会议/期刊**: cs.GR
- **日期**: 2026-07-13

## 核心方法

### 问题定义
- 水下 ROV/AUV 采集的测深数据通常不完整
- 传统 DTM 方法只能表示高度场，无法捕获悬垂或垂直结构
- 需要实时增量可视化表面覆盖

### 创新点
1. **Incremental BPA (IBPA)**: 将原始 Ball Pivoting Algorithm 适配为增量、实时、自由形式表面重建方法
2. **无假设**: 不需要点云重叠或空间分布的假设
3. **流形网格**: 支持复杂拓扑结构，无需先验结构假设
4. **孔洞检测**: 识别并高亮不完整网格区域

### 算法流程
```
点云流输入 → 增量 Ball Pivoting → 定向流形网格构建 → 孔洞检测 → 可视化
```

## 技术细节

### Ball Pivoting Algorithm (BPA)
- 球体在点云表面滚动
- 当球体接触三个点时创建三角形面片
- 适应不规则点云

### 增量更新
- 支持实时数据流处理
- 无需重新处理整个点云
- 内存占用低

## 开源实现

- **GitHub**: [https://github.com/Mauhing/Incremental-BPA](https://github.com/Mauhing/Incremental-BPA)

## 算法复杂度

- 时间复杂度：O(n log n) 适合实时应用
- 空间复杂度：增量更新，内存效率高

## 相关技术

- [[Ball Pivoting Algorithm]]
- [[Mesh Reconstruction]]
- [[Point Cloud Processing]]
- [[DTM (Digital Terrain Models)]]

## 可行性评估

✅ **推荐实现**

- 核心算法经典，已在 libigl/CGAL 中有参考实现
- 开源代码可用
- 适合作为网格重建 pipeline 的 baseline
- 可与 Poisson Surface Reconstruction 结合使用

## 会议/期刊链接

- DOI: https://doi.org/10.48550/arXiv.2607.11627
