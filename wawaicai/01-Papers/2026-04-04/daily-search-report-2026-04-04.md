# 每日几何处理论文搜索报告

**日期**: 2026-04-04  
**Agent**: 娃娃菜 (wawaicai)  
**搜索范围**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/Eurographics

---

## 📊 搜索摘要

本次搜索覆盖了最近 5 天（3月31日 - 4月4日）arXiv cs.GR 类别的论文，共发现 **41 篇**新提交。

### 几何处理相关论文

经过筛选，以下论文与几何处理领域直接相关：

| 论文 | 日期 | 相关度 | 关键词 |
|------|------|--------|--------|
| [Topology-First B-Rep Meshing](2026-04-04-Topology-First-BRep-Meshing.md) | 04-02 | ⭐⭐⭐ | 网格生成、B-Rep、CAD、拓扑 |
| [Dual Contouring of Signed Distance Data](2026-04-04-Dual-Contouring-Signed-Distance-Data.md) | 03-31 | ⭐⭐⭐ | 表面重建、SDF、网格、尖锐特征 |
| [Non-Rigid 3D Shape Correspondences](2026-04-04-Non-Rigid-3D-Shape-Correspondences.md) | 04-02 | ⭐⭐ | 形状对应、非刚性、光谱方法 |

---

## 📝 重点论文分析

### 🥇 Topology-First B-Rep Meshing

**核心创新**: 将 B-Rep 拓扑作为网格生成过程的不变量，绕过 2D 修剪曲线的不一致问题

**算法要点**:
- 直接在 3D 空间追踪曲线（不使用 2D 修剪曲线）
- 单一用户定义容差控制几何精度
- 拓扑正确性有数学保证

**可行性评估**: ✅ 推荐实现

**开源参考**:
- libigl: `decimate()`, `quadric_error_metric()`
- OCCT (Open CASCADE): B-Rep 处理

---

### 🥈 Dual Contouring of Signed Distance Data

**核心创新**: 仅用离散 SDF 值重建网格，无需梯度信息

**算法要点**:
- 二次优化决定顶点位置
- 擅长恢复尖锐特征
- 不需要训练数据

**可行性评估**: ✅ 推荐实现

**开源参考**:
- libigl: `marching_cubes()`, `decimate()`
- CGAL: `Surface_mesh_parameterization`

---

## 🔍 其他相关论文

### SGP 2026

- [SGP 2026](https://sgp26.org/) 会议正在筹备中（瑞士伯尔尼大学）
- 截止日期和提交信息待确认

### Survey 论文

- **A Survey of AI Methods for Geometry Preparation and Mesh Generation** (arXiv:2512.23719)
  - AI + 网格生成的全面综述
  - 发表于 International Meshing Roundtable 2026

---

## 📈 搜索统计

- **搜索时间**: 2026-04-04 14:07 UTC
- **arXiv cs.GR 新提交**: 41 篇
- **几何处理相关**: 3 篇
- **新建笔记**: 3 篇

---

## 🎯 下一步行动

1. 🔬 深入分析 B-Rep 网格化的 libigl 实现可能性
2. 📚 调研 Dual Contouring 的并行化优化方案
3. 🔗 跟进 SGP 2026 论文提交截止日期

---

*报告生成时间: 2026-04-04 14:08 UTC*
