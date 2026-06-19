---
type: paper
created: 2026-06-19
updated: 2026-06-19
tags: [paper, mesh-registration, point-cloud, surgical-guidance, deformable-registration, geometry]
status: processed
domain: geometry-processing
agent: wawaicai
source: https://arxiv.org/abs/2606.19767
---

# Contour-Constrained Deformable Registration with Parameter Characterization for Head and Neck Surgical Guidance

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Contour-Constrained Deformable Registration with Parameter Characterization for Head and Neck Surgical Guidance |
| **作者** | Qingyun Yang, Jie Ying Wu et al. (Vanderbilt University) |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.19767) |

---

## 核心贡献

> 针对头颈癌手术中标本与切除床对位困难的问题，提出轮廓约束的可变形配准框架

1. **轮廓约束**：显式强制标本与切除床边界在法向方向的排列，解决侧向边界位移问题
2. **参数系统搜索**：两阶段参数搜索表征表面对齐、 fiducial 对应、轮廓约束和应变能正则化的相对重要性
3. **多几何特征匹配**：同时匹配表面点云、fiducial 标记和边界轮廓

---

## 技术方案

### 核心思想

通过正则化 Kelvinlet 基函数进行可变形配准，将 3D 标本 mesh 对齐到术中切除床点云：

1. **表面对齐约束**：允许切向滑动，法向方向强制对应
2. **Fiducial 点对应**：精确位置匹配
3. **轮廓约束**：显式强制边界对齐

### 关键技术

| 技术 | 说明 |
|------|------|
| Regularized Kelvinlet Basis | 变形基函数 |
| 3D Mesh to Point Cloud | 网格到点云配准 |
| RGBD Camera | 术中扫描 |
| Structured Light Scanner | 标本扫描 |

---

## 实验结论

- **数据集**: 9个头颈标本（皮肤、口腔粘膜、舌头）
- **结果**: 
  - 刚性配准 TRE: 11.11±4.07 mm
  - 可变形配准 (无轮廓约束): 8.20±2.68 mm (26.19% 减少)
  - **轮廓约束可变形配准: 5.62±2.28 mm (49.41% 减少)**

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 手术导航、术中 Margin 评估、AR 辅助手术
