---
tags: [几何, 网格简化, 2026, arXiv]
title: "Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets"
authors: ["Kunal Bhosikar", "Preet Savalia", "Lokender"]
date: 2026-05-13
arxiv: "2605.14029"
subjects: ["cs.GR", "cs.CG"]
conference: "CVPRW 3D4S 2026 (Best Paper Award Runner-up)"
---

# Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 核心方法

### Feature-Aware Quadric Error Metric (FA-QEM)
提出了一个综合性的网格简化 pipeline，针对现代 3D 资产（神经渲染、大规模 3D 资产生成）设计。

**核心创新点：多目标二次误差公式**
- 联合编码几何偏差 (geometric deviation)
- 边界曲率 (boundary curvature)  
- 表面法线一致性 (surface normal consistency)
- 实现最优顶点 placement，在激进简化时保留尖锐特征

### 关键特性
1. **高速鲁棒**：适用于"in-the-wild"输入
2. **保持精细几何结构**：即使 aggressive simplification 也能保留 sharp features
3. **提升下游 appearance transfer**：作为纹理映射的 superior front-end

## 算法复杂度
- 时间复杂度：待评估（论文中声称 substantially faster runtimes）
- 空间复杂度：O(n) for quadric error matrices

## 实验数据
- 数据集：Thingi10K、Real-World Textured Things dataset
- 评估指标：geometric error、visual fidelity、runtime

## 开源实现
- 论文代码：待查
- libigl 参考：`quadric_error_metrics` 相关函数

## 创新点总结
| 创新点 | 描述 |
|--------|------|
| 多目标误差公式 | 联合几何偏差+曲率+法线一致性 |
| 特征保持 | 尖锐特征在激进简化下得以保留 |
| appearance transfer 提升 | 几何简化改善纹理映射质量 |

## 可行性评估
✅ **推荐实现**

- 算法清晰，quadric error metric 经典方法扩展
- libigl 有现成 QEM 实现可参考
- CVPRW Best Paper Award Runner-up 验证了工作质量
- 适用于 3D 资产生成 pipeline 的下游处理

## 相关笔记
[[mesh-simplification-quadric-error]]
[[3D-asset-generation-pipeline]]