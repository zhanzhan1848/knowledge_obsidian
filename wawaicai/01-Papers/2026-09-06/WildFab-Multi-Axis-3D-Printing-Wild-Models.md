---
tags: [几何, 3D打印, 网格修复, 点云, UDF, 工具路径规划]
---

# WildFab: Multi-Axis 3D Printing from Models in the Wild

## 论文信息
- **arXiv**: [2609.02413](https://arxiv.org/abs/2609.02413)
- **日期**: 2026-02
- **作者**: (待补充)

## 核心方法
直接计算空间工具路径和全局无碰撞运动从输入模型，支持非流形结构和非水密网格的多轴 3D 打印。基于混合查询表示：神经符号 UDF + 正则化广义绕数场 (reg-GWN)。

## 技术要点
- **问题**:
  - 现实几何包含实壳组合和非流形结构
  - 处理 "wild" 模型需要耗时的几何修复
- **解决**:
  - 混合查询表示：神经符号有符号距离场 (UDF) + 正则化广义绕数场 (reg-GWN)
  - UDF 提供可微分表面距离和方向查询
  - reg-GWN 解决 UDF 近表面歧义，提供可靠表面定位和实空指示
  - 高精度空间工具路径计算：迭代投影点在优化引导场等值面和 reg-GWN 梯度幅度脊之间
  - 粗到细碰撞检测：UDF 拒绝 + reg-GWN 验证
- **验证**: 非流形参数曲面、体素化拓扑优化结果、隐式模型、原始扫描点云、非水密网格

## 几何算法
- 神经 UDF (neural unsigned distance field)
- 正则化广义绕数场 (regularized generalized winding number)
- 空间工具路径计算 (spatial toolpath computation)
- 粗到细碰撞检测 (coarse-to-fine collision checking)

## 相关笔记
[[2026-03-12-TreeON-3D-Tree-Point-Cloud-Reconstruction]]
