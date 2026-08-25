---
tags: [几何, 网格简化, QEM, CVPRW, arXiv]
date: 2026-08-25
arxiv: 2605.14029
conference: CVPR Workshop 2026 (Best Paper Award Runner-up)
---

# FA-QEM: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 核心方法

Feature-Aware Quadric Error Metric (FA-QEM)，针对现代 3D 资产生成的**多目标 QEM 网格简化** pipeline。

### 三元困境
现代网格简化面临：**速度** vs **鲁棒性** vs **保真度** 的权衡。

### 关键创新：多目标 QEM 组合

$$Q_{gf}^k = Q_{base}^k + Q_{boundary}^k + Q_{normal}^k$$

1. **面积加权基础 QEM** ($Q_{base}$): 逆面积加权，减少平坦区域影响，集中保留高曲率细节
2. **边界曲率 QEM** ($Q_{boundary}$): 锐边/曲线保护，基于离散有限差分曲率估计
3. **法向量 QEM** ($Q_{normal}$): 表面法向量一致性保持

### 两阶段 Pipeline

```
Stage 1: 几何简化（多目标 QEM 引导边折叠）
    ↓
Stage 2: 纹理转移（successive mapping）
```

### 成本函数

$$\text{cost}_{total}(\mathbf{v}') = \text{cost}_{gf}(\mathbf{v}') + w_{area} \cdot \text{cost}_{area}(\mathbf{v}')$$

## 实验数据集

- AI 生成网格
- Thingi10K
- Real-World Textured Things dataset

## 主要贡献

1. **统一多目标 QEM 公式**：联合编码几何偏差、边界曲率、法向量一致性
2. **Geometry-first Pipeline**：高质量几何作为纹理映射前端
3. **快速鲁棒实现**：in-the-wild 网格（噪声、非流形）

## 可行性分析

✅ **推荐实现**

理由：
1. CVPRW 2026 Best Paper Award Runner-up
2. 统一框架替代独立约束组合
3. 速度优势明显，适合大规模 pipeline
4. 对 NeRF/3DGS 提取的 mesh 特别有价值

开源参考：
- libigl: `quadric_error_metric` 扩展
- 论文代码: 待确认

传给 @墨鱼丸：可作为 3D 资产生成管线的几何简化后处理模块。

## 相关笔记

[[Mesh-Simplification-Literature]]
[[Quadric-Error-Metric]]
